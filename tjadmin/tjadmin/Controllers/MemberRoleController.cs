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
    public class MemberRoleController : Controller
    {
        private TeachingJobEntities db = new TeachingJobEntities();

        //
        // GET: /MemberRole/

        public ViewResult Index()
        {
            return View(db.view_Membership.ToList());
        }

        //
        // GET: /MemberRole/Details/5

        public ViewResult Details(string id)
        {
            view_Membership view_membership = db.view_Membership.Single(v => v.UserName == id);
            return View(view_membership);
        }

        //
        // GET: /MemberRole/Create

        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /MemberRole/Create

        [HttpPost]
        public ActionResult Create(view_Membership view_membership)
        {
            if (ModelState.IsValid)
            {
                db.view_Membership.AddObject(view_membership);
                db.SaveChanges();
                return RedirectToAction("Index");  
            }

            return View(view_membership);
        }
        
        //
        // GET: /MemberRole/Edit/5
 
        public ActionResult Edit(string id)
        {
            view_Membership view_membership = db.view_Membership.Single(v => v.UserName == id);
            return View(view_membership);
        }

        //
        // POST: /MemberRole/Edit/5

        [HttpPost]
        public ActionResult Edit(view_Membership view_membership)
        {
            if (ModelState.IsValid)
            {
                db.view_Membership.Attach(view_membership);
                db.ObjectStateManager.ChangeObjectState(view_membership, EntityState.Modified);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(view_membership);
        }

        //
        // GET: /MemberRole/Delete/5
 
        public ActionResult Delete(string id)
        {
            view_Membership view_membership = db.view_Membership.Single(v => v.UserName == id);
            return View(view_membership);
        }

        //
        // POST: /MemberRole/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(string id)
        {            
            view_Membership view_membership = db.view_Membership.Single(v => v.UserName == id);
            db.view_Membership.DeleteObject(view_membership);
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