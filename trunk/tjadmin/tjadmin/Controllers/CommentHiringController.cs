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
    public class CommentHiringController : Controller
    {
        private TeachingJobEntities db = new TeachingJobEntities();

        //
        // GET: /CommentHiring/

        public ViewResult Index()
        {
            var tbl_commenthiring = db.tbl_CommentHiring.Include("tbl_HiringAdvice");
            return View(tbl_commenthiring.ToList().OrderByDescending(t=>t.createddate));
        }

        //
        // GET: /CommentHiring/Details/5

        public ViewResult Details(int id)
        {
            tbl_CommentHiring tbl_commenthiring = db.tbl_CommentHiring.Single(t => t.id == id);
            return View(tbl_commenthiring);
        }

        //
        // GET: /CommentHiring/Create

        public ActionResult Create()
        {
            ViewBag.tid = new SelectList(db.tbl_HiringAdvice, "id", "title");
            return View();
        } 

        //
        // POST: /CommentHiring/Create

        [HttpPost]
        public ActionResult Create(tbl_CommentHiring tbl_commenthiring)
        {
            if (ModelState.IsValid)
            {
                db.tbl_CommentHiring.AddObject(tbl_commenthiring);
                db.SaveChanges();
                return RedirectToAction("Index");  
            }

            ViewBag.tid = new SelectList(db.tbl_HiringAdvice, "id", "title", tbl_commenthiring.tid);
            return View(tbl_commenthiring);
        }
        
        //
        // GET: /CommentHiring/Edit/5
        [ValidateInput(false)]
        public ActionResult Edit(int id)
        {
            tbl_CommentHiring tbl_commenthiring = db.tbl_CommentHiring.Single(t => t.id == id);
            ViewBag.tid = new SelectList(db.tbl_HiringAdvice, "id", "title", tbl_commenthiring.tid);
            return View(tbl_commenthiring);
        }

        //
        // POST: /CommentHiring/Edit/5

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(tbl_CommentHiring tbl_commenthiring)
        {
            if (ModelState.IsValid)
            {
                db.tbl_CommentHiring.Attach(tbl_commenthiring);
                db.ObjectStateManager.ChangeObjectState(tbl_commenthiring, EntityState.Modified);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.tid = new SelectList(db.tbl_HiringAdvice, "id", "title", tbl_commenthiring.tid);
            return View(tbl_commenthiring);
        }

        //
        // GET: /CommentHiring/Delete/5
 
        public ActionResult Delete(int id)
        {
            tbl_CommentHiring tbl_commenthiring = db.tbl_CommentHiring.Single(t => t.id == id);
            return View(tbl_commenthiring);
        }

        //
        // POST: /CommentHiring/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {            
            tbl_CommentHiring tbl_commenthiring = db.tbl_CommentHiring.Single(t => t.id == id);
            db.tbl_CommentHiring.DeleteObject(tbl_commenthiring);
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