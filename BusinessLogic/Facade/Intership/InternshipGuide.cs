using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BusinessLogic.Facade.Intership
{
    public class InternshipGuide
    {
        private int id;
        private string fullname;
        private string email;
        private string country;
        private string phone;
        private DateTime created;
        
        private TeachinVietnamDataContext dbContext;

        public InternshipGuide()
        {
            dbContext = new TeachinVietnamDataContext();
        }
        public static void Insert(string title, string firstname,string lastname,string email,string country,string phone)
        {
            TeachinVietnamDataContext dbContext = new TeachinVietnamDataContext();
            dbContext.proc_Internship_Guide_Insert(title,firstname,lastname, email, country, phone);
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

        
    }
}
