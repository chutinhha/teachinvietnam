using System.Collections.Generic;
using System.Xml;
using DotNetNuke.Common;
using DotNetNuke.Common.Utilities;
using DotNetNuke.Services.Search;
using DataAccess;
namespace BusinessLogic
{
    public class tbl_LogSendMailController
	/*// : DotNetNuke.Entities.Modules.ISearchable, DotNetNuke.Entities.Modules.IPortable*/
	{
        private   string _conn;
        public tbl_LogSendMailController(string conn)
        {
            _conn = conn;
        }
	#region "Public Methods"		
		// Get a single tbl_LogSendMail item by primary key
		public tbl_LogSendMailInfo Gettbl_LogSendMail(int id)
		{
            return CBO.FillObject<tbl_LogSendMailInfo>(SQLData.Instance(_conn).Gettbl_LogSendMail(id));
		}

		public List<tbl_LogSendMailInfo> Listtbl_LogSendMail()
		{
			return CBO.FillCollection<tbl_LogSendMailInfo>(SQLData.Instance(_conn).Listtbl_LogSendMail());
		}

	
		public void Addtbl_LogSendMail(tbl_LogSendMailInfo objtbl_LogSendMail)
		{
			SQLData.Instance(_conn).Addtbl_LogSendMail(objtbl_LogSendMail.ObjType, objtbl_LogSendMail.LastId, objtbl_LogSendMail.LastSend, objtbl_LogSendMail.Status,objtbl_LogSendMail.LaguageId );
		}
	
		public void Updatetbl_LogSendMail(tbl_LogSendMailInfo objtbl_LogSendMail)
		{
			SQLData.Instance(_conn).Updatetbl_LogSendMail(objtbl_LogSendMail.ID, objtbl_LogSendMail.ObjType, objtbl_LogSendMail.LastId, objtbl_LogSendMail.LastSend, objtbl_LogSendMail.Status,objtbl_LogSendMail.LaguageId );
		}
		
		public void Deletetbl_LogSendMail(int id)
		{
			SQLData.Instance(_conn).Deletetbl_LogSendMail(id);
		}
	
	
		#endregion

	}
}
