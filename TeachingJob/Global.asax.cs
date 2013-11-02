using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;
using System.Globalization;
using System.Reflection;
using System.Resources;
using System.Web.Security;
using TeachingJob.Data;
using BusinessLogic;
using System.Text;
using System.Configuration;
using System.IO;
using System.Net.Mail;
namespace TeachingJob
{
    public class Global : System.Web.HttpApplication
    {
        //public System.Timers.Timer timer = new System.Timers.Timer(3600000);
        public System.Timers.Timer timer = new System.Timers.Timer(10000);
        String myConn = System.Configuration.ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
        BusinessFacade facade;
        void Application_Start(object sender, EventArgs e)
        {
            facade = new BusinessFacade(myConn);
            timer.Enabled = true;
            timer.Elapsed += new System.Timers.ElapsedEventHandler(send);
            timer.AutoReset = true;
           // SendNewJob();
            //SendNewCV();
         
        }
        public void send(object source, System.Timers.ElapsedEventArgs e)
        {
            
            //SendNewJob();
        }

        /// <summary>
        /// Gửi mail cho Job khi có CV mới
        /// </summary>
        public void SendNewCV()
        {
            MailUtils mailUtils = new MailUtils();
            string[] userList = Roles.GetUsersInRole("Employee");
            string strMail = "";
            foreach (string str in userList)
            {
                strMail = "minhhv89@gmail.com";

            }
            StringBuilder sb = new StringBuilder();
            sb.Append(mailUtils.MailHeader());
            sb.Append("<br/> Dear Recruiter, <br/>");
            sb.Append("Listed below are recent candidates and information that match your search- Native English Teachers!<br/>");
            sb.Append("Please take a moment to review the information below. <br/>");
            sb.Append(GetCVList());
            sb.Append("<br/>Thank you for using teachinvietnam.org!");
            sb.Append(mailUtils.MailFooter());
            SendMail("toquyen16112003@gmail.com", "Qualified Native Teachers!", sb.ToString(), "", strMail);
        }

        /// <summary>
        /// Gửi mail cho Emp khi có công việc mới
        /// </summary>
        public void SendNewJob()
        {
            MailUtils mailUtils = new MailUtils();
            string[] userList = Roles.GetUsersInRole("Employee");
            string strMail = "";
            foreach (string str in userList)
            {
                strMail = "minhhv89@gmail.com";
               
            }
            StringBuilder sb = new StringBuilder();
            sb.Append(mailUtils.MailHeader());
            sb.Append("<br/> Hello Q, <br/>");
            sb.Append("Listed below are recent opportunities and information that match your search- Teaching job in Vietnam!<br/>");
            sb.Append(GetNewJobList());
            sb.Append("<br/>Wish you a great career ahead!");
            sb.Append(mailUtils.MailFooter());
            SendMail("toquyen16112003@gmail.com", "Teacher position", sb.ToString(), "", strMail);
        }


        public void SendMail(String mailTo, String mailSubject, String body, String cc = "", String bcc = "")
        {
            System.Net.Mail.SmtpClient smtpClient = null;
            System.Net.Mail.MailMessage email = null;
            try
            {
                string PathApp = "/";
                
                Configuration config = System.Web.Configuration.WebConfigurationManager.OpenWebConfiguration(PathApp);
                System.Net.Configuration.MailSettingsSectionGroup settings = (System.Net.Configuration.MailSettingsSectionGroup)config.GetSectionGroup("system.net/mailSettings");

                smtpClient = new System.Net.Mail.SmtpClient();
                smtpClient.Host = settings.Smtp.Network.Host;
                smtpClient.EnableSsl = settings.Smtp.Network.EnableSsl;
                System.Net.NetworkCredential credentials = new System.Net.NetworkCredential(settings.Smtp.Network.UserName, settings.Smtp.Network.Password);
                smtpClient.Credentials = credentials;

                email = new System.Net.Mail.MailMessage();
                string to = mailTo;
                if (to.Contains(","))
                {
                    string[] tos = to.Split(',');
                    for (int i = 0; i < tos.Length; i++)
                    {
                        email.To.Add(new MailAddress(tos[i]));
                    }
                }
                else
                {
                    email.To.Add(new MailAddress(to));
                }
                if (cc != "")
                {
                    if (cc.Contains(","))
                    {
                        string[] ccs = cc.Split(',');
                        for (int i = 0; i < ccs.Length; i++)
                        {
                            email.CC.Add(new MailAddress(ccs[i]));
                        }
                    }
                    else
                    {
                        email.CC.Add(new MailAddress(cc));
                    }
                }
                if (bcc != "")
                {
                    if (bcc.Contains(","))
                    {
                        string[] bccs = bcc.Split(',');
                        for (int i = 0; i < bccs.Length; i++)
                        {
                            email.Bcc.Add(new MailAddress(bccs[i]));
                        }
                    }
                    else
                    {
                        email.Bcc.Add(new MailAddress(bcc));
                    }
                }
                email.From = new System.Net.Mail.MailAddress(settings.Smtp.Network.UserName, "Teachinvietnam.org");
                //email.To.Add(new System.Net.Mail.MailAddress(mailTo));
                email.Subject = mailSubject;
                email.DeliveryNotificationOptions = DeliveryNotificationOptions.OnFailure;
                email.Body = body.Replace(Environment.NewLine, "<br />");
                email.IsBodyHtml = true;
                smtpClient.Send(email);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                email.Dispose();
                smtpClient.Dispose();
            }
        }

        /// <summary>
        /// Lấy về danh sách các job mới
        /// </summary>
        /// <returns></returns>
        public string GetNewJobList()
        {
            string strJob = "";
           List<FeaturedJob> lst= facade.GetNewestJobs();
           int i = 0;
           foreach (FeaturedJob fJ in lst)
           {
               i++;
               if(i<3)
               strJob = strJob + "<a href='http://teach.vn/publicArea/JobDetails.aspx?jid="+fJ.Id.ToString()+"'>-" + fJ.Title + "</a><br/>";
           }
           return strJob;
        }


        /// <summary>
        /// Lấy về danh sách các job mới
        /// </summary>
        /// <returns></returns>
        public string GetCVList()
        {
            string strCV = "";
            List<BusinessLogic.CV.CvDetail> lst = facade.proc_SearchCV("", "", "", "", "", "", "", true);
            int i = 0;
            foreach (BusinessLogic.CV.CvDetail fJ in lst)
            {
                i++;
                if (i < 3)
                    strCV = strCV + "<a href='/publicArea/CV/Detail.aspx?cvname=" + fJ.UserId.ToString() + "'>-" + fJ.Fullname + "</a><br/>";
            }
            return strCV;
        }

        /// <summary>
        /// Gửi mail yêu cầu cập nhật CV
        /// </summary>
        public void SendUpdateCV()
        {
            
        }

        void Application_End(object sender, EventArgs e)
        {
            //  Code that runs on application shutdown
        }

        void Application_Error(object sender, EventArgs e)
        {
            // Code that runs when an unhandled error occurs

        }

        void Session_Start(object sender, EventArgs e)
        {
            Assembly ass = Assembly.Load("App_GlobalResources");
            ResourceManager rm = new ResourceManager("Resources.Resource", ass);
            // Code that runs when a new session is started
            Session.Add("keyword", "");
            Session.Add("category", rm.GetString("Any Category"));
            Session.Add("location", rm.GetString("Any Location"));
            Session.Add("citizenship", rm.GetString("Any Citizenship"));
            
        }

        void Session_End(object sender, EventArgs e)
        {
            // Code that runs when a session ends. 
            // Note: The Session_End event is raised only when the sessionstate mode
            // is set to InProc in the Web.config file. If session mode is set to StateServer 
            // or SQLServer, the event is not raised.

        }
        void Application_BeginRequest(object sender, EventArgs e)
        {
            if (HttpContext.Current != null)
            {
                string rawUrl = HttpContext.Current.Request.RawUrl;
                
                if (rawUrl.Contains("StatementUpdate.aspx"))
                {
                    HttpContext.Current.RewritePath("/publicArea/CV/InternalUpdate/StatementUpdate.aspx");
                    return;
                }
                if (rawUrl.Contains("UpdateProfile.aspx"))
                {
                    HttpContext.Current.RewritePath("/publicArea/CV/InternalUpdate/UpdateProfile.aspx");
                    return;
                } 
                if (rawUrl.Contains("UpdatePersonal.aspx"))
                {
                    HttpContext.Current.RewritePath("/publicArea/CV/InternalUpdate/UpdatePersonal.aspx");
                    return;
                }
                //if (HttpContext.Current.Request.UrlReferrer != null)
                //{
                //    String urlRefferer = HttpContext.Current.Request.UrlReferrer.ToString();
                //    if (urlRefferer.Contains("lang=vi"))
                //    {
                //        string redirectTo = string.Empty;
                //        if (urlRefferer.Contains('?') && !urlRefferer.Contains("lang"))
                //        {
                //            redirectTo = rawUrl + "&lang=vi";
                //        }
                //        //else if (urlRefferer.Contains('?') && (urlRefferer.Contains("lang=en") || urlRefferer.Contains("lang=vi")))
                //        //{
                //        //    redirectTo = rawUrl.Replace("lang=vi", "lang=en");
                //        //}
                //        else
                //        {
                //            redirectTo = rawUrl + "?lang=vi";
                //        }

                //        HttpContext.Current.RewritePath(redirectTo);
                //        return;
                //    }
                //}
            }
        }
    }
}
