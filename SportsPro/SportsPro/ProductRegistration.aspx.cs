using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SportsPro.Models;

namespace SportsPro {
    public partial class ProductRegistration : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {

        }

        protected void btnGetCustomer_Click(object sender, EventArgs e) {
            int customerID = int.Parse(txtCustomerID.Text);
            SetupPageForCustomer(customerID);
        }

        private void SetupPageForCustomer(int customerID) {
            if (!IsValid) return;
            TechSupportEntities db = new TechSupportEntities();
            Customer c = db.Customers.Find(customerID);
            if (c == null) {
                return;
            }
            lblName.Text = c.Name;
            btnRegisterProduct.Enabled = true;
            ddlProducts.Enabled = true;
            FillProductsDropdownForCustomer(c);
        }

        private void FillProductsDropdownForCustomer(Customer c) {
            
        }

        protected void cstmCustomerID_ServerValidate(object source, ServerValidateEventArgs args) {
            TechSupportEntities db = new TechSupportEntities();
            Customer c = db.Customers.Find(int.Parse(args.Value));
            cstmCustomerID.IsValid = (c == null) ? false : true;
            if (!cstmCustomerID.IsValid) {
                ResetProductControls();
            }
        }

        private void ResetProductControls() {
            lblName.Text = "";
            btnRegisterProduct.Enabled = false;
            ddlProducts.Enabled = false;
        }
    }
}