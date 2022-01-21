using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace LoginAppTesting.ViewModel
{
    public class LoginViewModel
    {
        [Required(ErrorMessage = "Please type your password again")]
        public string Username { get; set; }

        [Required(ErrorMessage = "Please type your password again")]
        public string Password { get; set; }

    }
}
