//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Services.Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class ClassesByUsers
    {
        public int UserId { get; set; }
        public int ClassId { get; set; }
        public int SubjectId { get; set; }
        public int YearCreated { get; set; }
    
        public virtual Classes Classes { get; set; }
        public virtual Subjects Subjects { get; set; }
        public virtual Users Users { get; set; }
    }
}
