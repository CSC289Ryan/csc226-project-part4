using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SportsPro.Administration {
    public partial class TechnicianIncidentSummary : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {

        }

        protected void GridView1_PreRender(object sender, EventArgs e) {
            GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;
        }
    }
}