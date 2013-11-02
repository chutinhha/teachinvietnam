using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogic;
using BusinessLogic.CV;
using TeachingJob.Data;
using System.Reflection;
using System.Resources;
using System.Threading;

namespace TeachingJob.publicArea.CV
{
    public partial class AdvanceSearchCV : BasePage
    {
        String myConn = System.Configuration.ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
        BusinessFacade facade;
        protected void Page_Load(object sender, EventArgs e)
        {
            Form.DefaultButton = btn_Search.UniqueID;

            facade = new BusinessFacade(myConn);

            dl_adminCate.DataSource = facade.GetChildCategory(1);
            dl_adminCate.DataBind();
            dl_Fromk12Cate.DataSource = facade.GetChildCategory(2);
            dl_Fromk12Cate.DataBind();
            dl_AcademicCate.DataSource = facade.GetChildCategory(3);
            dl_AcademicCate.DataBind();

            dl_Joblevel.DataSource = facade.GetAllJobRole();
            dl_Joblevel.DataBind();

            dl_WorkPlace.DataSource = facade.GetAllLocation();
            dl_WorkPlace.DataBind();

            Assembly ass = Assembly.Load("App_GlobalResources");
            ResourceManager rm = new ResourceManager("Resources.Resource", ass);

            ddl_citizenship.Items.Insert(0, new ListItem(rm.GetString("Pleaseselect"), string.Empty));
            List<Citizenship> ctList = facade.GetAllCitizenship();
            foreach (Citizenship ct in ctList)
            {
                ListItem li = Utils.DecideLangDropdown(ct.CitizenshipName, ct.CitizenshipName_vn);
                if (li.Value == "Afghanistan" || li.Value == "Afghanistan")
                {
                    ListItem l = new ListItem("------------------------------", "");
                    ddl_citizenship.Items.Add(l);
                }
                ddl_citizenship.Items.Add(li);
            }

            ddl_YearOfExp.Items.Insert(0, new ListItem(rm.GetString("Pleaseselect"), string.Empty));
            List<YearOfExp> yeList = facade.GetYearsOfExp();
            foreach (YearOfExp ye in yeList)
            {
                ListItem li = Utils.DecideLangDropdown(ye.Name_en, ye.Name_vi);
                ddl_YearOfExp.Items.Add(li);
            }

            ddl_EduLevel.Items.Insert(0, new ListItem(rm.GetString("Pleaseselect"), string.Empty));
            List<EduLevelcs> elList = facade.GetEduLevel();
            foreach (EduLevelcs el in elList)
            {
                ListItem li = Utils.DecideLangDropdown(el.Name_en, el.Name_vi);
                ddl_EduLevel.Items.Add(li);
            }

        }
        protected void dl_adminCate_DataBound(object sender, DataListItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var myCheckBox = (CheckBox)e.Item.FindControl("cb_adminCate");
                if (myCheckBox != null)
                {
                    myCheckBox.ID = "cbSectorName_" + e.Item.ItemIndex;
                    if (Thread.CurrentThread.CurrentCulture.Name == "vi-VN")
                    {
                        myCheckBox.Text = " " + DataBinder.Eval(e.Item.DataItem, "SeName_vi").ToString();
                    }
                    else
                    {
                        myCheckBox.Text = " " + DataBinder.Eval(e.Item.DataItem, "seName_en").ToString();
                    }
                    myCheckBox.InputAttributes.Add("value", DataBinder.Eval(e.Item.DataItem, "seName_en").ToString());
                    if (myCheckBox.Text == "Administration" || myCheckBox.Text == "From K-12" || myCheckBox.Text == "Academic")
                    {
                        myCheckBox.CssClass = "checked root";
                        myCheckBox.AutoPostBack = true;
                        //myCheckBox.Visible = false;
                    }
                    //else
                    //{
                    //    myCheckBox.CssClass = "subitem";
                    //}
                }
            }
        }
        string cate_filter;
        protected void cb_adminCate_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox cbr = ((CheckBox)sender);
            if (cbr.Text == "Administration")
            {
                if (cbr.Checked == false)
                {
                    foreach (DataListItem item in dl_adminCate.Items)
                    {
                        CheckBox cb = (CheckBox)item.FindControl("cbSectorName_" + item.ItemIndex);
                        cb.Checked = false;
                    }
                }
                else if (cbr.Checked == true)
                {
                    foreach (DataListItem item in dl_adminCate.Items)
                    {
                        CheckBox cb = (CheckBox)item.FindControl("cbSectorName_" + item.ItemIndex);
                        cb.Checked = true;
                    }
                }
            }

            var cbCateList = ((CheckBox)sender).InputAttributes["value"];
            if (string.IsNullOrEmpty(cate_filter))
            {
                cate_filter = cbCateList;
            }
            else
            {
                cate_filter += "O" + cbCateList;
            }
        }

        protected void dl_Joblevel_Databound(object sender, DataListItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var myCheckBox = (CheckBox)e.Item.FindControl("cb_JobLevel");
                if (myCheckBox != null)
                {
                    myCheckBox.ID = "cb_JobLevel_" + e.Item.ItemIndex;
                    if (Thread.CurrentThread.CurrentCulture.Name == "vi-VN")
                    {
                        myCheckBox.Text = " " + DataBinder.Eval(e.Item.DataItem, "JrName_vn").ToString();
                    }
                    else
                    {
                        myCheckBox.Text = " " + DataBinder.Eval(e.Item.DataItem, "JrName").ToString();
                    }
                    myCheckBox.InputAttributes.Add("value", DataBinder.Eval(e.Item.DataItem, "JrName").ToString());

                    //myCheckBox.CssClass = "checked root";
                    //myCheckBox.AutoPostBack = true;

                }
            }
        }
        string joblevel_filter;
        protected void cb_JobLevel_checkedchanged(object sender, EventArgs e)
        {
            var cbJobLevel = ((CheckBox)sender).InputAttributes["value"];
            if (string.IsNullOrEmpty(joblevel_filter))
            {
                joblevel_filter = cbJobLevel;
            }
            else
            {
                joblevel_filter += "O" + cbJobLevel;
            }
        }
        protected void dl_workplace_Databound(object sender, DataListItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var myCheckBox = (CheckBox)e.Item.FindControl("cb_workplace");
                if (myCheckBox != null)
                {
                    myCheckBox.ID = "cb_workplace_" + e.Item.ItemIndex;
                    if (Thread.CurrentThread.CurrentCulture.Name == "vi-VN")
                    {
                        myCheckBox.Text = " " + DataBinder.Eval(e.Item.DataItem, "LName_vn").ToString();
                    }
                    else
                    {
                        myCheckBox.Text = " " + DataBinder.Eval(e.Item.DataItem, "LName").ToString();
                    }
                    myCheckBox.InputAttributes.Add("value", DataBinder.Eval(e.Item.DataItem, "LName").ToString());

                }
            }
        }
        string workplace_filter = "";
        protected void cb_workplace_CheckChanged(object sender, EventArgs e)
        {
            var cbworkplace = ((CheckBox)sender).InputAttributes["value"];
            if (string.IsNullOrEmpty(workplace_filter))
            {
                workplace_filter = cbworkplace;
            }
            else
            {
                workplace_filter += "O" + cbworkplace;
            }
        }

        protected void dl_emplType_Databound(object sender, DataListItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var myCheckBox = (CheckBox)e.Item.FindControl("cb_emplType");
                if (myCheckBox != null)
                {
                    myCheckBox.ID = "cb_emplType_" + e.Item.ItemIndex;
                    myCheckBox.Text = DataBinder.Eval(e.Item.DataItem, "EtName").ToString();
                    myCheckBox.InputAttributes.Add("value", DataBinder.Eval(e.Item.DataItem, "EtName").ToString());

                }
            }
        }

        protected void Search_Click(object sender, EventArgs e)
        {
            string keyword = txt_Search.Text;
            string query = "?kw=" + keyword.Trim() + "&cate=" + cate_filter + "&location=" + workplace_filter + "&citizen=" + ddl_citizenship.SelectedValue + "&yoe=" + ddl_YearOfExp.SelectedValue + "&el=" + ddl_EduLevel.SelectedValue + "&jl=" + joblevel_filter + "&ad=true";

            Response.Redirect("~/publicArea/CV/SearchResultcv.aspx" + query);
        }
    }
}