using GenminiAPI.Services;
using GenminiAPI;
using System.Data;
using Microsoft.Data.SqlClient;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
builder.Services.Configure<GeminiSettings>(
    builder.Configuration.GetSection("Gemini"));
AppContext.SetSwitch("System.Globalization.Invariant", false);

builder.Services.AddHttpClient<GeminiService>();
builder.Services.AddScoped< SqlExecutorService>();

builder.Services.AddScoped<IDbConnection>(sp =>
    new SqlConnection(builder.Configuration.GetConnectionString("WebBaiGiang")));
var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

// Move this UP here
app.UseCors(option =>
    option.WithOrigins("*") // hoặc "*" để mở tất cả
          .AllowAnyMethod()
          .AllowAnyHeader()
);

// Then authorization
app.UseAuthorization();
app.MapControllers();

app.Run();
