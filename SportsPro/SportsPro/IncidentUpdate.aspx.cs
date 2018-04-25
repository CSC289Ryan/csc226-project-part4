using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SportsPro.Models;

namespace SportsPro {
    public partial class IncidentUpdate : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {

        }

        public IQueryable<Customer> ddlCustomers_GetData() {
            TechSupportEntities db = new TechSupportEntities();
            return from c in db.Customers
                   orderby c.Name
                   select c;
        }
    }
}