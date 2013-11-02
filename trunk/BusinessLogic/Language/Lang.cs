using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BusinessLogic.Language
{
    public class Lang
    {
        int id;
        string lang_en;
        string lang_vi;
        public int Id
        {
            get { return id; }
            set { id = value; }
        }
        public string Lang_en
        {
            get { return lang_en; }
            set { lang_en = value; }
        }
        public string Lang_vi
        {
            get { return lang_vi; }
            set { lang_vi = value; }
        }
        public Lang() { }
        public Lang(int i, string l_en,string l_vi)
        {
            Id = i;
            Lang_en = l_en;
            Lang_vi = l_vi;
        }
    }
}
