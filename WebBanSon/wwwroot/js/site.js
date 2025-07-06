// ... existing code ...

async function askGemini(prompt) {
    try {
        const response = await fetch('https://localhost:7090/api/Gemini/ask', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ prompt })
        });

        // Kiểm tra content-type trả về
        const contentType = response.headers.get('content-type');
        let data;
        if (contentType && contentType.includes('application/json')) {
            data = await response.json();
        } else {
            data = await response.text();
        }

        if (!response.ok) {
            // Log chi tiết lỗi từ backend
            console.error('API trả về lỗi:', {
                status: response.status,
                statusText: response.statusText,
                data: data
            });
            return { error: (typeof data === 'object' ? data?.error || data?.message : data) || `Lỗi API: ${response.status} ${response.statusText}` };
        }
        return data;
    } catch (err) {
        console.error('Bắt được lỗi rồi!');
        console.error('Lỗi khi gọi API:', err);
        return { error: 'Không thể kết nối AI!', err };
    }
}

function parseCustomersFromText(text) {
    // Tách phần tóm tắt (nếu có)
    const summaryMatch = text.match(/\*\*Tóm tắt chung:\*\*([\s\S]*)/);
    const summary = summaryMatch ? summaryMatch[1].trim() : '';

    // Tách từng khách hàng
    const customerRegex = /\*\*Khách hàng \d+\:\*\*([\s\S]*?)(?=(\*\*Khách hàng \d+\:\*\*|\*\*Tóm tắt chung\:\*\*|$))/g;
    let match, customers = [];
    while ((match = customerRegex.exec(text)) !== null) {
        const block = match[1];
        const fields = {};
        // Tìm từng dòng dạng * **Field:** Value
        const fieldRegex = /\*\*([A-Za-z0-9_]+)\:\*\* ([^\n*]*)/g;
        let f;
        while ((f = fieldRegex.exec(block)) !== null) {
            fields[f[1]] = f[2].trim();
        }
        customers.push(fields);
    }
    return { customers, summary };
}

function formatAIResponse(data, userMsg) {
    // Nếu là object có html
    if (typeof data === 'object' && data && data.html) return data;

    // Nếu là mảng object (danh sách khách hàng)
    if (Array.isArray(data) && data.length > 0 && typeof data[0] === 'object') {
        let html = '<div class="row">';
        data.forEach(cus => {
            html += `
            <div class="col-md-6 mb-3">
                <div class="card shadow-sm">
                    <div class="card-body d-flex align-items-center">
                        <img src="/images/${cus.Avartar}" alt="${cus.UserName}" class="rounded-circle me-3" width="60" height="60" style="object-fit:cover;">
                        <div>
                            <h5 class="card-title mb-1">${cus.FullName} <span class="badge bg-warning text-dark">${cus.AccountTypeName}</span></h5>
                            <p class="mb-1"><b>User:</b> ${cus.UserName} | <b>Email:</b> ${cus.Email}</p>
                            <p class="mb-1"><b>Điểm:</b> ${cus.Point} | <b>Trạng thái:</b> ${cus.Status == 1 ? 'Hoạt động' : 'Khóa'}</p>
                            <p class="mb-0"><b>Ngày sinh:</b> ${cus.Birthday} | <b>Giới tính:</b> ${cus.Gender == 1 ? 'Nam' : 'Nữ'}</p>
                        </div>
                    </div>
                </div>
            </div>
            `;
        });
        html += '</div>';
        return { html };
    }

    // Nếu là mảng string
    if (Array.isArray(data) && typeof data[0] === 'string') {
        return { html: `<ul>${data.map(item => `<li>${item}</li>`).join('')}</ul>` };
    }

    // Nếu là object có trường phổ biến
    if (data && (data.result || data.content || data.answer)) {
        return formatAIResponse(data.result || data.content || data.answer, userMsg);
    }

    // Nếu là object khác
    if (typeof data === 'object' && data !== null) {
        return { html: `<pre style="white-space:pre-wrap">${Object.entries(data).map(([k, v]) => `<b>${k}:</b> ${v}`).join('<br>')}</pre>` };
    }

    // Nếu là string, thử render markdown
    if (typeof data === 'string') {
        // Nếu có markdown hoặc nhiều dòng, dùng marked để render
        if (window.marked) {
            return { html: marked.parse(data) };
        } else {
            // Nếu không có marked, tự động xuống dòng
            return { html: `<div style="white-space:pre-line">${data}</div>` };
        }
    }

    return { html: '<i>AI không trả lời được.</i>' };
}

document.addEventListener('DOMContentLoaded', function () {
    const chatMessages = document.getElementById('ai-chat-messages');
    const chatInput = document.getElementById('ai-chat-input');
    const chatSend = document.getElementById('ai-chat-send');

    function appendMessage(message, sender = 'user') {
        const msgDiv = document.createElement('div');
        msgDiv.className = `ai-modern-message ${sender}`;
        const bubble = document.createElement('div');
        bubble.className = 'ai-modern-bubble';
        if (typeof message === 'object' && message.html) {
            bubble.innerHTML = message.html;
        } else {
            bubble.textContent = message;
        }
        msgDiv.appendChild(bubble);
        chatMessages.appendChild(msgDiv);
        chatMessages.scrollTop = chatMessages.scrollHeight;
        setTimeout(() => { msgDiv.style.opacity = 1; }, 10);
    }

    async function handleAIResponse(userMsg) {
        // Hiển thị hiệu ứng typing
        const typingDiv = document.createElement('div');
        typingDiv.className = 'ai-modern-message ai';
        typingDiv.innerHTML = '<div class="ai-modern-bubble"><span class="text-muted">AI đang trả lời...</span></div>';
        chatMessages.appendChild(typingDiv);
        chatMessages.scrollTop = chatMessages.scrollHeight;

        const data = await askGemini(userMsg);
        typingDiv.remove();

        appendMessage(formatAIResponse(data, userMsg), 'ai');
    }

    function updateSendBtn() {
        chatSend.disabled = chatInput.value.trim() === '';
    }

    chatSend.addEventListener('click', async function () {
        const msg = chatInput.value.trim();
        if (msg) {
            appendMessage(msg, 'user');
            chatInput.value = '';
            updateSendBtn();
            await handleAIResponse(msg);
            chatInput.focus();
        }
    });
    chatInput.addEventListener('keydown', function (e) {
        if (e.key === 'Enter') {
            chatSend.click();
        }
    });
    chatInput.addEventListener('input', updateSendBtn);
    updateSendBtn();
});