using LoginAppTest.Model;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace LoginAppTesting.Context
{
    public class BaseContext :IdentityDbContext
    {
        public BaseContext(DbContextOptions<BaseContext> options) : base(options)
        {

        }
        public BaseContext()
        {

        }
        public DbSet<User> User { get; set; }


    }
}
 