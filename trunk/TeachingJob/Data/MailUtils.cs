using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Globalization;
using System.Reflection;
using System.Resources;

namespace TeachingJob.Data
{
    public class MailUtils
    {
        protected HttpRequest httpRequest;

        public MailUtils(HttpRequest Request)
        {
            this.httpRequest = Request;
        }
        public MailUtils()
        { }
        public String MailHeader()
        {
            string fb = "<a href='http://facebook.com/teachinvietnam' style='margin-left:3px;display:inline-block'><img src='http://teachinvietnam.org/images/c/facebook.gif'></a>";
            string tw = "<a href='https://twitter.com/vietnamteachers' style='margin-left:3px;display:inline-block'><img src='http://teachinvietnam.org/images/c/twitter.gif'></a>";
            string mail = "<a href='mailto:info@teachinvietnam.org' style='margin-left:3px;display:inline-block'><img src='http://teachinvietnam.org/images/c/Mail123.gif/></a>";
            string gg = "<a href='http://facebook.com/teachinvietnam' style='margin-left:3px;display:inline-block'><img src='http://teachinvietnam.org/images/c/facebook.gif'></a>";
            string logo = "<img src='http://teachinvietnam.org/images/logo.png' alt='Teachinvietnam.org' />";
            
            StringBuilder sb = new StringBuilder();
            //gray background e2e2e2, xanh nhat la d8effd, mau xanh th cua bang b5d9de,d8effd, font-family table th: Rage Italic, xanh chu la 4ebb10, header bg: 8dca75-b5d9de, font color:666666, xanh logo: 006700,da cam logo
           // sb.Append("<div style='background-color: #e2e2e2; width:100%; padding-top:10px;padding-bottom:10px;'><div style='border: 1px solid #99D699; background-color: #fff; width: 600px; margin: 15px auto;'><div style='background-color: #fff;padding: 5px 10px 0 10px;font-family:Sans-Serif;'><span style='font-family:Broadway;font-size: 26px; color: #009900; font-weight: bold;font-style:italic;'>Teach<span style='color:#ff9900;'>in</span>Vietnam<span style='font-size:14px'>.org</span></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<div style='float:right'>"+fb+tw+mail +"</div></div><div style='width: 100%; border-top: 2px solid #FF944D;'></div>");
            sb.Append("<div style='background-color: #e2e2e2; width:100%; padding-top:10px;padding-bottom:10px;'><div style='border: 1px solid #99D699; background-color: #fff; width: 600px; margin: 15px auto;'><div style='background-color: #fff;padding: 5px 10px 0 10px;font-family:Sans-Serif;'>" + logo + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<div style='float:right'>" + fb + tw +  "</div></div><div style='width: 100%; border-top: 2px solid #FF944D;'></div>");
            sb.Append("<div style='border-bottom: solid 1px rgb(255, 130, 11); height: 1px;'>");
            return sb.ToString();
        }

        public String MailFooter()
        {
            StringBuilder sb = new StringBuilder();

            sb.Append(String.Format("<div><table width='100%' style='padding: 0 10px 0 10px;' cellpadding='5; text-align:center;'><tr style='background-color: #8dca75; text-align: left;'><th style='font-size: 14px;color: #fff;'>TeachinVietnam</th></tr><tr style='background-color: #ececec;'><td><a href='{1}' style='color: #485c22; text-decoration: underline;'>Visit our website</a> | <a style='color: #485c22; text-decoration: underline;' href='mailTo:{0}'>Mail us</a> | <a href='{1}/Contactus.aspx' style='color: #485c22; text-decoration: underline;'>Contact us</a><br />Contact us at: (84-4) 66847964 or support@teachinvietnam.org<br />Hotline: 0989696627<br /> Copyright © 2012 Teach in Vietnam.</td></tr></table></div></div></div>", General.WEB_MAIL, httpRequest.Url.GetLeftPart(UriPartial.Authority)));

            return sb.ToString();
        }
        
        public String Body(String title, String body, Boolean link = false, String href = "", string linkLabel = "", String culture = "en-US")
        {
            StringBuilder sb = new StringBuilder();            

            int formatIndex;
            string endBody = "This e-mail is generated automatically. Please do not reply to it.<br />Best regards,<br /><br />Customer Care Department<br />TeachinVietnam";
            if (culture == "en-US")
            {
                formatIndex = 83;
            }
            else
            {
                formatIndex = 35;
                endBody = "Đây là email tự động, vui lòng không trả lời (reply) email này.<br />Cảm ơn bạn đã sử dụng dịch vụ của chúng tôi.<br /><br />Thân mến!<br />Nhóm chăm sóc khách hàng<br />TeachinVietnam";
            }

            //neu ko co hyperlink trong body
            if (link != false)
            {
                //neu body = null
                if (body == null || body == "")
                {
                    sb.Append(String.Format("<p><div style='padding: 0px 10px 0 10px;'><span style='float:right'>{0}</span></div><div style='padding: 0px 10px 0 10px;'>{1}</div></p><p style='padding: 0px 10px 0 10px;'>{2}</p>", DateTime.Now.GetDateTimeFormats(new CultureInfo(culture))[formatIndex], title, endBody));
                }
                else
                {
                    sb.Append(String.Format("<p><div style='padding: 0px 10px 0 10px;'><span style='float:right'>{0}</span></div><div style='padding: 0px 10px 0 10px;'>{1}</div></p><div style='margin: 10px 20px 10px 20px; padding: 5px; background-color: #F2F2F2;'><table cellpadding='4'><tr><td>{2}<br /><a style='text-decoration: none; color: #86ac3d;' href='{3}/{4}'> &raquo; {5}</a></td></tr></table></div><p style='padding: 0px 10px 0 10px;'>{6}</p>", DateTime.Now.GetDateTimeFormats(new CultureInfo(culture))[formatIndex], title, body, httpRequest.Url.GetLeftPart(UriPartial.Authority), href, linkLabel, endBody));
                }
            }
            else
            {
                if (body == null || body == "")
                {
                    sb.Append(String.Format("<p><div style='padding: 0px 10px 0 10px;'><span style='float:right'>{0}</span></div><div style='padding: 0px 10px 0 10px;'>{1}</div></p><p style='padding: 0px 10px 0 10px;'>{2}</p>", DateTime.Now.GetDateTimeFormats(new CultureInfo(culture))[formatIndex], title, endBody));
                }
                else
                {
                    sb.Append(String.Format("<p><div style='padding: 0px 10px 0 10px;'><span style='float:right'>{0}</span></div><div style='padding: 0px 10px 0 10px;'>{1}</div></p><div style='margin: 10px 35px 10px 35px; padding: 5px; background-color: #F2F2F2;'><table cellpadding='4'><tr><td>{2}</td></tr></table></div><p style='padding: 0px 10px 0 10px;'>{3}</p>", DateTime.Now.GetDateTimeFormats(new CultureInfo(culture))[formatIndex], title, body, endBody));
                }
            }

            return sb.ToString();
        }
        public String Seperator()
        {
            return "<div style='width: 100%; border-top: 1px dashed green;padding-bottom:2x;'></div>";
        }
    }
}