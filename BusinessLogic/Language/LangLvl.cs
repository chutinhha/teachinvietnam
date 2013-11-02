using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BusinessLogic.Language
{
    public class LangLvl
    {
        int id;

        public int Id
        {
            get { return id; }
            set { id = value; }
        }
        string langlvl_en;

        public string Langlvl_en
        {
            get { return langlvl_en; }
            set { langlvl_en = value; }
        }
        string langlvl_vi;

        public string Langlvl_vi
        {
            get { return langlvl_vi; }
            set { langlvl_vi = value; }
        }
        public LangLvl() { }
        public LangLvl(int i, string lvl_en)
        {
            Id = i;
            Langlvl_en = lvl_en;
        }
        public LangLvl(int i, string lvl_en,string lvl_vi)
        {
            Id = i;
            Langlvl_en = lvl_en;
            Langlvl_vi = lvl_vi;
        }
    }
}
