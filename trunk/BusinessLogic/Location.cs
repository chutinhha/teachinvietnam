using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BusinessLogic
{
    public class Location
    {
        int lId;

        public int LId
        {
            get { return lId; }
            set { lId = value; }
        }
        string lName;
        string lName_vn;

        public string LName_vn
        {
            get { return lName_vn; }
            set { lName_vn = value; }
        }
        public string LName
        {
            get { return lName; }
            set { lName = value; }
        }
        public Location(int i, string n,string lo_vn)
        {
            this.LId = i;
            this.LName = n;
            LName_vn = lo_vn;
        }
    }
}
