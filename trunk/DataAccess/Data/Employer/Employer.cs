using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DataAccess.AccessFacade;
using System.Data;
using System.Data.SqlClient;
using DataAccess.DBUtils;

namespace DataAccess.Data.Employer
{
    public class Employer : EmployerFacade
    {
        SqlConnection sqlConn;
        DataSet ds;
        public Employer(string _connStr)
        {
            sqlConn = DBTool.GetConnection(_connStr);
            ds = new DataSet();
        }
        public DataTable GetEmployerByCity(string city)
        {
            string sqlQuery = "EXEC [dbo].[proc_GetEmployerByCity] '" + city+"'";
            SqlDataAdapter adapter = null;
            SqlCommand cmd = null;

            try
            {
                adapter = new SqlDataAdapter();
                cmd = new SqlCommand(sqlQuery, sqlConn);
                //cmd.Parameters.AddWithValue("@city", city);
                adapter.SelectCommand = cmd;
                adapter.Fill(ds, "tbl");
                return ds.Tables["tbl"];
            }
            catch (Exception e)
            {
                throw e;
            }
            finally
            {
                adapter.Dispose();
                cmd.Dispose();
                sqlConn.Close();
            }
        }
        public DataSet GetEmployerInfo(string userId)
        {
            string sqlQuery = "EXEC [dbo].[proc_GetEmployerInfo] @userid";
            SqlDataAdapter adapter = null;
            SqlCommand cmd = null;
            try
            {
                adapter = new SqlDataAdapter();
                cmd = new SqlCommand(sqlQuery, sqlConn);
                cmd.Parameters.AddWithValue("@userid", userId);
                adapter.SelectCommand = cmd;
                adapter.Fill(ds, "tbl_EmpInfo");
                return ds;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                adapter.Dispose();
                cmd.Dispose();
                sqlConn.Close();
            }
        }
    }
}
