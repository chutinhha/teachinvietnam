using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DataAccess.AccessFacade;
using System.Data.SqlClient;
using DataAccess.DBUtils;
using System.Data;

namespace DataAccess.Data.Candidate
{
    public class JobAlert : JobAlertFacade
    {
        String connStr;
        public JobAlert(String connStr)
        {
            this.connStr = connStr;
        }
        public void RegisterJobAlert(string email)
        {
            SqlConnection conn = null;
            try
            {
                DataSet ds = new DataSet();
                conn = DBTool.GetConnection(connStr);
                String sql = "EXEC proc_RegisterJobAlert @email";

                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@email", email);

                conn.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                conn.Close();
            }
        }
        public bool IsRegisterJobAlert(string email)
        {
            SqlConnection conn = null;
            SqlDataReader dataReader = null;
            try
            {
                conn = DBTool.GetConnection(connStr);
                String sql = "EXEC proc_IsRegisterJobAlert @email";

                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@email", email);

                conn.Open();
                dataReader = cmd.ExecuteReader();

                if (dataReader.HasRows)
                {
                    return true;
                }
                return false;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (dataReader != null)
                    dataReader.Close();

                if (conn.State == ConnectionState.Open)
                    conn.Close();
            }
        }
        public bool GetActiveValue(string email)
        {
            bool value =false;
            SqlConnection conn = null;
            SqlDataReader dataReader = null;
            try
            {
                String sql = "EXEC proc_JobAlert_GetActiveValue @email";
                conn = DBTool.GetConnection(connStr);

                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@email", email);

                conn.Open();
                dataReader = cmd.ExecuteReader();
                while (dataReader.Read())
                {
                    value = (bool)dataReader.GetValue(0);
                }
                return value;
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
        public void SetOnOff(string email, bool active)
        {
            SqlConnection conn = null;
            try
            {
                String sql = "EXEC proc_SetOnOffJobAlert @email,@active";
                conn = DBTool.GetConnection(connStr);

                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@email", email);
                cmd.Parameters.AddWithValue("@active", active);

                conn.Open();
                cmd.ExecuteNonQuery();

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                conn.Close();
            }
        }
        public bool IsActiveJobAlert(string email)
        {
            SqlConnection conn = null;
            SqlDataReader dataReader = null;
            try
            {
                DataSet ds = new DataSet();
                conn = DBTool.GetConnection(connStr);
                String sql = "EXEC proc_IsActive @email";

                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@email", email);

                conn.Open();
                dataReader = cmd.ExecuteReader();

                if (dataReader.HasRows)
                {
                    return true;
                }
                return false;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (dataReader != null)
                    dataReader.Close();

                if (conn.State == ConnectionState.Open)
                    conn.Close();
            }
        }
    }
}
