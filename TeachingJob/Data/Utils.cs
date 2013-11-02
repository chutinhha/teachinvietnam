using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Threading;
using BusinessLogic;
using System.Drawing;
using System.Configuration;
using System.IO;
using System.Net.Mail;

namespace TeachingJob.Data
{
    public class Utils
    {
        public Utils() { }
        public String ReplaceLanguage(String url, String ordinal, String replace)
        {
            return url.Replace(ordinal, replace);
        }
        public static ListItem DecideLangDropdown(string name_en, string name_vn)
        {
            ListItem li;
            //string value = name_en;
            if (Thread.CurrentThread.CurrentCulture.Name == "vi-VN")
            {
                li = new ListItem(name_vn, name_vn);
            }
            else
            {
                li = new ListItem(name_en, name_en);
            }
            return li;
        }
        public static ListItem DecideLangDropdownV2(string name_en, string name_vn, string value)
        {
            ListItem li;
            //string value = name_en;
            if (Thread.CurrentThread.CurrentCulture.Name == "vi-VN")
            {
                li = new ListItem(name_vn, value);
            }
            else
            {
                li = new ListItem(name_en, value);
            }
            return li;
        }
        public static void catebinding(DropDownList control, List<Sector> seList, int seid, int index)
        {
            foreach (Sector se in seList)
            {
                ListItem li;
                if (se.SeId == seid)
                {
                    if (Thread.CurrentThread.CurrentCulture.Name == "vi-VN")
                    {
                        li = new ListItem(se.SeName_vi, "");
                    }
                    else
                    {
                        li = new ListItem(se.SeName_en, "");
                    }
                    li.Attributes.Add("style", "color:blue");
                    li.Attributes.Add("disabled", "true");
                    control.Items.Insert(index, li);
                    continue;
                }
                else
                {
                    string name = "- ";
                    if (Thread.CurrentThread.CurrentCulture.Name == "vi-VN")
                    {
                        name += se.SeName_vi;
                    }
                    else
                    {
                        name += se.SeName_en;
                    }
                    li = new ListItem(name, se.SeName_en);
                }
                control.Items.Add(li);
            }
            ListItem l = new ListItem("", "");
            control.Items.Add(l);
        }
        public static System.Drawing.Image ScaleImage(System.Drawing.Image image, int maxWidth, int maxHeight)
        {
            //same fuction: minimize size of image
            //int newHeight = image.Height;
            //int newWidth = image.Width;
            //newHeight = (newHeight * maxWidth) / newWidth;
            //newWidth = maxWidth;
            //if (newHeight > maxHeight)
            //{
            //    newWidth = (newWidth * maxHeight) / newHeight;
            //    newHeight = maxHeight;
            //}

            //same fuction: minimize size of image
            var ratioX = (double)maxWidth / image.Width;
            var ratioY = (double)maxHeight / image.Height;
            var ratio = Math.Min(ratioX, ratioY);

            var newWidth = (int)(image.Width * ratio);
            var newHeight = (int)(image.Height * ratio);

            var newImage = new Bitmap(newWidth, newHeight);
            Graphics.FromImage(newImage).DrawImage(image, 0, 0, newWidth, newHeight);
            return newImage;
        }
        public static void SendMail(String mailTo, String mailSubject, String body, String cc = "", String bcc = "")
        {
            System.Net.Mail.SmtpClient smtpClient = null;
            System.Net.Mail.MailMessage email = null;
            try
            {
                string PathApp = "";
                try
                {
                    PathApp = HttpContext.Current.Request.ApplicationPath;
                }
                catch (Exception)
                {
                    PathApp = "";
                }

                if (PathApp != "")
                {
                    System.Configuration.ConfigurationManager.AppSettings["PathApp"] = "1";
                }
                else
                {
                    PathApp = System.Configuration.ConfigurationManager.AppSettings["PathApp"];
                }
                if (PathApp == "")
                {
                    return;
                }
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

        public static void SendMail(String mailTo, String mailSubject, String body, String host, bool enableSsl, String cc = "", String bcc = "")
        {
            System.Net.Mail.SmtpClient smtpClient = null;
            System.Net.Mail.MailMessage email = null;
            try
            {
                string PathApp = "";
                try
                {
                    PathApp = HttpContext.Current.Request.ApplicationPath;
                }
                catch (Exception)
                {
                    PathApp = "";
                }

                if (PathApp != "")
                {
                    System.Configuration.ConfigurationManager.AppSettings["PathApp"] = "1";
                }
                else
                {
                    PathApp = System.Configuration.ConfigurationManager.AppSettings["PathApp"];
                }
                if (PathApp == "")
                {
                    return;
                }
                Configuration config = System.Web.Configuration.WebConfigurationManager.OpenWebConfiguration(PathApp);
                System.Net.Configuration.MailSettingsSectionGroup settings = (System.Net.Configuration.MailSettingsSectionGroup)config.GetSectionGroup("system.net/mailSettings");

                smtpClient = new System.Net.Mail.SmtpClient();
                smtpClient.Host = !string.IsNullOrEmpty(host) ? host : settings.Smtp.Network.Host;
                smtpClient.EnableSsl = enableSsl;
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

        public static String validateImage(String path, String filename)
        {
            if (filename != "" && filename != null)
            {
                return path + "/" + filename;
            }
            else
            {
                return "~/images/companyLogo/no_image.jpg";
            }
        }
        public static string RemoveBreakLine(string str)
        {
            return str.Replace(Environment.NewLine, string.Empty).Replace("<br />", string.Empty);
        }
        //public static String validateImage(String path)
        //{
        //    if (path != "" && path != null)
        //    {
        //        return path;
        //    }
        //    else
        //    {
        //        return "~/images/companyLogo/no_image.jpg";
        //    }
        //}
        public static void WriteToFile(string filePath,string content)
        {
            StreamWriter writer = null;
            try
            {
                if (File.Exists(filePath))
                {
                    File.Delete(filePath);
                }
                writer = new StreamWriter(filePath, false);
                writer.Write(content);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (writer != null)
                {
                    writer.Close();
                    writer.Dispose();
                }
            }
        }

        public static string GetVirtualPath(string physicalPath)
        {
            if (!physicalPath.StartsWith(HttpContext.Current.Request.PhysicalApplicationPath))
            {
                throw new InvalidOperationException("Physical path is not within the application root");
            }

            return "/" + physicalPath.Substring(HttpContext.Current.Request.PhysicalApplicationPath.Length)
                  .Replace("\\", "/");
        }
        public static string GetServerPath(string physicalPath)
        {
            if (!physicalPath.StartsWith(HttpContext.Current.Request.PhysicalApplicationPath))
            {
                throw new InvalidOperationException("Physical path is not within the application root");
            }

            return "~/" + physicalPath.Substring(HttpContext.Current.Request.PhysicalApplicationPath.Length)
                  .Replace("\\", "/");
        }
    }
}