using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BusinessLogic.Facade.Object;

namespace BusinessLogic.Facade
{
    public class CourseBusinessFacade
    {
        TeachinVietnamDataContext dbContext;
        public CourseBusinessFacade()
        {
            dbContext = new TeachinVietnamDataContext();
        }
        public List<TrainingLevel> GetTrainingLevel()
        {
            List<TrainingLevel> list = new List<TrainingLevel>();
            var trainingList = from tl in dbContext.tbl_TrainingLevels
                               orderby tl.tlId descending
                               select tl;
            foreach (var t in trainingList)
            {
                TrainingLevel tl = new TrainingLevel(t.tlId, t.tlName_en, t.tlName_vi);
                list.Add(tl);
            }
            return list;
        }
        public string GetAvailableCourse()
        {
            var avaiCourse = dbContext.tbl_TrainingCourses.Where(x => x.tc_active == true).Count();
            return avaiCourse.ToString();
        }
    }
}
