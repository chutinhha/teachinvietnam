using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogic;
using System.Web.Security;
using TeachingJob.Data;

namespace TeachingJob.Employer
{
    public partial class cvsaved : BasePage
    {
        String conn = System.Configuration.ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
        BusinessFacade facade;
        MembershipUser mu;
        protected void Page_Load(object sender, EventArgs e)
        {
            facade = new BusinessFacade(conn);
            mu = Membership.GetUser();

            Datalist_Binding();
        }
        private void Datalist_Binding()
        {
            CollectionPager1.MaxPages = 10000;
            CollectionPager1.PageSize = Convert.ToInt16(ddl_ResultPerPage.SelectedValue);
            CollectionPager1.DataSource = facade.GetSavedCV(mu.ProviderUserKey.ToString());
            CollectionPager1.BindToControl = DataList1;
            DataList1.DataSource = CollectionPager1.DataSourcePaged;
            DataList1.DataBind();
        }
        protected void DataList_DataBound(object sender, DataListItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                HyperLink hpl_Image = (HyperLink)e.Item.FindControl("hpl_Image");
                Image Img = (Image)e.Item.FindControl("Img");
                HyperLink hpl_Fullname = (HyperLink)e.Item.FindControl("hpl_Fullname");
                string imgName = DataBinder.Eval(e.Item.DataItem, "Avatar").ToString();

                Guid userId = new Guid(DataBinder.Eval(e.Item.DataItem, "CvUserId").ToString());
                MembershipUser cvname_mu = Membership.GetUser(userId);
                string usernameStr = cvname_mu.UserName;


                hpl_Image.NavigateUrl = "~/publicArea/CV/Detail.aspx?cvname=" + userId;
                //
                hpl_Fullname.Text = DataBinder.Eval(e.Item.DataItem, "Fullname").ToString();
                hpl_Fullname.NavigateUrl = "~/publicArea/CV/Detail.aspx?cvname=" + userId;
                //Image
                Image img = (Image)e.Item.FindControl("Img");
                if (imgName == null || imgName == "")
                {
                    img.ImageUrl = "~/images/companyLogo/noLogo.jpg";
                }
                else
                {
                    img.ImageUrl = General.CAN_LOGO + usernameStr + "/" + imgName;
                }

                //Major
                Label lbl_Major = (Label)e.Item.FindControl("lbl_Major");
                lbl_Major.Text = DataBinder.Eval(e.Item.DataItem, "Major").ToString();
                lbl_Major.ToolTip = DataBinder.Eval(e.Item.DataItem, "Major").ToString();


                //hiddenfield
                HiddenField hf_id = (HiddenField)e.Item.FindControl("HiddenField_ID");
                hf_id.Value = DataBinder.Eval(e.Item.DataItem, "Id").ToString();
            }
        }

        protected void DataList_ItemCommand(object source, DataListCommandEventArgs e)
        {
            HiddenField hf_id = (HiddenField)e.Item.FindControl("HiddenField_ID");
            if (e.CommandName == "Delete")
            {
                facade.DeleteSavedCV(Convert.ToInt32(hf_id.Value));
                Datalist_Binding();
            }
        }

        protected void Repeater1_ItemCommand(object sender, RepeaterCommandEventArgs e)
        {

        }
        protected void PageSize_SelectChanged(object sender, EventArgs e)
        {

        }

    }
}