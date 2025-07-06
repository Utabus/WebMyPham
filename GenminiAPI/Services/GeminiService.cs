using Microsoft.Extensions.Options;
using System.Text.Json;
using System.Text;

namespace GenminiAPI.Services
{
    public class GeminiService
    {
        private readonly HttpClient _httpClient;
        private readonly string _apiKey;
        private readonly string _url;

        public GeminiService(HttpClient httpClient, IOptions<GeminiSettings> options)
        {
            _httpClient = httpClient;
            _apiKey = options.Value.ApiKey;
            var model = options.Value.Model;
            _url = $"https://generativelanguage.googleapis.com/v1beta/models/{model}:generateContent?key={_apiKey}";
        }
        public async Task<string> GetGeminiResponseAsync(string userPrompt)
        {
            var requestData = new
            {
                contents = new[]
                {
            new
            {
                role = "user",
                parts = new[]
                {
                    new { text ="CREATE TABLE [dbo].[Accounts](\r\n\t[AccountId] [int] IDENTITY(1,1) NOT NULL,\r\n\t[UserName] [nvarchar](max) NULL,\r\n\t[Password] [nvarchar](max) NULL,\r\n\t[Avartar] [nvarchar](max) NULL,\r\n\t[Email] [nvarchar](max) NULL,\r\n\t[FullName] [nvarchar](max) NULL,\r\n\t[Phone] [nvarchar](max) NULL,\r\n\t[Point] [int] NULL,\r\n\t[Birthday] [datetime] NULL, \r\n\t[Gender] [tinyint] NULL,\r\n\t[RoleId] [int] NULL,\r\n\t[AccountTypeId] [int] NULL,\r\n\t[Status] [tinyint] NULL,\r\n CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED \r\n(\r\n\t[AccountId] ASC\r\n)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]\r\n) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]\r\nGO\r\n/****** Object:  Table [dbo].[AccountType]    Script Date: 4/30/2025 9:23:23 AM ******/ \r\nSET ANSI_NULLS ON\r\nGO\r\nSET QUOTED_IDENTIFIER ON\r\nGO\r\nCREATE TABLE [dbo].[AccountType](\r\n\t[AccountTypeId] [int] IDENTITY(1,1) NOT NULL,\r\n\t[Name] [nvarchar](max) NULL,\r\n CONSTRAINT [PK_AccountType] PRIMARY KEY CLUSTERED \r\n(\r\n\t[AccountTypeId] ASC\r\n) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]\r\n) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]\r\nGO\r\n/****** Object:  Table [dbo].[Address]    Script Date: 4/30/2025 9:23:23 AM ******/\r\nSET ANSI_NULLS ON\r\nGO\r\nSET QUOTED_IDENTIFIER ON\r\nGO\r\nCREATE TABLE [dbo].[Address](\r\n\t[AddressId] [int] IDENTITY(1,1) NOT NULL,\r\n\t[Street] [nvarchar](max) NULL,\r\n\t[Ward] [nvarchar](max) NULL,\r\n\t[District] [nvarchar](max) NULL,\r\n\t[City] [nvarchar](max) NULL,\r\n\t[Country] [nvarchar](max) NULL,\r\n\t[AccountId] [int] NULL,\r\n CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED \r\n(\r\n\t[AddressId] ASC\r\n)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]\r\n) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]\r\nGO\r\n/****** Object:  Table [dbo].[Discounts]    Script Date: 4/30/2025 9:23:23 AM ******/\r\nSET ANSI_NULLS ON\r\nGO\r\nSET QUOTED_IDENTIFIER ON\r\nGO\r\nCREATE TABLE [dbo].[Discounts](\r\n\t[DiscountId] [int] IDENTITY(1,1) NOT NULL,\r\n\t[Name] [nvarchar](max) NULL,\r\n\t[Code] [nvarchar](max) NULL,\r\n\t[Description] [nvarchar](max) NULL,\r\n\t[Discount_percent] [decimal](18, 0) NULL,\r\n\t[Quantity] [int] NULL,\r\n\t[UseNumber] [int] NULL,\r\n\t[Status] [tinyint] NULL,\r\n CONSTRAINT [PK_Discounts] PRIMARY KEY CLUSTERED \r\n(\r\n\t[DiscountId] ASC\r\n)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]\r\n) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]\r\nGO\r\n/****** Object:  Table [dbo].[Messages]    Script Date: 4/30/2025 9:23:23 AM ******/\r\nSET ANSI_NULLS ON\r\nGO\r\nSET QUOTED_IDENTIFIER ON\r\nGO\r\nCREATE TABLE [dbo].[Messages](\r\n\t[Id] [int] IDENTITY(1,1) NOT NULL,\r\n\t[FromUserId] [int] NULL,\r\n\t[ToUserId] [int] NULL,\r\n\t[Content] [nvarchar](max) NULL,\r\n\t[IsFromUserId] [bit] NULL,\r\n\t[IsToUserId] [bit] NULL,\r\n\t[Status] [tinyint] NULL,\r\n CONSTRAINT [PK_Messages] PRIMARY KEY CLUSTERED \r\n(\r\n\t[Id] ASC\r\n)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]\r\n) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]\r\nGO\r\n/****** Object:  Table [dbo].[Oder_Items]    Script Date: 4/30/2025 9:23:23 AM ******/\r\nSET ANSI_NULLS ON\r\nGO\r\nSET QUOTED_IDENTIFIER ON\r\nGO\r\nCREATE TABLE [dbo].[Oder_Items](\r\n\t[OderId] [int] NOT NULL,\r\n\t[ProductId] [int] NOT NULL,\r\n\t[Quantity] [int] NULL,\r\n CONSTRAINT [PK_Oder_Items] PRIMARY KEY CLUSTERED \r\n(\r\n\t[OderId] ASC,\r\n\t[ProductId] ASC\r\n)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]\r\n) ON [PRIMARY]\r\nGO\r\n/****** Object:  Table [dbo].[Oders]    Script Date: 4/30/2025 9:23:23 AM ******/\r\nSET ANSI_NULLS ON\r\nGO\r\nSET QUOTED_IDENTIFIER ON\r\nGO\r\nCREATE TABLE [dbo].[Oders](\r\n\t[OdersId] [int] IDENTITY(1,1) NOT NULL,\r\n\t[AccountId] [int] NULL,\r\n\t[Total] [decimal](18, 0) NULL,\r\n\t[CreateDay] [datetime] NULL,\r\n\t[AddressId] [int] NULL,\r\n\t[DiscountId] [int] NULL,\r\n\t[Status] [tinyint] NULL,\r\n CONSTRAINT [PK_Oders] PRIMARY KEY CLUSTERED \r\n(\r\n\t[OdersId] ASC\r\n)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]\r\n) ON [PRIMARY]\r\nGO\r\n/****** Object:  Table [dbo].[PaymentMethods]    Script Date: 4/30/2025 9:23:23 AM ******/\r\nSET ANSI_NULLS ON\r\nGO\r\nSET QUOTED_IDENTIFIER ON\r\nGO\r\nCREATE TABLE [dbo].[PaymentMethods](\r\n\t[PaymentMethodsId] [int] IDENTITY(1,1) NOT NULL,\r\n\t[Name] [nvarchar](max) NULL,\r\n\t[Description] [nvarchar](max) NULL,\r\n CONSTRAINT [PK_PaymentMethods] PRIMARY KEY CLUSTERED \r\n(\r\n\t[PaymentMethodsId] ASC\r\n)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]\r\n) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]\r\nGO\r\n/****** Object:  Table [dbo].[Payments]    Script Date: 4/30/2025 9:23:23 AM ******/\r\nSET ANSI_NULLS ON\r\nGO\r\nSET QUOTED_IDENTIFIER ON\r\nGO\r\nCREATE TABLE [dbo].[Payments](\r\n\t[PaymentsId] [int] IDENTITY(1,1) NOT NULL,\r\n\t[OdersId] [int] NULL,\r\n\t[PaymentMethodsId] [int] NULL,\r\n\t[Amount] [decimal](18, 0) NULL,\r\n\t[PaymentDate] [datetime] NULL,\r\n\t[Status] [tinyint] NULL,\r\n CONSTRAINT [PK_Payments] PRIMARY KEY CLUSTERED \r\n(\r\n\t[PaymentsId] ASC\r\n)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]\r\n) ON [PRIMARY]\r\nGO\r\n/****** Object:  Table [dbo].[Products]    Script Date: 4/30/2025 9:23:23 AM ******/\r\nSET ANSI_NULLS ON\r\nGO\r\nSET QUOTED_IDENTIFIER ON\r\nGO\r\nCREATE TABLE [dbo].[Products](\r\n\t[ProductId] [int] IDENTITY(1,1) NOT NULL,\r\n\t[Name] [nvarchar](max) NULL,\r\n\t[Image] [nvarchar](max) NULL,\r\n\t[Image1] [nvarchar](max) NULL,\r\n\t[Image2] [nvarchar](max) NULL,\r\n\t[Image3] [nvarchar](max) NULL,\r\n\t[Description] [nvarchar](max) NULL,\r\n\t[Price] [float] NULL,\r\n\t[Product_InventoryId] [int] NULL,\r\n\t[ProductTypeId] [int] NULL,\r\n\t[Status] [tinyint] NULL,\r\n CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED \r\n(\r\n\t[ProductId] ASC\r\n)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]\r\n) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]\r\nGO\r\n/****** Object:  Table [dbo].[Products_Inventorys]    Script Date: 4/30/2025 9:23:23 AM ******/\r\nSET ANSI_NULLS ON\r\nGO\r\nSET QUOTED_IDENTIFIER ON\r\nGO\r\nCREATE TABLE [dbo].[Products_Inventorys](\r\n\t[Product_InventoryId] [int] IDENTITY(1,1) NOT NULL,\r\n\t[Quantity] [int] NULL,\r\n\t[QuantitySold] [int] NULL,\r\n CONSTRAINT [PK_Product_Inventory] PRIMARY KEY CLUSTERED \r\n(\r\n\t[Product_InventoryId] ASC\r\n)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]\r\n) ON [PRIMARY]\r\nGO\r\n/****** Object:  Table [dbo].[ProductTypes]    Script Date: 4/30/2025 9:23:23 AM ******/\r\nSET ANSI_NULLS ON\r\nGO\r\nSET QUOTED_IDENTIFIER ON\r\nGO\r\nCREATE TABLE [dbo].[ProductTypes](\r\n\t[ProductTypeId] [int] IDENTITY(1,1) NOT NULL,\r\n\t[Name] [nvarchar](max) NULL,\r\n\t[Description] [nvarchar](max) NULL,\r\n\t[Status] [tinyint] NULL,\r\n CONSTRAINT [PK_ProductTypes] PRIMARY KEY CLUSTERED \r\n(\r\n\t[ProductTypeId] ASC\r\n)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]\r\n) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]\r\nGO\r\n/****** Object:  Table [dbo].[Receipt_Products]    Script Date: 4/30/2025 9:23:23 AM ******/\r\nSET ANSI_NULLS ON\r\nGO\r\nSET QUOTED_IDENTIFIER ON\r\nGO\r\nCREATE TABLE [dbo].[Receipt_Products](\r\n\t[Receipt_ProductId] [int] IDENTITY(1,1) NOT NULL,\r\n\t[ProductId] [int] NULL,\r\n\t[Quantity] [int] NULL,\r\n\t[Price] [decimal](18, 0) NULL,\r\n\t[Image] [nvarchar](max) NULL,\r\n\t[CreateDay] [datetime2](7) NULL,\r\n\t[Status] [tinyint] NULL,\r\n CONSTRAINT [PK_Receipt_Products] PRIMARY KEY CLUSTERED \r\n(\r\n\t[Receipt_ProductId] ASC\r\n)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]\r\n) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]\r\nGO\r\n/****** Object:  Table [dbo].[Roles]    Script Date: 4/30/2025 9:23:23 AM ******/\r\nSET ANSI_NULLS ON\r\nGO\r\nSET QUOTED_IDENTIFIER ON\r\nGO\r\nCREATE TABLE [dbo].[Roles](\r\n\t[RoleId] [int] IDENTITY(1,1) NOT NULL,\r\n\t[Name] [nvarchar](max) NULL,\r\n CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED \r\n(\r\n\t[RoleId] ASC\r\n)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]\r\n) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]\r\nGO\r\n/****** Object:  Table [dbo].[Shipments]    Script Date: 4/30/2025 9:23:23 AM ******/\r\nSET ANSI_NULLS ON\r\nGO\r\nSET QUOTED_IDENTIFIER ON\r\nGO\r\nCREATE TABLE [dbo].[Shipments](\r\n\t[ShipmentsId] [int] IDENTITY(1,1) NOT NULL,\r\n\t[OdersId] [int] NULL,\r\n\t[TrackingNumber] [nvarchar](max) NULL,\r\n\t[ShippingMethodsId] [int] NULL,\r\n\t[Status] [tinyint] NULL,\r\n CONSTRAINT [PK_Shipments] PRIMARY KEY CLUSTERED \r\n(\r\n\t[ShipmentsId] ASC\r\n)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]\r\n) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]\r\nGO\r\n/****** Object:  Table [dbo].[ShippingMethods]    Script Date: 4/30/2025 9:23:23 AM ******/\r\nSET ANSI_NULLS ON\r\nGO\r\nSET QUOTED_IDENTIFIER ON\r\nGO\r\nCREATE TABLE [dbo].[ShippingMethods](\r\n\t[ShippingMethodsId] [int] IDENTITY(1,1) NOT NULL,\r\n\t[Name] [nvarchar](max) NULL,\r\n\t[Description] [nvarchar](max) NULL,\r\n\t[ShippingFee] [decimal](18, 0) NULL,\r\n CONSTRAINT [PK_ShippingMethods] PRIMARY KEY CLUSTERED \r\n(\r\n\t[ShippingMethodsId] ASC\r\n)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]\r\n) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]\r\nGO\r\nALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FK_Account_AccountType] FOREIGN KEY([AccountTypeId])\r\nREFERENCES [dbo].[AccountType] ([AccountTypeId])\r\nGO\r\nALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK_Account_AccountType]\r\nGO\r\nALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FK_Account_Role] FOREIGN KEY([RoleId])\r\nREFERENCES [dbo].[Roles] ([RoleId])\r\nGO\r\nALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK_Account_Role]\r\nGO\r\nALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [FK_Address_Account] FOREIGN KEY([AccountId])\r\nREFERENCES [dbo].[Accounts] ([AccountId])\r\nGO\r\nALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK_Address_Account]\r\nGO\r\nALTER TABLE [dbo].[Messages]  WITH CHECK ADD  CONSTRAINT [FK_Messages_Accounts_FromUserId] FOREIGN KEY([FromUserId])\r\nREFERENCES [dbo].[Accounts] ([AccountId])\r\nGO\r\nALTER TABLE [dbo].[Messages] CHECK CONSTRAINT [FK_Messages_Accounts_FromUserId]\r\nGO\r\nALTER TABLE [dbo].[Oder_Items]  WITH CHECK ADD  CONSTRAINT [FK_Oder_Items_Oders] FOREIGN KEY([OderId])\r\nREFERENCES [dbo].[Oders] ([OdersId])\r\nGO\r\nALTER TABLE [dbo].[Oder_Items] CHECK CONSTRAINT [FK_Oder_Items_Oders]\r\nGO\r\nALTER TABLE [dbo].[Oder_Items]  WITH CHECK ADD  CONSTRAINT [FK_Oder_Items_Product] FOREIGN KEY([ProductId])\r\nREFERENCES [dbo].[Products] ([ProductId])\r\nGO\r\nALTER TABLE [dbo].[Oder_Items] CHECK CONSTRAINT [FK_Oder_Items_Product]\r\nGO\r\nALTER TABLE [dbo].[Oders]  WITH CHECK ADD  CONSTRAINT [FK_Oders_Account] FOREIGN KEY([AccountId])\r\nREFERENCES [dbo].[Accounts] ([AccountId])\r\nGO\r\nALTER TABLE [dbo].[Oders] CHECK CONSTRAINT [FK_Oders_Account]\r\nGO\r\nALTER TABLE [dbo].[Oders]  WITH CHECK ADD  CONSTRAINT [FK_Oders_Discount] FOREIGN KEY([DiscountId])\r\nREFERENCES [dbo].[Discounts] ([DiscountId])\r\nGO\r\nALTER TABLE [dbo].[Oders] CHECK CONSTRAINT [FK_Oders_Discount]\r\nGO\r\nALTER TABLE [dbo].[Payments]  WITH CHECK ADD  CONSTRAINT [FK_Payments_Oders] FOREIGN KEY([OdersId])\r\nREFERENCES [dbo].[Oders] ([OdersId])\r\nGO\r\nALTER TABLE [dbo].[Payments] CHECK CONSTRAINT [FK_Payments_Oders]\r\nGO\r\nALTER TABLE [dbo].[Payments]  WITH CHECK ADD  CONSTRAINT [FK_Payments_PaymentMethods] FOREIGN KEY([PaymentMethodsId])\r\nREFERENCES [dbo].[PaymentMethods] ([PaymentMethodsId])\r\nGO\r\nALTER TABLE [dbo].[Payments] CHECK CONSTRAINT [FK_Payments_PaymentMethods]\r\nGO\r\nALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Product_Product_Inventory] FOREIGN KEY([Product_InventoryId])\r\nREFERENCES [dbo].[Products_Inventorys] ([Product_InventoryId])\r\nGO\r\nALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Product_Product_Inventory]\r\nGO\r\nALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductType] FOREIGN KEY([ProductTypeId])\r\nREFERENCES [dbo].[ProductTypes] ([ProductTypeId])\r\nGO\r\nALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Product_ProductType]\r\nGO\r\nALTER TABLE [dbo].[Receipt_Products]  WITH CHECK ADD  CONSTRAINT [FK_Receipt_Product_Product] FOREIGN KEY([ProductId])\r\nREFERENCES [dbo].[Products] ([ProductId])\r\nGO\r\nALTER TABLE [dbo].[Receipt_Products] CHECK CONSTRAINT [FK_Receipt_Product_Product]\r\nGO\r\nALTER TABLE [dbo].[Shipments]  WITH CHECK ADD  CONSTRAINT [FK_Shipments_Oders] FOREIGN KEY([OdersId])\r\nREFERENCES [dbo].[Oders] ([OdersId])\r\nGO\r\nALTER TABLE [dbo].[Shipments] CHECK CONSTRAINT [FK_Shipments_Oders]\r\nGO\r\nALTER TABLE [dbo].[Shipments]  WITH CHECK ADD  CONSTRAINT [FK_Shipments_ShippingMethods] FOREIGN KEY([ShippingMethodsId])\r\nREFERENCES [dbo].[ShippingMethods] ([ShippingMethodsId])\r\nGO\r\nALTER TABLE [dbo].[Shipments] CHECK CONSTRAINT [FK_Shipments_ShippingMethods]\r\nGO\r\n  Bạn là một trợ lý thông minh, chuyên về cơ sở dữ liệu sql mssql .  và đây là thông tin các bảng trong csdl của tôi bạn có thể dùng nó để trả ra query tương ứng với câu hỏi người dùng và bạn chỉ trả ra sql query  các bảng có FK thì bạn lấy thông tin bên kia ghép qua tức la join lại chứ không truy vấn rồi trả ra như accountId nha và mmsql ko có limit nha lấy dự liệu tránh những dữ liệu nhạy cảm như passwork" }
                }
            },
            new
            {
                role = "user",
                parts = new[]
                {
                    new { text = userPrompt }
                }
            }
        }
            };
            var json = JsonSerializer.Serialize(requestData);
            var content = new StringContent(json, Encoding.UTF8, "application/json");
            var response = await _httpClient.PostAsync(_url, content);
            if (!response.IsSuccessStatusCode)
            {
                var error = await response.Content.ReadAsStringAsync();
                throw new Exception($"Gemini API Error: {response.StatusCode} - {error}");
            }

            var responseContent = await response.Content.ReadAsStringAsync();

            using var doc = JsonDocument.Parse(responseContent);
            var text = doc.RootElement
                          .GetProperty("candidates")[0]
                          .GetProperty("content")
                          .GetProperty("parts")[0]
                          .GetProperty("text")
                          .GetString();

            return text;
        }

        public async Task<string> GetGeminiAnswerWithDataAsync(string userPrompt, IEnumerable<dynamic> dbData)
        { 
            // Chuyển dbData thành JSON string
            var dbDataJson = JsonSerializer.Serialize(dbData);

            var requestData = new
            {
                contents = new[]
                {
            new
            {
                role = "user",
                parts = new[]
                {
                    new { text = $"Bạn là một trợ lý thông minh, chuyên về cơ sở dữ liệu sql mssql. Dưới đây là dữ liệu đã lấy từ database (dạng JSON), hãy trả lời câu hỏi dựa trên dữ liệu này một cách tự nhiên, chi tiết và dễ hiểu cho người dùng.\nDữ liệu: {dbDataJson}" }
                }
            },
            new
            {
                role = "user",
                parts = new[]
                {
                    new { text = userPrompt }
                }
            }
        }
            };
            var json = JsonSerializer.Serialize(requestData);
            var content = new StringContent(json, Encoding.UTF8, "application/json");
            var response = await _httpClient.PostAsync(_url, content);
            if (!response.IsSuccessStatusCode)
            {
                var error = await response.Content.ReadAsStringAsync();
                throw new Exception($"Gemini API Error: {response.StatusCode} - {error}");
            }

            var responseContent = await response.Content.ReadAsStringAsync();

            using var doc = JsonDocument.Parse(responseContent);
            var text = doc.RootElement
                          .GetProperty("candidates")[0]
                          .GetProperty("content")
                          .GetProperty("parts")[0]
                          .GetProperty("text")
                          .GetString();

            return text;
        }
    }
}
