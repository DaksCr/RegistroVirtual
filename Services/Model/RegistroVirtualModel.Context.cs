﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class RegistroVirtualEntities : DbContext
    {
        public RegistroVirtualEntities()
            : base("name=RegistroVirtualEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Institution> Institution { get; set; }
        public virtual DbSet<Users> Users { get; set; }
        public virtual DbSet<Classes> Classes { get; set; }
        public virtual DbSet<Roles> Roles { get; set; }
        public virtual DbSet<Subjects> Subjects { get; set; }
        public virtual DbSet<Students> Students { get; set; }
        public virtual DbSet<ExtraclassWorks> ExtraclassWorks { get; set; }
        public virtual DbSet<RegisterProfiles> RegisterProfiles { get; set; }
        public virtual DbSet<SchoolYears> SchoolYears { get; set; }
        public virtual DbSet<Trimesters> Trimesters { get; set; }
        public virtual DbSet<Exams> Exams { get; set; }
        public virtual DbSet<Scores> Scores { get; set; }
        public virtual DbSet<ExamScores> ExamScores { get; set; }
        public virtual DbSet<ExtraclassWorksScores> ExtraclassWorksScores { get; set; }
        public virtual DbSet<ClassesByUsers> ClassesByUsers { get; set; }
    }
}
