using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BusinessLogic
{   
    [Serializable]
    public class DetailJob
    {
        int id;
        string title;
        string workplace;
        string workplace2;
        string workplace3;
        DateTime uploadDate;
        DateTime closingDate;
        string jobLevel;
        string employmentType;
        int viewcount;
        string description;
        string minExp;
        string contact;
        string username; //la truong jEmployer trong table teachingjob
        string orgName;
        string orgLogo;
        string orgAddress1;
        string orgAddress2;
        string phoneNumber1;
        string phoneNumber2;
        string website;
        string category;
        string category2;
        string category3;
        string orgType;
        string schoolType;
        string citizenship;
        string eduRequirement;
        Boolean salaryType;
        decimal salary;
        decimal salaryTo;
        string salaryCurrency;
        string salaryPaymentType;
        Boolean executiveJob;
        string emailForEmployer;
        string orgInfo;

        public string OrgInfo
        {
            get { return orgInfo; }
            set { orgInfo = value; }
        }

        //Object for InsertNewJob
        //Boolean salary type: 0->negotiable, 1->Specified
        public DetailJob(string _title, string _description, string _employer, string _cate1, string _cate2, string _cate3, string _citizenship, string _orgType, string _schoolType, string _jobLevel, string _eduRequirement, string _employementType, string _location1, string _location2, string _location3, Boolean _SalaryType, decimal _salaryFrom, decimal _salaryTo, string _salaryCurrency, string _salaryPaymentType, DateTime _closingDate, Boolean _executiveJob, string _contactPerson, string _emailForEmployer)
        {
            //Id = _id;
            Username = _employer;
            Title = _title;
            Description = _description;
            Category = _cate1;
            Category2 = _cate2;
            Category3 = _cate3;
            Citizenship = _citizenship;
            OrgType = _orgType;
            SchoolType = _schoolType;
            JobLevel = _jobLevel;
            EduRequirement = _eduRequirement;
            EmploymentType = _employementType;
            Workplace2 = _location2;
            Workplace = _location1;
            Workplace3 = _location3;
            SalaryType = _SalaryType;
            Salary = _salaryFrom;
            SalaryTo = _salaryTo;
            SalaryCurrency = _salaryCurrency;
            SalaryPaymentType = _salaryPaymentType;
            ClosingDate = _closingDate;
            ExecutiveJob = _executiveJob;
            Contact = _contactPerson;
            EmailForEmployer = _emailForEmployer;
        }
        public DetailJob(string _title, string _description, string _employer, string _cate1, string _cate2, string _cate3, string _citizenship, string _jobLevel, string _eduRequirement, string _employementType, string _location1, string _location2, string _location3, Boolean _SalaryType, decimal _salaryFrom, decimal _salaryTo, string _salaryCurrency, string _salaryPaymentType, DateTime _closingDate, Boolean _executiveJob, string _contactPerson, string _emailForEmployer)
        {
            //Id = _id;
            Username = _employer;
            Title = _title;
            Description = _description;
            Category = _cate1;
            Category2 = _cate2;
            Category3 = _cate3;
            Citizenship = _citizenship;
            JobLevel = _jobLevel;
            EduRequirement = _eduRequirement;
            EmploymentType = _employementType;
            Workplace2 = _location2;
            Workplace = _location1;
            Workplace3 = _location3;
            SalaryType = _SalaryType;
            Salary = _salaryFrom;
            SalaryTo = _salaryTo;
            SalaryCurrency = _salaryCurrency;
            SalaryPaymentType = _salaryPaymentType;
            ClosingDate = _closingDate;
            ExecutiveJob = _executiveJob;
            Contact = _contactPerson;
            EmailForEmployer = _emailForEmployer;
        }

        public string EduRequirement
        {
            get { return eduRequirement; }
            set { eduRequirement = value; }
        }
        public string Category2
        {
            get { return category2; }
            set { category2 = value; }
        }
        public string Category3
        {
            get { return category3; }
            set { category3 = value; }
        }
        public string Citizenship
        {
            get { return citizenship; }
            set { citizenship = value; }
        }
        public string OrgType
        {
            get { return orgType; }
            set { orgType = value; }
        }
        public string SchoolType
        {
            get { return schoolType; }
            set { schoolType = value; }
        }
        public string Category
        {
            get { return category; }
            set { category = value; }
        }

        public Boolean ExecutiveJob
        {
            get { return executiveJob; }
            set { executiveJob = value; }
        }
        public string EmailForEmployer
        {
            get { return emailForEmployer; }
            set { emailForEmployer = value; }
        }
        public int Id
        {
            get { return id; }
            set { id = value; }
        }
        public string Title
        {
            get { return title; }
            set { title = value; }
        }
        public decimal Salary
        {
            get { return salary; }
            set { salary = value; }
        }
        public string Workplace
        {
            get { return workplace; }
            set { workplace = value; }
        }
        public string Workplace2
        {
            get { return workplace2; }
            set { workplace2 = value; }
        }
        public string Workplace3
        {
            get { return workplace3; }
            set { workplace3 = value; }
        }
        public DateTime UploadDate
        {
            get { return uploadDate; }
            set { uploadDate = value; }
        }
        public DateTime ClosingDate
        {
            get { return closingDate; }
            set { closingDate = value; }
        }
        public string JobLevel
        {
            get { return jobLevel; }
            set { jobLevel = value; }
        }
        public string EmploymentType
        {
            get { return employmentType; }
            set { employmentType = value; }
        }
        public int Viewcount
        {
            get { return viewcount; }
            set { viewcount = value; }
        }
        public string Description
        {
            get { return description; }
            set { description = value; }
        }
        public string MinExp
        {
            get { return minExp; }
            set { minExp = value; }
        }
        public string Contact
        {
            get { return contact; }
            set { contact = value; }
        }
        public string Username
        {
            get { return username; }
            set { username = value; }
        }
        public string OrgName
        {
            get { return orgName; }
            set { orgName = value; }
        }
        public string OrgLogo
        {
            get { return orgLogo; }
            set { orgLogo = value; }
        }
        public string OrgAddress1
        {
            get { return orgAddress1; }
            set { orgAddress1 = value; }
        }
        public string OrgAddress2
        {
            get { return orgAddress2; }
            set { orgAddress2 = value; }
        }
        public string PhoneNumber1
        {
            get { return phoneNumber1; }
            set { phoneNumber1 = value; }
        }
        public string PhoneNumber2
        {
            get { return phoneNumber2; }
            set { phoneNumber2 = value; }
        }
        public string Website
        {
            get { return website; }
            set { website = value; }
        }

        public Boolean SalaryType
        {
            get { return salaryType; }
            set { salaryType = value; }
        }

        public decimal SalaryTo
        {
            get { return salaryTo; }
            set { salaryTo = value; }
        }

        public string SalaryCurrency
        {
            get { return salaryCurrency; }
            set { salaryCurrency = value; }
        }

        public string SalaryPaymentType
        {
            get { return salaryPaymentType; }
            set { salaryPaymentType = value; }
        }
        public DetailJob()
        {

        }
        public DetailJob(
            int _id,
            string _title,
            decimal _salary,
            string _workplace,
            DateTime _uploadDate,
            DateTime _closingDate,
            string _category,
            string _jobLevel,
            string _employmentType,
            int _viewcount,
            string _description,
            string _minExp,
            string _contact,
            string _username,
            string _orgName,
            string _orgLogo,
            string _orgAddress1,
            string _orgAddress2,
            string _phoneNumber1,
            string _website)
        {
            Id = _id;
            Title = _title;
            Salary = _salary;
            Workplace = _workplace;
            UploadDate = _uploadDate;
            ClosingDate = _closingDate;
            Category = _category;
            JobLevel = _jobLevel;
            EmploymentType = _employmentType;
            Viewcount = _viewcount;
            Description = _description;
            MinExp = _minExp;
            Contact = _contact;
            Username = _username;
            OrgName = _orgName;
            OrgLogo = _orgLogo;
            OrgAddress1 = _orgAddress1;
            OrgAddress2 = _orgAddress2;
            PhoneNumber1 = _phoneNumber1;
            Website = _website;
        }
        public DetailJob(int _id, string _title, string _username, string _orgName, DateTime _closingDate, DateTime _uploadDate)
        {
            this.Id = _id; this.Title = _title; this.Username = _username; this.OrgName = _orgName; this.ClosingDate = _closingDate; this.UploadDate = _uploadDate;
        }
        //j.jId,j.jTitle_en,t2.Username,t2.OrganizationName,t2.Logo,j.jSalary_en,j.jLocation_en,j.jUploadDate,j.jClosingDate,j.jSector_en,j.jJobLevel_//en,j.jEmploymentType_en,j.jViewCount
        public DetailJob(int _id, string _title, string _username, string _orgName, string _orgLogo, decimal _salary, string _workplace, DateTime _uploaddate, DateTime _closingDate, string _category, string _citizenship, string _employmenttype, int _view)
        {
            this.Id = _id;
            Title = _title;
            Username = _username;
            OrgName = _orgName;
            OrgLogo = _orgLogo;
            Salary = _salary;
            Workplace = _workplace;
            UploadDate = _uploaddate;
            ClosingDate = _closingDate;
            Category = _category;
            Citizenship = _citizenship;
            EmploymentType = _employmenttype;
            Viewcount = _view;
        }
        public DetailJob(int _id, string _title, string _username, string _orgName, string _orgLogo, decimal _salary, string _category, string _category2, string _category3, string _workplace, string _workplace2, string _workplace3, string _citizenship, DateTime _uploaddate, DateTime _closingDate, string _joblevel, string _employmenttype, int _view)
        {
            this.Id = _id;
            Title = _title;
            Username = _username;
            OrgName = _orgName;
            OrgLogo = _orgLogo;
            Salary = _salary;
            Workplace = _workplace;
            Workplace2 = _workplace2;
            Workplace3 = _workplace3;
            UploadDate = _uploaddate;
            ClosingDate = _closingDate;
            Category = _category;
            Category2 = _category2;
            Category3 = _category3;
            JobLevel = _joblevel;
            EmploymentType = _employmenttype;
            Viewcount = _view;
            Citizenship = _citizenship;
        }

        public DetailJob(int _id, string _title, DateTime _upload, DateTime _closing, int _view)
        {
            this.Id = _id;
            this.Title = _title;
            this.UploadDate = _upload;
            this.ClosingDate = _closing;
            this.Viewcount = _view;
        }

        public DetailJob(int _id, string _title, DateTime _closingDate, Boolean _salaryType, decimal _salaryfrom, decimal _salaryTo, string _currency, string _paymentType)
        {
            this.Id = _id;
            this.Title = _title;
            this.ClosingDate = _closingDate;
            this.SalaryType = _salaryType;
            
            this.Salary = _salaryfrom;
            this.SalaryTo = _salaryTo;
            this.SalaryCurrency = _currency;
            this.SalaryPaymentType = _paymentType;

            if (SalaryType == false)
            {
                SalaryToString = "negotiable";
            }
            else
            {
                SalaryToString = Salary + " - " + SalaryTo + " " + SalaryCurrency + "/" + SalaryPaymentType;
            }
            
        }

        string salaryToString;
        public string SalaryToString
        {
            get { return salaryToString; }
            set { salaryToString = value; }
        }
        public DetailJob(int _jid, string _orgname, string _briefinfo, string _logo, string _orgaddress, string _phone, string _website, string username,string _jEmailToApplication, string _title, DateTime _upload, DateTime _closing, string _description, string _cate1, string _cate2, string _cate3, string _loca1, string _loca2, string _loca3, Boolean _satype, decimal _safrom, decimal _sato, string _sacurrency, string _sapayment, string _citizen, string _jlvl, string _eduRe, string _emptype, string _contactname, int _viewcount,string _orgType,string _schoolType)
        {
            Id = _jid;
            OrgName = _orgname;
            OrgInfo = _briefinfo;
            OrgLogo = _logo;
            OrgAddress1 = _orgaddress;
            PhoneNumber1 = _phone;
            Website = _website;
            Username = username;
            EmailForEmployer = _jEmailToApplication;
            Title = _title;
            UploadDate = _upload;
            ClosingDate = _closing;
            Description = _description;
            Category = _cate1;
            Category2 = _cate2;
            Category3 = _cate3;
            Workplace = _loca1;
            Workplace2 = _loca2;
            workplace3 = _loca3;
            SalaryType = _satype;
            Salary = _safrom;
            SalaryTo = _sato;
            SalaryCurrency = _sacurrency;
            SalaryPaymentType = _sapayment;
            Citizenship = _citizen;
            JobLevel = _jlvl;
            EduRequirement = _eduRe;
            EmploymentType = _emptype;
            Contact = _contactname;
            Viewcount = _viewcount;
            OrgType = _orgType;
            SchoolType = _schoolType;
        }
        public DetailJob(string _id,string _title,string _cate1,string _cate2,string _cate3,string _lo1,string _lo2,string _lo3,string _closingdate,string _uploaddate)
        {
            Id = Convert.ToInt16(_id);
            Title = _title;
            Category = _cate1;
            Category2 = _cate2;
            Category3 = _cate3;
            Workplace = _lo1;
            Workplace2 = _lo2;
            Workplace3 = _lo3;
            ClosingDate = Convert.ToDateTime(_closingdate);
            UploadDate = Convert.ToDateTime(_uploaddate);
        }
        public DetailJob(string _id, string _title, string _closingdate, string _uploaddate)
        {
            Id = Convert.ToInt16(_id);
            Title = _title;
            ClosingDate = Convert.ToDateTime(_closingdate);
            UploadDate = Convert.ToDateTime(_uploaddate);
        }
    }
}
