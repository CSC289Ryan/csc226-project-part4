using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SportsPro.Models;
using System.Net.Mail;

namespace SportsPro {
    public partial class ProductRegistration : System.Web.UI.Page {
        private Customer selected;
        protected void Page_Load(object sender, EventArgs e) {
            selected = (Customer)Session["customer"];
        }

        protected void btnGetCustomer_Click(object sender, EventArgs e) {
            if (!Page.IsValid) {
                ResetProductControls();
                return;
            }
            int customerID = int.Parse(txtCustomerID.Text);
            SetupPageForCustomer(customerID);
        }

        private void SetupPageForCustomer(int customerID) {
            TechSupportEntities db = new TechSupportEntities();
            selected = db.Customers.Find(customerID);
            if (selected == null) {
                return;
            }
            Session["customer"] = selected;
            lblName.Text = selected.Name;
            btnRegisterProduct.Enabled = true;
            ddlProducts.Enabled = true;
        }

        protected void cstmCustomerID_ServerValidate(object source, ServerValidateEventArgs args) {
            TechSupportEntities db = new TechSupportEntities();
            Customer c = db.Customers.Find(int.Parse(args.Value));
            args.IsValid = (c == null) ? false : true;
            if (!args.IsValid) {
                ResetProductControls();
            }
        }

        private void ResetProductControls() {
            lblName.Text = "";
            btnRegisterProduct.Enabled = false;
            ddlProducts.Enabled = false;
        }

        protected void btnRegisterProduct_Click(object sender, EventArgs e) {
            // register product and send email
            SendConfirmationEmail();
        }

        private void SendConfirmationEmail() {
            if (selected == null) { return; }
            MailAddress to = new MailAddress(selected.Email);
            MailMessage msg = new MailMessage();
            msg.To.Add(to);
            msg.Subject = "SportsPro Registration Confirmation";
            msg.Body = $"Thanks for registering, {selected.Name}.";
            SmtpClient client = new SmtpClient();
            client.Send(msg);
        }
    }
}