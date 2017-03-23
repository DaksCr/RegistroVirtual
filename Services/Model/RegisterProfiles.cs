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
    
    public partial class RegisterProfiles
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public RegisterProfiles()
        {
            this.ExtraclassWorks = new HashSet<ExtraclassWorks>();
            this.Exams = new HashSet<Exams>();
            this.Scores = new HashSet<Scores>();
        }
    
        public int Id { get; set; }
        public string Name { get; set; }
        public double DailyWorkPercentage { get; set; }
        public double ConceptPercentage { get; set; }
        public double AssistancePercentage { get; set; }
        public Nullable<int> YearCreated { get; set; }
        public int NumberOfLessons { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ExtraclassWorks> ExtraclassWorks { get; set; }
        public virtual SchoolYears SchoolYears { get; set; }
        public virtual Trimesters Trimesters { get; set; }
        public virtual Users Users { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Exams> Exams { get; set; }
        public virtual Subjects Subjects { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Scores> Scores { get; set; }
    }
}
