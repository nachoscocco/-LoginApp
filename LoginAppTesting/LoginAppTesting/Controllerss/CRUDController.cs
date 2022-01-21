using LoginAppTesting.ViewModel;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace LoginAppTesting.Controllerss
{
    public class CRUDController : Controller
    {
        private readonly UserManager<IdentityUser> _userManager;

        public CRUDController(UserManager<IdentityUser> userManager)
        {
            _userManager = userManager;
        }

        [HttpGet]
        public IActionResult crudTable()
        {
            return View();
        }

        [HttpPost] 
        public IActionResult crudTable(int xd)
        {
            return null;
        }

       [HttpGet]
       public IActionResult basicPage()
        {
            return View();
        }

        [HttpPost]
        public IActionResult basicPage(int xd)
        {
            return null;
        }

        public async Task<IActionResult> switchUserState(string Id)
        {
            var user = await _userManager.FindByIdAsync(Id);
            user.LockoutEnabled=!user.LockoutEnabled;
            var rat = await _userManager.UpdateAsync(user);
            return RedirectToAction("crudTable", "CRUD");
        }
        [HttpGet]
        public async Task<IActionResult> updateUser(string Id)
        {
            var user = await _userManager.FindByIdAsync(Id);
            var role="hi";
            ViewBag.User = user;
            ViewBag.Role = role;
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> updateUser(UpdateViewModel model,string Id)
        {
            var user = await _userManager.FindByIdAsync(Id);
            await _userManager.RemoveFromRoleAsync(user, "admin");
            await _userManager.RemoveFromRoleAsync(user, "user");
            await _userManager.AddToRoleAsync(user, model.RoleId);
            user.UserName = model.Username;
           await _userManager.UpdateAsync(user);

            return RedirectToAction("crudTable", "CRUD"); ;
        }

     
    }
}
