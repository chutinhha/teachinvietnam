using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using tjadmin.Models;

namespace tjadmin.Controllers
{ 
    public class PreparationController : Controller
    {
        private TeachingJobEntities db = new TeachingJobEntities();

        //
        // GET: /Preparation/

        public ViewResult Index()
        {
            return View(db.Preparation_Article.ToList().OrderByDescending(t=>t.sort_order));
        }

        //
        // GET: /Preparation/Details/5

        public ViewResult Details(int id)
        {
            Preparation_Article preparation_article = db.Preparation_Article.Single(p => p.id == id);
            return View(preparation_article);
        }

        //
        // GET: /Preparation/Create

        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /Preparation/Create

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create(Preparation_Article preparation_article)
        {
            if (ModelState.IsValid)
            {
                db.Preparation_Article.AddObject(preparation_article);
                db.SaveChanges();
                return RedirectToAction("Index");  
            }

            return View(preparation_article);
        }
        
        //
        // GET: /Preparation/Edit/5
        [ValidateInput(false)]
        public ActionResult Edit(int id)
        {
            Preparation_Article preparation_article = db.Preparation_Article.Single(p => p.id == id);
            return View(preparation_article);
        }

        //
        // POST: /Preparation/Edit/5

        [HttpPost]
        [ValidateInput(false)] 
        public ActionResult Edit(Preparation_Article preparation_article)
        {
            if (ModelState.IsValid)
            {
                db.Preparation_Article.Attach(preparation_article);
                db.ObjectStateManager.ChangeObjectState(preparation_article, EntityState.Modified);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(preparation_article);
        }

        //
        // GET: /Preparation/Delete/5
 
        public ActionResult Delete(int id)
        {
            Preparation_Article preparation_article = db.Preparation_Article.Single(p => p.id == id);
            return View(preparation_article);
        }

        //
        // POST: /Preparation/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {            
            Preparation_Article preparation_article = db.Preparation_Article.Single(p => p.id == id);
            db.Preparation_Article.DeleteObject(preparation_article);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}