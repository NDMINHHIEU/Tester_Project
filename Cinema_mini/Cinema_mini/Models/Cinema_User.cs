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
    
    public partial class Cinema_User
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Cinema_User()
        {
            this.Cinema_Ticket = new HashSet<Cinema_Ticket>();
        }
    
        public int id { get; set; }
        public string username { get; set; }
        public string pass { get; set; }
        public int type { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Cinema_Ticket> Cinema_Ticket { get; set; }
        public virtual Cinema_Usertype Cinema_Usertype { get; set; }
    }
}
