using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BusinessLogic.Facade.Intership
{
    public class InternshipUserSubmit
    {
        private int id;
        private string fullname;
        private string email;
        private string country;
        private string phone;
        private DateTime created;
        private string whenShouldWeCallYou;
        private string cvPath;

        private TeachinVietnamDataContext dbContext;

        public InternshipUserSubmit()
        {
            dbContext = new TeachinVietnamDataContext();
        }
        public static void Insert(string title, string firstname, string lastname, string email, string country, string phone, string whenshouldwecall,string fullPath)
        {
            TeachinVietnamDataContext dbContext = new TeachinVietnamDataContext();
            dbContext.proc_Internship_UserSubmit_Insert(title, firstname, lastname, email, country, phone, whenshouldwecall, fullPath);
        }

        public int Id
        {
            get { return id; }
            set { id = value; }
        }
        public string Fullname
        {
            get { return fullname; }
            set { fullname = value; }
        }
        public string Email
        {
            get { return email; }
            set { email = value; }
        }
        public string Country
        {
            get { return country; }
            set { country = value; }
        }
        public string Phone
        {
            get { return phone; }
            set { phone = value; }
        }
        public DateTime Created
        {
            get { return created; }
            set { created = value; }
        }
        public string WhenShouldWeCallYou
        {
            get { return whenShouldWeCallYou; }
            set { whenShouldWeCallYou = value; }
        }
        public string CvPath
        {
            get { return cvPath; }
            set { cvPath = value; }
        }
    }
}
