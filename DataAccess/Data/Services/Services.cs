using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DataAccess.AccessFacade;
using System.Data;
using System.Data.SqlClient;
using DataAccess.DBUtils;

namespace DataAccess.Data
{
    public class Services
    {
        SqlConnection sqlConn;
        DataSet ds;
        public Services(string _connStr)
        {
            sqlConn = DBTool.GetConnection(_connStr);
            ds = new DataSet();
        }
        public SqlConnection GetConnection()
        {
            return sqlConn;
           
        }
        /// <summary>
        /// THeem mowis dichj vu
        /// </summary>
        /// <param name="ParentId"></param>
        /// <param name="Name"></param>
        /// <param name="CONTENT"></param>
        /// <param name="Image"></param>
        /// <param name="Order"></param>
        /// <param name="Status"></param>
        /// <returns></returns>
        public string Add(int ParentId, string Name,string CONTENT,string Image, int Order,int Status)
        {
            string sql = "EXEC tbl_Services_Add {0},'{1}','{2}','{3}',{4},{5}";
            sql = string.Format(sql, ParentId, Name, CONTENT, Image, Order, Status);
            SqlConnection conn = GetConnection();
            SqlCommand cmd = new SqlCommand(sql, conn);
            try
            {
                
                conn.Open();
                int idInsert = int.Parse(cmd.ExecuteScalar().ToString());
                return idInsert.ToString();
            }
            catch (Exception ex)
            {
                throw ex;
                conn.Close();
                return "";
            }
            finally
            {
                conn.Close();
            }
           
        }

        /// <summary>
        /// Lấy về danh sách 
        /// </summary>
        /// <param name="ParentId"></param>
        /// <returns></returns>
        public IDataReader GetByParent(int ParentId)
        {
            SqlConnection conn = GetConnection();
            try
            {
                conn.Open();
                return (IDataReader)SqlHelper.ExecuteReader(conn, "tbl_Services_GetByParent", ParentId);
               
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

    }
}
