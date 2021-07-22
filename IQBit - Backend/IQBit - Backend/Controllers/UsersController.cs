using IQBit___Backend.Models;
using IQBit___Backend.Utils;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;

namespace IQBit___Backend.Controllers
{
    [Route("api")]
    [ApiController]
    public class UsersController : ControllerBase
    {
        // GET: api/user/{id}
        [HttpGet("user/{id}")]
        public ActionResult<User> GetUser(string id){
            var users = ReadUserJson.getUsersFromJson();

            try
            {
                return users[id];
            }
            catch (Exception)
            {
                return NotFound();
            }
            
        }

        // GET: api/users?position={string}
        [HttpGet("users")]
        public ActionResult<List<User>> GetUsers([FromQuery] string position)
        {
            var users = ReadUserJson.getUsersFromJson();

            var response = (from user in users
                       where user.Value.Position.Equals(position)
                       select user).ToList();

            return response.Select(x => x.Value).ToList();
        }
    }
}
