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
    public class EduLevelController : Controller
    {
        private TeachingJobEntities db = new TeachingJobEntities();

        //
        // GET: /EduLevel/

        public ViewResult Index()
        {
            return View(db.tbl_CV_EduLevel.ToList());
        }

        //
        // GET: /EduLevel/Details/5

        public ViewResult Details(int id)
        {
            tbl_CV_EduLevel tbl_cv_edulevel = db.tbl_CV_EduLevel.Single(t => t.el_id == id);
            return View(tbl_cv_edulevel);
        }

        //
        // GET: /EduLevel/Create

        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /EduLevel/Create

        [HttpPost]
        public ActionResult Create(tbl_CV_EduLevel tbl_cv_edulevel)
        {
            if (ModelState.IsValid)
            {
                db.tbl_CV_EduLevel.AddObject(tbl_cv_edulevel);
                db.SaveChanges();
                return RedirectToAction("Index");  
            }

            return View(tbl_cv_edulevel);
        }
        
        //
        // GET: /EduLevel/Edit/5
 
        public ActionResult Edit(int id)
        {
            tbl_CV_EduLevel tbl_cv_edulevel = db.tbl_CV_EduLevel.Single(t => t.el_id == id);
            return View(tbl_cv_edulevel);
        }

        //
        // POST: /EduLevel/Edit/5

        [HttpPost]
        public ActionResult Edit(tbl_CV_EduLevel tbl_cv_edulevel)
        {
            if (ModelState.IsValid)
            {
                db.tbl_CV_EduLevel.Attach(tbl_cv_edulevel);
                db.ObjectStateManager.ChangeObjectState(tbl_cv_edulevel, EntityState.Modified);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(tbl_cv_edulevel);
        }

        //
        // GET: /EduLevel/Delete/5
 
        public ActionResult Delete(int id)
        {
            tbl_CV_EduLevel tbl_cv_edulevel = db.tbl_CV_EduLevel.Single(t => t.el_id == id);
            return View(tbl_cv_edulevel);
        }

        //
        // POST: /EduLevel/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {            
            tbl_CV_EduLevel tbl_cv_edulevel = db.tbl_CV_EduLevel.Single(t => t.el_id == id);
            db.tbl_CV_EduLevel.DeleteObject(tbl_cv_edulevel);
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