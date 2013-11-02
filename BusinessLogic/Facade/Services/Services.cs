using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DataAccess.AccessFacade;
using System.Data;
using DotNetNuke.Common.Utilities;

namespace BusinessLogic.Facade
{
    public class Services
    {
        private string conn;
        public Services(string connStr)
        {
            conn = connStr;
        }

        public string Add(int ParentId, string Name, string CONTENT, string Image, int Order, int Status)
        {
            try
            {
                DataAccess.Data.Services Services = new DataAccess.Data.Services(conn);
                return  Services.Add(ParentId,Name,CONTENT,Image,Order,Status);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// Lấy vè service theo mã service cha
        /// </summary>
        /// <param name="ParentId"></param>
        /// <returns></returns>
        public List<ServicesInfo> GetByParent(int ParentId)
        {

            try
            {
                DataAccess.Data.Services Services = new DataAccess.Data.Services(conn);
                return CBO.FillCollection<ServicesInfo>( Services.GetByParent(ParentId));

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

    }
}
