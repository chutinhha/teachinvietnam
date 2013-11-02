using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DataAccess.AccessFacade;
using System.Data;

namespace BusinessLogic.Facade.Employer
{
    public class EmployerLogic
    {
        DataAccess.Data.Employer.Employer employer;
        public EmployerLogic(string connStr)
        {
            employer = new DataAccess.Data.Employer.Employer(connStr);
        }

        public List<BusinessLogic.Employer> GetEmployerByCity(string city)
        {
            try
            {
                List<BusinessLogic.Employer> eList = new List<BusinessLogic.Employer>();
                DataTable tbl = employer.GetEmployerByCity(city);
                foreach (DataRow r in tbl.Rows)
                {
                    BusinessLogic.Employer e = new BusinessLogic.Employer();
                    e.UniqueId = r[0] != null ? r[0].ToString() : "";
                    e.EmName = r[1] != null ? r[1].ToString() : "";
                    e.OrgType = r[2] != null ? r[2].ToString() : "";
                    e.SchoolType = r[3] != null ? r[3].ToString() : "";
                    eList.Add(e);
                }
                return eList;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public DataSet GetEmployerInfo(string userId)
        {
            try
            {
                return employer.GetEmployerInfo(userId);
            }
            catch (Exception e)
            {
                throw e;
            }
        }
    }
}
