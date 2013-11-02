using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BusinessLogic
{
    public class Employer
    {
        private string uniqueId;
        private int emId;
        private string emName;
        private string emContact;
        private bool emIsPremium;
        private string schoolType;
        private string orgType;

        public string OrgType
        {
            get { return orgType; }
            set { orgType = value; }
        }
        public string UniqueId
        {
            get { return uniqueId; }
            set { uniqueId = value; }
        }
        public int EmId
        {
            get { return emId; }
            set { emId = value; }
        }
        public string EmName
        {
            get { return emName; }
            set { emName = value; }
        }
        public string EmContact
        {
            get { return emContact; }
            set { emContact = value; }
        }
        public bool EmIsPremium
        {
            get { return emIsPremium; }
            set { emIsPremium = value; }
        }
        public string SchoolType
        {
            get { return schoolType; }
            set { schoolType = value; }
        }

        public Employer() { }
        public Employer(string n)
        {
            this.EmName = n;
        }
        public Employer(string _uniqueId, string n)
        {
            this.UniqueId = _uniqueId;
            this.EmName = n;
        }

        public Employer(int i, string n, string c, bool p)
        {
            this.EmId = i;
            this.EmName = n;
            this.EmContact = c;
            this.EmIsPremium = p;
        }

        public Employer(string _uniqueId, string n, string _st)
        {
            this.UniqueId = _uniqueId;
            this.EmName = n;
            this.SchoolType = _st;
        }

    }
}
