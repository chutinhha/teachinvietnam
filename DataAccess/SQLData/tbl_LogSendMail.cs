using System;
using System.Data;
using System.Data.SqlClient;
using DataAccess.DBUtils;
namespace DataAccess
{

    /// ----------------------------------------------------------------------------- 
    /// <summary> 
    /// SQL Server implementation of the abstract DataProvider class 
    /// </summary> 
    /// <remarks> 
    /// </remarks> 
    /// <history> 
    /// </history> 
    /// ----------------------------------------------------------------------------- 
    public partial class SQLData : DataProvider
    {
        #region "tbl_LogSendMail Methods"

        public override IDataReader Gettbl_LogSendMail(int id)
        {
            SqlConnection conn = GetConnection();
            try
            {
                conn.Open();
                return SqlHelper.ExecuteReader(conn, "dtbl_LogSendMailGet", id);
            }
            catch (Exception e)
            {
                throw e;
            }
            finally
            {
                conn.Close();
            }

        }
        public override IDataReader Listtbl_LogSendMail()
        {
            SqlConnection conn = GetConnection();
            try
            {
                conn.Open();
                return SqlHelper.ExecuteReader(conn, "dtbl_LogSendMailList");
            }
            catch (Exception e)
            {
                throw e;
            }
            finally
            {
                conn.Close();
            }

        }

        public override void Addtbl_LogSendMail(int objType, int lastId, int lastSend, int status, string laguageId)
        {
            SqlConnection conn = GetConnection();
            try
            {
                conn.Open();
                SqlHelper.ExecuteScalar(conn, "dtbl_LogSendMailAdd", objType, lastId, lastSend, status, laguageId).ToString();
            }
            catch (Exception e)
            {
                throw e;
            }
            finally
            {
                conn.Close();
            }

        }

        public override void Updatetbl_LogSendMail(int id, int objType, int lastId, int lastSend, int status, string laguageId)
        {
            SqlConnection conn = GetConnection();
            try
            {
                conn.Open();
                SqlHelper.ExecuteNonQuery(conn, "dtbl_LogSendMailUpdate", id, objType, lastId, lastSend, status, laguageId);
            }
            catch (Exception e)
            {
                throw e;
            }
            finally
            {
                conn.Close();
            }

        }

        public override void Deletetbl_LogSendMail(int id)
        {
            SqlConnection conn = GetConnection();
            try
            {
                conn.Open();
                SqlHelper.ExecuteNonQuery(conn, "dtbl_LogSendMailDelete", id);
            }
            catch (Exception e)
            {
                throw e;
            }
            finally
            {
                conn.Close();
            }

        }

        #endregion
    }
}

