using LoginAppTesting.ViewModel;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace LoginAppTesting.Controllerss
{
    public class LoginController : Controller
    {
        private readonly SignInManager<IdentityUser> _signinManager;
        private readonly UserManager<IdentityUser> _userManager;
        private readonly ILogger<LoginController> _acountCtrl;
        private readonly RoleManager<IdentityRole> _roleManager;
         

        public LoginController(SignInManager<IdentityUser> signinManager , 
                               UserManager<IdentityUser> userManager,
                               ILogger<LoginController>  acountCtrl,
                               RoleManager<IdentityRole> roleManager)
        {
            _signinManager = signinManager;
            _roleManager = roleManager;
            _userManager = userManager;
            _acountCtrl = acountCtrl;
        }
        [HttpGet]
        public IActionResult loginUser()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> loginUser(LoginViewModel model)
        {

            try
            {
                if (!ModelState.IsValid)
                {
                    return View();
                }
                var user = await _userManager.FindByNameAsync(model.Username);
                if(user == null)
                {
                    ModelState.AddModelError("Username", "There is not any user with that UserName");
                    return View();

                }
                if (!user.LockoutEnabled)
                {
                    ModelState.AddModelError("Account", "Your account is blocked");
                    return View();
                }
                var result = await _signinManager.PasswordSignInAsync(user, model.Password, false, false);
                if (!result.Succeeded)
                {
                    ModelState.AddModelError("Account", "Error in login");
                    return View();
                }
                ModelState.AddModelError("Succes", "nashe");
                var roles = await _userManager.GetRolesAsync(user);
                var rolNow = roles.ToList().FirstOrDefault();
                if(rolNow == "admin")
                {
                    return RedirectToAction("crudTable","CRUD");
                }else if(rolNow == "user")
                {
                    ViewBag.UserLogued = user.UserName;
                    return RedirectToAction("basicPage","CRUD");
                }

                return View();
                 
                

            }
            catch (Exception)
            {

                throw;
            }
            return null;
        } 


      

        [HttpGet]
        public async Task<IActionResult> logoutUser()
        {
            await _signinManager.SignOutAsync();
            ModelState.AddModelError("Sign Out", "Sign Out success");
            return View("loginUser");
        }

        [HttpGet]
        public IActionResult signInUser()
        {

            return View();
        }

        [HttpPost]
        public async Task<IActionResult> signInUser(SignInViewModel model)
        {
            try
            {
                //PARA CREAR ROLES =  descomentar el codigo de abajo
                //ir a pestaña de signUp , crear un usuario
                //luego devolver el codigo a la normalidad

                /////////////////////////////////////////

                /* IdentityRole role = new IdentityRole
                 {

                     Name = "user"
                 };
                 IdentityRole role2 = new IdentityRole
                 {

                     Name = "admin"
                 };
                await _roleManager.CreateAsync(role);
                 await _roleManager.CreateAsync(role2);  */




                //////////////////////////////////

                if (!ModelState.IsValid)
                { return View(); 
                
                }
                IdentityUser user = new IdentityUser {UserName = model.Username};
                var userExists = await _userManager.FindByNameAsync(user.UserName);
                if (userExists != null)
                {
                    ModelState.AddModelError("SignUp", "This UserName is already in use");
                    return View();
                }
               

                var result = await _userManager.CreateAsync(user,model.Password);
                if (!result.Succeeded)
                {
                    ModelState.AddModelError("SignUp", "Error");
                    return View();
                }

                ModelState.AddModelError("Succes", "You are now registered");
                var role = _roleManager.Roles.Where(e => e.Name == "user").FirstOrDefault();     //PARA CREAR ADMIN = modificar esta linea y poner en el string "admin", luego volver a "user"
                var final = _userManager.AddToRoleAsync(user, role.Name);
                if (!final.Result.Succeeded)
                {
                    ModelState.AddModelError("SignUp", "Error");
                    return View();
                }
                return View(); 
            }
            catch (Exception)
            {

                throw;
            }
            return null;
        }
    }
}
