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
    public class LocationController : Controller
    {
        private TeachingJobEntities db = new TeachingJobEntities();

        //
        // GET: /Location/

        public ViewResult Index()
        {
            return View(db.tbl_Job_Location.ToList());
        }

        //
        // GET: /Location/Details/5

        public ViewResult Details(int id)
        {
            tbl_Job_Location tbl_job_location = db.tbl_Job_Location.Single(t => t.lId == id);
            return View(tbl_job_location);
        }

        //
        // GET: /Location/Create

        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /Location/Create

        [HttpPost]
        public ActionResult Create(tbl_Job_Location tbl_job_location)
        {
            if (ModelState.IsValid)
            {
                db.tbl_Job_Location.AddObject(tbl_job_location);
                db.SaveChanges();
                return RedirectToAction("Index");  
            }

            return View(tbl_job_location);
        }
        
        //
        // GET: /Location/Edit/5
 
        public ActionResult Edit(int id)
        {
            tbl_Job_Location tbl_job_location = db.tbl_Job_Location.Single(t => t.lId == id);
            return View(tbl_job_location);
        }

        //
        // POST: /Location/Edit/5

        [HttpPost]
        public ActionResult Edit(tbl_Job_Location tbl_job_location)
        {
            if (ModelState.IsValid)
            {
                db.tbl_Job_Location.Attach(tbl_job_location);
                db.ObjectStateManager.ChangeObjectState(tbl_job_location, EntityState.Modified);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(tbl_job_location);
        }

        //
        // GET: /Location/Delete/5
 
        public ActionResult Delete(int id)
        {
            tbl_Job_Location tbl_job_location = db.tbl_Job_Location.Single(t => t.lId == id);
            return View(tbl_job_location);
        }

        //
        // POST: /Location/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {            
            tbl_Job_Location tbl_job_location = db.tbl_Job_Location.Single(t => t.lId == id);
            db.tbl_Job_Location.DeleteObject(tbl_job_location);
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