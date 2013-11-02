using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BusinessLogic.Article
{
    public class HiringAdviceCategory
    {
        private int id;
        private string name;

        public int Id
        {
            get { return id; }
            set { id = value; }
        }
        public string Name
        {
            get { return name; }
            set { name = value; }
        }

        public HiringAdviceCategory() { }

        public HiringAdviceCategory(string _id, string _name)
        {
            Id = Convert.ToInt16(_id);
            Name = _name;
        }

    }
}
