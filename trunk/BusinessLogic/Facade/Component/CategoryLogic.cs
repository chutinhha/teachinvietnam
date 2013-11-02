using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DataAccess.Data.Component;
using System.Data;

namespace BusinessLogic.Facade.Component
{
    public class CategoryLogic
    {
        Category category;
        public CategoryLogic(string _connStr)
        {
            category = new Category(_connStr);
        }
        public List<Sector> GetRootCategory()
        {
            List<Sector> rootCategoryList = new List<Sector>();
            DataTable tbl = category.GetRootCategory();
            foreach (DataRow r in tbl.Rows)
            {
                Sector s = new Sector(r[0].ToString(), r[1].ToString(), r[2].ToString());
                rootCategoryList.Add(s);
            }
            return rootCategoryList;
        }
    }
}
