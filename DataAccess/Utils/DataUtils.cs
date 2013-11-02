using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using DataAccess.DBUtils;

namespace DataAccess.Utils
{
    public static class DataUtils
    {
        public static DataTable SqlSelect(String connStr, string sql, DataSet d, string tbl)
        {
            SqlDataAdapter adapter = null;
            SqlCommand cmd = null;
            SqlConnection conn = null;

            try
            {
                conn = new SqlConnection(connStr);
                adapter = new SqlDataAdapter();
                cmd = new SqlCommand(sql, conn);
                adapter.SelectCommand = cmd;
                adapter.Fill(d, tbl);
                return d.Tables["tbl"];
            }
            catch (Exception e)
            {
                throw e;
            }
            finally
            {
                adapter.Dispose();
                cmd.Dispose();
                conn.Close();
            }
        }
    }
}
