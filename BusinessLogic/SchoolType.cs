using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BusinessLogic
{
    public class SchoolType
    {
        private int id;

        public int Id
        {
            get { return id; }
            set { id = value; }
        }
        private string name;

        public string Name
        {
            get { return name; }
            set { name = value; }
        }
        private string name_vn;

        public string Name_vn
        {
            get { return name_vn; }
            set { name_vn = value; }
        }

        public SchoolType() { }
        public SchoolType(int i, string n) { this.Id = i; this.Name = n; }
        public SchoolType(int i, string n, string n_vn) { this.Id = i; this.Name = n; Name_vn = n_vn; }

    }
}
