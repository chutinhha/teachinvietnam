using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BusinessLogic.Facade.Intership
{
    public class Intership
    {
        private int id;
        private string articleName;
        private string articleIntroduction;
        private string articleContent;
        private bool active;
        private DateTime createdDate;
        private bool enableFreeGuide;
        private bool enableApplyOnline;

        private static TeachinVietnamDataContext dbContext;

        public Intership()
        {
            dbContext = new TeachinVietnamDataContext();
        }

        public static List<Intership> GetAll()
        {
            dbContext = new TeachinVietnamDataContext();
            var allIntership = dbContext.tbl_Interships.Where(x => x.active == true).OrderByDescending(x => x.createdDate);
            List<Intership> ilist = new List<Intership>();
            foreach (var i in allIntership)
            {
                Intership _intership = new Intership();
                _intership.id = i.id;
                _intership.articleName = i.articleName;
                _intership.articleIntroduction = i.articleIntroduction.Replace(Environment.NewLine, "<br />");
                _intership.articleContent = i.articleContent.Replace(Environment.NewLine, "<br />");
                _intership.active = (bool)i.active;
                _intership.createdDate = (DateTime)i.createdDate;
                _intership.enableFreeGuide = i.EnableFreeGuide != null ? (bool)i.EnableFreeGuide : false;
                _intership.enableApplyOnline = i.EnableApplyOnline != null ? (bool)i.EnableApplyOnline : false;

                ilist.Add(_intership);
            }
            return ilist;
        }
        public static void DeleteAIntershipArticle(int id)
        {
            try
            {
                dbContext = new TeachinVietnamDataContext();
                dbContext.proc_deleteAIntershipArticle(id);
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public static Intership getIntershipById(int id, bool selectAll = false)
        {
            dbContext = new TeachinVietnamDataContext();
            BusinessLogic.proc_getIntershipByIdResult i = null;
            if (selectAll == false)
            {
                i = dbContext.proc_getIntershipById(id).Where(x => x.active == true).FirstOrDefault();
            }
            else
            {
                i = dbContext.proc_getIntershipById(id).FirstOrDefault();
            }
            if (i != null)
            {
                Intership _intership = new Intership();
                _intership.id = i.id;
                _intership.articleName = i.articleName;
                _intership.articleIntroduction = i.articleIntroduction.Replace(Environment.NewLine, "<br />");
                _intership.articleContent = i.articleContent.Replace(Environment.NewLine, "<br />");
                _intership.active = (bool)i.active;
                _intership.createdDate = (DateTime)i.createdDate;
                _intership.enableFreeGuide = i.EnableFreeGuide != null ? (bool)i.EnableFreeGuide : false;
                _intership.enableApplyOnline = i.EnableApplyOnline != null ? (bool)i.EnableApplyOnline : false;

                return _intership;
            }
            return null;
        }

        public static void UpdateIntership(int id, string title, string intro, string body, bool active, bool enableFreeGuide, bool enableApplyOnline)
        {
            dbContext = new TeachinVietnamDataContext();
            var result = dbContext.proc_UpdateInternship(id, title, intro, body, active, enableFreeGuide, enableApplyOnline);

        }

        public static void Insert(string title, string introduction, string body, bool isActive, bool enableFreeGuide, bool enableApplyOnline)
        {
            try
            {
                dbContext = new TeachinVietnamDataContext();
                string insertCommand = string.Format("EXEC [dbo].[proc_insertIntership] N'{0}',N'{1}',N'{2}',{3},{4},{5}", title, introduction, body, isActive == true ? "1" : "0", enableFreeGuide == true ? "1" : "0", enableApplyOnline == true ? "1" : "0");
                dbContext.ExecuteCommand(insertCommand);
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
        public string ArticleName
        {
            get { return articleName; }
            set { articleName = value; }
        }
        public string ArticleContent
        {
            get { return articleContent; }
            set { articleContent = value; }
        }
        public bool Active
        {
            get { return active; }
            set { active = value; }
        }

        public DateTime CreatedDate
        {
            get { return createdDate; }
            set { createdDate = value; }
        }
        public string ArticleIntroduction
        {
            get { return articleIntroduction; }
            set { articleIntroduction = value; }
        }

        public bool EnableFreeGuide
        {
            get { return enableFreeGuide; }
            set { enableFreeGuide = value; }
        }
        public bool EnableApplyOnline
        {
            get { return enableApplyOnline; }
            set { enableApplyOnline = value; }
        }
    }
}
