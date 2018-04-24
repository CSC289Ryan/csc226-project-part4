using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SportsPro.Models;

namespace SportsPro {
    public partial class ContactDisplay : System.Web.UI.Page {
        private CustomerList contacts;

        protected void Page_Load(object sender, EventArgs e) {
            contacts = CustomerList.GetCustomers();
            DisplayContactsOnFirstLoad();
        }

        private void DisplayContactsOnFirstLoad() {
            if (!IsPostBack) {
                DisplayContacts();
            }
        }

        private void DisplayContacts() {
            lstContacts.Items.Clear();
            for (int idx = 0; idx < contacts.Count; idx++) {
                lstContacts.Items.Add(new ListItem(contacts[idx].ContactDisplay()));
            }
        }

        protected void btnRemoveContact_Click(object sender, EventArgs e) {
            RemoveChosenContact();
        }

        private void RemoveChosenContact() {
            if (!ContactsExist()) {
                return;
            }
            int selectedIdx = lstContacts.SelectedIndex;
            bool itemIsSelected = (selectedIdx > -1);
            if (itemIsSelected) {
                contacts.RemoveAt(selectedIdx);
                DisplayContacts(); // refresh display
            } else {
                NotifyUser("Please select a contact to remove.");
            }
        }

        private bool ContactsExist() {
            return contacts.Count > 0;
        }

        private void NotifyUser(string msg) {
            lblMessage.Text = msg;
        }

        protected void btnEmptyContacts_Click(object sender, EventArgs e) {
            RemoveAllContacts();
        }

        private void RemoveAllContacts() {
            if (ContactsExist()) {
                contacts.Clear();
                lstContacts.Items.Clear(); // refresh display
            }            
        }
    }
}