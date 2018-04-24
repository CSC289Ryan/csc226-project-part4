using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace SportsPro {
    public partial class CustomerSurvey : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            this.Page.Form.DefaultFocus = txtCustomerID.ClientID;
            lblNoIncidents.Visible = false;
        }

        protected void btnGetIncidents_Click(object sender, EventArgs e) {
            lstIncidents.Items.Clear();
            DataView incidentsTable = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            incidentsTable.RowFilter = string.Format("CustomerID = '{0}' And DateClosed Is Not Null",
                txtCustomerID.Text);
            if (incidentsTable.Count == 0) {
                lblNoIncidents.Text = "No closed incidents found for that customer ID.";
                lblNoIncidents.Visible = true;
                DisableSurveyFields();
            } else {
                lstIncidents.Items.Add(new ListItem("--Select an incident--", "None"));
                foreach (DataRowView row in incidentsTable) {
                    Models.Incident i = new Models.Incident();
                    i.IncidentID = (int)row["IncidentID"];
                    i.CustomerID = (int)row["CustomerID"];
                    i.ProductCode = row["ProductCode"].ToString();
                    i.TechID = (int)row["TechID"];
                    i.DateOpened = (DateTime)row["DateOpened"];
                    i.DateClosed = (DateTime)row["DateClosed"];
                    i.Title = row["Title"].ToString();
                    lstIncidents.Items.Add(new ListItem(i.CustomerIncidentDisplay(), i.IncidentID.ToString()));
                }
                lstIncidents.Focus();
                //lstIncidents.Items[0].Selected = true; // Commented to let validator trigger on no selection
                EnableSurveyFields();
            }
        }

        private void EnableSurveyFields() {
            lstIncidents.Enabled = true;
            rblResponseTime.Enabled = true;
            rblEfficiency.Enabled = true;
            rblResolution.Enabled = true;
            txtComments.Enabled = true;
            chkContactMe.Enabled = true;
            rdoEmail.Enabled = true;
            rdoPhone.Enabled = true;
            btnSubmit.Enabled = true;
        }

        private void DisableSurveyFields() {
            lstIncidents.Enabled = false;
            rblResponseTime.Enabled = false;
            rblEfficiency.Enabled = false;
            rblResolution.Enabled = false;
            txtComments.Enabled = false;
            chkContactMe.Enabled = false;
            rdoEmail.Enabled = false;
            rdoPhone.Enabled = false;
            btnSubmit.Enabled = false;
        }

        protected void btnSubmit_Click(object sender, EventArgs e) {
            Models.Survey s = new Models.Survey();
            ListItem i = lstIncidents.SelectedItem;
            if (i.Value == "None") {
                // didn't pick an incident
                rfvIncidents.IsValid = false;
            } else if (string.IsNullOrWhiteSpace(txtCustomerID.Text)) {
                // removed text after getting incidents
                rfvCustomerID.IsValid = false;
            } else {
                s.CustomerID = int.Parse(txtCustomerID.Text); // User could change this before submit. BUG
                s.IncidentID = int.Parse(i.Value.ToString());
                s.ResponseTime = int.Parse(rblResponseTime.SelectedValue);
                s.TechEfficiency = int.Parse(rblEfficiency.SelectedValue);
                s.Resolution = int.Parse(rblResolution.SelectedValue);
                s.Comments = txtComments.Text;
                s.Contact = chkContactMe.Checked;
                s.ContactBy = rdoEmail.Checked ? "Email" : "Phone";
                Session["ContactCustomer"] = s.Contact;
                Response.Redirect("~/CustomerSupport/SurveyComplete");
            }
        }
    }
}