using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BusinessLogic
{
    public class FeaturedJob
    {
        private int id;
        private string title;
        private string avatar;
        private string employer;
        private DateTime closingDate;
        private string orgName;

        public string OrgName
        {
            get { return orgName; }
            set { orgName = value; }
        }
        public DateTime ClosingDate
        {
            get { return closingDate; }
            set { closingDate = value; }
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
        public string Avatar
        {
            get { return avatar; }
            set { avatar = value; }
        }
        public string Employer
        {
            get { return employer; }
            set { employer = value; }
        }
        public FeaturedJob(int i,string t,string a,string e)
        {
            this.Id = i;
            this.Title = t;
            this.Avatar = a;
            this.Employer = e;
        }
        public FeaturedJob(int i, string t, string a, string e,DateTime c)
        {
            this.Id = i;
            this.Title = t;
            this.Avatar = a;
            this.Employer = e;
            this.ClosingDate = c;
        }
        public FeaturedJob(int i, string t, string a, string e, string _orgName)
        {
            this.Id = i;
            this.Title = t;
            this.Avatar = a;
            this.Employer = e;
            this.OrgName = _orgName;
        }
    }
}
