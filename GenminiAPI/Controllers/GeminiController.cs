using Microsoft.AspNetCore.Mvc;
using GenminiAPI.Services;

namespace GenminiAPI.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class GeminiController : ControllerBase
    {
        private readonly GeminiService _geminiService;
        private readonly SqlExecutorService _context;
        public GeminiController(GeminiService geminiService,SqlExecutorService sqlExecutorService)
        {
            _geminiService = geminiService;
            _context = sqlExecutorService;
        }

        [HttpPost("ask")]
        public async Task<IActionResult> AskGemini([FromBody] GeminiRequest request)
        {
            if (string.IsNullOrWhiteSpace(request.Prompt))
                return BadRequest("Prompt cannot be empty.");

            var result = await _geminiService.GetGeminiResponseAsync(request.Prompt);

            var lines = result.Split(new[] { "\r\n", "\n" }, StringSplitOptions.None)
                              .Skip(1)
                              .SkipLast(1)
                              .ToList();

            var cleanedResult = string.Join(Environment.NewLine, lines);

            // Kiểm tra an toàn truy vấn
            var forbidden = new[] { "drop", "delete", "truncate", "update", "insert" };
            if (forbidden.Any(x => cleanedResult.ToLower().Contains(x)))
                return BadRequest("Unsafe SQL detected.");

            try
            {
                var data = await _context.ExecuteQueryAsync(cleanedResult);
                  result = await _geminiService.GetGeminiAnswerWithDataAsync(request.Prompt, data);
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest($"SQL execution failed: {ex.Message}");
            }
        }

       
    }

    public class GeminiRequest
    {
        public string Prompt { get; set; }
    }

    public class GeminiAnswerWithDataRequest
    {
        public string Prompt { get; set; }
        public string Data { get; set; }
    }
}
