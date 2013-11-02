
using System;
using System.Data;


namespace DataAccess
{
    public abstract partial class DataProvider
    {

        #region tbl_Categorys Abstract Methods
        // Get a single tbl_Categorys item by primary key
        public abstract IDataReader Gettbl_Categorys(int id);

        public abstract IDataReader Listtbl_Categorys();



        public abstract void Addtbl_Categorys(int parentId, string name, string subContent, string content, string image, int status, int categoryType, string laguageId, int order, string categoryLink, int ortherInt, string ortherText, double ortherFloat, string paramNamePK, string paramOrther);

        public abstract void Updatetbl_Categorys(int id, int parentId, string name, string subContent, string content, string image, int status, int categoryType, string laguageId, int order, string categoryLink, int ortherInt, string ortherText, double ortherFloat, string paramNamePK, string paramOrther);

        public abstract void Deletetbl_Categorys(int id);
        public abstract IDataReader tbl_CategorysGetByParent(int ParentId);

        //public abstract IDataReader GetPagetbl_Categorys(string sortCol, int requiredPage, int recordsPerPage, out int totalRows);
        #endregion
	}
}
