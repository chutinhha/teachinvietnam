using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BusinessLogic
{
    public class Citizenship
    {
        private string citizenshipName;
        private string citizenshipName_vn;

        public string CitizenshipName_vn
        {
            get { return citizenshipName_vn; }
            set { citizenshipName_vn = value; }
        }
        public string CitizenshipName
        {
            get { return citizenshipName; }
            set { citizenshipName = value; }
        }
        private int id;

        public int Id
        {
            get { return id; }
            set { id = value; }
        }

       
        public Citizenship()
        {

        }
        public Citizenship(int i,string q,string q_vn)
        {
            this.Id = i;
            this.CitizenshipName = q;
            this.CitizenshipName_vn = q_vn;
        }
    }
}
