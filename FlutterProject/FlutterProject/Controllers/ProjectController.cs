using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace FlutterProject.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProjectController : ControllerBase
    {
        private readonly IConfiguration _configuration;
        public ProjectController(IConfiguration configuration)
        {
            _configuration = configuration;
        }
        [HttpGet]
        public JsonResult Get()
        {
            string query = @"select Id, ProjectName from dbo.Project";
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
