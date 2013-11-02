using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BusinessLogic.Facade
{
    public class ServiceArticle
    {
        private int id;
        private int parentId;
        private string title;
        private string mainContent;
        private DateTime createdDate;
        private bool displayOnMenu;
        private int displayOrder;
        private bool active;
        private static TeachinVietnamDataContext dbContext;

        public ServiceArticle() { }
        public static List<ServiceArticle> GetAll()
        {
            dbContext = new TeachinVietnamDataContext();
            var allArticles = dbContext.tbl_service_articles.Where(x => x.active == true).OrderByDescending(x => x.displayOrder).ThenByDescending(x => x.createdDate).ToList();
            List<ServiceArticle> saList = new List<ServiceArticle>();
            foreach (var article in allArticles)
            {
                ServiceArticle sa = new ServiceArticle();
                sa.id = article.id;
                sa.parentId = Convert.ToInt32(article.parentId);
                sa.title = article.title;
                sa.mainContent = article.maincontent.Replace(Environment.NewLine, "<br />");
                sa.createdDate = (DateTime)article.createdDate;
                sa.displayOnMenu = (bool)article.displayOnMenu; 
                sa.DisplayOrder = Convert.ToInt32(article.displayOrder);
                sa.active = (bool)article.active;
                saList.Add(sa);
            }
            return saList;
        }
        public static List<ServiceArticle> GetSubArticlesById(int _id)
        {
            dbContext = new TeachinVietnamDataContext();
            var list = dbContext.proc_service_article_GetSubArtiles(_id);
            List<ServiceArticle> saList = new List<ServiceArticle>();
            foreach (var article in list)
            {
                ServiceArticle sa = new ServiceArticle();
                sa.id = article.id;
                sa.parentId = Convert.ToInt32(article.parentId);
                sa.title = article.title;
                sa.mainContent = article.maincontent.Replace(Environment.NewLine, "<br />");
                sa.createdDate = (DateTime)article.createdDate;
                sa.displayOnMenu = (bool)article.displayOnMenu;
                sa.DisplayOrder = Convert.ToInt32(article.displayOrder);
                sa.active = (bool)article.active;
                saList.Add(sa);
            }
            return saList;
        }
        public static List<KeyValuePair<int, string>> GetAllIdAndTitle()
        {
            dbContext = new TeachinVietnamDataContext();
            List<KeyValuePair<int, string>> allArticles = dbContext.tbl_service_articles.Where(x => x.active == true).Select(x => new KeyValuePair<int, string>(x.id, x.title)).ToList();
            return allArticles;
        }
        public static bool hasParentNotRoot(int _id)
        {
            bool hasParent = false;
            dbContext = new TeachinVietnamDataContext();
            if (dbContext.proc_service_article_hasParentNotRoot(_id).Count() > 0)
            {
                hasParent = true;
            }

            return hasParent;
        }
        public static void InsertNewArticle(int _parentId,string _title,string _mainContent,bool _displayOnMenu,int _displayOrder,bool _active)
        {
            try
            {
                dbContext = new TeachinVietnamDataContext();
                dbContext.proc_service_acticle_insert(_parentId, _title, _mainContent, _displayOnMenu, _displayOrder, _active);
            }
            catch (Exception e)
            {
                throw e;
            }
        }
        public static void UpdateArticle(int _id, int _parentId, string _title, string _mainContent, bool _displayOnMenu, int _displayOrder, bool _active)
        {
            try
            {
                dbContext = new TeachinVietnamDataContext();
                dbContext.proc_service_article_updateArticleById(_id, _parentId, _title, _mainContent, _displayOnMenu, _displayOrder, _active);
            }
            catch (Exception e)
            {
                throw e;
            }
        }
        public static ServiceArticle GetArticleById(int id)
        {
            dbContext = new TeachinVietnamDataContext();
            proc_service_article_getArticleByIdResult article = dbContext.proc_service_article_getArticleById(id).FirstOrDefault();
            if (article != null)
            {
                ServiceArticle sa = new ServiceArticle();
                sa.id = article.id;
                sa.parentId = Convert.ToInt32(article.parentId);
                sa.title = article.title;
                sa.mainContent = article.maincontent.Replace(Environment.NewLine, "<br />");
                sa.createdDate = (DateTime)article.createdDate;
                sa.DisplayOrder =Convert.ToInt32(article.displayOrder);
                sa.displayOnMenu = (bool)article.displayOnMenu;
                sa.active = (bool)article.active;
                return sa;
            }
            return null;
        }
        public int Id
        {
            get { return id; }
            set { id = value; }
        }
        public int ParentId
        {
            get { return parentId; }
            set { parentId = value; }
        }
        public string Title
        {
            get { return title; }
            set { title = value; }
        }
        public string MainContent
        {
            get { return mainContent; }
            set { mainContent = value; }
        }
        public DateTime CreatedDate
        {
            get { return createdDate; }
            set { createdDate = value; }
        }
        public bool DisplayOnMenu
        {
            get { return displayOnMenu; }
            set { displayOnMenu = value; }
        }
        public int DisplayOrder
        {
            get { return displayOrder; }
            set { displayOrder = value; }
        }
        public bool Active
        {
            get { return active; }
            set { active = value; }
        }
    }
}
