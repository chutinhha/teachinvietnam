using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;

namespace DataAccess.DBUtils
{
    public static class DBTool
    {
        public static SqlConnection GetConnection(String connStr)
        {
            try
            {
                return new SqlConnection(connStr);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
