using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SportsPro.Models;
using System.Web.ModelBinding;
using System.Data.Entity.Infrastructure;
using System.Data.Entity.Validation;

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
        public IQueryable<Incident> grdIncidents_GetData([Control] string ddlCustomers) {
            TechSupportEntities db = new TechSupportEntities();
            if (ddlCustomers == null)
                ddlCustomers = db.Customers.FirstOrDefault().CustomerID.ToString();
            return from i in db.Incidents
                   where i.CustomerID.ToString() == ddlCustomers
                   select i;
        }

        // The id parameter name should match the DataKeyNames value set on the control
        public void grdIncidents_UpdateItem(int IncidentID) {
            Incident item = null;
            // Load the item here, e.g. item = MyDataLayer.Find(id);
            TechSupportEntities db = new TechSupportEntities();
            item = db.Incidents.Find(IncidentID);
            if (item == null) {
                // The item wasn't found
                ModelState.AddModelError("", String.Format("Item with id {0} was not found", IncidentID));
                return;
            }
            TryUpdateModel(item);
            if (ModelState.IsValid) {
                // Save changes here, e.g. MyDataLayer.SaveChanges();
                try {
                    db.SaveChanges();
                    grdIncidents.DataBind();
                }
                catch (DbUpdateConcurrencyException ex) { HandleConcurrencyError(ex); }
                catch (DbEntityValidationException ex) { HandleValidationError(ex); }
                catch (Exception ex) { HandleOtherErrors(ex); }
            }
        }

        private void HandleConcurrencyError(DbUpdateConcurrencyException ex) {
            ex.Entries.Single().Reload();
            ModelState.AddModelError("", "Another user changed or deleted that incident.");
        }

        private void HandleValidationError(DbEntityValidationException ex) {
            foreach (var ve in ex.EntityValidationErrors) {
                foreach (var e in ve.ValidationErrors) {
                    ModelState.AddModelError("", $"Error: {e.ErrorMessage}");
                }
            }
        }

        private void HandleOtherErrors(Exception ex) {
            // Get innermost, relevant exception
            while (ex.InnerException != null) {
                ex = ex.InnerException;
            }
            ModelState.AddModelError("", $"Error: {ex.Message}");
        }

        protected void grdIncidents_PreRender(object sender, EventArgs e) {
            // For proper Bootstrap formatting
            if (grdIncidents.HeaderRow != null)
                grdIncidents.HeaderRow.TableSection = TableRowSection.TableHeader;
        }
    }
}