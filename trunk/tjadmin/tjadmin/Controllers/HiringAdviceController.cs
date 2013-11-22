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
    public class HiringAdviceController : Controller
    {
        private TeachingJobEntities db = new TeachingJobEntities();

        //
        // GET: /HiringAdvice/

        public ViewResult Index()
        {
            var tbl_hiringadvice = db.tbl_HiringAdvice.Include("tbl_HiringAdvice_Category");
            return View(tbl_hiringadvice.ToList().OrderByDescending(t=>t.uploadedDate));
        }

        //
        // GET: /HiringAdvice/Details/5

        public ViewResult Details(int id)
        {
            tbl_HiringAdvice tbl_hiringadvice = db.tbl_HiringAdvice.Single(t => t.id == id);
            return View(tbl_hiringadvice);
        }

        //
        // GET: /HiringAdvice/Create

        public ActionResult Create()
        {
            ViewBag.cate_id = new SelectList(db.tbl_HiringAdvice_Category, "cate_id", "cate_name");
            return View();
        } 

        //
        // POST: /HiringAdvice/Create

        [HttpPost]
        public ActionResult Create(tbl_HiringAdvice tbl_hiringadvice)
        {
            if (ModelState.IsValid)
            {
                db.tbl_HiringAdvice.AddObject(tbl_hiringadvice);
                db.SaveChanges();
                return RedirectToAction("Index");  
            }

            ViewBag.cate_id = new SelectList(db.tbl_HiringAdvice_Category, "cate_id", "cate_name", tbl_hiringadvice.cate_id);
            return View(tbl_hiringadvice);
        }
        
        //
        // GET: /HiringAdvice/Edit/5
        [ValidateInput(false)]
        public ActionResult Edit(int id)
        {
            tbl_HiringAdvice tbl_hiringadvice = db.tbl_HiringAdvice.Single(t => t.id == id);
            ViewBag.cate_id = new SelectList(db.tbl_HiringAdvice_Category, "cate_id", "cate_name", tbl_hiringadvice.cate_id);
            return View(tbl_hiringadvice);
        }

        //
        // POST: /HiringAdvice/Edit/5
        [ValidateInput(false)]
        [HttpPost]
        public ActionResult Edit(tbl_HiringAdvice tbl_hiringadvice)
        {
            if (ModelState.IsValid)
            {
                db.tbl_HiringAdvice.Attach(tbl_hiringadvice);
                db.ObjectStateManager.ChangeObjectState(tbl_hiringadvice, EntityState.Modified);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.cate_id = new SelectList(db.tbl_HiringAdvice_Category, "cate_id", "cate_name", tbl_hiringadvice.cate_id);
            return View(tbl_hiringadvice);
        }

        //
        // GET: /HiringAdvice/Delete/5
 
        public ActionResult Delete(int id)
        {
            tbl_HiringAdvice tbl_hiringadvice = db.tbl_HiringAdvice.Single(t => t.id == id);
            return View(tbl_hiringadvice);
        }

        //
        // POST: /HiringAdvice/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {            
            tbl_HiringAdvice tbl_hiringadvice = db.tbl_HiringAdvice.Single(t => t.id == id);
            db.tbl_HiringAdvice.DeleteObject(tbl_hiringadvice);
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