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
    public class WillToRelocateController : Controller
    {
        private TeachingJobEntities db = new TeachingJobEntities();

        //
        // GET: /WillToRelocate/

        public ViewResult Index()
        {
            return View(db.tbl_cv_wilingtorelocate.ToList());
        }

        //
        // GET: /WillToRelocate/Details/5

        public ViewResult Details(int id)
        {
            tbl_cv_wilingtorelocate tbl_cv_wilingtorelocate = db.tbl_cv_wilingtorelocate.Single(t => t.el_id == id);
            return View(tbl_cv_wilingtorelocate);
        }

        //
        // GET: /WillToRelocate/Create

        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /WillToRelocate/Create

        [HttpPost]
        public ActionResult Create(tbl_cv_wilingtorelocate tbl_cv_wilingtorelocate)
        {
            if (ModelState.IsValid)
            {
                db.tbl_cv_wilingtorelocate.AddObject(tbl_cv_wilingtorelocate);
                db.SaveChanges();
                return RedirectToAction("Index");  
            }

            return View(tbl_cv_wilingtorelocate);
        }
        
        //
        // GET: /WillToRelocate/Edit/5
 
        public ActionResult Edit(int id)
        {
            tbl_cv_wilingtorelocate tbl_cv_wilingtorelocate = db.tbl_cv_wilingtorelocate.Single(t => t.el_id == id);
            return View(tbl_cv_wilingtorelocate);
        }

        //
        // POST: /WillToRelocate/Edit/5

        [HttpPost]
        public ActionResult Edit(tbl_cv_wilingtorelocate tbl_cv_wilingtorelocate)
        {
            if (ModelState.IsValid)
            {
                db.tbl_cv_wilingtorelocate.Attach(tbl_cv_wilingtorelocate);
                db.ObjectStateManager.ChangeObjectState(tbl_cv_wilingtorelocate, EntityState.Modified);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(tbl_cv_wilingtorelocate);
        }

        //
        // GET: /WillToRelocate/Delete/5
 
        public ActionResult Delete(int id)
        {
            tbl_cv_wilingtorelocate tbl_cv_wilingtorelocate = db.tbl_cv_wilingtorelocate.Single(t => t.el_id == id);
            return View(tbl_cv_wilingtorelocate);
        }

        //
        // POST: /WillToRelocate/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {            
            tbl_cv_wilingtorelocate tbl_cv_wilingtorelocate = db.tbl_cv_wilingtorelocate.Single(t => t.el_id == id);
            db.tbl_cv_wilingtorelocate.DeleteObject(tbl_cv_wilingtorelocate);
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