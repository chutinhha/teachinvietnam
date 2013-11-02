using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using DataAccess.DBUtils;
using System.Data;

namespace DataAccess.Data.General
{
    public class AdvanceSearch
    {
        String connStr;
        public AdvanceSearch(string conn)
        {
            this.connStr = conn;
        }
        public List<String> GetAllJobTitle()
        {
            SqlConnection conn=null;
            SqlDataReader dataReader=null;
            try
            {
                conn = DBTool.GetConnection(connStr);
                string sql = "EXEC proc_GetAllJobTitle";

                SqlCommand cmd = new SqlCommand(sql, conn);

                conn.Open();
                dataReader = cmd.ExecuteReader();

                List<String> titleList = new List<string>();
                while (dataReader.Read())
                {
                    titleList.Add(dataReader["jtitle_en"].ToString());
                }
                return titleList;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (dataReader != null) { dataReader.Close(); }
                if (conn.State == ConnectionState.Open) { conn.Close(); }
            }
        }
    }
}
