using LoginAppTest.Model;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace LoginAppTesting.ViewModel
{
    public class UpdateViewModel
    {
        [Required(ErrorMessage = "Please type your username ")]
        public string Username { get; set; }

        [Required(ErrorMessage = "Please select role")]
        public string RoleId { get; set; }
    }
}
