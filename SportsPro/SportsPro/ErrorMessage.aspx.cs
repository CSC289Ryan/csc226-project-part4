using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SportsPro {
    public partial class ErrorMessage : System.Web.UI.Page {
        private string errorMsg;
        protected void Page_Load(object sender, EventArgs e) {
            errorMsg = (string)Session["ErrorMessage"];
            if (string.IsNullOrEmpty(errorMsg)) { errorMsg = "Unknown Error"; }
            lblErrorMsg.Text = errorMsg;
        }

        protected void btnReturn_Click(object sender, EventArgs e) {
            string returnUrl = (string)Session["ReturnUrl"];
            if (string.IsNullOrEmpty(returnUrl)) { returnUrl = "~/"; }
            Response.Redirect(returnUrl);
        }
    }
}