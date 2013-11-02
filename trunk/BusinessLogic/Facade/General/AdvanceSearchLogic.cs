using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DataAccess.Data.General;

namespace BusinessLogic.Facade.General
{
    public class AdvanceSearchLogic
    {
        AdvanceSearch advanceSearch;
        public AdvanceSearchLogic(string conn)
        {
            advanceSearch = new AdvanceSearch(conn);
        }
        public List<String> GetAllJobTitle()
        {
            try
            {
                return advanceSearch.GetAllJobTitle();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
