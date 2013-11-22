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
    public class OrgTypeController : Controller
    {
        private TeachingJobEntities db = new TeachingJobEntities();

        //
        // GET: /OrgType/

        public ViewResult Index()
        {
            return View(db.tbl_OrganizationType.ToList());
        }

        //
        // GET: /OrgType/Details/5

        public ViewResult Details(int id)
        {
            tbl_OrganizationType tbl_organizationtype = db.tbl_OrganizationType.Single(t => t.id == id);
            return View(tbl_organizationtype);
        }

        //
        // GET: /OrgType/Create

        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /OrgType/Create

        [HttpPost]
        public ActionResult Create(tbl_OrganizationType tbl_organizationtype)
        {
            if (ModelState.IsValid)
            {
                db.tbl_OrganizationType.AddObject(tbl_organizationtype);
                db.SaveChanges();
                return RedirectToAction("Index");  
            }

            return View(tbl_organizationtype);
        }
        
        //
        // GET: /OrgType/Edit/5
 
        public ActionResult Edit(int id)
        {
            tbl_OrganizationType tbl_organizationtype = db.tbl_OrganizationType.Single(t => t.id == id);
            return View(tbl_organizationtype);
        }

        //
        // POST: /OrgType/Edit/5

        [HttpPost]
        public ActionResult Edit(tbl_OrganizationType tbl_organizationtype)
        {
            if (ModelState.IsValid)
            {
                db.tbl_OrganizationType.Attach(tbl_organizationtype);
                db.ObjectStateManager.ChangeObjectState(tbl_organizationtype, EntityState.Modified);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(tbl_organizationtype);
        }

        //
        // GET: /OrgType/Delete/5
 
        public ActionResult Delete(int id)
        {
            tbl_OrganizationType tbl_organizationtype = db.tbl_OrganizationType.Single(t => t.id == id);
            return View(tbl_organizationtype);
        }

        //
        // POST: /OrgType/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {            
            tbl_OrganizationType tbl_organizationtype = db.tbl_OrganizationType.Single(t => t.id == id);
            db.tbl_OrganizationType.DeleteObject(tbl_organizationtype);
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