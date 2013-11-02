using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BusinessLogic.Facade.Object;

namespace BusinessLogic.Facade.Employer
{
    public static class TrainingCourseLogic
    {
        public static void InsertNewCourse(string _guid, string _certificate, string _length, string _timetable, string _cost, string _entry, string _contact, string _content, string _benefit)
        {
            try
            {
                TeachinVietnamDataContext dbContext = new TeachinVietnamDataContext();
                Guid guid = new Guid(_guid);
                //dbContext.proc_InsertTrainingCourse(guid, _certificate, _length, _timetable, _cost, _entry, _contact, _content, _benefit,true);
                dbContext.SubmitChanges();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static List<TrainingCourse> GetCoursesByEmployer(string _guid)
        {
            TeachinVietnamDataContext dbContext = new TeachinVietnamDataContext();
            var courseList = from tc in dbContext.tbl_TrainingCourses
                             where tc.tc_empId == new Guid(_guid)
                             select tc;
            List<TrainingCourse> mylist = new List<TrainingCourse>();

            foreach (var c in courseList)
            {
                TrainingCourse tc = new TrainingCourse();
                tc.Id = c.tc_id.ToString();
                tc.Guid = c.tc_empId.ToString();
                tc.Name = c.tc_name;
                tc.Certificate = (int)c.tc_certificate;
                tc.Category = (int)c.tc_category;
                tc.Location = (int)c.tc_location;
                tc.Length = c.tc_length;
                tc.Timetable = c.tc_timetable;
                tc.Cost = c.tc_cost;
                tc.Entry = c.tc_entryRequirement;
                tc.Contact = c.tc_contact;
                tc.Coursecontent = c.tc_courseContent;
                tc.Benefit = c.tc_teacherBenefit;
                tc.ViewCount = (int)c.tc_viewCount;

                mylist.Add(tc);
            }
            return mylist;
        }
        public static List<TrainingCourse> GetCoursesByLocation(string _location)
        {
            TeachinVietnamDataContext dbContext = new TeachinVietnamDataContext();
            var courseList = dbContext.proc_GetCoursesByLocation(_location);
            
            List<TrainingCourse> mylist = new List<TrainingCourse>();
            foreach (var c in courseList)
            {
                TrainingCourse tc = new TrainingCourse();
                //tc.Id = c.tc_id.ToString();
                tc.Guid = c.tc_empId.ToString();
                //tc.Name = c.tc_name;
                //tc.Certificate = (int)c.tc_certificate;
                //tc.Category = (int)c.tc_category;
                //tc.Location = (int)c.tc_location;
                tc.Length = c.tc_length;
                tc.Timetable = c.tc_timetable;
                tc.Cost = c.tc_cost;
                tc.Entry = c.tc_entryRequirement;
                tc.Contact = c.tc_contact;
                tc.Coursecontent = c.tc_courseContent;
                tc.Benefit = c.tc_teacherBenefit;
                tc.ViewCount = (int)c.tc_viewCount;

                mylist.Add(tc);
            }
            return mylist;
        }
        public static List<TrainingCourse> GetAllTrainingCourse()
        {
            try
            {
                List<TrainingCourse> tcList = new List<TrainingCourse>();
                TeachinVietnamDataContext dbContext = new TeachinVietnamDataContext();
                var allTrainingCourseList = (from tc in dbContext.tbl_TrainingCourses
                                            where tc.tc_active == true
                                            select tc).Take(100);
                foreach (var c in allTrainingCourseList)
                {
                    TrainingCourse tc = new TrainingCourse();
                    tc.Id = c.tc_id.ToString();
                    tc.Guid = c.tc_empId.ToString();
                    tc.Name = c.tc_name;
                    tc.Certificate = (int)c.tc_certificate;
                    tc.Category = (int)c.tc_category;
                    tc.Location = (int)c.tc_location;
                    tc.Length = c.tc_length;
                    tc.Timetable = c.tc_timetable;
                    tc.Cost = c.tc_cost;
                    tc.Entry = c.tc_entryRequirement;
                    tc.Contact = c.tc_contact;
                    tc.Coursecontent = c.tc_courseContent;
                    tc.Benefit = c.tc_teacherBenefit;
                    tc.ViewCount = (int)c.tc_viewCount;

                    tcList.Add(tc);
                }
                return tcList;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static List<TrainingCourse> SearchCourses(string _courseName,string _cateId,string _levelId,string _locationId)
        {
             try
             {
                 int? cId=0;
                //int? cId = Convert.ToInt16(_cateId);
                //int? leId = Convert.ToInt16(_levelId);
                //int? loId = Convert.ToInt16(_locationId);
                 short cIdd;
                 if (Int16.TryParse(_cateId, out cIdd))
                 {
                     cId = cIdd;
                 }

                List<TrainingCourse> tcList = new List<TrainingCourse>();
                TeachinVietnamDataContext dbContext = new TeachinVietnamDataContext();
                var allTrainingCourseList = from tc in dbContext.tbl_TrainingCourses
                                            where tc.tc_active == true && 
                                                  tc.tc_name.Contains(_courseName) && 
                                                  tc.tc_category==cId //&& 
                                                  //tc.tc_location==loId && 
                                                  //tc.tc_certificate==leId
                                            select tc;
                foreach (var c in allTrainingCourseList)
                {
                    TrainingCourse tc = new TrainingCourse();
                    tc.Id = c.tc_id.ToString();
                    tc.Guid = c.tc_empId.ToString();
                    tc.Name = c.tc_name;
                    tc.Certificate = (int)c.tc_certificate;
                    tc.Category = (int)c.tc_category;
                    tc.Location = (int)c.tc_location;
                    tc.Length = c.tc_length;
                    tc.Timetable = c.tc_timetable;
                    tc.Cost = c.tc_cost;
                    tc.Entry = c.tc_entryRequirement;
                    tc.Contact = c.tc_contact;
                    tc.Coursecontent = c.tc_courseContent;
                    tc.Benefit = c.tc_teacherBenefit;
                    tc.ViewCount = (int)c.tc_viewCount;

                    tcList.Add(tc);
                }
                return tcList;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
