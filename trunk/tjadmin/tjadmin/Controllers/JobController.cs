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
    public class JobController : Controller
    {
        private TeachingJobEntities db = new TeachingJobEntities();

        //
        // GET: /Job/

        public ViewResult Index()
        {
            DateTime now =DateTime.Now;
            var tbl_teachingjob = db.tbl_TeachingJob.Include("aspnet_Users");
            return View(tbl_teachingjob.ToList().Where(t=>t.jClosingDate>=now).OrderByDescending(t=>t.jUploadDate));
        }

        //
        // GET: /Job/Details/5

        public ViewResult Details(int id)
        {
            tbl_TeachingJob tbl_teachingjob = db.tbl_TeachingJob.Single(t => t.jId == id);
            return View(tbl_teachingjob);
        }

        //
        // GET: /Job/Create

        public ActionResult Create()
        {
            ViewBag.jEmployer = new SelectList(db.aspnet_Users, "UserId", "UserName");
            return View();
        } 

        //
        // POST: /Job/Create

        [HttpPost]
        public ActionResult Create(tbl_TeachingJob tbl_teachingjob)
        {
            if (ModelState.IsValid)
            {
                db.tbl_TeachingJob.AddObject(tbl_teachingjob);
                db.SaveChanges();
                return RedirectToAction("Index");  
            }

            ViewBag.jEmployer = new SelectList(db.aspnet_Users, "UserId", "UserName", tbl_teachingjob.jEmployer);
            return View(tbl_teachingjob);
        }
        
        //
        // GET: /Job/Edit/5
 
        public ActionResult Edit(int id)
        {
            tbl_TeachingJob tbl_teachingjob = db.tbl_TeachingJob.Single(t => t.jId == id);
            ViewBag.jEmployer = new SelectList(db.aspnet_Users, "UserId", "UserName", tbl_teachingjob.jEmployer);
            return View(tbl_teachingjob);
        }

        //
        // POST: /Job/Edit/5

        [HttpPost]
        public ActionResult Edit(tbl_TeachingJob tbl_teachingjob)
        {
            if (ModelState.IsValid)
            {
                db.tbl_TeachingJob.Attach(tbl_teachingjob);
                db.ObjectStateManager.ChangeObjectState(tbl_teachingjob, EntityState.Modified);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.jEmployer = new SelectList(db.aspnet_Users, "UserId", "UserName", tbl_teachingjob.jEmployer);
            return View(tbl_teachingjob);
        }

        //
        // GET: /Job/Delete/5
 
        public ActionResult Delete(int id)
        {
            tbl_TeachingJob tbl_teachingjob = db.tbl_TeachingJob.Single(t => t.jId == id);
            return View(tbl_teachingjob);
        }

        //
        // POST: /Job/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {            
            tbl_TeachingJob tbl_teachingjob = db.tbl_TeachingJob.Single(t => t.jId == id);
            db.tbl_TeachingJob.DeleteObject(tbl_teachingjob);
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