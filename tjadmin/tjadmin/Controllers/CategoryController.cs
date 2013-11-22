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
    public class CategoryController : Controller
    {
        private TeachingJobEntities db = new TeachingJobEntities();

        //
        // GET: /Category/

        public ViewResult Index()
        {
            return View(db.tbl_Job_Sector.ToList());
        }

        //
        // GET: /Category/Details/5

        public ViewResult Details(int id)
        {
            tbl_Job_Sector tbl_job_sector = db.tbl_Job_Sector.Single(t => t.seId == id);
            return View(tbl_job_sector);
        }

        //
        // GET: /Category/Create

        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /Category/Create

        [HttpPost]
        public ActionResult Create(tbl_Job_Sector tbl_job_sector)
        {
            if (ModelState.IsValid)
            {
                db.tbl_Job_Sector.AddObject(tbl_job_sector);
                db.SaveChanges();
                return RedirectToAction("Index");  
            }

            return View(tbl_job_sector);
        }
        
        //
        // GET: /Category/Edit/5
 
        public ActionResult Edit(int id)
        {
            tbl_Job_Sector tbl_job_sector = db.tbl_Job_Sector.Single(t => t.seId == id);
            return View(tbl_job_sector);
        }

        //
        // POST: /Category/Edit/5

        [HttpPost]
        public ActionResult Edit(tbl_Job_Sector tbl_job_sector)
        {
            if (ModelState.IsValid)
            {
                db.tbl_Job_Sector.Attach(tbl_job_sector);
                db.ObjectStateManager.ChangeObjectState(tbl_job_sector, EntityState.Modified);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(tbl_job_sector);
        }

        //
        // GET: /Category/Delete/5
 
        public ActionResult Delete(int id)
        {
            tbl_Job_Sector tbl_job_sector = db.tbl_Job_Sector.Single(t => t.seId == id);
            return View(tbl_job_sector);
        }

        //
        // POST: /Category/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {            
            tbl_Job_Sector tbl_job_sector = db.tbl_Job_Sector.Single(t => t.seId == id);
            db.tbl_Job_Sector.DeleteObject(tbl_job_sector);
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