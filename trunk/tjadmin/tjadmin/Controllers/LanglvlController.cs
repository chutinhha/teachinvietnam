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
    public class LanglvlController : Controller
    {
        private TeachingJobEntities db = new TeachingJobEntities();

        //
        // GET: /Langlvl/

        public ViewResult Index()
        {
            return View(db.tbl_Langlvl.ToList());
        }

        //
        // GET: /Langlvl/Details/5

        public ViewResult Details(int id)
        {
            tbl_Langlvl tbl_langlvl = db.tbl_Langlvl.Single(t => t.langlvl_Id == id);
            return View(tbl_langlvl);
        }

        //
        // GET: /Langlvl/Create

        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /Langlvl/Create

        [HttpPost]
        public ActionResult Create(tbl_Langlvl tbl_langlvl)
        {
            if (ModelState.IsValid)
            {
                db.tbl_Langlvl.AddObject(tbl_langlvl);
                db.SaveChanges();
                return RedirectToAction("Index");  
            }

            return View(tbl_langlvl);
        }
        
        //
        // GET: /Langlvl/Edit/5
 
        public ActionResult Edit(int id)
        {
            tbl_Langlvl tbl_langlvl = db.tbl_Langlvl.Single(t => t.langlvl_Id == id);
            return View(tbl_langlvl);
        }

        //
        // POST: /Langlvl/Edit/5

        [HttpPost]
        public ActionResult Edit(tbl_Langlvl tbl_langlvl)
        {
            if (ModelState.IsValid)
            {
                db.tbl_Langlvl.Attach(tbl_langlvl);
                db.ObjectStateManager.ChangeObjectState(tbl_langlvl, EntityState.Modified);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(tbl_langlvl);
        }

        //
        // GET: /Langlvl/Delete/5
 
        public ActionResult Delete(int id)
        {
            tbl_Langlvl tbl_langlvl = db.tbl_Langlvl.Single(t => t.langlvl_Id == id);
            return View(tbl_langlvl);
        }

        //
        // POST: /Langlvl/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {            
            tbl_Langlvl tbl_langlvl = db.tbl_Langlvl.Single(t => t.langlvl_Id == id);
            db.tbl_Langlvl.DeleteObject(tbl_langlvl);
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