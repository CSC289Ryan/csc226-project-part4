using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SportsPro {
    public partial class CustomerIncidentDisplay : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {

        }

        protected void DataList1_PreRender(object sender, EventArgs e) {
            DataList1.DataBind();
            if (DataList1.Items.Count == 0) {
                lblNoData.Visible = true;
            } else {
                lblNoData.Visible = false;
            }
        }
    }
}