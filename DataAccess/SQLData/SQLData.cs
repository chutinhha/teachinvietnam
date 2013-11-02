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
    public partial  class SQLData : DataProvider
    {
        SqlConnection sqlConn;
        public SQLData(string _connStr)
        {
            sqlConn = DBTool.GetConnection(_connStr);

        }
        public SqlConnection GetConnection()
        {
            return sqlConn;
           
        }


        /// <summary>
        /// Exposes the singleton object used to access the database with
        /// the conrete dataprovider
        /// </summary>
        /// <returns></returns>
        public static DataProvider Instance(string conn)
        {
            return new SQLData(conn);
        }
	}
}

