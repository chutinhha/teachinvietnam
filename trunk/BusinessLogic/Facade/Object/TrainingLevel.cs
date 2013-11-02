using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BusinessLogic.Facade.Object
{
    public class TrainingLevel
    {
        private int id;
        private string tlName_en;
        private string tlName_vi;

        public TrainingLevel() { }
        public TrainingLevel(int _id, string _name_en, string _name_vi)
        {
            id = _id;
            tlName_en = _name_en;
            tlName_vi = _name_vi;
        }

        public int Id
        {
            get { return id; }
            set { id = value; }
        }
        public string TlName_en
        {
            get { return tlName_en; }
            set { tlName_en = value; }
        }
        public string TlName_vi
        {
            get { return tlName_vi; }
            set { tlName_vi = value; }
        }
    }
}
