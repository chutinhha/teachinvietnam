using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Threading;
using System.Globalization;
using System.Text;
using System.Web.UI;
using System.IO;
using System.Text.RegularExpressions;

namespace TeachingJob.Data
{
    public class BasePage : System.Web.UI.Page
    {
        protected override void InitializeCulture()
        {
            //string lang = string.Empty;
            //if (!string.IsNullOrEmpty(Request["lang"]))
            if (Request["lang"] != null)
            {
                Session["lang"] = Request["lang"];


                //String url = this.Page.Request.Url.AbsoluteUri;
                //if (url.Contains("lang=en"))
                //{
                //    lang = "en";
                //}
                //else if (url.Contains("lang=vi"))
                //{
                //    lang = "vi";
                //}
                //else
                //{
                //    lang = "en";
                //}
            }

            string lang = Convert.ToString(Session["lang"]);
            string culture = string.Empty;
            if (lang.ToLower().CompareTo("vi") == 0)
            {
                //culture = "vi-VN";
                culture = "en-US";
            }
            else if (lang.ToLower().CompareTo("en") == 0 || string.IsNullOrEmpty(culture))
            {
                culture = "en-US";
            }
            Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(culture);
            Thread.CurrentThread.CurrentUICulture = new CultureInfo(culture);

            base.InitializeCulture();
        }

        //Hide all view state in page source
        //protected override void Render(HtmlTextWriter writer)
        //{
        //    StringBuilder sb = new StringBuilder();
        //    StringWriter sw = new StringWriter(sb);
        //    HtmlTextWriter hWriter = new HtmlTextWriter(sw);
        //    base.Render(hWriter);
        //    string html = sb.ToString();
        //    html = Regex.Replace(html, "<input[^>]*id=\"(__VIEWSTATE)\"[^>]*>", string.Empty, RegexOptions.IgnoreCase);
        //    writer.Write(html);
        //}
    }
}