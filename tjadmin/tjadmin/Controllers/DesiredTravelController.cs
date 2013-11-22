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
    public class DesiredTravelController : Controller
    {
        private TeachingJobEntities db = new TeachingJobEntities();

        //
        // GET: /DesiredTravel/

        public ViewResult Index()
        {
            return View(db.tbl_cv_DesiredTravel.ToList());
        }

        //
        // GET: /DesiredTravel/Details/5

        public ViewResult Details(int id)
        {
            tbl_cv_DesiredTravel tbl_cv_desiredtravel = db.tbl_cv_DesiredTravel.Single(t => t.dt_id == id);
            return View(tbl_cv_desiredtravel);
        }

        //
        // GET: /DesiredTravel/Create

        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /DesiredTravel/Create

        [HttpPost]
        public ActionResult Create(tbl_cv_DesiredTravel tbl_cv_desiredtravel)
        {
            if (ModelState.IsValid)
            {
                db.tbl_cv_DesiredTravel.AddObject(tbl_cv_desiredtravel);
                db.SaveChanges();
                return RedirectToAction("Index");  
            }

            return View(tbl_cv_desiredtravel);
        }
        
        //
        // GET: /DesiredTravel/Edit/5
 
        public ActionResult Edit(int id)
        {
            tbl_cv_DesiredTravel tbl_cv_desiredtravel = db.tbl_cv_DesiredTravel.Single(t => t.dt_id == id);
            return View(tbl_cv_desiredtravel);
        }

        //
        // POST: /DesiredTravel/Edit/5

        [HttpPost]
        public ActionResult Edit(tbl_cv_DesiredTravel tbl_cv_desiredtravel)
        {
            if (ModelState.IsValid)
            {
                db.tbl_cv_DesiredTravel.Attach(tbl_cv_desiredtravel);
                db.ObjectStateManager.ChangeObjectState(tbl_cv_desiredtravel, EntityState.Modified);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(tbl_cv_desiredtravel);
        }

        //
        // GET: /DesiredTravel/Delete/5
 
        public ActionResult Delete(int id)
        {
            tbl_cv_DesiredTravel tbl_cv_desiredtravel = db.tbl_cv_DesiredTravel.Single(t => t.dt_id == id);
            return View(tbl_cv_desiredtravel);
        }

        //
        // POST: /DesiredTravel/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {            
            tbl_cv_DesiredTravel tbl_cv_desiredtravel = db.tbl_cv_DesiredTravel.Single(t => t.dt_id == id);
            db.tbl_cv_DesiredTravel.DeleteObject(tbl_cv_desiredtravel);
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