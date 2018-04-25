using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SportsPro.Models;
using System.Web.ModelBinding;

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

        // The return type can be changed to IEnumerable, however to support
        // paging and sorting, the following parameters must be added:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public IQueryable<Incident> grdIncidents_GetData([Control] string ddlCustomer) {
            TechSupportEntities db = new TechSupportEntities();
            if (ddlCustomer == null) ddlCustomer = db.Customers.FirstOrDefault().CustomerID.ToString();
            return from i in db.Incidents
                   where i.CustomerID.ToString() == ddlCustomer
                   select i;
        }
    }
}