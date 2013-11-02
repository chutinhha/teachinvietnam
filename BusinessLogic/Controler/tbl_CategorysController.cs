using System.Collections.Generic;
using System.Xml;
using DotNetNuke.Common;
using DotNetNuke.Common.Utilities;
using DotNetNuke.Services.Search;
using DataAccess;
namespace BusinessLogic
{
    public class tbl_CategorysController
    /*// : DotNetNuke.Entities.Modules.ISearchable, DotNetNuke.Entities.Modules.IPortable*/
    {
        private string _conn;
        public tbl_CategorysController(string conn)
        {
            _conn = conn;
        }
        #region "Public Methods"
        // Get a single tbl_Categorys item by primary key
        public tbl_CategorysInfo Gettbl_Categorys(int id)
        {
            return CBO.FillObject<tbl_CategorysInfo>(SQLData.Instance(_conn).Gettbl_Categorys(id));
        }

        public List<tbl_CategorysInfo> Listtbl_Categorys()
        {
            return CBO.FillCollection<tbl_CategorysInfo>(SQLData.Instance(_conn).Listtbl_Categorys());
        }


        public void Addtbl_Categorys(tbl_CategorysInfo objtbl_Categorys)
        {
            SQLData.Instance(_conn).Addtbl_Categorys(objtbl_Categorys.ParentId, objtbl_Categorys.Name, objtbl_Categorys.SubContent, objtbl_Categorys.Content, objtbl_Categorys.Image, objtbl_Categorys.Status, objtbl_Categorys.CategoryType, objtbl_Categorys.LaguageId, objtbl_Categorys.Order, objtbl_Categorys.CategoryLink, objtbl_Categorys.OrtherInt, objtbl_Categorys.OrtherText, objtbl_Categorys.OrtherFloat, objtbl_Categorys.ParamNamePK, objtbl_Categorys.ParamOrther);
        }

        public void Updatetbl_Categorys(tbl_CategorysInfo objtbl_Categorys)
        {
            SQLData.Instance(_conn).Updatetbl_Categorys(objtbl_Categorys.ID, objtbl_Categorys.ParentId, objtbl_Categorys.Name, objtbl_Categorys.SubContent, objtbl_Categorys.Content, objtbl_Categorys.Image, objtbl_Categorys.Status, objtbl_Categorys.CategoryType, objtbl_Categorys.LaguageId, objtbl_Categorys.Order, objtbl_Categorys.CategoryLink, objtbl_Categorys.OrtherInt, objtbl_Categorys.OrtherText, objtbl_Categorys.OrtherFloat, objtbl_Categorys.ParamNamePK, objtbl_Categorys.ParamOrther);
        }

        public void Deletetbl_Categorys(int id)
        {
            SQLData.Instance(_conn).Deletetbl_Categorys(id);
        }


        public List<tbl_CategorysInfo> GetByParent(int ParentId)
        {
            return CBO.FillCollection<tbl_CategorysInfo>(SQLData.Instance(_conn).tbl_CategorysGetByParent(ParentId));
        }

        #endregion

    }
}
