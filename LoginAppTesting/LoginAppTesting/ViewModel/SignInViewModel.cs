using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace LoginAppTesting.ViewModel
{
    public class SignInViewModel 
    {
        [Required(ErrorMessage = "Please type your password again")]
        public string Username { get; set; }

        [Required(ErrorMessage = "Please type your password again")]     
        public string Password { get; set; }

        [Required(ErrorMessage = "Please type your password again")]
        [Compare("Password", ErrorMessage = "The two password doesn not match, check them out")]
        public string RepeatPassword { get; set; }
    }
}
