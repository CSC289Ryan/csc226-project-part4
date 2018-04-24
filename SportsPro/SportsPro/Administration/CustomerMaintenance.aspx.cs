using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SportsPro.Administration {
    public partial class CustomerMaintenance : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
        }

        protected void DetailsView1_ItemInserted(object sender, DetailsViewInsertedEventArgs e) {
            if (e.Exception != null) {
                lblErrorMsg.Text = DatabaseErrorMessage(e.Exception.Message);
                e.ExceptionHandled = true;
                e.KeepInInsertMode = true;
            } else {
                GridView1.DataBind();
            }
        }

        protected void DetailsView1_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e) {
            if (e.Exception != null) {
                lblErrorMsg.Text = DatabaseErrorMessage(e.Exception.Message);
                e.ExceptionHandled = true;
                e.KeepInEditMode = true;
            } else if (e.AffectedRows == 0) {
                lblErrorMsg.Text = ConcurrencyErrorMessage();
            } else {
                GridView1.DataBind();
            }
        }

        protected void DetailsView1_ItemDeleted(object sender, DetailsViewDeletedEventArgs e) {
            if (e.Exception != null) {
                lblErrorMsg.Text = DatabaseErrorMessage(e.Exception.Message);
                e.ExceptionHandled = true;
            } else if (e.AffectedRows == 0) {
                lblErrorMsg.Text = ConcurrencyErrorMessage();
            } else {
                GridView1.DataBind();
            }
        }

        protected void GridView1_PreRender(object sender, EventArgs e) {
            GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;
        }

        private string DatabaseErrorMessage(string errorMsg) {
            return $"<b>A database error has occurred:</b> {errorMsg}";
        }

        private string ConcurrencyErrorMessage() {
            return "Another user may have updated that customer. Please try again.";
        }
    }
}