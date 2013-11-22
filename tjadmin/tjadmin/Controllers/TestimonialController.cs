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
    public class TestimonialController : Controller
    {
        private TeachingJobEntities db = new TeachingJobEntities();

        //
        // GET: /Testimonial/

        public ViewResult Index()
        {
            return View(db.Testimonial_Article.ToList().OrderByDescending(t=>t.id));
        }

        //
        // GET: /Testimonial/Details/5

        public ViewResult Details(int id)
        {
            Testimonial_Article testimonial_article = db.Testimonial_Article.Single(t => t.id == id);
            return View(testimonial_article);
        }

        //
        // GET: /Testimonial/Create

        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /Testimonial/Create

        [HttpPost]
        public ActionResult Create(Testimonial_Article testimonial_article)
        {
            if (ModelState.IsValid)
            {
                db.Testimonial_Article.AddObject(testimonial_article);
                db.SaveChanges();
                return RedirectToAction("Index");  
            }

            return View(testimonial_article);
        }
        
        //
        // GET: /Testimonial/Edit/5
        [ValidateInput(false)]
        public ActionResult Edit(int id)
        {
            Testimonial_Article testimonial_article = db.Testimonial_Article.Single(t => t.id == id);
            return View(testimonial_article);
        }

        //
        // POST: /Testimonial/Edit/5

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(Testimonial_Article testimonial_article)
        {
            if (ModelState.IsValid)
            {
                db.Testimonial_Article.Attach(testimonial_article);
                db.ObjectStateManager.ChangeObjectState(testimonial_article, EntityState.Modified);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(testimonial_article);
        }

        //
        // GET: /Testimonial/Delete/5
 
        public ActionResult Delete(int id)
        {
            Testimonial_Article testimonial_article = db.Testimonial_Article.Single(t => t.id == id);
            return View(testimonial_article);
        }

        //
        // POST: /Testimonial/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {            
            Testimonial_Article testimonial_article = db.Testimonial_Article.Single(t => t.id == id);
            db.Testimonial_Article.DeleteObject(testimonial_article);
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