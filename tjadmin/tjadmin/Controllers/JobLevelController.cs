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
    public class JobLevelController : Controller
    {
        private TeachingJobEntities db = new TeachingJobEntities();

        //
        // GET: /JobLevel/

        public ViewResult Index()
        {
            return View(db.tbl_Job_JobLevel.ToList());
        }

        //
        // GET: /JobLevel/Details/5

        public ViewResult Details(int id)
        {
            tbl_Job_JobLevel tbl_job_joblevel = db.tbl_Job_JobLevel.Single(t => t.jrId == id);
            return View(tbl_job_joblevel);
        }

        //
        // GET: /JobLevel/Create

        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /JobLevel/Create

        [HttpPost]
        public ActionResult Create(tbl_Job_JobLevel tbl_job_joblevel)
        {
            if (ModelState.IsValid)
            {
                db.tbl_Job_JobLevel.AddObject(tbl_job_joblevel);
                db.SaveChanges();
                return RedirectToAction("Index");  
            }

            return View(tbl_job_joblevel);
        }
        
        //
        // GET: /JobLevel/Edit/5
 
        public ActionResult Edit(int id)
        {
            tbl_Job_JobLevel tbl_job_joblevel = db.tbl_Job_JobLevel.Single(t => t.jrId == id);
            return View(tbl_job_joblevel);
        }

        //
        // POST: /JobLevel/Edit/5

        [HttpPost]
        public ActionResult Edit(tbl_Job_JobLevel tbl_job_joblevel)
        {
            if (ModelState.IsValid)
            {
                db.tbl_Job_JobLevel.Attach(tbl_job_joblevel);
                db.ObjectStateManager.ChangeObjectState(tbl_job_joblevel, EntityState.Modified);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(tbl_job_joblevel);
        }

        //
        // GET: /JobLevel/Delete/5
 
        public ActionResult Delete(int id)
        {
            tbl_Job_JobLevel tbl_job_joblevel = db.tbl_Job_JobLevel.Single(t => t.jrId == id);
            return View(tbl_job_joblevel);
        }

        //
        // POST: /JobLevel/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {            
            tbl_Job_JobLevel tbl_job_joblevel = db.tbl_Job_JobLevel.Single(t => t.jrId == id);
            db.tbl_Job_JobLevel.DeleteObject(tbl_job_joblevel);
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