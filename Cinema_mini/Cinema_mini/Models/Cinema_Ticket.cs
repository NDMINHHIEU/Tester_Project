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
    
    public partial class Cinema_Ticket
    {
        public int id { get; set; }
        public int id_pc { get; set; }
        public int id_sc { get; set; }
        public int id_user { get; set; }
        public int id_type_tick { get; set; }
        public int id_film { get; set; }
        public int id_nv { get; set; }
        public Nullable<System.DateTime> created_date { get; set; }
    
        public virtual Cinema_Film Cinema_Film { get; set; }
        public virtual Cinema_Room Cinema_Room { get; set; }
        public virtual Cinema_Showtime Cinema_Showtime { get; set; }
        public virtual Cinema_TypeTick Cinema_TypeTick { get; set; }
        public virtual Cinema_User Cinema_User { get; set; }
        public virtual Cinema_Staff Cinema_Staff { get; set; }
    }
}
