using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DataAccess.Data.Candidate;

namespace BusinessLogic.Facade.Candidate
{
    public class JobAlertLogic
    {
        JobAlert jobAlert;
        public JobAlertLogic(string connStr)
        {
            jobAlert = new JobAlert(connStr);
        }
        public void RegisterJobAlert(string email)
        {
            try
            {
                jobAlert.RegisterJobAlert(email);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public bool IsRegisterJobAlert(string email)
        {
            try
            {
                return jobAlert.IsRegisterJobAlert(email);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public void SetOnOff(string email, bool active)
        {
            try
            {
                jobAlert.SetOnOff(email, active);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public bool GetActiveValue(string email)
        {
            try
            {
                return jobAlert.GetActiveValue(email);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public bool IsActiveJobAlert(string email)
        {
            try
            {
                return jobAlert.IsActiveJobAlert(email);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
