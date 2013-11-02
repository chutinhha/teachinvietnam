using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BusinessLogic.CV
{
    public class WillToRelocated
    {
        int id;

        public int Id
        {
            get { return id; }
            set { id = value; }
        }
        string name_en;

        public string Name_en
        {
            get { return name_en; }
            set { name_en = value; }
        }
        string name_vi;

        public string Name_vi
        {
            get { return name_vi; }
            set { name_vi = value; }
        }
        public WillToRelocated() { }
        public WillToRelocated(int i, string n) { 
            this.Id = i;
            this.Name_en = n; 
        }
        public WillToRelocated(int i, string n_en, string n_vi)
        { 
            this.Id = i;
            this.Name_en = n_en; 
            this.Name_vi = n_vi; }
    }
}
