using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BusinessLogic.Facade
{
    public class FeaturedLogo
    {
        private string orgName;
        private string logo;
        private string username;
        private int sortOrder;
        private bool active;
        private int id;

        public static List<FeaturedLogo> GetAll()
        {
            TeachinVietnamDataContext dbContext = new TeachinVietnamDataContext();
            var all = dbContext.tbl_feature_logos.Where(x=>x.active==true).OrderByDescending(x => x.SortOrder);
            List<FeaturedLogo> list = new List<FeaturedLogo>();
            foreach (var obj in all)
            {
                FeaturedLogo fl = new FeaturedLogo();
                fl.orgName = obj.OrganizationName;
                fl.logo = obj.logo;
                fl.username = obj.username;
                list.Add(fl);
            }
            return list;
        }

        public static FeaturedLogo GetFeatureLogoById(int _id)
        {
            TeachinVietnamDataContext dbContext = new TeachinVietnamDataContext();
            proc_feature_logo_GetByIdResult logo = dbContext.proc_feature_logo_GetById(_id).FirstOrDefault();
            if (logo != null)
            {
                FeaturedLogo fl = new FeaturedLogo();
                fl.id = logo.id;
                fl.Active = (bool)logo.active;
                fl.OrgName = logo.OrganizationName;
                fl.Logo = logo.logo;
                fl.Username = logo.username;
                fl.SortOrder = Convert.ToInt32(logo.SortOrder);
                return fl;
            }
            return null;
        }
        public static void UpdateLogo(int _id, int _displayOrder, bool _active)
        {
            try
            {
                TeachinVietnamDataContext dbContext = new TeachinVietnamDataContext();
                dbContext.proc_feature_logo_update(_id,  _active,_displayOrder);
            }
            catch (Exception e)
            {
                throw e;
            }
        }
        public static void InsertNewLogo(string _username, int _displayOrder)
        {
            try
            {
                TeachinVietnamDataContext dbContext = new TeachinVietnamDataContext();
                dbContext.proc_feature_logo_insert(_username, _displayOrder);
            }
            catch (Exception e)
            {
                throw e;
            }
        }
        public int Id
        {
            get { return id; }
            set { id = value; }
        }
        public bool Active
        {
            get { return active; }
            set { active = value; }
        }
        public int SortOrder
        {
            get { return sortOrder; }
            set { sortOrder = value; }
        }
        public string Username
        {
            get { return username; }
            set { username = value; }
        }
        public string OrgName
        {
            get { return orgName; }
            set { orgName = value; }
        }
        public string Logo
        {
            get { return logo; }
            set { logo = value; }
        }
    }
}
