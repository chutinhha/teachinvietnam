using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Web.Profile;
using TeachingJob.Data;

namespace TeachingJob.publicArea.CV.InternalUpdate
{
    public partial class StatementUpdate : BasePage
    {
        MembershipUser mu;
        protected void Page_Load(object sender, EventArgs e)
        {
            mu = Membership.GetUser();
            if (!IsPostBack)
            {
                txt_Statement.Text = Context.Profile.GetPropertyValue("CV.PersonalStatement").ToString();
            }
        }
        protected void Update_Click(object sender, EventArgs e)
        {
            string text = txt_Statement.Text;
            Context.Profile.SetPropertyValue("CV.PersonalStatement",text);
            Context.Profile.SetPropertyValue("CV.LastUpdated", DateTime.Now);
            Context.Profile.Save();
            Response.Redirect("~/publicArea/CV/UpdateCV.aspx?cvname=" + mu.ProviderUserKey.ToString()+"&stt=updated");
        }
    }
}