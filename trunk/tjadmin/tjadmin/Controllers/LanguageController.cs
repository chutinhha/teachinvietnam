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
    public class LanguageController : Controller
    {
        private TeachingJobEntities db = new TeachingJobEntities();

        //
        // GET: /Language/

        public ViewResult Index()
        {
            return View(db.tbl_Lang.ToList());
        }

        //
        // GET: /Language/Details/5

        public ViewResult Details(int id)
        {
            tbl_Lang tbl_lang = db.tbl_Lang.Single(t => t.lang_Id == id);
            return View(tbl_lang);
        }

        //
        // GET: /Language/Create

        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /Language/Create

        [HttpPost]
        public ActionResult Create(tbl_Lang tbl_lang)
        {
            if (ModelState.IsValid)
            {
                db.tbl_Lang.AddObject(tbl_lang);
                db.SaveChanges();
                return RedirectToAction("Index");  
            }

            return View(tbl_lang);
        }
        
        //
        // GET: /Language/Edit/5
 
        public ActionResult Edit(int id)
        {
            tbl_Lang tbl_lang = db.tbl_Lang.Single(t => t.lang_Id == id);
            return View(tbl_lang);
        }

        //
        // POST: /Language/Edit/5

        [HttpPost]
        public ActionResult Edit(tbl_Lang tbl_lang)
        {
            if (ModelState.IsValid)
            {
                db.tbl_Lang.Attach(tbl_lang);
                db.ObjectStateManager.ChangeObjectState(tbl_lang, EntityState.Modified);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(tbl_lang);
        }

        //
        // GET: /Language/Delete/5
 
        public ActionResult Delete(int id)
        {
            tbl_Lang tbl_lang = db.tbl_Lang.Single(t => t.lang_Id == id);
            return View(tbl_lang);
        }

        //
        // POST: /Language/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {            
            tbl_Lang tbl_lang = db.tbl_Lang.Single(t => t.lang_Id == id);
            db.tbl_Lang.DeleteObject(tbl_lang);
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