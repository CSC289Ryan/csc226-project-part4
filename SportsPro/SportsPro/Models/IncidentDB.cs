using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Collections;
using System.ComponentModel;
using System.Data.SqlClient;

namespace SportsPro.Models {
    [DataObject(true)]
    public static class IncidentDB {
        [DataObjectMethod(DataObjectMethodType.Select)]
        public static IEnumerable GetOpenTechIncidents(int techID) {
            SqlConnection conn = new SqlConnection(TechSupportDB.GetConnectionString());
            string select = "Select I.DateOpened, I.ProductCode, C.Name " + 
                "From Incidents I "+ 
                "Left Join Customers C On I.CustomerID = C.CustomerID " + 
                "Where TechID = @TechID And DateClosed Is Null " +
                "Order By I.DateOpened;";
            SqlCommand cmd = new SqlCommand(select, conn);
            cmd.Parameters.AddWithValue("@TechID", techID);
            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
            return dr;
        }
    }
}