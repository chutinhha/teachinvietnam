using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BusinessLogic.CV
{
    public class SaveJobs
    {
        int id;
        int jId;
        string saver;
        DateTime savedate;
        string stt;
        string jTitle;
        string orgName;
        DateTime jClosingDate;
        string candidateUsername;
        string fullname;
        Boolean readbefore;
        Boolean favorite;

        public Boolean Favorite
        {
            get { return favorite; }
            set { favorite = value; }
        }
        public Boolean Readbefore
        {
            get { return readbefore; }
            set { readbefore = value; }
        }

        public string Fullname
        {
            get { return fullname; }
            set { fullname = value; }
        }

        public string CandidateUsername
        {
          get { return candidateUsername; }
          set { candidateUsername = value; }
        }
        public string JTitle
        {
            get { return jTitle; }
            set { jTitle = value; }
        }
        public string OrgName
        {
            get { return orgName; }
            set { orgName = value; }
        }      
        public DateTime JClosingDate
        {
            get { return jClosingDate; }
            set { jClosingDate = value; }
        }
        public DateTime Savedate
        {
            get { return savedate; }
            set { savedate = value; }
        }
        public string Stt
        {
            get { return stt; }
            set { stt = value; }
        }
        public int Id
        {
            get { return id; }
            set { id = value; }
        }
        public int JId
        {
            get { return jId; }
            set { jId = value; }
        }
        public string Saver
        {
            get { return saver; }
            set { saver = value; }
        }
        public SaveJobs() { }
        public SaveJobs(int _id,string _sav,int _jid,DateTime sdate,string status) {
            Id = _id;
            JId = _jid;
            Saver = _sav;
            Savedate = sdate;
            Stt = status;
        }
        public SaveJobs(int _id, string _sav, int _jid, DateTime sdate, string status,string title,string org,DateTime closing)
        {
            Id = _id;
            JId = _jid;
            Saver = _sav;
            Savedate = sdate;
            Stt = status;
            JTitle = title;
            OrgName = org;
            JClosingDate = closing;
        }
        public SaveJobs(int _id, string _sav, int _jid, DateTime sdate, string status, string title, DateTime closing, string _candidateUsername,string _fullname,Boolean _readbefore,Boolean _favorite)
        {
            Id = _id;
            JId = _jid;
            Saver = _sav;
            Savedate = sdate;
            Stt = status;
            JTitle = title;
            CandidateUsername = _candidateUsername;
            JClosingDate = closing;
            Fullname = _fullname;
            Readbefore = _readbefore;
            Favorite = _favorite;
        }
        public SaveJobs(string _id,string _candidate,string _jid,string _title,string _saveddate,string _closingdate)
        {
            Id = Convert.ToInt16(_id);
            CandidateUsername = _candidate;
            JId = Convert.ToInt16(_jid);
            JTitle = _title;
            Savedate =Convert.ToDateTime(_saveddate);
            JClosingDate = Convert.ToDateTime(_closingdate);
        }
    }
}
