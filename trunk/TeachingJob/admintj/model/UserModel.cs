using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TeachingJob.admintj.model
{
    public class UserModel
    {
        private string userName;
        private string email;
        private string phone;
        private string role;
        private DateTime creationDate;
        private DateTime lastActivityDate;
        private bool isApproved;

        public UserModel() { }

        #region property

        public string UserName
        {
            get { return userName; }
            set { userName = value; }
        }
        public string Email
        {
            get { return email; }
            set { email = value; }
        }
        public string Phone
        {
            get { return phone; }
            set { phone = value; }
        }
        public string Role
        {
            get { return role; }
            set { role = value; }
        }
        public DateTime CreationDate
        {
            get { return creationDate; }
            set { creationDate = value; }
        }
        public DateTime LastActivityDate
        {
            get { return lastActivityDate; }
            set { lastActivityDate = value; }
        }
        public bool IsApproved
        {
            get { return isApproved; }
            set { isApproved = value; }
        }

        #endregion
    }
}