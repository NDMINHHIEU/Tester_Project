//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Cinema_mini.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class View_get_staff_info
    {
        public int id { get; set; }
        public string name { get; set; }
        public int phone { get; set; }
        public string address { get; set; }
        public int type_staff { get; set; }
        public string name_type_staff { get; set; }
        public System.DateTime check_in { get; set; }
        public System.DateTime check_out { get; set; }
        public int actual_wkd { get; set; }
        public int standard_salary { get; set; }
        public string actual_salary { get; set; }
        public string status { get; set; }
    }
}