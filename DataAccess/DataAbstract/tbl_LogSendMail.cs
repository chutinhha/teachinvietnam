
using System;
using System.Data;


namespace DataAccess
{
    public abstract partial class DataProvider
    {

        #region tbl_LogSendMail Abstract Methods
        // Get a single tbl_LogSendMail item by primary key
        public abstract IDataReader Gettbl_LogSendMail(int id);

        public abstract IDataReader Listtbl_LogSendMail();



        public abstract void Addtbl_LogSendMail(int objType, int lastId, int lastSend, int status, string laguageId);

        public abstract void Updatetbl_LogSendMail(int id, int objType, int lastId, int lastSend, int status, string laguageId);

        public abstract void Deletetbl_LogSendMail(int id);

        //public abstract IDataReader GetPagetbl_LogSendMail(string sortCol, int requiredPage, int recordsPerPage, out int totalRows);
        #endregion
	}
}
