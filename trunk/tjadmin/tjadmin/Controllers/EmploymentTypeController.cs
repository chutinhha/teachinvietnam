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
    public class EmploymentTypeController : Controller
    {
        private TeachingJobEntities db = new TeachingJobEntities();

        //
        // GET: /EmploymentType/

        public ViewResult Index()
        {
            return View(db.tbl_Job_EmploymentType.ToList());
        }

        //
        // GET: /EmploymentType/Details/5

        public ViewResult Details(int id)
        {
            tbl_Job_EmploymentType tbl_job_employmenttype = db.tbl_Job_EmploymentType.Single(t => t.etId == id);
            return View(tbl_job_employmenttype);
        }

        //
        // GET: /EmploymentType/Create

        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /EmploymentType/Create

        [HttpPost]
        public ActionResult Create(tbl_Job_EmploymentType tbl_job_employmenttype)
        {
            if (ModelState.IsValid)
            {
                db.tbl_Job_EmploymentType.AddObject(tbl_job_employmenttype);
                db.SaveChanges();
                return RedirectToAction("Index");  
            }

            return View(tbl_job_employmenttype);
        }
        
        //
        // GET: /EmploymentType/Edit/5
 
        public ActionResult Edit(int id)
        {
            tbl_Job_EmploymentType tbl_job_employmenttype = db.tbl_Job_EmploymentType.Single(t => t.etId == id);
            return View(tbl_job_employmenttype);
        }

        //
        // POST: /EmploymentType/Edit/5

        [HttpPost]
        public ActionResult Edit(tbl_Job_EmploymentType tbl_job_employmenttype)
        {
            if (ModelState.IsValid)
            {
                db.tbl_Job_EmploymentType.Attach(tbl_job_employmenttype);
                db.ObjectStateManager.ChangeObjectState(tbl_job_employmenttype, EntityState.Modified);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(tbl_job_employmenttype);
        }

        //
        // GET: /EmploymentType/Delete/5
 
        public ActionResult Delete(int id)
        {
            tbl_Job_EmploymentType tbl_job_employmenttype = db.tbl_Job_EmploymentType.Single(t => t.etId == id);
            return View(tbl_job_employmenttype);
        }

        //
        // POST: /EmploymentType/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {            
            tbl_Job_EmploymentType tbl_job_employmenttype = db.tbl_Job_EmploymentType.Single(t => t.etId == id);
            db.tbl_Job_EmploymentType.DeleteObject(tbl_job_employmenttype);
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