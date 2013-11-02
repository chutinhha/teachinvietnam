using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BusinessLogic
{
    public class JobRole
    {
        int jrId;

        public int JrId
        {
            get { return jrId; }
            set { jrId = value; }
        }
        string jrName;
        string jrName_vn;

        public string JrName_vn
        {
            get { return jrName_vn; }
            set { jrName_vn = value; }
        }
        public string JrName
        {
            get { return jrName; }
            set { jrName = value; }
        }
        public JobRole(int i, string n,string jrvn)
        {
            this.JrId = i;
            this.JrName = n;
            JrName_vn = jrvn;
        }
    }
}
