using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BusinessLogic
{
    public class Sector
    {
        private int seId;
        private string seName_en;
        private string seName_vi;
        private int seParentId;

        public string SeName_en
        {
            get { return seName_en; }
            set { seName_en = value; }
        }
        public string SeName_vi
        {
            get { return seName_vi; }
            set { seName_vi = value; }
        }

        public int SeParentId
        {
            get { return seParentId; }
            set { seParentId = value; }
        }
        public int SeId
        {
            get { return seId; }
            set { seId = value; }
        }

        public Sector(int id, string name_en, string name_vi, int parentId)
        {
            this.SeId = id;
            this.SeName_en = name_en;
            this.SeName_vi = name_vi;
            this.SeParentId = parentId;
        }
        public Sector(string id, string name_en, string name_vi)
        {
            this.SeId = Convert.ToInt16(id);
            this.SeName_en = name_en;
            this.SeName_vi = name_vi;
        }
    }
}
