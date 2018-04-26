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
            lblError.Text = "";
            btnRegisterProduct.Enabled = false;
            ddlProducts.Enabled = false;
        }

        protected void btnRegisterProduct_Click(object sender, EventArgs e) {
            if (IsValid && ddlProducts.SelectedIndex > -1) {
                var parameters = SqlDataSource2.InsertParameters;
                parameters["CustomerID"].DefaultValue = selected.CustomerID.ToString();
                parameters["ProductCode"].DefaultValue = ddlProducts.SelectedValue;
                parameters["RegistrationDate"].DefaultValue = DateTime.Now.ToString();
                try {
                    SqlDataSource2.Insert();
                    SendConfirmationEmail(ddlProducts.SelectedItem.Text); // Easy hard-coded email
                    ResetProductControls();
                    txtCustomerID.Text = "";
                }
                catch (Exception ex) {
                    string errorMsg = "A database error has occurred. " +
                        "Message: " + ex.Message;
                    lblError.Text = errorMsg;
                    // TODO: Redirect to ErrorMessage page passing errorMsg
                }
            }
        }

        private void SendConfirmationEmail(string product) {
            if (selected == null) { return; }
            MailAddress to = new MailAddress(selected.Email);
            MailMessage msg = new MailMessage();
            msg.To.Add(to);
            msg.Subject = "SportsPro Registration Confirmation";
            msg.Body = $"{selected.Name},\n\nThanks for registering '{product}'.";
            SmtpClient client = new SmtpClient();
            client.Send(msg);
        }
    }
}