using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BusinessLogic.CV
{
    public class CvDetail
    {
        string userId;
        string logo;
        string username;
        string major;
        DateTime uploaddate;
        string fullname;
        string dob;
        string MostRecentPosition;
        string YearsofExperience;
        string RelatedExperience;
        string salaryType;
        string SalaryFrom;
        string SalaryTo;
        string SalaryCurrency;
        string SalaryPaidType;
        string location;
        string location2;
        string location3;
        string Searchable;
        String createDate;
        String citizenship; String desiredCate; String desiredCate2; String desiredCate3;
        String lastUpdated;

        public CvDetail(String _UserId, String _Username, String _FullName, String _Major, String _MostRecentPosition, String _dob, String _Avatar, String _citizenship, String _desiredCate, String _desiredCate2, String _desiredCate3,String _salarytype, String _SalaryFrom, String _SalaryTo, String _SalaryCurrency, String _SalaryPaidType, String _location, String _location2, String _location3, String _CreateDate, String _Searchable,String _lastUpdated)
        {
            this.UserId = _UserId;
            Username = _Username;
            Fullname = _FullName;
            Major = _Major;
            MostRecentPosition1 = _MostRecentPosition;
            Dob = _dob;
            Logo = _Avatar;
            SalaryFrom1 = _SalaryFrom;
            SalaryTo1 = _SalaryTo;
            SalaryCurrency1 = _SalaryCurrency;
            SalaryPaidType1 = _SalaryPaidType;
            Location = _location;
            Location2 = _location2;
            Location3 = _location3;
            CreateDate = _CreateDate;
            Searchable1 = _Searchable;
            Citizenship = _citizenship;
            DesiredCate = _desiredCate;
            DesiredCate2 = _desiredCate2;
            DesiredCate3= _desiredCate3;
            SalaryType = _salarytype;
            LastUpdated = _lastUpdated;
        }

        public CvDetail() { }
        public CvDetail(string i, string u, string l, string m)
        {
            UserId = i;
            Username = u;
            Logo = l;
            Major = m;
        }
        public CvDetail(string i, string u, string l, string m, DateTime ud, string fn)
        {
            UserId = i;
            Username = u;
            Logo = l;
            Major = m;
            Uploaddate = ud;
            Fullname = fn;
        }
        public CvDetail(string _userid, string _username, string _fullname, string _major, string _mostRecentPosition, string _relatedExp, string _salaryFrom, string _salaryTo, string _salaryCurrency, string _salaryPayment, string _lo1, string _lo2, string _lo3, string _uploadDate, string _searchable)
        {
            UserId = _userid;
            Username = _username;
            Fullname = _fullname;
            Major = _major;
            MostRecentPosition1 = _mostRecentPosition;
            RelatedExperience1 = _relatedExp;
            SalaryFrom1 = _salaryFrom;
            SalaryTo1 = _salaryTo;
            SalaryCurrency1 = _salaryCurrency;
            SalaryPaidType1 = _salaryPayment;
            Location = _lo1;
            Location2 = _lo2;
            Location3 = _lo3;
            CreateDate = _uploadDate;
            Searchable1 = _searchable;

        }

        public String CreateDate
        {
            get { return createDate; }
            set { createDate = value; }
        }


        public string SalaryType
        {
            get { return salaryType; }
            set { salaryType = value; }
        }

        public String Citizenship
        {
            get { return citizenship; }
            set { citizenship = value; }
        }

        public String DesiredCate
        {
            get { return desiredCate; }
            set { desiredCate = value; }
        }


        public String DesiredCate2
        {
            get { return desiredCate2; }
            set { desiredCate2 = value; }
        }
        public String DesiredCate3
        {
            get { return desiredCate3; }
            set { desiredCate3 = value; }
        }


        public string MostRecentPosition1
        {
            get { return MostRecentPosition; }
            set { MostRecentPosition = value; }
        }

        public string Dob
        {
            get { return dob; }
            set { dob = value; }
        }
        public string YearsofExperience1
        {
            get { return YearsofExperience; }
            set { YearsofExperience = value; }
        }
        public string RelatedExperience1
        {
            get { return RelatedExperience; }
            set { RelatedExperience = value; }
        }


        public string SalaryFrom1
        {
            get { return SalaryFrom; }
            set { SalaryFrom = value; }
        }


        public string SalaryTo1
        {
            get { return SalaryTo; }
            set { SalaryTo = value; }
        }

        public string SalaryCurrency1
        {
            get { return SalaryCurrency; }
            set { SalaryCurrency = value; }
        }
        public string SalaryPaidType1
        {
            get { return SalaryPaidType; }
            set { SalaryPaidType = value; }
        }


        public string Location
        {
            get { return location; }
            set { location = value; }
        }


        public string Location2
        {
            get { return location2; }
            set { location2 = value; }
        }


        public string Location3
        {
            get { return location3; }
            set { location3 = value; }
        }


        public string Searchable1
        {
            get { return Searchable; }
            set { Searchable = value; }
        }

        public string Fullname
        {
            get { return fullname; }
            set { fullname = value; }
        }

        public DateTime Uploaddate
        {
            get { return uploaddate; }
            set { uploaddate = value; }
        }
        public string UserId
        {
            get { return userId; }
            set { userId = value; }
        }
        public string Logo
        {
            get { return logo; }
            set { logo = value; }
        }
        public string Username
        {
            get { return username; }
            set { username = value; }
        }
        public string Major
        {
            get { return major; }
            set { major = value; }
        }

        public String LastUpdated
        {
            get { return lastUpdated; }
            set { lastUpdated = value; }
        }
    }
}
