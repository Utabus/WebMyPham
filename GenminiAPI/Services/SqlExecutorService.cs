
using Dapper;
using Microsoft.Data.SqlClient;

namespace GenminiAPI.Services
{
    public class SqlExecutorService
    {

        public SqlExecutorService()
        {
        }

        public async Task<IEnumerable<dynamic>> ExecuteQueryAsync(string sql)
        {
            using (var connection = new SqlConnection(
                "Server=DESKTOP-VC92P42\\SQLEXPRESS;Database=WebMyPham;Trusted_Connection=True;TrustServerCertificate=True;MultipleActiveResultSets=true"
                ))
                    {
                        await connection.OpenAsync();
                        var result = await connection.QueryAsync(sql);
                        return result;
                    }
           
        }

       
    }
}
