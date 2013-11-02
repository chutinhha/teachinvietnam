using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BusinessLogic
{
    public class EmploymentType
    {
        private int etId;

        public int EtId
        {
            get { return etId; }
            set { etId = value; }
        }
        private string etName;
        private string etName_vn;

        public string EtName_vn
        {
            get { return etName_vn; }
            set { etName_vn = value; }
        }
        public string EtName
        {
            get { return etName; }
            set { etName = value; }
        }
        public EmploymentType(int i, string n,string n_vn)
        {
            this.EtId = i;
            this.EtName = n;
            EtName_vn = n_vn;
        }
    }
}
