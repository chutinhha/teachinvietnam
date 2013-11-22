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
    public class YoEController : Controller
    {
        private TeachingJobEntities db = new TeachingJobEntities();

        //
        // GET: /YoE/

        public ViewResult Index()
        {
            return View(db.tbl_cv_YearsOfExp.ToList());
        }

        //
        // GET: /YoE/Details/5

        public ViewResult Details(int id)
        {
            tbl_cv_YearsOfExp tbl_cv_yearsofexp = db.tbl_cv_YearsOfExp.Single(t => t.yoe_id == id);
            return View(tbl_cv_yearsofexp);
        }

        //
        // GET: /YoE/Create

        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /YoE/Create

        [HttpPost]
        public ActionResult Create(tbl_cv_YearsOfExp tbl_cv_yearsofexp)
        {
            if (ModelState.IsValid)
            {
                db.tbl_cv_YearsOfExp.AddObject(tbl_cv_yearsofexp);
                db.SaveChanges();
                return RedirectToAction("Index");  
            }

            return View(tbl_cv_yearsofexp);
        }
        
        //
        // GET: /YoE/Edit/5
 
        public ActionResult Edit(int id)
        {
            tbl_cv_YearsOfExp tbl_cv_yearsofexp = db.tbl_cv_YearsOfExp.Single(t => t.yoe_id == id);
            return View(tbl_cv_yearsofexp);
        }

        //
        // POST: /YoE/Edit/5

        [HttpPost]
        public ActionResult Edit(tbl_cv_YearsOfExp tbl_cv_yearsofexp)
        {
            if (ModelState.IsValid)
            {
                db.tbl_cv_YearsOfExp.Attach(tbl_cv_yearsofexp);
                db.ObjectStateManager.ChangeObjectState(tbl_cv_yearsofexp, EntityState.Modified);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(tbl_cv_yearsofexp);
        }

        //
        // GET: /YoE/Delete/5
 
        public ActionResult Delete(int id)
        {
            tbl_cv_YearsOfExp tbl_cv_yearsofexp = db.tbl_cv_YearsOfExp.Single(t => t.yoe_id == id);
            return View(tbl_cv_yearsofexp);
        }

        //
        // POST: /YoE/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {            
            tbl_cv_YearsOfExp tbl_cv_yearsofexp = db.tbl_cv_YearsOfExp.Single(t => t.yoe_id == id);
            db.tbl_cv_YearsOfExp.DeleteObject(tbl_cv_yearsofexp);
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