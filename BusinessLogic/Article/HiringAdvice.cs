using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BusinessLogic.Article
{
    public class HiringAdvice
    {
        int id;
        string title;
        int cate_id;
        string writer;
        string logo;
        Boolean active;
        DateTime uploadedDate;
        string fullName;
        string orgName;
        string detail;

        public HiringAdvice() { }
        public HiringAdvice(string _id, string _title, string _cateid, string _writer,string _detail, string _logo, string _active, string _date,string _fullname,string _orgname)
        {
            Id = Convert.ToInt16(_id);
            Title = _title;
            Cate_id = Convert.ToInt16(_cateid);
            Writer = _writer;
            Logo = _logo;
            Active = Convert.ToBoolean(_active);
            if (_date == "")
            {
                _date = DateTime.Now.ToString();
            }
            UploadedDate = Convert.ToDateTime(_date);
            FullName = _fullname;
            OrgName = _orgname;
            Detail = _detail;
        }



        public string Detail
        {
            get { return detail; }
            set { detail = value; }
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
        public int Cate_id
        {
            get { return cate_id; }
            set { cate_id = value; }
        }
        public string Writer
        {
            get { return writer; }
            set { writer = value; }
        }
        public string Logo
        {
            get { return logo; }
            set { logo = value; }
        }

        public DateTime UploadedDate
        {
            get { return uploadedDate; }
            set { uploadedDate = value; }
        }


        public Boolean Active
        {
            get { return active; }
            set { active = value; }
        }

        public string FullName
        {
            get { return fullName; }
            set { fullName = value; }
        }
        public string OrgName
        {
            get { return orgName; }
            set { orgName = value; }
        }
    }
}
