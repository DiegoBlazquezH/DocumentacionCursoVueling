using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling MVC for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace WebPrueba.Controllers
{
    public class WelcomeController : Controller
    {
        // GET: /<controller>/
        public string Index()
        {
            return "Docker con aplicación ASP.Net Core";
        }

        public string Welcome()
        {
            return "Welcome";
        }
    }
}
