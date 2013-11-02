using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Reflection;
using System.Resources;
using BusinessLogic;
using TeachingJob.Data;
using System.Text;

namespace TeachingJob.Templates.Pages
{
    public partial class InternshipGuide : System.Web.UI.Page
    {
        String myConn = System.Configuration.ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlCountry.DataBind();
            }
        }
        protected void Citizenship_DataBound(object sender, EventArgs e)
        {
            BusinessFacade facade = new BusinessFacade(myConn);
            Assembly ass = Assembly.Load("App_GlobalResources");
            ResourceManager rm = new ResourceManager("Resources.Resource", ass);

            ddlCountry.Items.Insert(0, new ListItem("Please select..", String.Empty));

            List<Citizenship> ciList = facade.GetAllCitizenship();
            foreach (Citizenship ci in ciList)
            {
                ListItem li = Utils.DecideLangDropdown(ci.CitizenshipName, ci.CitizenshipName_vn);
                if (li.Value == "Afghanistan" || li.Value == "Afghanistan")
                {
                    ListItem l = new ListItem("------------------------------", "N/A");
                    l.Attributes.Add("disabled", "true");
                    ddlCountry.Items.Add(l);
                }
                ddlCountry.Items.Add(li);
            }
        }
        protected void btn_Submit_Click(object sender, EventArgs e)
        {
            recaptcha.Validate();
            if (recaptcha.IsValid)
            {
                if (Page.IsValid && recaptcha.IsValid)
                {
                    try
                    {
                        StringBuilder emailMessage = new StringBuilder();

                        emailMessage.Append(String.Format("Dear {0} {1} {2},<br /><br />", ddlTitle.SelectedValue, txtFirstName.Text, txtLastName.Text));
                        emailMessage.Append("There is new request for Teach in Vietnam Guide.<br />Here are the details:<br />");
                        emailMessage.Append(String.Format("<table style='margin-left:25px;'><tr><td style='padding: 8px;background: #d0dafd; border-bottom: 1px solid #fff;color: #669;border-top: 1px solid transparent;'>Name:</td><td style='padding: 8px;background: #e8edff; border-bottom: 1px solid #fff;color: #669;border-top: 1px solid transparent;'>{0}</td></tr><tr><td style='padding: 8px;background: #d0dafd; border-bottom: 1px solid #fff;color: #669;border-top: 1px solid transparent;'>Email:</td><td style='padding: 8px;background: #e8edff; border-bottom: 1px solid #fff;color: #669;border-top: 1px solid transparent;'>{1}</td></tr><tr><td style='padding: 8px;background: #d0dafd; border-bottom: 1px solid #fff;color: #669;border-top: 1px solid transparent;'>Country:</td><td style='padding: 8px;background: #e8edff; border-bottom: 1px solid #fff;color: #669;border-top: 1px solid transparent;'>{2}</td></tr><tr><td style='padding: 8px;background: #d0dafd; border-bottom: 1px solid #fff;color: #669;border-top: 1px solid transparent;'>Phone Number:</td><td style='padding: 8px;background: #e8edff; border-bottom: 1px solid #fff;color: #669;border-top: 1px solid transparent;'>{3}</td></tr></table><br />", ddlTitle.SelectedValue + " " + txtFirstName.Text.Trim() + " " + txtLastName.Text.Trim(), txtEmailAddress.Text.Trim(), ddlCountry.SelectedValue, txtPhoneNumber.Text.Trim()));

                        StringBuilder strBuilder = new StringBuilder();

                        TeachingJob.Data.MailUtils mailUtils = new TeachingJob.Data.MailUtils(Request);
                        strBuilder.Append(mailUtils.MailHeader());
                        strBuilder.Append(mailUtils.Body(emailMessage.ToString(), null, false, null, null, "en-US"));
                        strBuilder.Append(mailUtils.MailFooter());

                        // Send the email
                        TeachingJob.Data.Utils.SendMail(General.WEB_MAIL_INTERNSHIP, "TeachinVietnam Internship Guide.", strBuilder.ToString(), "smtp.gmail.com", true);
                        BusinessLogic.Facade.Intership.InternshipGuide.Insert(ddlTitle.SelectedValue, txtFirstName.Text.Trim(), txtLastName.Text.Trim(), txtEmailAddress.Text.Trim(), ddlCountry.SelectedValue, txtPhoneNumber.Text.Trim());

                        Page.ClientScript.RegisterClientScriptBlock(GetType(), "", "<script>alert('Request internship guide successfully.');</script>");
                    }
                    catch (Exception)
                    {
                        Page.ClientScript.RegisterClientScriptBlock(GetType(), "", "<script>alert('" + General.AlertErrorJS + "');</script>");
                    }
                }
            }
            else
            {
                Assembly ass = Assembly.Load("App_GlobalResources");
                ResourceManager rm = new ResourceManager("Resources.Resource", ass);
                lbl_captStt.Text = rm.GetString("Pleaseentercorrectcaptcha");
            }
        }
    }
}