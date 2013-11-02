using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogic;
using System.Data;
using System.Collections;
using Telerik.Web.UI;
namespace TeachingJob.admintj
{
    public partial class CategorysEdit : System.Web.UI.Page
    {
        static int MaTuTang = 0;
        static int MaTuTang1 = 1;
        String myConn = System.Configuration.ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
        #region "Function"
        /// <summary>
        /// Load danh sách dịch vụ cha
        /// </summary>
        private void BindParentServices()
        {
           
         
        }


        private void DeQuy(ref ArrayList arr, int ParentId,string strAdd)
        {
           
        }

        /// <summary>
        /// Lấy về danh sách thứ tự
        /// </summary>
        protected void LoadBehind()
        {
            ddlBehind.Items.Clear();
            tbl_CategorysController ctl = new tbl_CategorysController(myConn);
            RadTreeNode afterNode = rtvCategory.FindChildByValue<RadTreeNode>(ddlServiceParent .SelectedValue, false);
            foreach (RadTreeNode nodeChild in afterNode.Nodes)
            {
                CreateNodeClientForBehind(nodeChild);
            }
            ddlBehind.Items.Insert(0, new ListItem("<Head>", "0"));
        }

        /// <summary>
        /// Lấy về danh sách loại  cha
        /// </summary>
        protected void LoadParentServices()
        {
            ddlServiceParent.Items.Clear();
            RadTreeNode rootNode = rtvCategory.Nodes[0];
            foreach (RadTreeNode nodeChild in rootNode.Nodes)
            {
                CreateNodeClientForServiceParent("", nodeChild);
            }
            ddlServiceParent.Items.Insert(0, new ListItem("<None>", "0"));
        }

        /// <summary>
        /// Tạo ra các node ở client cho danh sách loại  cha
        /// </summary>
        /// <param name="chr"></param>
        /// <param name="rnode"></param>
        protected void CreateNodeClientForServiceParent(string chr, RadTreeNode rnode)
        {
            ddlServiceParent.Items.Add(new ListItem(chr + rnode.Text, rnode.Value));
            chr += "-+";
            foreach (RadTreeNode nodeChild in rnode.Nodes)
            {
                CreateNodeClientForServiceParent(chr, nodeChild);
            }
        }




        /// <summary>
        /// Tải danh sách  từ DB
        /// </summary>
        protected void LoadCategory(int parentid, RadTreeNode node)
        {
            tbl_CategorysController ctl = new tbl_CategorysController(myConn );
            List<tbl_CategorysInfo > lst = ctl.GetByParent(parentid);
            foreach (tbl_CategorysInfo obj in lst)
            {
                RadTreeNode newnode = new RadTreeNode(obj.Name, "old_" + obj.Status.ToString() + "_" + obj.ID .ToString());
                if (obj.Status == int.Parse(Category_Status.UnApprove.ToString("D")))
                {
                    newnode.ForeColor = System.Drawing.Color.Gray;
                }
                LoadCategory(obj.ID, newnode);
                node.Nodes.Add(newnode);
            }
        }

        /// <summary>
        /// Tạo ra các node ở client cho danh sách thứ tự
        /// </summary>
        /// <param name="chr"></param>
        /// <param name="rnode"></param>
        protected void CreateNodeClientForBehind(RadTreeNode rnode)
        {
            ddlBehind.Items.Add(new ListItem(rnode.Text, rnode.Value));
        }


        /// <summary>
        /// Lấy về danh sách trạng thái
        /// </summary>
        protected void LoadStatus()
        {
            ddlStatus.Items.Clear();
            ddlStatus.Items.Add(new ListItem("Approve", Category_Status.Approve.ToString("D")));
            ddlStatus.Items.Add(new ListItem("UnApprove", Category_Status.UnApprove.ToString("D")));
        }
        #endregion
        #region "Events"
        /// <summary>
        /// Page_load
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            
            rtvCategory.ContextMenuItemClick += RadTreeView1_ContextMenuItemClick;
            if (!IsPostBack)
            {
                LoadStatus();
                LoadCategory(0, rtvCategory.Nodes[0]);
                LoadParentServices();
                LoadBehind();
                
            }
        }

        /// <summary>
        /// Thêm chuyên mục từ root
        /// </summary>
        protected void AddFromRoot()
        {
            int indexAfter = 0;
            RadTreeNode parentNode = rtvCategory.FindChildByValue<RadTreeNode>(ddlServiceParent.SelectedValue, false);
            if (ddlBehind.SelectedValue != "0")
            {
                RadTreeNode afterNode = rtvCategory.FindChildByValue<RadTreeNode>(ddlBehind.SelectedValue, false);
                indexAfter = afterNode.Index + 1;
            }
            MaTuTang = MaTuTang + 1;
            RadTreeNode newNode = new RadTreeNode(txt_name.Text, "new_" + ddlStatus.SelectedValue + "_" + MaTuTang.ToString());
            parentNode.Nodes.Insert(indexAfter, newNode);
            //Tải lại danh sách Loại  cha
            LoadParentServices();
            //Tải lại danh sách Thứ tự
            LoadBehind();

        }

        /// <summary>
        /// Cập nhật vào CSDL
        /// </summary>
        /// <param name="chr"></param>
        /// <param name="rnode"></param>
        /// <param name="parentid"></param>
        /// <returns></returns>
        protected int AddToDB(string chr, RadTreeNode rnode, int parentid)
        {
            tbl_CategorysInfo obj = new tbl_CategorysInfo();
            tbl_CategorysController ctl = new tbl_CategorysController(myConn);
            obj.ParentId = parentid;
            obj.Name = rnode.Text;
            obj.Order = MaTuTang1;
            obj.Content = txt_content.Value;
            obj.Image = txt_image.Text;
            obj.LaguageId = "en-US";
            obj.Status = int.Parse(rnode.Value.Split('_')[1]);
            obj.ParamOrther = chr;
            ctl.Addtbl_Categorys(obj);
            return 1;
        }

        /// <summary>
        /// Clear Data      
        /// </summary>
        protected void RefreshData()
        {
            txt_content.Value = "";
            txt_image.Text = "";
            txt_name.Text = "";
        }

        /// <summary>
        /// Tạo ra các node ở server
        /// </summary>
        /// <param name="chr"></param>
        /// <param name="rnode"></param>
        protected void CreateNodeSerVer(string chr, RadTreeNode rnode, int parentid)
        {

            int parentid1 = 0;
            MaTuTang1 = MaTuTang1 + 1;
            if (rnode.Value.Contains("new_"))
            {
                parentid1 = AddToDB(chr, rnode, parentid);
            }
            //else
            //{
            //    UpdateToDB(chr, rnode, parentid);
            //    parentid1 = int.Parse(rnode.Value.Split('_')[2]);
            //}
            parentid1 = int.Parse(rnode.Value.Split('_')[2]);

            chr += "-+";
            foreach (RadTreeNode nodeChild in rnode.Nodes)
            {
                CreateNodeSerVer(chr, nodeChild, parentid1);
            }
        }


        /// <summary>
        /// Event Addnew
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btn_submit_Click(object sender, EventArgs e)
        {
            switch (hdfType.Value)
            {
                case "Add":
                    AddFromRoot();
                    break;
                case "Edit":
                    //Edit();
                    break;
                default:
                    AddFromRoot();
                    break;
            }
            MaTuTang1 = 1;
            foreach (RadTreeNode obj in rtvCategory.Nodes[0].Nodes)
            {
                CreateNodeSerVer("", obj, 0);
            }
            RefreshData();
            rtvCategory.Nodes[0].Nodes.Clear();
            LoadStatus();
            LoadCategory(0, rtvCategory.Nodes[0]);
            LoadParentServices();
            LoadBehind();

        }

        protected void RadTreeView1_ContextMenuItemClick(object sender, RadTreeViewContextMenuEventArgs e)
        {
            RadTreeNode clickedNode = e.Node;

            switch (e.MenuItem.Value)
            {
                case "AddFromRoot":
                   hdfType.Value = "Add";
                    break;
                case "Add":
                    hdfType.Value = "Add";
                    ddlServiceParent.ClearSelection();
                    ddlServiceParent.Items.FindByValue(clickedNode.ParentNode.Value).Selected = true;
                    LoadBehind();
                    break;
                case "AddChild":
                    hdfType.Value = "Add";
                    ddlServiceParent.ClearSelection();
                    ddlServiceParent.Items.FindByValue(clickedNode.Value).Selected = true;
                    LoadBehind();
                    break;
                case "Edit":
                    try
                    {
                        hdfType.Value = "Edit";
                        ddlServiceParent .ClearSelection();
                        ddlStatus.ClearSelection();
                        tbl_CategorysController ctl = new tbl_CategorysController(myConn );
                        tbl_CategorysInfo obj = ctl.Gettbl_Categorys(int.Parse(clickedNode.Value.Split('_')[2]));
                        if (obj != null)
                        {
                            ddlServiceParent.Items.FindByValue(clickedNode.ParentNode.Value).Selected = true;
                            ddlStatus.Items.FindByValue(clickedNode.Value.Split('_')[1]).Selected = true;
                            txt_name.Text = obj.Name;
                            txt_content.Value = obj.Content;
                            txt_image.Text = obj.Image;
                            hdfIdEdit.Value = clickedNode.Value;
                            LoadBehind();
                            if (clickedNode.Index > 0)
                            {
                                ddlBehind.ClearSelection();
                                ddlBehind.SelectedIndex = clickedNode.Index;
                            }
                        }
                    }
                    catch (Exception ex) { }
                    break;
                case "Delete":
                    break;
            }
        }

        protected void ddlServiceParent_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadBehind();
        }
        #endregion

        
        
    }
}