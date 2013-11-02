
using System;
using System.Data;
using DotNetNuke.Entities.Modules;
using DotNetNuke.Common.Utilities;

namespace BusinessLogic
{
	public class tbl_LogSendMailInfo : IHydratable
	{
	#region "Private Members"
		protected int _id;
		protected int _objType;
		protected int _lastId;
		protected int _lastSend;
		protected int _status;
		protected string _laguageId = String.Empty;
	#endregion
		
	#region "Constructors"
        public tbl_LogSendMailInfo()
        {
		}

        public tbl_LogSendMailInfo(int id, int objType, int lastId, int lastSend, int status, string laguageId)
		{
            this.ID = id;
            this.ObjType = objType;
            this.LastId = lastId;
            this.LastSend = lastSend;
            this.Status = status;
            this.LaguageId = laguageId;
        }
	#endregion
		
		#region "Public Properties"
		public int ID
		{
			get{return _id;}
			set{_id = value;}
		}
		
		public int ObjType
		{
			get{return _objType;}
			set{_objType = value;}
		}

		public int LastId
		{
			get{return _lastId;}
			set{_lastId = value;}
		}

		public int LastSend
		{
			get{return _lastSend;}
			set{_lastSend = value;}
		}

		public int Status
		{
			get{return _status;}
			set{_status = value;}
		}

		public string LaguageId
		{
			get{return _laguageId;}
			set{_laguageId = value;}
		}
		#endregion
		
		#region "IHydratable Interface"
		
		public int KeyID
		{
			get{return _id;}
			set{_id = value;}
		}
		
        public void Fill(IDataReader dr)
        {
		       ID = Convert.ToInt32(Null.SetNull(dr["ID"], ID));
		       ObjType = Convert.ToInt32(Null.SetNull(dr["ObjType"], ObjType));
		       LastId = Convert.ToInt32(Null.SetNull(dr["LastId"], LastId));
		       LastSend = Convert.ToInt32(Null.SetNull(dr["LastSend"], LastSend));
		       Status = Convert.ToInt32(Null.SetNull(dr["Status"], Status));
		       LaguageId = Convert.ToString(Null.SetNull(dr["LaguageId"], LaguageId));
		}		
		#endregion
	}
}
