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
    public class CommentTestimonialController : Controller
    {
        private TeachingJobEntities db = new TeachingJobEntities();

        //
        // GET: /CommentTestimonial/

        public ViewResult Index()
        {
            var tbl_comment = db.tbl_Comment.Include("Testimonial_Article");
            return View(tbl_comment.ToList().OrderBy(t=>t.createddate));
        }

        //
        // GET: /CommentTestimonial/Details/5

        public ViewResult Details(int id)
        {
            tbl_Comment tbl_comment = db.tbl_Comment.Single(t => t.id == id);
            return View(tbl_comment);
        }

        //
        // GET: /CommentTestimonial/Create

        public ActionResult Create()
        {
            ViewBag.tid = new SelectList(db.Testimonial_Article, "id", "name");
            return View();
        } 

        //
        // POST: /CommentTestimonial/Create

        [HttpPost]
        public ActionResult Create(tbl_Comment tbl_comment)
        {
            if (ModelState.IsValid)
            {
                db.tbl_Comment.AddObject(tbl_comment);
                db.SaveChanges();
                return RedirectToAction("Index");  
            }

            ViewBag.tid = new SelectList(db.Testimonial_Article, "id", "name", tbl_comment.tid);
            return View(tbl_comment);
        }
        
        //
        // GET: /CommentTestimonial/Edit/5
        [ValidateInput(false)]
        public ActionResult Edit(int id)
        {
            tbl_Comment tbl_comment = db.tbl_Comment.Single(t => t.id == id);
            ViewBag.tid = new SelectList(db.Testimonial_Article, "id", "name", tbl_comment.tid);
            return View(tbl_comment);
        }

        //
        // POST: /CommentTestimonial/Edit/5

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(tbl_Comment tbl_comment)
        {
            if (ModelState.IsValid)
            {
                db.tbl_Comment.Attach(tbl_comment);
                db.ObjectStateManager.ChangeObjectState(tbl_comment, EntityState.Modified);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.tid = new SelectList(db.Testimonial_Article, "id", "name", tbl_comment.tid);
            return View(tbl_comment);
        }

        //
        // GET: /CommentTestimonial/Delete/5
 
        public ActionResult Delete(int id)
        {
            tbl_Comment tbl_comment = db.tbl_Comment.Single(t => t.id == id);
            return View(tbl_comment);
        }

        //
        // POST: /CommentTestimonial/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {            
            tbl_Comment tbl_comment = db.tbl_Comment.Single(t => t.id == id);
            db.tbl_Comment.DeleteObject(tbl_comment);
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