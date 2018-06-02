﻿//------------------------------------------------------------------------------
// <auto-generated>
//    此代码是根据模板生成的。
//
//    手动更改此文件可能会导致应用程序中发生异常行为。
//    如果重新生成代码，则将覆盖对此文件的手动更改。
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Collections.Generic;

public partial class Activity
{
    public Activity()
    {
        this.ActivityTeacher = new HashSet<ActivityTeacher>();
    }

    public int Activity_id { get; set; }
    public string Activity_title { get; set; }
    public System.DateTime Activity_time { get; set; }
    public string Activity_content { get; set; }
    public string Activity_place { get; set; }
    public int Activity_nowcount { get; set; }
    public int Activity_limitcount { get; set; }
    public int Activity_categoryid { get; set; }
    public long Activity_isdeleted { get; set; }
    public string Activity_author { get; set; }
    public int Activity_hit { get; set; }
    public Nullable<System.DateTime> Activity_deletedtime { get; set; }
    public string Activity_summary { get; set; }
    public System.DateTime Activity_hold_time { get; set; }

    public virtual ActivityCategory ActivityCategory { get; set; }
    public virtual ICollection<ActivityTeacher> ActivityTeacher { get; set; }
}

public partial class ActivityCategory
{
    public ActivityCategory()
    {
        this.Activity = new HashSet<Activity>();
    }

    public int ActivityCategory_id { get; set; }
    public string ActivityCategory_name { get; set; }

    public virtual ICollection<Activity> Activity { get; set; }
}

public partial class ActivitySummary
{
    public int ActivitySummary_id { get; set; }
    public string ActivitySummary_title { get; set; }
    public System.DateTime ActivitySummary_time { get; set; }
    public string ActivitySummary_content { get; set; }
    public long ActivitySummary_isdeleted { get; set; }
    public string ActivitySummary_author { get; set; }
    public string ActivitySummary_cover { get; set; }
    public int ActivitySummary_hit { get; set; }
    public Nullable<System.DateTime> ActivitySummary_deletedtime { get; set; }
    public string ActivitySummary_summary { get; set; }
}

public partial class ActivityTeacher
{
    public int id { get; set; }
    public int activity_id { get; set; }
    public int teacher_id { get; set; }

    public virtual Activity Activity { get; set; }
    public virtual Teacher Teacher { get; set; }
}

public partial class Admin
{
    public string Admin_id { get; set; }
    public string Admin_pwd { get; set; }
    public string Admin_name { get; set; }
    public string Admin_emai { get; set; }
    public string Admin_phone { get; set; }
    public Nullable<System.DateTime> Admin_birthday { get; set; }
    public long Admin_emai_check { get; set; }
}

public partial class ApplicationInfo
{
    public int id { get; set; }
    public string name { get; set; }
    public int gender { get; set; }
    public string department { get; set; }
    public string rank { get; set; }
    public string submit_time { get; set; }
}

public partial class Develop
{
    public int Develop_id { get; set; }
    public string Develop_title { get; set; }
    public string Develop_author { get; set; }
    public System.DateTime Develop_time { get; set; }
    public string Develop_content { get; set; }
    public string Develop_link { get; set; }
    public int Develop_hit { get; set; }
    public long Develop_deleted { get; set; }
    public int Develop_category { get; set; }
    public string Develop_path { get; set; }
    public Nullable<System.DateTime> Develop_deteledtime { get; set; }
    public string Develop_summary { get; set; }

    public virtual DevelopCategory DevelopCategory { get; set; }
}

public partial class DevelopCategory
{
    public DevelopCategory()
    {
        this.Develop = new HashSet<Develop>();
    }

    public int DevelopCategory_id { get; set; }
    public string DevelopCategory_name { get; set; }

    public virtual ICollection<Develop> Develop { get; set; }
}

public partial class EducateSource
{
    public int id { get; set; }
    public string title { get; set; }
    public string body { get; set; }
    public string publisher { get; set; }
    public string publish_time { get; set; }
    public int view_times { get; set; }
    public int is_deleted { get; set; }
    public Nullable<System.DateTime> deletedtime { get; set; }
    public string summary { get; set; }
    public int category { get; set; }

    public virtual SourceCategory SourceCategory { get; set; }
}

public partial class FriendsLink
{
    public int id { get; set; }
    public string title { get; set; }
    public string link { get; set; }
    public int orders { get; set; }
}

public partial class Introduction
{
    public int Introduction_id { get; set; }
    public string Introduction_content { get; set; }
}

public partial class JudgeApplication
{
    public int id { get; set; }
    public int teacher_id { get; set; }
    public string submit_time { get; set; }

    public virtual Teacher Teacher { get; set; }
}

public partial class PasswordCode
{
    public int id { get; set; }
    public string teacher_number { get; set; }
    public string code { get; set; }
    public System.DateTime send_time { get; set; }
}

public partial class Picture
{
    public int Picture_id { get; set; }
    public string Picture_path { get; set; }
    public int is_top { get; set; }
    public string Picture_title { get; set; }
    public string Picture_link { get; set; }
    public string Picture_summary { get; set; }
}

public partial class ProCatCategory
{
    public ProCatCategory()
    {
        this.ProjectCategory = new HashSet<ProjectCategory>();
    }

    public int ProCatCategory_id { get; set; }
    public string ProCatCategory_name { get; set; }

    public virtual ICollection<ProjectCategory> ProjectCategory { get; set; }
}

public partial class Project
{
    public Project()
    {
        this.ProjectJudge = new HashSet<ProjectJudge>();
        this.ProjectStage = new HashSet<ProjectStage>();
    }

    public int project_id { get; set; }
    public string name { get; set; }
    public int category { get; set; }
    public int teacher_id { get; set; }
    public string submit_time { get; set; }
    public string fund { get; set; }
    public int is_deleted { get; set; }
    public Nullable<System.DateTime> deletedtime { get; set; }

    public virtual ProjectCategory ProjectCategory { get; set; }
    public virtual Teacher Teacher { get; set; }
    public virtual ICollection<ProjectJudge> ProjectJudge { get; set; }
    public virtual ICollection<ProjectStage> ProjectStage { get; set; }
}

public partial class ProjectCategory
{
    public ProjectCategory()
    {
        this.Project = new HashSet<Project>();
    }

    public int id { get; set; }
    public string name { get; set; }
    public string project_file { get; set; }
    public string project_content { get; set; }
    public int stage { get; set; }
    public string end_time { get; set; }
    public string judge_end_time { get; set; }
    public int is_deleted { get; set; }
    public string publish_time { get; set; }
    public Nullable<System.DateTime> deletedtime { get; set; }
    public string summary { get; set; }
    public int category { get; set; }

    public virtual ProCatCategory ProCatCategory { get; set; }
    public virtual ICollection<Project> Project { get; set; }
}

public partial class ProjectInfo
{
    public int project_id { get; set; }
    public string name { get; set; }
    public string category_name { get; set; }
    public string teacher_name { get; set; }
    public string submit_time { get; set; }
    public int category { get; set; }
    public int is_deleted { get; set; }
    public Nullable<System.DateTime> deletedtime { get; set; }
}

public partial class ProjectJudge
{
    public int id { get; set; }
    public int project_id { get; set; }
    public int category { get; set; }
    public int teacher_id { get; set; }
    public int judge_id { get; set; }
    public int stage { get; set; }
    public string comment { get; set; }
    public int is_pass { get; set; }

    public virtual Project Project { get; set; }
}

public partial class ProjectStage
{
    public int id { get; set; }
    public int project_id { get; set; }
    public string project_file { get; set; }
    public string project_content { get; set; }
    public int stage { get; set; }
    public string time { get; set; }
    public int is_pass { get; set; }

    public virtual Project Project { get; set; }
}

public partial class Service
{
    public int Service_id { get; set; }
    public int Service_teacher { get; set; }
    public System.DateTime Service_time { get; set; }
    public string Service_phone { get; set; }
    public string Service_remarks { get; set; }
    public int Service_category { get; set; }
    public int Service_isdeal { get; set; }
    public long Service_isdeleted { get; set; }
    public int Service_hit { get; set; }
    public string Service_author { get; set; }
    public Nullable<System.DateTime> Service_deletedtime { get; set; }
    public string Service_reply { get; set; }

    public virtual ServiceCategory ServiceCategory { get; set; }
    public virtual Teacher Teacher { get; set; }
}

public partial class ServiceCategory
{
    public ServiceCategory()
    {
        this.Service = new HashSet<Service>();
    }

    public int ServiceCategory_id { get; set; }
    public string ServiceCategory_name { get; set; }

    public virtual ICollection<Service> Service { get; set; }
}

public partial class SourceCategory
{
    public SourceCategory()
    {
        this.EducateSource = new HashSet<EducateSource>();
    }

    public int SourceCategory_id { get; set; }
    public string SourceCategory_name { get; set; }

    public virtual ICollection<EducateSource> EducateSource { get; set; }
}

public partial class sysdiagrams
{
    public string name { get; set; }
    public int principal_id { get; set; }
    public int diagram_id { get; set; }
    public Nullable<int> version { get; set; }
    public byte[] definition { get; set; }
}

public partial class Teacher
{
    public Teacher()
    {
        this.ActivityTeacher = new HashSet<ActivityTeacher>();
        this.JudgeApplication = new HashSet<JudgeApplication>();
        this.Project = new HashSet<Project>();
        this.Service = new HashSet<Service>();
    }

    public int id { get; set; }
    public string name { get; set; }
    public string password { get; set; }
    public int gender { get; set; }
    public string email { get; set; }
    public string number { get; set; }
    public string phone_number { get; set; }
    public string department { get; set; }
    public string rank { get; set; }
    public int is_judge { get; set; }

    public virtual ICollection<ActivityTeacher> ActivityTeacher { get; set; }
    public virtual ICollection<JudgeApplication> JudgeApplication { get; set; }
    public virtual ICollection<Project> Project { get; set; }
    public virtual ICollection<Service> Service { get; set; }
}
