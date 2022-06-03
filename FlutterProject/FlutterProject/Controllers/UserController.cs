using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using Microsoft.Extensions.Configuration;

namespace FlutterProject.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {
        private readonly IConfiguration _configuration;
        public UserController(IConfiguration configuration)
        {
            _configuration = configuration;
        }
        [HttpGet]
        public JsonResult Get()
        {
            string query = @"select Id, UserMail,UserPassword from dbo.Users";
            DataTable table = new DataTable();
            string sqldataSource = _configuration.GetConnectionString("FlutterAppCon");
            SqlDataReader myReader;
            using (SqlConnection sqlConnection = new SqlConnection(sqldataSource))
            {
                sqlConnection.Open();
                using (SqlCommand myCommand = new SqlCommand(query, sqlConnection))
                {
                    myReader = myCommand.ExecuteReader();
                    table.Load(myReader);
                    myReader.Close();
                    sqlConnection.Close();
                }
            }
            return new JsonResult(table);
        }
            

    }
}
