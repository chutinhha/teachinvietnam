using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TeachingJob.Data;
using System.Text;
using System.Globalization;
using System.Web.Security;

namespace TeachingJob.admintj
{
    public partial class SendingEmailTeach : System.Web.UI.Page
    {
        MailUtils mailUtils;
        string mark;
        protected void Page_Load(object sender, EventArgs e)
        {
            mailUtils = new MailUtils(Request);

            if (ddl_body.SelectedValue == "1")
            {
                if (ddl_lang.SelectedValue == "1")
                {
                    panel_quote_en.Visible = false;
                    panel_content_vi.Visible = false;
                    panel_quote_vi.Visible = false;
                    mark = "1body1lang";
                }
                else if (ddl_lang.SelectedValue == "2")
                {
                    panel_quote_en.Visible = false;
                    panel_content_vi.Visible = true;
                    panel_quote_vi.Visible = false;
                    mark = "1body2lang";
                }
            }
            else if (ddl_body.SelectedValue == "2")
            {
                if (ddl_lang.SelectedValue == "1")
                {
                    panel_quote_en.Visible = true;
                    panel_content_vi.Visible = false;
                    panel_quote_vi.Visible = false;
                    mark = "2bodyquote1lang";
                }
                else if (ddl_lang.SelectedValue == "2")
                {
                    panel_quote_en.Visible = true;
                    panel_content_vi.Visible = true;
                    panel_quote_vi.Visible = true;
                    mark = "2bodyquote2lang";
                }
            }
            if (!IsPostBack)
            {
                if (Request.Params["mailto"] != null)
                {
                    txt_mailto.Text = Request.Params["mailto"];
                }
                else if (Request.Params["t"] != null)
                {
                    string strMail = "";
                    string[] userList = Roles.GetUsersInRole(Request.Params["t"]);
                    foreach (string str in userList)
                    {
                        if (strMail == "")
                        {
                            strMail = str;
                        }
                        else
                        {
                            strMail =strMail+"," +str;
                        }
                    }
                    txt_bcc.Text = strMail;
                }
            }
        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            try
            {
                if (Page.IsValid)
                {
                    StringBuilder sb = new StringBuilder();

                    sb.Append(mailUtils.MailHeader());
                    string vl = txt_content_en.Value.Replace("\r\n", "");
                    if (mark == "1body1lang")
                    {
                       
                        sb.Append(Body(vl,null));
                    }
                    else if (mark == "1body2lang")
                    {
                        sb.Append(Body(vl, null));
                        sb.Append(mailUtils.Seperator());
                        sb.Append(Body(vl, null));
                    }
                    else if (mark == "2bodyquote1lang")
                    {
                        sb.Append(Body(vl, txt_quote_en.Text));
                    }
                    else if (mark == "2bodyquote2lang")
                    {
                        sb.Append(Body(vl, txt_quote_en.Text));
                        sb.Append(mailUtils.Seperator());
                        sb.Append(Body(vl, txt_quote_vi.Text));
                    }

                    sb.Append(mailUtils.MailFooter());

                    Utils.SendMail(txt_mailto.Text.Trim(), txt_subject.Text.Trim(), sb.ToString(),txt_cc.Text.Trim(),txt_bcc.Text.Trim());

                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "PopupScript", "<script>alert('Your mail has been sent.');window.location.href='SendingEmail.aspx';</script>");
                }
            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "PopupScript", "<script>alert('" + ex.Message + "');</script>");
            }
        }
        protected void btn_Cancel_Click(object sender, EventArgs e)
        {
            txt_content_en.Value = null;
        }
        public String Body(String title, String body, Boolean link = false, String href = "", string linkLabel = "", String culture = "en-US")
        {
            StringBuilder sb = new StringBuilder();

            string endBody;

            if (culture == "en-US")
            {
                endBody = "This e-mail is generated automatically. Please do not reply to it.<br />Best regards,<br /><br />TeachinVietnam.org";
            }
            else
            {
                endBody = "Đây là email tự động, vui lòng không trả lời (reply) email này.<br />Cảm ơn bạn đã sử dụng dịch vụ của chúng tôi.<br /><br />Thân mến!<br />Nhóm chăm sóc khách hàng<br />TeachinVietnam";
            }

            //neu ko co hyperlink trong body
            if (link != false)
            {
                //neu body = null
                if (body == null || body == "")
                {
                    sb.Append(String.Format("<p><div style='padding: 0px 10px 0 10px;'>{0}</div></p><p style='padding: 0px 10px 0 10px;'>{1}</p>", title, endBody));
                }
                else
                {
                    sb.Append(String.Format("<p><div style='padding: 0px 10px 0 10px;'>{1}</div></p><div style='margin: 10px 20px 10px 20px; padding: 5px; background-color: #F2F2F2;'><table cellpadding='4'><tr><td>{2}<br /><a style='text-decoration: none; color: #86ac3d;' href='{3}/{4}'> &raquo; {5}</a></td></tr></table></div><p style='padding: 0px 10px 0 10px;'>{6}</p>", null, title, body, Request.Url.GetLeftPart(UriPartial.Authority), href, linkLabel, endBody));
                }
            }
            else
            {
                if (body == null || body == "")
                {
                    sb.Append(String.Format("<p><div style='padding: 0px 10px 0 10px;'>{1}</div></p><p style='padding: 0px 10px 0 10px;'>{2}</p>", null, title, endBody));
                }
                else
                {
                    sb.Append(String.Format("<p><div style='padding: 0px 10px 0 10px;'>{1}</div></p><div style='margin: 10px 35px 10px 35px; padding: 5px; background-color: #F2F2F2;'><table cellpadding='4'><tr><td>{2}</td></tr></table></div><p style='padding: 0px 10px 0 10px;'>{3}</p>", null, title, body, endBody));
                }
            }

            return sb.ToString();
        }
    }
}