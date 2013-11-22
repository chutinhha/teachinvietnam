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
    public class HiringAdviceCategoryController : Controller
    {
        private TeachingJobEntities db = new TeachingJobEntities();

        //
        // GET: /HiringAdviceCategory/

        public ViewResult Index()
        {
            return View(db.tbl_HiringAdvice_Category.ToList());
        }

        //
        // GET: /HiringAdviceCategory/Details/5

        public ViewResult Details(int id)
        {
            tbl_HiringAdvice_Category tbl_hiringadvice_category = db.tbl_HiringAdvice_Category.Single(t => t.cate_id == id);
            return View(tbl_hiringadvice_category);
        }

        //
        // GET: /HiringAdviceCategory/Create

        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /HiringAdviceCategory/Create

        [HttpPost]
        public ActionResult Create(tbl_HiringAdvice_Category tbl_hiringadvice_category)
        {
            if (ModelState.IsValid)
            {
                db.tbl_HiringAdvice_Category.AddObject(tbl_hiringadvice_category);
                db.SaveChanges();
                return RedirectToAction("Index");  
            }

            return View(tbl_hiringadvice_category);
        }
        
        //
        // GET: /HiringAdviceCategory/Edit/5
        [ValidateInput(false)]
        public ActionResult Edit(int id)
        {
            tbl_HiringAdvice_Category tbl_hiringadvice_category = db.tbl_HiringAdvice_Category.Single(t => t.cate_id == id);
            return View(tbl_hiringadvice_category);
        }

        //
        // POST: /HiringAdviceCategory/Edit/5

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(tbl_HiringAdvice_Category tbl_hiringadvice_category)
        {
            if (ModelState.IsValid)
            {
                db.tbl_HiringAdvice_Category.Attach(tbl_hiringadvice_category);
                db.ObjectStateManager.ChangeObjectState(tbl_hiringadvice_category, EntityState.Modified);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(tbl_hiringadvice_category);
        }

        //
        // GET: /HiringAdviceCategory/Delete/5
 
        public ActionResult Delete(int id)
        {
            tbl_HiringAdvice_Category tbl_hiringadvice_category = db.tbl_HiringAdvice_Category.Single(t => t.cate_id == id);
            return View(tbl_hiringadvice_category);
        }

        //
        // POST: /HiringAdviceCategory/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {            
            tbl_HiringAdvice_Category tbl_hiringadvice_category = db.tbl_HiringAdvice_Category.Single(t => t.cate_id == id);
            db.tbl_HiringAdvice_Category.DeleteObject(tbl_hiringadvice_category);
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