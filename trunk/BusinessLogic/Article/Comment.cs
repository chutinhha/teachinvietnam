using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BusinessLogic.Article
{
    public class Comment
    {
        int id;
        int tid;
        string writername;
        string email;
        string body;
        DateTime createddate;
        Boolean active;
        string fullname;
        string logo;
        string orgName;


        public Comment() { }

        public Comment(string _id, string _tid, string _wr, String _email, String _body, string _cd, string _active)
        {
            id = Convert.ToInt16(_id);
            tid = Convert.ToInt16(_tid);
            email = _email;
            writername = _wr;
            body = _body;
            createddate = Convert.ToDateTime(_cd);
            active = Convert.ToBoolean(_active);
        }
        public Comment(string _id, string _tid, string _wr,  String _body, string _cd, string _active,string fullname,string logo)
        {
            id = Convert.ToInt16(_id);
            tid = Convert.ToInt16(_tid);
            writername = _wr;
            body = _body;
            createddate = Convert.ToDateTime(_cd);
            active = Convert.ToBoolean(_active);
            Logo = logo;
            Fullname = fullname;
        }
        public Comment(string _id, string _tid, string _wr, String _body, string _cd, string _active, string fullname, string logo, string _orgName)
        {
            id = Convert.ToInt16(_id);
            tid = Convert.ToInt16(_tid);
            writername = _wr;
            body = _body;
            createddate = Convert.ToDateTime(_cd);
            active = Convert.ToBoolean(_active);
            Logo = logo;
            Fullname = fullname;
            OrgName = _orgName;
        }
        public int Id
        {
            get { return id; }
            set { id = value; }
        }
        public int Tid
        {
            get { return tid; }
            set { tid = value; }
        }
        public string OrgName
        {
            get { return orgName; }
            set { orgName = value; }
        }

        public string Writername
        {
            get { return writername; }
            set { writername = value; }
        }
        public string Email
        {
            get { return email; }
            set { email = value; }
        }
        public string Body
        {
            get { return body; }
            set { body = value; }
        }
        public DateTime Createddate
        {
            get { return createddate; }
            set { createddate = value; }
        }
        public Boolean Active
        {
            get { return active; }
            set { active = value; }
        }
        public string Fullname
        {
            get { return fullname; }
            set { fullname = value; }
        }
        public string Logo
        {
            get { return logo; }
            set { logo = value; }
        }
    }
}
