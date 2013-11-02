using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using DataAccess.Utils;

namespace DataAccess.Data.Component
{
    public class Category
    {
        String connStr;
        DataSet ds = null;
        public Category(String _connStr)
        {
            this.connStr = _connStr;
        }
        public DataTable GetRootCategory()
        {
            String sql = "EXEC proc_GetComponent_GetRootCategory";
            ds = new DataSet();
            return DataUtils.SqlSelect(connStr, sql, ds, "tbl");
        }
    }
}
