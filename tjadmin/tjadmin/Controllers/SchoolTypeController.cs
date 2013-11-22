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
    public class SchoolTypeController : Controller
    {
        private TeachingJobEntities db = new TeachingJobEntities();

        //
        // GET: /SchoolType/

        public ViewResult Index()
        {
            return View(db.tbl_Job_SchoolType.ToList());
        }

        //
        // GET: /SchoolType/Details/5

        public ViewResult Details(int id)
        {
            tbl_Job_SchoolType tbl_job_schooltype = db.tbl_Job_SchoolType.Single(t => t.stId == id);
            return View(tbl_job_schooltype);
        }

        //
        // GET: /SchoolType/Create

        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /SchoolType/Create

        [HttpPost]
        public ActionResult Create(tbl_Job_SchoolType tbl_job_schooltype)
        {
            if (ModelState.IsValid)
            {
                db.tbl_Job_SchoolType.AddObject(tbl_job_schooltype);
                db.SaveChanges();
                return RedirectToAction("Index");  
            }

            return View(tbl_job_schooltype);
        }
        
        //
        // GET: /SchoolType/Edit/5
 
        public ActionResult Edit(int id)
        {
            tbl_Job_SchoolType tbl_job_schooltype = db.tbl_Job_SchoolType.Single(t => t.stId == id);
            return View(tbl_job_schooltype);
        }

        //
        // POST: /SchoolType/Edit/5

        [HttpPost]
        public ActionResult Edit(tbl_Job_SchoolType tbl_job_schooltype)
        {
            if (ModelState.IsValid)
            {
                db.tbl_Job_SchoolType.Attach(tbl_job_schooltype);
                db.ObjectStateManager.ChangeObjectState(tbl_job_schooltype, EntityState.Modified);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(tbl_job_schooltype);
        }

        //
        // GET: /SchoolType/Delete/5
 
        public ActionResult Delete(int id)
        {
            tbl_Job_SchoolType tbl_job_schooltype = db.tbl_Job_SchoolType.Single(t => t.stId == id);
            return View(tbl_job_schooltype);
        }

        //
        // POST: /SchoolType/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {            
            tbl_Job_SchoolType tbl_job_schooltype = db.tbl_Job_SchoolType.Single(t => t.stId == id);
            db.tbl_Job_SchoolType.DeleteObject(tbl_job_schooltype);
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