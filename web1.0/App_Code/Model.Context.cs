﻿//------------------------------------------------------------------------------
// <auto-generated>
//    此代码是根据模板生成的。
//
//    手动更改此文件可能会导致应用程序中发生异常行为。
//    如果重新生成代码，则将覆盖对此文件的手动更改。
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;

public partial class TeachingCenterEntities : DbContext
{
    public TeachingCenterEntities()
        : base("name=TeachingCenterEntities")
    {
    }

    protected override void OnModelCreating(DbModelBuilder modelBuilder)
    {
        throw new UnintentionalCodeFirstException();
    }

    public DbSet<Activity> Activity { get; set; }
    public DbSet<ActivityCategory> ActivityCategory { get; set; }
    public DbSet<ActivitySummary> ActivitySummary { get; set; }
    public DbSet<ActivityTeacher> ActivityTeacher { get; set; }
    public DbSet<Admin> Admin { get; set; }
    public DbSet<Develop> Develop { get; set; }
    public DbSet<DevelopCategory> DevelopCategory { get; set; }
    public DbSet<EducateSource> EducateSource { get; set; }
    public DbSet<FriendsLink> FriendsLink { get; set; }
    public DbSet<Introduction> Introduction { get; set; }
    public DbSet<JudgeApplication> JudgeApplication { get; set; }
    public DbSet<PasswordCode> PasswordCode { get; set; }
    public DbSet<Picture> Picture { get; set; }
    public DbSet<ProCatCategory> ProCatCategory { get; set; }
    public DbSet<Project> Project { get; set; }
    public DbSet<ProjectCategory> ProjectCategory { get; set; }
    public DbSet<ProjectJudge> ProjectJudge { get; set; }
    public DbSet<ProjectStage> ProjectStage { get; set; }
    public DbSet<Service> Service { get; set; }
    public DbSet<ServiceCategory> ServiceCategory { get; set; }
    public DbSet<SourceCategory> SourceCategory { get; set; }
    public DbSet<Teacher> Teacher { get; set; }
    public DbSet<ApplicationInfo> ApplicationInfo { get; set; }
    public DbSet<ProjectInfo> ProjectInfo { get; set; }
}
