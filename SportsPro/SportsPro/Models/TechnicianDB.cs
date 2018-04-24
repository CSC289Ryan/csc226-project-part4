using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Collections;
using System.ComponentModel;

namespace SportsPro.Models {
    [DataObject(true)]
    public static class TechnicianDB {
        [DataObjectMethod(DataObjectMethodType.Select)]
        public static IEnumerable GetAllTechnicians() {
            SqlConnection conn = new SqlConnection(TechSupportDB.GetConnectionString());
            string select = "Select TechID, Name, Email, Phone From Technicians Order By Name";
            SqlCommand cmd = new SqlCommand(select, conn);
            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
            return dr;
        }
    }
}