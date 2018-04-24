using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SportsPro.Administration {
    public partial class TechnicianMaintenance : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {

        }

        protected void FormView1_ItemUpdated(object sender, FormViewUpdatedEventArgs e) {
            if (e.Exception != null) {
                lblErrorMsg.Text = DatabaseErrorMessage(e.Exception.Message);
                e.ExceptionHandled = true;
                e.KeepInEditMode = true;
            } else if (e.AffectedRows == 0) {
                lblErrorMsg.Text = ConcurrencyErrorMessage();
            } else {
                DropDownList1.DataBind();
            }
        }

        protected void FormView1_ItemDeleted(object sender, FormViewDeletedEventArgs e) {
            if (e.Exception != null) {
                lblErrorMsg.Text = DatabaseErrorMessage(e.Exception.Message);
                e.ExceptionHandled = true;
            } else if (e.AffectedRows == 0) {
                lblErrorMsg.Text = ConcurrencyErrorMessage();
            } else {
                DropDownList1.DataBind();
            }
        }

        protected void FormView1_ItemInserted(object sender, FormViewInsertedEventArgs e) {
            if (e.Exception != null) {
                lblErrorMsg.Text = DatabaseErrorMessage(e.Exception.Message);
                e.ExceptionHandled = true;
                e.KeepInInsertMode = true;
            } else {
                DropDownList1.DataBind();
            }
        }

        private string DatabaseErrorMessage(string errorMsg) {
            return $"<b>A database error has occurred:</b> {errorMsg}";
        }

        private string ConcurrencyErrorMessage() {
            return "Another user may have updated that customer. Please try again.";
        }
    }
}