using IQBit___Backend.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace IQBit___Backend.Utils
{
    public class ReadUserJson
    {
        //Lee un archivo .json y lo transforma en un dictionario con key de tipo string y value de tipo User
        public static Dictionary<string, User> getUsersFromJson()
        {
            StreamReader reader = new StreamReader("Assets/users.json");
            string jsonString = reader.ReadToEnd();

            var users = JsonConvert.DeserializeObject<Dictionary<string, User>>(jsonString);

            return users;
        }
    }
}
