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
    public class CitizenshipController : Controller
    {
        private TeachingJobEntities db = new TeachingJobEntities();

        //
        // GET: /Citizenship/

        public ViewResult Index()
        {
            return View(db.tbl_Job_Citizenship.ToList());
        }

        //
        // GET: /Citizenship/Details/5

        public ViewResult Details(int id)
        {
            tbl_Job_Citizenship tbl_job_citizenship = db.tbl_Job_Citizenship.Single(t => t.ctId == id);
            return View(tbl_job_citizenship);
        }

        //
        // GET: /Citizenship/Create

        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /Citizenship/Create

        [HttpPost]
        public ActionResult Create(tbl_Job_Citizenship tbl_job_citizenship)
        {
            if (ModelState.IsValid)
            {
                db.tbl_Job_Citizenship.AddObject(tbl_job_citizenship);
                db.SaveChanges();
                return RedirectToAction("Index");  
            }

            return View(tbl_job_citizenship);
        }
        
        //
        // GET: /Citizenship/Edit/5
 
        public ActionResult Edit(int id)
        {
            tbl_Job_Citizenship tbl_job_citizenship = db.tbl_Job_Citizenship.Single(t => t.ctId == id);
            return View(tbl_job_citizenship);
        }

        //
        // POST: /Citizenship/Edit/5

        [HttpPost]
        public ActionResult Edit(tbl_Job_Citizenship tbl_job_citizenship)
        {
            if (ModelState.IsValid)
            {
                db.tbl_Job_Citizenship.Attach(tbl_job_citizenship);
                db.ObjectStateManager.ChangeObjectState(tbl_job_citizenship, EntityState.Modified);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(tbl_job_citizenship);
        }

        //
        // GET: /Citizenship/Delete/5
 
        public ActionResult Delete(int id)
        {
            tbl_Job_Citizenship tbl_job_citizenship = db.tbl_Job_Citizenship.Single(t => t.ctId == id);
            return View(tbl_job_citizenship);
        }

        //
        // POST: /Citizenship/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {            
            tbl_Job_Citizenship tbl_job_citizenship = db.tbl_Job_Citizenship.Single(t => t.ctId == id);
            db.tbl_Job_Citizenship.DeleteObject(tbl_job_citizenship);
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