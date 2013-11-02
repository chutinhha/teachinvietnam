using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DataAccess;
using System.Data;
using BusinessLogic.CV;
using BusinessLogic.Language;
using BusinessLogic.Article;

namespace BusinessLogic
{
    public class BusinessFacade
    {
        DataFacade facade;
        public BusinessFacade(string myConn)
        {
            facade = new DataFacade(myConn);
        }

        public string SQLExecute(string Query)
        {
            return facade.SQLExecute(Query);
        }

        public List<FeaturedJob> GetFeaturedJob()
        {
            List<FeaturedJob> jList = new List<FeaturedJob>();
            DataTable tbl = facade.GetFeaturedJob();
            foreach (DataRow r in tbl.Rows)
            {
                FeaturedJob fj = new FeaturedJob(Convert.ToInt32(r[0].ToString()), r[1].ToString(), r[2].ToString(), r[3].ToString(), r[4].ToString());
                jList.Add(fj);
            }
            return jList;
        }
        public List<Citizenship> GetAllCitizenship()
        {
            List<Citizenship> cList = new List<Citizenship>();
            DataTable tbl = facade.GetAllCitizenship();
            foreach (DataRow r in tbl.Rows)
            {
                Citizenship ct = new Citizenship(Convert.ToInt32(r[0].ToString()), r[1].ToString(),r[2].ToString());
                cList.Add(ct);
            }
            return cList;
        }

        public List<Sector> GetAllCategory()
        {
            List<Sector> sList = new List<Sector>();
            DataTable tbl = facade.GetAllCategory();
            foreach (DataRow r in tbl.Rows)
            {
                Sector s = new Sector(Convert.ToInt32(r[0].ToString()), r[1].ToString(), r[2].ToString(), Convert.ToInt32(r[3].ToString()));
                sList.Add(s);
            }
            return sList;
        }
        public List<FeaturedJob> GetNewestJobs()
        {
            List<FeaturedJob> jList = new List<FeaturedJob>();
            DataTable tbl = facade.GetNewestJobs();
            foreach (DataRow r in tbl.Rows)
            {
                FeaturedJob fj = new FeaturedJob(Convert.ToInt32(r[0].ToString()), r[1].ToString(), r[2].ToString(), r[3].ToString(), Convert.ToDateTime(r[4].ToString()));
                jList.Add(fj);
            }
            return jList;
        }
        public List<Location> GetAllLocation()
        {
            List<Location> lList = new List<Location>();
            DataTable tbl = facade.GetAllLocation();
            foreach (DataRow r in tbl.Rows)
            {
                Location l = new Location(Convert.ToInt32(r[0].ToString()), r[1].ToString(),r[2].ToString());
                if (l.LName == "Ha Noi" || l.LName == "Hà Nội")
                {
                    lList.Insert(0, l);
                    continue;
                }
                if (l.LName == "Ho Chi Minh" || l.LName == "Hồ Chí Minh")
                {
                    lList.Insert(1, l);
                    continue;
                }
                lList.Add(l);

            }
            return lList;
        }

        public List<EmploymentType> GetAllEmploymentType()
        {
            List<EmploymentType> lList = new List<EmploymentType>();
            DataTable tbl = facade.GetAllEmploymentType();
            foreach (DataRow r in tbl.Rows)
            {
                EmploymentType l = new EmploymentType(Convert.ToInt32(r[0].ToString()), r[1].ToString(),r[2].ToString());
                lList.Add(l);
            }
            return lList;
        }
        public List<JobRole> GetAllJobRole()
        {
            List<JobRole> lList = new List<JobRole>();
            DataTable tbl = facade.GetAllJobRole();
            foreach (DataRow r in tbl.Rows)
            {
                JobRole l = new JobRole(Convert.ToInt32(r[0].ToString()), r[1].ToString(),r[2].ToString());
                lList.Add(l);
            }
            return lList;
        }
        public int GetAvailableJobCount()
        {
            return facade.GetAvailableJobCount();
        }
        public int GetAvaiResumes()
        {
            return facade.GetAvaiResumes();
        }
        public DataSet GetAllJob()
        {
            return facade.GetAllJob();
            //List<DetailJob> djList = new List<DetailJob>();
            //DataTable tbl = facade.GetAllJobBySector(cmd);
            //foreach (DataRow r in tbl.Rows)
            //{
            //    DetailJob dj = new DetailJob(Convert.ToInt32(r[0].ToString()), r[1].ToString(), Convert.ToDateTime(r[2].ToString()), Convert.ToBoolean(r[3].ToString()), Convert.ToDecimal(r[4].ToString()), Convert.ToDecimal(r[5].ToString()), r[6].ToString(), r[7].ToString());
            //    djList.Add(dj);
            //}
            //return djList;
        }
        public DataSet GetAllJobBySector(string cmd)
        {
            return facade.GetAllJobBySector(cmd);
            //List<DetailJob> djList = new List<DetailJob>();
            //DataTable tbl = facade.GetAllJobBySector(cmd);
            //foreach (DataRow r in tbl.Rows)
            //{
            //    DetailJob dj = new DetailJob(Convert.ToInt32(r[0].ToString()), r[1].ToString(), Convert.ToDateTime(r[2].ToString()), Convert.ToBoolean(r[3].ToString()), Convert.ToDecimal(r[4].ToString()), Convert.ToDecimal(r[5].ToString()), r[6].ToString(), r[7].ToString());
            //    djList.Add(dj);
            //}
            //return djList;
        }

        public DataSet GetJobsBySectorId(int sectorId)
        {
            return facade.GetJobsBySectorId(sectorId);
        }
        public DataSet GetJobsBySectorIdAndExecutive(int sectorId, Boolean executivejob)
        {
            return facade.GetJobsBySectorIdAndExecutive(sectorId, executivejob);
        }
        //Insert a job
        public void PostAJob(string title, string description, string employer, string location, decimal salary, string sector, string joblevel, string employmentType, string educationRequirement, string citizenship, string otherBenefit, string minimunExp, string contact, DateTime closingDate, string schooltype, char gender = 'n', bool featureJob = false, int viewCount = 0)
        {
            facade.PostAJob(title, description, employer, location, salary, sector, joblevel, employmentType, educationRequirement, citizenship, otherBenefit, minimunExp, contact, closingDate, schooltype, gender, featureJob, viewCount);
        }

        //trang executive job
        public List<DetailJob> GetTop5NewExecutiveJob()
        {
            List<DetailJob> jobList = new List<DetailJob>();
            DataTable tbl = facade.GetTop5NewExecutiveJob();
            foreach (DataRow r in tbl.Rows)
            {
                DetailJob dj = new DetailJob(Convert.ToInt16(r[0].ToString()), r[1].ToString(), r[2].ToString(), r[3].ToString(), Convert.ToDateTime(r[4].ToString()), Convert.ToDateTime(r[5].ToString()));
                jobList.Add(dj);
            }
            return jobList;
        }
        public List<FeaturedJob> GetExecutiveFeaturedJobs()
        {
            List<FeaturedJob> jobList = new List<FeaturedJob>();
            DataTable tbl = facade.GetExecutiveFeaturedJobs();
            foreach (DataRow r in tbl.Rows)
            {
                FeaturedJob fj = new FeaturedJob(Convert.ToInt16(r[0].ToString()), r[1].ToString(), r[2].ToString(), r[3].ToString(), Convert.ToDateTime(r[4].ToString()));
                jobList.Add(fj);
            }
            return jobList;
        }

        public List<DetailJob> GetJobList(string orderBy, string orderUpdown)
        {
            List<DetailJob> jobList = new List<DetailJob>();
            DataTable tbl = facade.GetJobList(orderBy, orderUpdown);
            foreach (DataRow r in tbl.Rows)
            {
                DetailJob dj = new DetailJob(Convert.ToInt32(r[0].ToString()), r[1].ToString(), r[2].ToString(), r[3].ToString(), r[4].ToString(), Convert.ToDecimal(r[5].ToString()), r[6].ToString(), Convert.ToDateTime(r[7].ToString()), Convert.ToDateTime(r[8].ToString()), r[9].ToString(), r[10].ToString(), r[11].ToString(), Convert.ToInt32(r[12].ToString()));
                jobList.Add(dj);
            }
            return jobList;
        }
        public DetailJob GetDetailJobById(int id)
        {
            DataTable tbl = facade.GetDetailJobById(id);
            foreach (DataRow r in tbl.Rows)
            {
                string salaryType = r[19].ToString();
                if (salaryType == "" || salaryType == null)
                {
                    salaryType = "false";
                }
                DetailJob dj = new DetailJob(Convert.ToInt32(r[0].ToString()), r[1].ToString(), r[2].ToString(), r[3].ToString(), r[4].ToString(), r[5].ToString(), r[6].ToString(), r[7].ToString(), r[8].ToString(), r[9].ToString(), Convert.ToDateTime(r[10].ToString()), Convert.ToDateTime(r[11].ToString()), r[12].ToString(), r[13].ToString(), r[14].ToString(), r[15].ToString(), r[16].ToString(), r[17].ToString(), r[18].ToString(), Convert.ToBoolean(salaryType), Convert.ToDecimal(r[20].ToString()), Convert.ToDecimal(r[21].ToString()), r[22].ToString(), r[23].ToString(), r[24].ToString(), r[25].ToString(), r[26].ToString(), r[27].ToString(), r[28].ToString(), Convert.ToInt32(r[29].ToString()),r[30].ToString(),r[31].ToString());
                return dj;
            }
            return null;
        }
        public List<SchoolType> GetSchoolType()
        {
            List<SchoolType> stList = new List<SchoolType>();
            DataTable tbl = facade.GetSchoolType();
            foreach (DataRow r in tbl.Rows)
            {
                SchoolType st = new SchoolType(Convert.ToInt32(r[0].ToString()), r[1].ToString(),r[2].ToString());
                stList.Add(st);
            }
            return stList;
        }
        public List<DetailJob> GetSearchResult(string keyword)
        {
            List<DetailJob> jlist = new List<DetailJob>();
            DataTable tbl = facade.GetSearchResult(keyword);
            foreach (DataRow r in tbl.Rows)
            {
                DetailJob dj = new DetailJob(Convert.ToInt16(r[0].ToString()), r[1].ToString(), r[2].ToString(), r[3].ToString(), r[4].ToString(), Convert.ToDecimal(r[5].ToString()), r[6].ToString(), r[7].ToString(), r[8].ToString(), r[9].ToString(), r[10].ToString(), r[11].ToString(), r[12].ToString(), Convert.ToDateTime(r[13].ToString()), Convert.ToDateTime(r[14].ToString()), r[15].ToString(), r[16].ToString(), Convert.ToInt32(r[17].ToString()));
                jlist.Add(dj);
            }
            return jlist;
        }
        public List<DetailJob> GetSearchResult(string keyword, string st, string cate, string wp, string ci, string jl, string empt, string ot, Boolean ad)
        {
            List<DetailJob> jlist = new List<DetailJob>();
            DataRow[] tbl = facade.GetSearchResult(keyword, st, cate, wp, ci, jl, empt, ot, ad);
            foreach (DataRow r in tbl)
            {
                DetailJob dj = new DetailJob(Convert.ToInt16(r[0].ToString()), r[1].ToString(), r[2].ToString(), r[3].ToString(), r[4].ToString(), Convert.ToDecimal(r[5].ToString()), r[6].ToString(), r[7].ToString(), r[8].ToString(), r[9].ToString(), r[10].ToString(), r[11].ToString(), r[12].ToString(), Convert.ToDateTime(r[13].ToString()), Convert.ToDateTime(r[14].ToString()), r[15].ToString(), r[16].ToString(), Convert.ToInt32(r[17].ToString()));
                jlist.Add(dj);
            }
            return jlist;
        }
        public List<CvDetail> GetSearchResultCV(string keyword)
        {
            List<CvDetail> cvList = new List<CvDetail>();
            DataTable tbl = facade.GetSearchResultCV(keyword);
            foreach (DataRow r in tbl.Rows)
            {
                CvDetail cv = new CvDetail(r[0].ToString(), r[1].ToString(), r[2].ToString(), r[3].ToString(), r[4].ToString(), r[5].ToString(), r[6].ToString(), r[7].ToString(), r[8].ToString(), r[9].ToString(), r[10].ToString(), r[11].ToString(), r[12].ToString(), r[13].ToString(), r[14].ToString());
                cvList.Add(cv);
            }
            return cvList;
        }
        public List<OrganizationType> GetAllOrganizationType()
        {
            List<OrganizationType> oList = new List<OrganizationType>();
            DataTable tbl = facade.GetAllOrganizationType();
            foreach (DataRow r in tbl.Rows)
            {
                OrganizationType ot = new OrganizationType(Convert.ToInt32(r[0].ToString()), r[1].ToString(),r[2].ToString());
                oList.Add(ot);
            }
            return oList;
        }
        public DataSet GetJobByOrgType(string orgType)
        {
            return facade.GetJobByOrgType(orgType);
        }

        /*******************************************    CV Business  *****************************************/

        public List<DesiredTravel> GetDesiredTravel()
        {
            List<DesiredTravel> list = new List<DesiredTravel>();
            DataTable tbl = facade.GetDesiredTravel();
            foreach (DataRow r in tbl.Rows)
            {
                DesiredTravel dt = new DesiredTravel(Convert.ToInt32(r[0].ToString()), r[1].ToString(), r[2].ToString());
                list.Add(dt);
            }
            return list;
        }
        public List<EduLevelcs> GetEduLevel()
        {
            List<EduLevelcs> list = new List<EduLevelcs>();
            DataTable tbl = facade.GetEduLevel();
            foreach (DataRow r in tbl.Rows)
            {
                EduLevelcs dt = new EduLevelcs(Convert.ToInt32(r[0].ToString()), r[1].ToString(), r[2].ToString());
                list.Add(dt);
            }
            return list;
        }
        public List<SalaryExpectation> GetSalaryExpectation()
        {
            List<SalaryExpectation> list = new List<SalaryExpectation>();
            DataTable tbl = facade.GetSalaryExpectation();
            foreach (DataRow r in tbl.Rows)
            {
                SalaryExpectation dt = new SalaryExpectation(Convert.ToInt32(r[0].ToString()), r[1].ToString(), r[2].ToString());
                list.Add(dt);
            }
            return list;
        }
        public List<WillToRelocated> GetWilingToRelocate()
        {
            List<WillToRelocated> list = new List<WillToRelocated>();
            DataTable tbl = facade.GetWilingToRelocate();
            foreach (DataRow r in tbl.Rows)
            {
                WillToRelocated dt = new WillToRelocated(Convert.ToInt32(r[0].ToString()), r[1].ToString(), r[2].ToString());
                list.Add(dt);
            }
            return list;
        }
        public List<YearOfExp> GetYearsOfExp()
        {
            List<YearOfExp> list = new List<YearOfExp>();
            DataTable tbl = facade.GetYearsOfExp();
            foreach (DataRow r in tbl.Rows)
            {
                YearOfExp dt = new YearOfExp(Convert.ToInt32(r[0].ToString()), r[1].ToString(), r[2].ToString());
                list.Add(dt);
            }
            return list;
        }
        public void PostACV(string userId, string edulevel, string major, string yearOfExp, string achievement, string skill, string relatedExp, string spokenlang, string membership, string desiredTravel, string desiredCate, string DesiredJobLevel, string salaryExpect, string willtorelocate, string desiredlocation, string howsoon)
        {
            facade.PostACV(userId, edulevel, major, yearOfExp, achievement, skill, relatedExp, spokenlang, membership, desiredTravel, desiredCate, DesiredJobLevel, salaryExpect, willtorelocate, desiredlocation, howsoon);
        }
        public List<CvDetail> GetTop6CV()
        {
            List<CvDetail> cvList = new List<CvDetail>();
            DataTable tbl = facade.GetTop16CV();
            foreach (DataRow r in tbl.Rows)
            {
                if (r[4].ToString() == "")
                {
                    r[4] = System.DateTime.Now.ToString();
                }
                CvDetail cv = new CvDetail(r[0].ToString(), r[1].ToString(), r[2].ToString(), r[3].ToString(), Convert.ToDateTime(r[4].ToString()), r[5].ToString() + " " + r[6].ToString());
                cvList.Add(cv);
                if (cvList.Count == 6)
                {
                    return cvList;
                }
            }
            return cvList;
        }
        public List<CvDetail> GetTop16CV()
        {
            List<CvDetail> cvList = new List<CvDetail>();
            DataTable tbl = facade.GetTop16CV();
            foreach (DataRow r in tbl.Rows)
            {
                if (r[4].ToString() == "")
                {
                    r[4] = System.DateTime.Now.ToString();
                }
                CvDetail cv = new CvDetail(r[0].ToString(), r[1].ToString(), r[2].ToString(), r[3].ToString(), Convert.ToDateTime(r[4].ToString()), r[5].ToString() + " " + r[6].ToString());
                cvList.Add(cv);
            }
            return cvList;
        }

        public List<Sector> GetFullCategory(int cateid)
        {
            List<Sector> seList = new List<Sector>();
            DataTable tbl = facade.GetFullCategory(cateid);
            foreach (DataRow r in tbl.Rows)
            {
                Sector se = new Sector(Convert.ToInt16(r[0].ToString()), r[1].ToString(), r[2].ToString(), Convert.ToInt16(r[3].ToString()));
                seList.Add(se);
            }
            return seList;
        }
        //Advance Search
        public List<Sector> GetChildCategory(int cateid)
        {
            List<Sector> seList = new List<Sector>();
            DataTable tbl = facade.GetChildCategory(cateid);
            foreach (DataRow r in tbl.Rows)
            {
                Sector se = new Sector(Convert.ToInt16(r[0].ToString()), r[1].ToString(), r[2].ToString(), Convert.ToInt16(r[3].ToString()));
                seList.Add(se);
            }
            return seList;
        }


        public void PlusView(int id)
        {
            facade.PlusView(id);
        }
        public void SaveAJob(string employer, int jid, string fullname)
        {
            facade.SaveAJob(employer, jid, fullname);
        }
        public List<SaveJobs> GetSaveJobs(string employer)
        {
            List<SaveJobs> sjList = new List<SaveJobs>();
            DataTable tbl = facade.GetSaveJobs(employer);
            foreach (DataRow r in tbl.Rows)
            {
                SaveJobs sj = new SaveJobs(Convert.ToInt16(r[0].ToString()), r[1].ToString(), Convert.ToInt16(r[2].ToString()), Convert.ToDateTime(r[3].ToString()), r[4].ToString(), r[5].ToString(), r[6].ToString(), Convert.ToDateTime(r[7].ToString()));
                sjList.Add(sj);
            }
            return sjList;
        }
        public void DeleteSaveJobs(int id)
        {
            facade.DeleteSaveJobs(id);
        }
        public List<Lang> GetLang(string lang)
        {
            List<Lang> langList = new List<Lang>();
            DataTable tbl = facade.GetLang(lang);
            foreach (DataRow r in tbl.Rows)
            {
                Lang l = new Lang(Convert.ToInt16(r[0].ToString()), r[1].ToString(),r[2].ToString());
                langList.Add(l);
            }
            return langList;
        }
        public List<LangLvl> GetLangLvl_en()
        {
            List<LangLvl> langlvlList = new List<LangLvl>();
            DataTable tbl = facade.GetLangLvl_en();
            foreach (DataRow r in tbl.Rows)
            {
                LangLvl lvl = new LangLvl(Convert.ToInt16(r[0].ToString()), r[1].ToString(),r[2].ToString());
                langlvlList.Add(lvl);
            }
            return langlvlList;
        }

        //------------------------------------------------EMployer---------------------------------
        public List<DetailJob> GetPostedJobByUser(string userId)
        {
            List<DetailJob> jobListByUser = new List<DetailJob>();
            DataTable tbl = facade.GetPostedJobByUser(userId);
            foreach (DataRow r in tbl.Rows)
            {
                DetailJob dj = new DetailJob(Convert.ToInt32(r[0].ToString()), r[1].ToString(), Convert.ToDateTime(r[2].ToString()), Convert.ToDateTime(r[3].ToString()), Convert.ToInt32(r[4].ToString()));
                jobListByUser.Add(dj);
            }
            return jobListByUser;
        }
        public List<DetailJob> GetJobByEmployer(String userId)
        {
            List<DetailJob> jobListByUser = new List<DetailJob>();
            DataTable tbl = facade.GetJobByEmployer(userId);
            foreach (DataRow r in tbl.Rows)
            {
                DetailJob dj = new DetailJob(Convert.ToInt32(r[0].ToString()), r[1].ToString(), Convert.ToDateTime(r[2].ToString()), Convert.ToDateTime(r[3].ToString()), Convert.ToInt32(r[4].ToString()));
                jobListByUser.Add(dj);
            }
            return jobListByUser;
        }
        public String GetGuidByJobId(int jid)
        {
            return facade.GetGuidByJobId(jid);
        }
        public List<DetailJob> GetJobBySameCate(String cate1,String cate2,String cate3)
        {
            List<DetailJob> jobListByUser = new List<DetailJob>();
            DataTable tbl = facade.GetJobBySameCate(cate1,cate2,cate3);
            foreach (DataRow r in tbl.Rows)
            {
                DetailJob dj = new DetailJob(Convert.ToInt32(r[0].ToString()), r[1].ToString(), Convert.ToDateTime(r[2].ToString()), Convert.ToDateTime(r[3].ToString()), Convert.ToInt32(r[4].ToString()));
                jobListByUser.Add(dj);
            }
            return jobListByUser;
        }
        
        public void DeleteAPostedJob(int jid)
        {
            facade.DeleteAPostedJob(jid);
        }
        public List<SaveJobs> GetApplicants(int jid)
        {
            List<SaveJobs> sjList = new List<SaveJobs>();
            DataTable tbl = facade.GetApplicants(jid);
            foreach (DataRow r in tbl.Rows)
            {
                if (r[9] == null || r[9].ToString() == "")
                {
                    r[9] = false;
                }
                SaveJobs sj = new SaveJobs(Convert.ToInt32(r[0].ToString()), r[1].ToString(), Convert.ToInt32(r[2].ToString()), Convert.ToDateTime(r[3].ToString()), r[4].ToString(), r[5].ToString(), Convert.ToDateTime(r[6].ToString()), r[7].ToString(), r[8].ToString(), Convert.ToBoolean(r[9].ToString()), Convert.ToBoolean(r[10].ToString()));
                sjList.Add(sj);
            }
            return sjList;
        }
        public void DeleteAnApplicant(int sj_id)
        {
            facade.DeleteAnApplicant(sj_id);
        }
        public void MarkAsRead(int sj_id, Boolean readbefore)
        {
            facade.MarkAsRead(sj_id, readbefore);
        }
        public void MarkAsInterest(int sj_id, Boolean favorite)
        {
            facade.MarkAsInterest(sj_id, favorite);
        }

        public int NoOfUnread(string employerId)
        {
            DataRow r = facade.NoOfUnread(employerId);
            int NoOfUnread = Convert.ToInt32(r[0].ToString());
            return NoOfUnread;
        }
        public string GetFullnameFromUserId_Emp(string userId)
        {
            DataSet dataset = facade.GetFullnameFromUserId_Emp(userId);
            if (dataset != null)
            {
                string fullname = dataset.Tables["tbl"].Rows[0][2].ToString() + " " + dataset.Tables["tbl"].Rows[0][4].ToString();
                return fullname;
            }
            return null;
        }

        public string InsertNewJob(DetailJob dj)
        {
            string stt = facade.InsertNewJob(dj.Title, dj.Description, dj.Username, dj.Category, dj.Category2, dj.Category3, dj.Citizenship, dj.JobLevel, dj.EduRequirement, dj.EmploymentType, dj.Workplace, dj.Workplace2, dj.Workplace3, dj.SalaryType, dj.Salary, dj.SalaryTo, dj.SalaryCurrency, dj.SalaryPaymentType, dj.ClosingDate, dj.ExecutiveJob, dj.Contact, dj.EmailForEmployer);
            return stt;
        }
        public int AppliedNumber(int jid)
        {
            DataRow r = facade.AppliedNumber(jid);
            int AppliedNumber = Convert.ToInt32(r[0].ToString());
            return AppliedNumber;
        }
        public int NoOfInterested(string userId)
        {
            DataRow r = facade.NoOfInterested(userId);
            int NoOfInterested = Convert.ToInt32(r[0].ToString());
            return NoOfInterested;
        }
        
        public List<CvDetail> proc_SearchCV(string kw, string qt_cate, string qt_location, string qt_citizen, string qt_el, string qt_jl, string qt_yoe, bool ad)
        {
            List<CvDetail> cvList = new List<CvDetail>();
            DataRow[] rows = facade.proc_SearchCV(kw, qt_cate, qt_location, qt_citizen,qt_el,qt_jl,qt_yoe,ad);
            foreach (DataRow r in rows)
            {
                CvDetail cv = new CvDetail(r[0].ToString(), r[1].ToString(), r[2].ToString(), r[3].ToString(), r[4].ToString(), r[5].ToString(), r[6].ToString(), r[7].ToString(), r[8].ToString(), r[9].ToString(), r[10].ToString(), r[11].ToString(), r[12].ToString(), r[13].ToString(), r[14].ToString(), r[15].ToString(), r[16].ToString(), r[17].ToString(), r[18].ToString(), r[19].ToString(), r[20].ToString(),r[21].ToString());
                cvList.Add(cv);
            }
            return cvList;
        }

        public void Insert_PreparedArticle(String title, String logo, String body, Boolean setAsSlider, Boolean Active = false)
        {
            facade.Insert_PreparedArticle(title, logo, body, setAsSlider, Active);
        }
        public List<HiringAdviceCategory> view_HiringAdvice_Category()
        {
            List<HiringAdviceCategory> hacList = new List<HiringAdviceCategory>();
            DataTable tbl = facade.view_HiringAdvice_Category();
            foreach (DataRow r in tbl.Rows)
            {
                HiringAdviceCategory hac = new HiringAdviceCategory(r[0].ToString(), r[1].ToString());
                hacList.Add(hac);
            }
            return hacList;
        }
        public int GetFirstCateId()
        {
            return facade.GetFirstCateId();
        }
        public List<HiringAdvice> view_HiringAdvice(int cateid)
        {
            List<HiringAdvice> haList = new List<HiringAdvice>();
            DataTable tbl = facade.view_HiringAdvice(cateid);
            foreach (DataRow r in tbl.Rows)
            {
                HiringAdvice ha = new HiringAdvice(r[0].ToString(), r[1].ToString(), r[2].ToString(), r[3].ToString(), r[4].ToString(), r[5].ToString(), r[6].ToString(),r[7].ToString(),r[8].ToString(),r[9].ToString());
                haList.Add(ha);
            }
            return haList;
        }
        public HiringAdvice GetHiringAdviceById(int id)
        {
            DataRow r = facade.GetHiringAdviceById(id);
            if (r != null)
            {
                HiringAdvice ha = new HiringAdvice(r[0].ToString(), r[1].ToString(), r[2].ToString(), r[3].ToString(), r[4].ToString(), r[5].ToString(), r[6].ToString(), r[7].ToString(), r[8].ToString(),r[9].ToString());
                return ha;
            }
            else
            {
                return null;
            }
        }
        public List<Preparation> View_Article(String view)
        {
            List<Preparation> pList = new List<Preparation>();
            DataTable tbl = facade.View_Article(view);
            foreach (DataRow r in tbl.Rows)
            {
                Preparation p = new Preparation(r[0].ToString(), r[1].ToString(), r[2].ToString(), r[3].ToString(), r[4].ToString(), r[5].ToString());
                pList.Add(p);
            }
            return pList;
        }
        public void Insert_TestimonialArticle(String title, String citizenship, String logo, String body, Boolean setAsSlider, Boolean Active = false)
        {
            facade.Insert_TestimonialArticle(title, citizenship, logo, body, setAsSlider, Active);
        }
        public Preparation GetSlider()
        {
            DataRow r = facade.GetSlider();
            if (r != null)
            {
                Preparation p = new Preparation(r[0].ToString(), r[1].ToString(), r[2].ToString(), r[3].ToString(), r[4].ToString(), r[5].ToString(), r[6].ToString());
                return p;
            }
            else { return null; }
        }
        public List<Preparation> View_TestimonialArticle()
        {
            List<Preparation> pList = new List<Preparation>();
            DataTable tbl = facade.View_TestimonialArticle();
            foreach (DataRow r in tbl.Rows)
            {
                Preparation p = new Preparation(r[0].ToString(), r[1].ToString(), r[2].ToString(), r[3].ToString(), r[4].ToString(), r[5].ToString(), r[6].ToString());
                pList.Add(p);
            }
            return pList;
        }
        public Preparation GetTestimonialArticleById(int tid)
        {
            DataRow row = facade.GetTestimonialArticleById(tid);
            if (row != null)
            {
                Preparation p = new Preparation(row[0].ToString(), row[1].ToString(), row[2].ToString(), row[3].ToString(), row[4].ToString(), row[5].ToString(), row[6].ToString());
                return p;
            }
            else
            {
                return null;
            }
        }
        
        public void SaveCv(string saver, string cvuserid)
        {
            facade.SaveCv(saver, cvuserid);
        }
        public List<SavedCv> GetSavedCV(string saver)
        {
            List<SavedCv> cvList = new List<SavedCv>();
            DataTable tbl = facade.GetSavedCV(saver);
            foreach (DataRow r in tbl.Rows)
            {
                string favorite = r[3].ToString();
                if (favorite == "" || favorite == null)
                {
                    favorite = "false";
                }
                SavedCv cv = new SavedCv(r[0].ToString(), r[1].ToString(), r[2].ToString(), favorite, r[4].ToString(), r[5].ToString(), r[6].ToString());
                cvList.Add(cv);
            }
            return cvList;
        }
        public void DeleteSavedCV(int id)
        {
            facade.DeleteSavedCV(id);
        }
        public void SaveJob2(string candidate, int jId)
        {
            facade.SaveJob2(candidate, jId);
        }
        public List<SaveJobs> GetSaveJob2(String candidate)
        {
            List<SaveJobs> sjList = new List<SaveJobs>();
            DataTable tbl = facade.GetSaveJob2(candidate);
            foreach (DataRow r in tbl.Rows)
            {
                SaveJobs sj = new SaveJobs(r[0].ToString(), r[1].ToString(), r[2].ToString(), r[3].ToString(), r[4].ToString(), r[5].ToString());
                sjList.Add(sj);
            }
            return sjList;
        }
        public void DeleteSaveJob2(int id)
        {
            facade.DeleteSaveJob2(id);
        }

        public void PostComment(int tid, string name, string email, string content, Boolean active)
        {
            facade.PostComment(tid, name, email, content, active);
        }
        public List<Comment> ViewCommentByTid(int tid)
        {
            List<Comment> cList = new List<Comment>();
            DataTable tbl = facade.ViewCommentByTid(tid);
            foreach (DataRow r in tbl.Rows)
            {
                Comment c = new Comment(r[0].ToString(), r[1].ToString(), r[2].ToString(), r[3].ToString(), r[4].ToString(), r[5].ToString(), r[6].ToString());
                cList.Add(c);
            }
            if (cList != null)
            {
                return cList;
            }
            else
            {
                return null;
            }
        }
        public List<Comment> ViewCommentHiringById(int tid)
        {
            List<Comment> cList = new List<Comment>();
            DataTable tbl = facade.ViewCommentHiringById(tid);
            foreach (DataRow r in tbl.Rows)
            {
                Comment c = new Comment(r[0].ToString(), r[1].ToString(), r[2].ToString(), r[3].ToString(), r[4].ToString(), r[5].ToString(),r[6].ToString(),r[7].ToString(),r[8].ToString());
                cList.Add(c);
            }
            if (cList != null)
            {
                return cList;
            }
            else
            {
                return null;
            }
        }

        public void AddHiringAdvice(string title, int cateid, string writer, Boolean active, string detail)
        {
            facade.AddHiringAdvice(title, cateid, writer, active, detail);
        }

        public void PostCommentHiring(int tid, string name,  string content, Boolean active)
        {
            facade.PostCommentHiring(tid, name, content, active);
        }
        public void removeRow(int id,string idColumnName, string tbl)
        {
            facade.removeRow(id, idColumnName, tbl);
        }
        public void disableRow(string tbl, string colName,int id)
        {
            facade.disableRow(tbl, colName,id);
        }
        public int GetNumberOfCommentHiringById(int tid)
        {
            return facade.GetNumberOfCommentHiringById(tid);
        }
        public Comment GetRecentComment(int tid)
        {
            DataRow r = facade.GetRecentComment(tid);
            if (r != null)
            {
                Comment c = new Comment(r[0].ToString(), r[1].ToString(), r[2].ToString(), r[3].ToString(), r[4].ToString(), r[5].ToString(), r[6].ToString(), r[7].ToString());
                return c;
            }
            else
            {
                return null;
            }
        }
        public List<DetailJob> getJobAlert(string cate1, string cate2, string cate3, string lo1, string lo2, string lo3)
        {
            List<DetailJob> djList = new List<DetailJob>();
            DataTable tbl = facade.getJobAlert(cate1, cate2, cate3, lo1, lo2, lo3);
            foreach (DataRow r in tbl.Rows)
            {
                DetailJob dj = new DetailJob(r[0].ToString(), r[1].ToString(), r[2].ToString(), r[3].ToString());
                djList.Add(dj);
            }
            if (!djList.Equals(null))
            {
                return djList;
            }
            else
            {
                return null;
            }
            
        }
        public string GetLastestJobIdByGuid(string guid)
        {
            return facade.GetLastestJobIdByGuid(guid);
        }
    }
}
