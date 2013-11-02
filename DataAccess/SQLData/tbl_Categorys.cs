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

        #region "tbl_Categorys Methods"

        public override IDataReader Gettbl_Categorys(int id)
        {
                return SqlHelper.ExecuteReader(sqlConn, "tbl_CategorysGet", id);
        }



        public override IDataReader Listtbl_Categorys()
        {
                return SqlHelper.ExecuteReader(sqlConn, "tbl_CategorysList");
        }

        public override void Addtbl_Categorys(int parentId, string name, string subContent, string content, string image, int status, int categoryType, string laguageId, int order, string categoryLink, int ortherInt, string ortherText, double ortherFloat, string paramNamePK, string paramOrther)
        {
               // sqlConn.Open();
                SqlHelper.ExecuteReader(sqlConn, "tbl_CategorysAdd", parentId, name, subContent, content, image, status, categoryType, laguageId, order, categoryLink, ortherInt, ortherText, ortherFloat, paramNamePK, paramOrther).ToString();
        }

        public override void Updatetbl_Categorys(int id, int parentId, string name, string subContent, string content, string image, int status, int categoryType, string laguageId, int order, string categoryLink, int ortherInt, string ortherText, double ortherFloat, string paramNamePK, string paramOrther)
        {
            
                SqlHelper.ExecuteReader(sqlConn, "tbl_CategorysUpdate", id, parentId, name, subContent, content, image, status, categoryType, laguageId, order, categoryLink, ortherInt, ortherText, ortherFloat, paramNamePK, paramOrther);
        }

        public override void Deletetbl_Categorys(int id)
        {
           
                 SqlHelper.ExecuteReader(sqlConn, "tbl_CategorysDelete", id);
        }

        public override IDataReader tbl_CategorysGetByParent(int ParentId)
        {       
                IDataReader idt=SqlHelper.ExecuteReader(sqlConn, "tbl_CategorysGetByParent",ParentId );
                return idt;  
        }

        #endregion

    }
}

