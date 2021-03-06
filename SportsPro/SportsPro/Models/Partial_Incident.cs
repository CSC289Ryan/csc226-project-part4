﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SportsPro.Models {
    public partial class Incident {
        /*  Properties commented out in favor of Entity Framework Data model
        public int IncidentID { get; set; }
        public int CustomerID { get; set; }
        public string ProductCode { get; set; }
        public int TechID { get; set; }
        public DateTime DateOpened { get; set; }
        public DateTime DateClosed{ get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        */
        public string CustomerIncidentDisplay() {
            //string formatted = $"Incident for product {ProductCode} closed {DateClosed.ToShortDateString()} ({Title})";
            string closeDate = ((DateTime)DateClosed).ToShortDateString();
            string formatted = $"Incident for product {ProductCode} closed {closeDate} ({Title})";
            return formatted;
        }
    }
}