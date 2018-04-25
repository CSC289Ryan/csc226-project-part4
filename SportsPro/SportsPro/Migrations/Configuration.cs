namespace SportsPro.Migrations
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Migrations;
    using System.Linq;
    using Microsoft.AspNet.Identity;
    using Microsoft.AspNet.Identity.EntityFramework;
    using SportsPro.Models;
    internal sealed class Configuration : DbMigrationsConfiguration<SportsPro.Models.ApplicationDbContext>
    {
        public Configuration()
        {
            AutomaticMigrationsEnabled = false;
            ContextKey = "SportsPro.Models.ApplicationDbContext";
        }

        protected override void Seed(SportsPro.Models.ApplicationDbContext context)
        {
            //  This method will be called after migrating to the latest version.

            //  You can use the DbSet<T>.AddOrUpdate() helper extension method 
            //  to avoid creating duplicate seed data. E.g.
            //
            //    context.People.AddOrUpdate(
            //      p => p.FullName,
            //      new Person { FullName = "Andrew Peters" },
            //      new Person { FullName = "Brice Lambson" },
            //      new Person { FullName = "Rowan Miller" }
            //    );
            //
            string adminRole = "admin";
            string techRole = "technician";
            context.Roles.AddOrUpdate(r => r.Name, new IdentityRole { Name = adminRole });
            context.Roles.AddOrUpdate(r => r.Name, new IdentityRole { Name = techRole });

            string adminUser = "admin@test.com";
            string adminPass = "P@ssw0rd";
            if (!context.Users.Any(u => u.UserName == adminUser)) {
                var manager = new ApplicationUserManager(
                    new UserStore<ApplicationUser>(context));
                var user = new ApplicationUser {
                    UserName = adminUser ,
                    Email = adminUser
                };
                manager.Create(user, adminPass);
                manager.AddToRole(user.Id, adminRole);
            }

            string techUser = "technician@test.com";
            string techPass = "Techn!c!4n";
            if (!context.Users.Any(u => u.UserName == techUser)) {
                var manager = new ApplicationUserManager(
                    new UserStore<ApplicationUser>(context));
                var user = new ApplicationUser {
                    UserName = techUser,
                    Email = techUser
                };
                manager.Create(user, techPass);
                manager.AddToRole(user.Id, techRole);
            }

            string normalUser = "normal@test.com";
            string normalPass = "Norm@l_1";
            if (!context.Users.Any(u => u.UserName == normalUser)) {
                var manager = new ApplicationUserManager(
                    new UserStore<ApplicationUser>(context));
                var user = new ApplicationUser {
                    UserName = normalUser,
                    Email = normalUser
                };
                manager.Create(user, normalPass);
                // Don't add to any role
            }
        }
    }
}
