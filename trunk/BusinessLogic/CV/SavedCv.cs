using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BusinessLogic.CV
{
    public class SavedCv
    {
        private string saver; 
        private string cvUserId; 
        private int id; 
        private DateTime createdDate;
        private Boolean favorite;
        private string fullname;
        private string avatar;
        private string major;
        
        public SavedCv() { }
        public SavedCv(string _id,string _cvUserid,string _createddate,string _favorite)
        {
            CvUserId = _cvUserid;
            Id =  Convert.ToInt16(_id);
            CreatedDate = Convert.ToDateTime(_createddate);
            Favorite = Convert.ToBoolean(_favorite);
        }
        public SavedCv(string _id,string _cvUserid, string _createddate, string _favorite, string _fullname, string _avatar, string _major)
        {
            Id =Convert.ToInt16(_id);
            CreatedDate = Convert.ToDateTime(_createddate);
            Favorite = Convert.ToBoolean(_favorite);
            Fullname = _fullname;
            Avatar = _avatar;
            Major = _major;
            CvUserId = _cvUserid;
        }

        public string Saver
        {
            get { return saver; }
            set { saver = value; }
        }
        public string CvUserId
        {
            get { return cvUserId; }
            set { cvUserId = value; }
        }
        public int Id
        {
            get { return id; }
            set { id = value; }
        }
        public DateTime CreatedDate
        {
            get { return createdDate; }
            set { createdDate = value; }
        }
        

        public Boolean Favorite
        {
            get { return favorite; }
            set { favorite = value; }
        }
        public string Fullname
        {
            get { return fullname; }
            set { fullname = value; }
        }
        public string Avatar
        {
            get { return avatar; }
            set { avatar = value; }
        }

        public string Major
        {
            get { return major; }
            set { major = value; }
        }
    }
}
