using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;

namespace DataAccess
{
    public class DataFacade
    {
        private string connStr;

        private SqlConnection conn;
        private DataSet ds;

        public DataFacade(string myConn)
        {
            connStr = myConn;
            ds = new DataSet();
        }
        public SqlConnection GetConnection()
        {
            SqlConnection sqlConn = new SqlConnection(connStr);
            return sqlConn;
        }

        public  string SQLExecute(string sql)
        {
            try
            {
                conn = GetConnection();
                SqlDataAdapter adapter = new SqlDataAdapter();
                SqlCommand cmd = new SqlCommand(sql, conn);
                conn.Open();
                cmd.ExecuteNonQuery();
                return "_";
            }
            catch (Exception e)
            {
                return e.Message ;
            }
            finally
            {
                conn.Close();
            }
        }
        protected void SqlSelect(string sql, DataSet d, string tbl)
        {
            try
            {
                conn = GetConnection();
                SqlDataAdapter adapter = new SqlDataAdapter();
                SqlCommand cmd = new SqlCommand(sql, conn);
                adapter.SelectCommand = cmd;
                adapter.Fill(d, tbl);
                //conn.Close();
            }
            catch (Exception e)
            {
                throw e;
            }
            finally
            {
                conn.Close();
            }
        }
        //

        public DataTable GetFeaturedJob()
        {
            string sql = "select * from View_GetFeaturedJobs";
            SqlSelect(sql, ds, "tbl_FeaturedJob");
            return ds.Tables["tbl_FeaturedJob"];
        }
        public DataTable GetNewestJobs()
        {
            string sql = "select * from View_GetNewestJobs";
            SqlSelect(sql, ds, "tbl_NewestJobs");
            return ds.Tables["tbl_NewestJobs"];
        }
        public DataTable GetAllCategory()
        {
            string sql = "SELECT * FROM view_GetAllCategory";
            SqlSelect(sql, ds, "tbl_AllSector");
            return ds.Tables["tbl_AllSector"];
        }
        public DataTable GetAllLocation()
        {
            DataSet dataset = new DataSet();
            string sql = "SELECT * FROM view_GetAllLocation";
            SqlSelect(sql, dataset, "tbl_AllLocation");
            return dataset.Tables["tbl_AllLocation"];
        }
        //public DataTable GetAllEmployer()
        //{
        //    string sql = "SELECT * FROM tbl_Job_Employer WHERE emIsPremium=1";
        //    SqlSelect(sql, ds, "tbl_AllEmployer");
        //    return ds.Tables["tbl_AllEmployer"];
        //}
        public DataTable GetAllJobRole()
        {
            string sql = "SELECT * FROM view_GetAllJobLevel";
            SqlSelect(sql, ds, "tbl_AllJobRole");
            return ds.Tables["tbl_AllJobRole"];
        }
        public DataTable GetAllEmploymentType()
        {
            string sql = "SELECT * FROM view_GetAllEmpType";
            SqlSelect(sql, ds, "tbl_AllEmploymentType");
            return ds.Tables["tbl_AllEmploymentType"];
        }
        public int GetAvailableJobCount()
        {
            string sql = "SELECT * FROM view_GetAvaiJobCount";
            SqlSelect(sql, ds, "tbl_AvailableJobCount");
            return (int)ds.Tables["tbl_AvailableJobCount"].Rows[0][0];
        }
        //-----------------Job By Sector va Executive Job

        public DataSet GetAllJob()
        {
            string sql = null;
            sql = "SELECT b.jid,b.jtitle_en,b.jClosingDate,b.jSalaryType,b.jSalary_en,b.jSalaryTo_en,b.jSalaryCurrency,b.jSalaryPaymentType FROM ";
            sql += "(	";
            sql += "select DISTINCT TOP(16) tj.jid,tj.jtitle_en,tj.jClosingDate,tj.jSalaryType,tj.jSalary_en,tj.jSalaryTo_en,tj.jSalaryCurrency,tj.jSalaryPaymentType,tj.juploaddate ";
            sql += "	 from tbl_job_sector se INNER JOIN tbl_teachingjob tj ";
            sql += "	 on se.seName_en = tj.jSector_en OR se.seName_en=tj.jSector_en2 OR se.seName_en=tj.jSector_en3 ";
            sql += "	WHERE tj.jActive=1 AND jExecutiveJob=0 ";
            sql += ") b ";
            sql += " ORDER BY b.juploaddate DESC";
            SqlSelect(sql, ds, "tbl_AllJobByAllSector");
            return ds;
        }

        public DataSet GetAllJobBySector(string cmd)
        {
            string sql = null;
            if (cmd == "executive")
            {
                sql = "SELECT * FROM view_GetAllExecutiveJobs";
            }
            else
            {
                sql = "SELECT * FROM view_GetAllJobs";
            }
            SqlSelect(sql, ds, "tbl_AllJobByAllSector");
            return ds;
        }
        public DataSet GetJobsBySectorId(int sectorId)
        {
            DataSet dataset = new DataSet();
            string sql = "EXEC proc_GetJobsBySectorId " + sectorId;
            SqlSelect(sql, dataset, "tbl_AllJobBySector");
            return dataset;
        }

        public DataSet GetJobsBySectorIdAndExecutive(int sectorId, Boolean executivejob)
        {
            DataSet dataset = new DataSet();
            string sql = "EXEC proc_GetJobsBySectorIdAndExecutive " + sectorId + "," + executivejob;
            SqlSelect(sql, dataset, "tbl_AllJobBySector");
            return dataset;
        }
        //---------------------------END---------------
        public DataTable GetTop5NewExecutiveJob()
        {
            string sql = "select top(5) * from view_getallexecutivejob";
            SqlSelect(sql, ds, "tbl_GetAllJobByJobRole");
            return ds.Tables["tbl_GetAllJobByJobRole"];
        }
        public DataTable GetExecutiveFeaturedJobs()
        {
            string sql = "SELECT * FROM View_GetExecutiveFeaturedJobs";
            SqlSelect(sql, ds, "GetExecutiveFeaturedJobs");
            return ds.Tables["GetExecutiveFeaturedJobs"];
        }
        private string ExecuteProc(string proc)
        {
            string sql = "EXEC " + proc + " @jTitle_en,@jDescription_en,@jEmployer,@jLocation_en,@jSalary_en,@jSector_en,@jJobLevel_en,@jEmploymentType_en,@jCitizenship_en,@jEducationRequirement_en,@jOtherBenefits_en,@jMinimumExp_en,@jGender_en,@jContact,@jClosingDate,@jFeaturedJob,@jViewCount,@schooltype";
            return sql;
        }

        public void PostAJob(string title, string description, string employer, string location, decimal salary, string sector, string joblevel, string employmentType, string educationRequirement, string citizenship, string otherBenefit, string minimunExp, string contact, DateTime closingDate, string schooltype, char gender = 'n', bool featureJob = false, int viewCount = 0)
        {
            string sql = ExecuteProc("proc_InsertJob");
            conn = GetConnection();
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@jTitle_en", title);
            cmd.Parameters.AddWithValue("@jDescription_en", description);
            cmd.Parameters.AddWithValue("@jEmployer", employer);
            cmd.Parameters.AddWithValue("@jLocation_en", location);
            cmd.Parameters.AddWithValue("@jSalary_en", salary);
            cmd.Parameters.AddWithValue("@jSector_en", sector);
            cmd.Parameters.AddWithValue("@jJobLevel_en", joblevel);
            cmd.Parameters.AddWithValue("@jEmploymentType_en", employmentType);
            cmd.Parameters.AddWithValue("@jEducationRequirement_en", educationRequirement);
            cmd.Parameters.AddWithValue("@jCitizenship_en", citizenship);
            cmd.Parameters.AddWithValue("@jOtherBenefits_en", otherBenefit);
            cmd.Parameters.AddWithValue("@jMinimumExp_en", minimunExp);
            cmd.Parameters.AddWithValue("@jGender_en", gender);
            cmd.Parameters.AddWithValue("@jContact", contact);
            cmd.Parameters.AddWithValue("@jClosingDate", closingDate);
            cmd.Parameters.AddWithValue("@jFeaturedJob", featureJob);
            cmd.Parameters.AddWithValue("@jViewCount", viewCount);
            cmd.Parameters.AddWithValue("@schooltype", schooltype);

            try
            {
                conn.Open();
                int result = cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                conn.Close();
            }
        }
        //public DataSet GetJobList(string orderBy,string orderUpdown,string whereClause,string all = "where "+where+" is not null")
        //where clause != null thi cau truy van se co WHERE, else thi se ko co
        public DataTable GetJobList(string orderBy, string orderUpdown)
        {
            DataSet dataSet = new DataSet();
            //string sql = "SELECT j.jId,j.jTitle_en,t2.Username,t2.OrganizationName,t2.Logo,j.jSalary_en,j.jLocation_en,j.jUploadDate,j.jClosingDate,j.jSector_en,j.jcitizenship_en,j.jEmploymentType_en,j.jViewCount FROM tbl_TeachingJob j INNER JOIN (SELECT us.UserId,us.Username,dbo.fn_GetProfileElement('Logo',PropertyNames,PropertyValuesString) AS Logo ,dbo.fn_GetProfileElement('OrganizationName',PropertyNames,PropertyValuesString) AS OrganizationName FROM dbo.aspnet_Profile p INNER JOIN dbo.aspnet_Users us ON p.UserId=us.UserId) t2 ON t2.UserId=j.jEmployer WHERE j.jClosingDate>getdate() AND j.jActive=1 ORDER BY " + orderBy + " " + orderUpdown;
            string sql = "SELECT j.jId,j.jTitle_en,t2.Username,t2.OrganizationName,t2.Logo,j.jSalary_en,j.jLocation_en,j.jUploadDate,j.jClosingDate,j.jSector_en,j.jcitizenship_en,j.jEmploymentType_en,j.jViewCount FROM tbl_TeachingJob j INNER JOIN (SELECT us.UserId,us.Username,dbo.fn_GetProfileElement('Logo',PropertyNames,PropertyValuesString) AS Logo ,dbo.fn_GetProfileElement('OrganizationName',PropertyNames,PropertyValuesString) AS OrganizationName FROM dbo.aspnet_Profile p INNER JOIN dbo.aspnet_Users us ON p.UserId=us.UserId) t2 ON t2.UserId=j.jEmployer WHERE j.jActive=1 ORDER BY " + orderBy + " " + orderUpdown;
            SqlSelect(sql, dataSet, "tbl_GetJobList");
            return dataSet.Tables["tbl_GetJobList"];
        }
        public DataTable GetDetailJobById(int id)
        {
            DataSet dataSet = new DataSet();
            string sql = "EXEC proc_GetDetailJobById " + id;
            SqlSelect(sql, dataSet, "tbl_JobDetail");
            return dataSet.Tables["tbl_JobDetail"];
        }
        public DataTable GetAllCitizenship()
        {
            DataSet dataset = new DataSet();
            string sql = "SELECT * FROM View_GetAllCitizenships";
            SqlSelect(sql, dataset, "tbl_GetCitizen");
            return dataset.Tables["tbl_GetCitizen"];
        }
        public DataTable GetSchoolType()
        {
            DataSet dataset = new DataSet();
            string sql = "SELECT * FROM tbl_job_Schooltype";
            SqlSelect(sql, dataset, "tbl_job_Schooltype");
            return dataset.Tables["tbl_job_Schooltype"];
        }
        public DataTable GetSearchResult(string keyword)
        {
            DataSet dataset = new DataSet();
            string sql = "EXEC proc_SearchItem '" + keyword + "'";
            SqlSelect(sql, dataset, "tbl_SearchResults");
            return dataset.Tables["tbl_SearchResults"];
        }
        public DataTable GetSearchResultCV(String keyword)
        {
            DataSet dataset = new DataSet();

            string sql = "EXEC proc_SearchCV '" + keyword + "'";
            SqlSelect(sql, dataset, "tbl_SearchResults");
            return dataset.Tables["tbl_SearchResults"];
        }
        //Search = like rat lau, dung = cung lau nhung nhanh hon.
        public DataRow[] GetSearchResult(string keyword, string st = "", String cate = "", string wp = "", string ci = "", string jl = "", string empt = "", string ot = "", Boolean ad = false)
        {
            DataSet dataset = new DataSet();

            string sql = "EXEC proc_SearchItem '" + keyword + "'";
            SqlSelect(sql, dataset, "tbl_SearchResults");
            String anyCitizenship = "";
            string cateFilter = "";
            string workplaceFilter = "";
            string citizenship = "";
            string jlFilter = GetFilterString(jl, "joblevel");
            string emptFilter = GetFilterString(empt, "employmenttype");
            if (!string.IsNullOrEmpty(cate))
            {
                cateFilter = GetFilterString(cate, "sector", "sector2", "sector3");
            }
            else { cateFilter = "sector like '%%' "; }
            if (!string.IsNullOrEmpty(wp))
            {
                workplaceFilter = GetFilterString(wp, "location", "location2", "location3");
            }
            else { workplaceFilter = "location like '%%' "; }
            if (!string.IsNullOrEmpty(ci))
            {
                citizenship = GetFilterString(ci, "citizenship");
            }
            else { citizenship = "citizenship like '%%' "; }
            anyCitizenship = GetFilterString("Any citizenship", "citizenship");

            string schooltypeFilter = "";
            if (string.IsNullOrEmpty(st)) { schooltypeFilter = "schooltype LIKE '%%' OR schooltype is null"; }
            else { schooltypeFilter = "schooltype LIKE '%" + st + "%'"; }

            string orgTypeFilter = "";
            if (string.IsNullOrEmpty(ot)) { orgTypeFilter = "organizationtype LIKE '%%' OR organizationtype is null"; }
            else { orgTypeFilter = "organizationtype LIKE '%" + ot + "%'"; }
            var abc = dataset.Tables["tbl_SearchResults"].Rows.Count;
            try
            {
                if (ad == false)
                {
                    return dataset.Tables["tbl_SearchResults"].Select("(" + cateFilter + ")" + " AND " + "(" + workplaceFilter + ")" + " AND " + "((" + citizenship + ") OR " + anyCitizenship + ")", "uploadDate DESC");
                }
                else
                {
                    return dataset.Tables["tbl_SearchResults"].Select("(" + cateFilter + ")" + " AND " + "(" + workplaceFilter + ")" + " AND " + "((" + citizenship + ") OR " + anyCitizenship + ")" + " AND " + "(" + jlFilter + ")" + " AND " + "(" + emptFilter + ")" + " AND " + "(" + orgTypeFilter + ")" + " AND " + "(" + schooltypeFilter + ")", "uploadDate DESC");
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public DataRow[] proc_SearchCV(string kw, string qt_cate, string qt_location, string qt_citizen, string qt_el, string qt_jl, string qt_yoe, bool ad)
        {
            string sql = "EXEC proc_SearchCV '" + kw + "'";
            DataSet dataset = new DataSet();
            SqlSelect(sql, dataset, "tbl_SearchResults");

            string cateFilter = "";
            string workplaceFilter = "";
            string citizenship = "";
            cateFilter = GetFilterString(qt_cate, "DesiredEmployment", "DesiredEmployment2", "DesiredEmployment3");
            workplaceFilter = GetFilterString(qt_location, "location", "location2", "location3");
            citizenship = GetFilterString(qt_citizen, "Citizenship");

            try
            {
                if (ad == false)
                {
                    return dataset.Tables["tbl_SearchResults"].Select("(" + cateFilter + ") AND (" + workplaceFilter + ") AND (" + citizenship + ")", "CreateDate DESC");
                }
                else
                {
                    string eduFilter = ""; string joblvlFilter = ""; string yoeFilter = "";
                    eduFilter = GetFilterString(qt_el, "EduLevel");
                    joblvlFilter = GetFilterString(qt_jl, "CurrentJobLevel");
                    yoeFilter = GetFilterString(qt_yoe, "YearsofExperience");

                    return dataset.Tables["tbl_SearchResults"].Select("(" + cateFilter + ") AND (" + workplaceFilter + ") AND (" + citizenship + ") AND (" + eduFilter + ") AND (" + yoeFilter + ") AND (" + joblvlFilter + ")", "CreateDate DESC");
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private string GetFilterString(string text, string field, string field2 = "", string field3 = "")
        {
            string Filter = "";
            if (text != null)
            {
                if (text.Contains('O'))
                {
                    string[] wpSplit = text.Split('O');
                    foreach (string s in wpSplit)
                    {
                        Filter += field + " LIKE '%" + s + "%' OR " + field2 + " LIKE '%" + s + "%' OR " + field3 + " LIKE '%" + s + "%' OR ";
                    }
                    Filter = Filter.Remove(Filter.Length - 4, 4);
                }
                else
                {
                    Filter = field + " LIKE '%" + text + "%' OR " + field2 + " LIKE '%" + text + "%' OR " + field3 + " LIKE '%" + text + "%'";
                }
            }
            return Filter;
        }
        private string GetFilterString(string text, string field)
        {
            string Filter = "";
            if (text != null)
            {
                if (text.Contains('O'))
                {
                    string[] wpSplit = text.Split('O');
                    foreach (string s in wpSplit)
                    {
                        Filter += field + " LIKE '%" + s + "%' OR ";
                    }
                    Filter = Filter.Remove(Filter.Length - 4, 4);
                }
                else
                {
                    Filter = field + " LIKE '%" + text + "%'";
                }
            }
            return Filter;
        }
        public DataTable GetAllOrganizationType()
        {
            DataSet dataset = new DataSet();
            string sql = "select * from View_GetAllOrganizationType";
            SqlSelect(sql, dataset, "AllOrganizationType");
            return dataset.Tables["AllOrganizationType"];
        }
        public DataSet GetJobByOrgType(String orgType)
        {
            String sql = "EXEC proc_GetJobByOrgType '" + orgType + "'";
            DataSet dataset = new DataSet();
            SqlSelect(sql, dataset, "tbl");
            return dataset;
        }
        public DataTable GetLang(string lang)
        {
            string langCol = "lang_name_en";
            if (lang == "vi")
            {
                langCol = "lang_name_vi";
            }
            DataSet dataset = new DataSet();
            string sql = "SELECT * FROM view_GetLang_en ORDER BY " + langCol + " ASC";
            //string sql = "SELECT lang_Id,lang_name_en,lang_name_vi FROM tbl_Lang ORDER BY lang_name_en ASC";
            SqlSelect(sql, dataset, "GetLang_en");
            return dataset.Tables["GetLang_en"];
        }
        public DataTable GetLangLvl_en()
        {
            DataSet dataset = new DataSet();
            string sql = "SELECT * FROM view_GetLanglvl_en";
            SqlSelect(sql, dataset, "GetLangLvl_en");
            return dataset.Tables["GetLangLvl_en"];
        }
        /*******************************************    CV QUERY  *****************************************/

        public DataTable GetEduLevel()
        {
            DataSet dataset = new DataSet();
            string sql = "SELECT * FROM View_GetEduLevel";
            SqlSelect(sql, dataset, "View_GetEduLevel");
            return dataset.Tables["View_GetEduLevel"];
        }
        public DataTable GetYearsOfExp()
        {
            DataSet dataset = new DataSet();
            string sql = "SELECT * FROM View_GetYearsOfExp";
            SqlSelect(sql, dataset, "View_GetYearsOfExp");
            return dataset.Tables["View_GetYearsOfExp"];
        }
        public DataTable GetDesiredTravel()
        {
            DataSet dataset = new DataSet();
            string sql = "SELECT * FROM View_GetDesiredTravel";
            SqlSelect(sql, dataset, "View_GetDesiredTravel");
            return dataset.Tables["View_GetDesiredTravel"];
        }
        public DataTable GetSalaryExpectation()
        {
            DataSet dataset = new DataSet();
            string sql = "SELECT * FROM View_GetSalaryExpectation";
            SqlSelect(sql, dataset, "View_GetSalaryExpectation");
            return dataset.Tables["View_GetSalaryExpectation"];
        }
        public DataTable GetWilingToRelocate()
        {
            DataSet dataset = new DataSet();
            string sql = "SELECT * FROM View_GetWilingToRelocate";
            SqlSelect(sql, dataset, "View_GetWilingToRelocate");
            return dataset.Tables["View_GetWilingToRelocate"];
        }
        public void PostACV(string userId, string edulevel, string major, string yearOfExp, string achievement, string skill, string relatedExp, string spokenlang, string membership, string desiredTravel, string desiredCate, string DesiredJobLevel, string salaryExpect, string willtorelocate, string desiredlocation, string howsoon)
        {
            string sql = "EXEC Proc_InsertCV @cv_UserId,@cv_EduLevel,@cv_Major_en,@cv_YearsOfExp_en,@cv_Achievement_en,@cv_Skill_en,@cv_RelatedExperience_en,@cv_SpokenLang_en,@cv_Membership_en,@cv_DesiredTravel_en,@cv_DesiredCate_en,@cv_DesiredJobLevel_en,@cv_SalaryExpectation_en,@cv_WillingToRelocate_en,@cv_DesiredLocation_en,@cv_HowSoon_en";
            conn = GetConnection();
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@cv_UserId", userId);
            cmd.Parameters.AddWithValue("@cv_EduLevel", edulevel);
            cmd.Parameters.AddWithValue("@cv_Major_en", major);
            cmd.Parameters.AddWithValue("@cv_YearsOfExp_en", yearOfExp);
            cmd.Parameters.AddWithValue("@cv_Skill_en", skill);
            cmd.Parameters.AddWithValue("@cv_RelatedExperience_en", relatedExp);
            cmd.Parameters.AddWithValue("@cv_SpokenLang_en", spokenlang);
            cmd.Parameters.AddWithValue("@cv_Membership_en", membership);
            cmd.Parameters.AddWithValue("@cv_DesiredTravel_en", desiredTravel);
            cmd.Parameters.AddWithValue("@cv_Achievement_en", achievement);
            cmd.Parameters.AddWithValue("@cv_DesiredJobLevel_en", DesiredJobLevel);
            cmd.Parameters.AddWithValue("@cv_SalaryExpectation_en", salaryExpect);
            cmd.Parameters.AddWithValue("@cv_WillingToRelocate_en", willtorelocate);
            cmd.Parameters.AddWithValue("@cv_DesiredLocation_en", desiredlocation);
            cmd.Parameters.AddWithValue("@cv_HowSoon_en", howsoon);
            cmd.Parameters.AddWithValue("@cv_DesiredCate_en", desiredCate);

            try
            {
                conn.Open();
                int result = cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                conn.Close();
            }
        }
        //public DataTable GetTop6CV()
        //{
        //    DataSet dataset = new DataSet();
        //    string sql = "SELECT * FROM View_GetTop6CV";
        //    SqlSelect(sql, dataset, "View_GetTop6CV");
        //    return dataset.Tables["View_GetTop6CV"];
        //}
        public DataTable GetTop16CV()
        {
            DataSet dataset = new DataSet();
            string sql = "EXEC proc_GetTop16CV";
            SqlSelect(sql, dataset, "View_GetTop16CV");
            return dataset.Tables["View_GetTop16CV"];
        }

        public DataTable GetFullCategory(int cateId)
        {
            string sql = "EXEC Proc_GetSectorFull " + cateId;
            DataSet dataset = new DataSet();
            SqlSelect(sql, dataset, "GetSectorFull");
            return dataset.Tables["GetSectorFull"];
        }
        //Advance search
        public DataTable GetChildCategory(int cateId)
        {
            string sql = "EXEC Proc_GetSectorChild " + cateId;
            DataSet dataset = new DataSet();
            SqlSelect(sql, dataset, "GetChildCategory");
            return dataset.Tables["GetChildCategory"];
        }

        public void PlusView(int id)
        {
            string sql = "SELECT jviewcount from tbl_teachingjob WHERE jid = " + id;
            DataSet dataset = new DataSet();
            SqlSelect(sql, dataset, "GetViewCount");
            int viewcount = (int)dataset.Tables["GetViewCount"].Rows[0][0];
            viewcount = viewcount + 1;
            string updateSql = "UPDATE tbl_teachingjob SET jViewCount=" + viewcount + " WHERE jid=" + id;

            conn = GetConnection();
            SqlCommand cmd = new SqlCommand(updateSql, conn);
            try
            {
                conn.Open();
                int result = cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {

            }
            finally
            {
                conn.Close();
            }
        }
        public void SaveAJob(string employer, int jid, string fullname)
        {
            string sql = "EXEC proc_InsertSaveJob @jEmployer,@jId,@fullname";
            conn = GetConnection();
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@jEmployer", employer);
            cmd.Parameters.AddWithValue("@jId", jid);
            cmd.Parameters.AddWithValue("@fullname", fullname);
            try
            {
                conn.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                conn.Close();
            }
        }
        public DataTable GetSaveJobs(string userid)
        {
            DataSet dataset = new DataSet();
            string sql = "EXEC proc_GetSaveJobs '" + userid + "'";
            SqlSelect(sql, dataset, "GetSaveJobs");
            return dataset.Tables["GetSaveJobs"];
        }
        public void DeleteSaveJobs(int id)
        {
            string sql = "EXEC proc_DeleteSaveJob @id";
            conn = GetConnection();
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@id", id);
            try
            {
                conn.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally { conn.Close(); }
        }
        //-----------------------------------------Employer-------------------------------------
        //
        public DataTable GetPostedJobByUser(string userId)
        {
            DataSet dataset = new DataSet();
            string sql = "EXEC proc_GetPostedJobByUser '" + userId + "'";
            SqlSelect(sql, dataset, "GetPostedJobByUser");
            return dataset.Tables["GetPostedJobByUser"];
        }
        public DataTable GetJobByEmployer(String userId)
        {
            DataSet dataset = new DataSet();

            string sql = "EXEC proc_GetJobByEmployer @userId";
            SqlDataAdapter adapter = new SqlDataAdapter();
            SqlCommand cmd = new SqlCommand(sql, GetConnection());
            cmd.Parameters.AddWithValue("@userId", userId);

            adapter.SelectCommand = cmd;
            adapter.Fill(dataset, "tbl_GetJobByEmployer");

            return dataset.Tables["tbl_GetJobByEmployer"];
        }
        public DataTable GetJobBySameCate(String cate1, String cate2, String cate3)
        {
            DataSet dataset = new DataSet();

            string sql = "EXEC proc_GetJobByCategory @cate1,@cate2,@cate3";
            SqlDataAdapter adapter = new SqlDataAdapter();
            SqlCommand cmd = new SqlCommand(sql, GetConnection());
            cmd.Parameters.AddWithValue("@cate1", cate1);
            cmd.Parameters.AddWithValue("@cate2", cate2);
            cmd.Parameters.AddWithValue("@cate3", cate3);

            adapter.SelectCommand = cmd;
            adapter.Fill(dataset, "tbl");

            return dataset.Tables["tbl"];
        }

        public String GetGuidByJobId(int jid)
        {
            DataSet dataset = new DataSet();
            string sql = "EXEC proc_GetGuidByJobId @jid";
            SqlDataAdapter adapter = new SqlDataAdapter();
            SqlCommand cmd = new SqlCommand(sql, GetConnection());
            cmd.Parameters.AddWithValue("@jid", jid);
            adapter.SelectCommand = cmd;
            adapter.Fill(dataset, "tbl");

            return dataset.Tables["tbl"].Rows[0][0].ToString();
        }
        public void DeleteAPostedJob(int jid)
        {
            string sql = "EXEC proc_DeleteAPostedJob @jid";
            conn = GetConnection();
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@jid", jid);
            try
            {
                conn.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                conn.Close();
            }
        }
        public DataTable GetApplicants(int jid)
        {
            string sql = "EXEC proc_GetApplicants " + jid;
            DataSet dataset = new DataSet();
            SqlSelect(sql, dataset, "GetApplicants");
            return dataset.Tables["GetApplicants"];
        }
        public void DeleteAnApplicant(int sj_id)
        {
            string sql = "EXEC proc_DeleteAnApplicant @sj_id";
            conn = GetConnection();
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@sj_id", sj_id);
            try
            {
                conn.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                conn.Close();
            }
        }
        public void MarkAsRead(int sj_id, Boolean readbefore)
        {
            string sql = "EXEC proc_MarkAsRead @sj_id,@readbefore";
            conn = GetConnection();
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@sj_id", sj_id);
            cmd.Parameters.AddWithValue("@readbefore", readbefore);
            try
            {
                conn.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                conn.Close();
            }
        }
        public void MarkAsInterest(int sj_id, Boolean favorite)
        {
            string sql = "EXEC proc_MarkAsInterest @sj_id,@favorite";
            conn = GetConnection();
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@sj_id", sj_id);
            cmd.Parameters.AddWithValue("@favorite", favorite);
            try
            {
                conn.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                conn.Close();
            }
        }
        public DataRow NoOfUnread(string employerId)
        {
            DataSet dataset = new DataSet();
            string sql = "EXEC proc_NoOfUnread '" + employerId + "'";
            SqlSelect(sql, dataset, "NoOfUnread");
            return dataset.Tables["NoOfUnread"].Rows[0];
        }
        public DataSet GetFullnameFromUserId_Emp(string userId)
        {
            string sql = "EXEC porc_GetFullnameFromUserId_Emp '" + userId + "'";
            DataSet dataset = new DataSet();
            SqlSelect(sql, dataset, "tbl");
            return dataset;
        }

        public string InsertNewJob(string title, string description, string employer, string cate1, string cate2, string cate3, string citizenship, string jobLevel, string eduRequirement, string employementType, string location1, string location2, string location3, Boolean SalaryType, decimal salaryFrom, decimal salaryTo, string salaryCurrency, string salaryPaymentType, DateTime closingDate, Boolean executiveJob, string contactPerson, string emailForEmployer)
        {
            String sql = "EXEC proc_InsertNewJob @title, @description, @employer, @cate1, @cate2, @cate3, @citizenship, @jobLevel, @eduRequirement, @employementType, @location1, @location2, @location3, @SalaryType, @salaryFrom, @salaryTo, @salaryCurrency, @salaryPaymentType, @closingDate, @executiveJob, @contactPerson, @emailForEmployer";

            conn = GetConnection();
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@title", title);
            cmd.Parameters.AddWithValue("@description", description);
            cmd.Parameters.AddWithValue("@employer", employer);
            cmd.Parameters.AddWithValue("@cate1", cate1);
            cmd.Parameters.AddWithValue("@cate2", cate2);
            cmd.Parameters.AddWithValue("@cate3", cate3);
            cmd.Parameters.AddWithValue("@citizenship", citizenship);
            cmd.Parameters.AddWithValue("@jobLevel", jobLevel);
            cmd.Parameters.AddWithValue("@eduRequirement", eduRequirement);
            cmd.Parameters.AddWithValue("@employementType", employementType);
            cmd.Parameters.AddWithValue("@location1", location1);
            cmd.Parameters.AddWithValue("@location2", location2);
            cmd.Parameters.AddWithValue("@location3", location3);
            cmd.Parameters.AddWithValue("@SalaryType", SalaryType);
            cmd.Parameters.AddWithValue("@salaryFrom", salaryFrom);
            cmd.Parameters.AddWithValue("@salaryTo", salaryTo);
            cmd.Parameters.AddWithValue("@salaryCurrency", salaryCurrency);
            cmd.Parameters.AddWithValue("@salaryPaymentType", salaryPaymentType);
            cmd.Parameters.AddWithValue("@closingDate", closingDate);
            cmd.Parameters.AddWithValue("@executiveJob", executiveJob);
            cmd.Parameters.AddWithValue("@contactPerson", contactPerson);
            cmd.Parameters.AddWithValue("@emailForEmployer", emailForEmployer);
            try
            {
                conn.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                conn.Close();
            }
            return "done";
        }
        public DataRow AppliedNumber(int jid)
        {
            DataSet dataset = new DataSet();
            string sql = "EXEC proc_AppliedNumber '" + jid + "'";
            SqlSelect(sql, dataset, "AppliedNumber");
            return dataset.Tables["AppliedNumber"].Rows[0];
        }
        public DataRow NoOfInterested(string userId)
        {
            DataSet dataset = new DataSet();
            string sql = "EXEC proc_NoOfInterested '" + userId + "'";
            SqlSelect(sql, dataset, "NoOfInterested");
            return dataset.Tables["NoOfInterested"].Rows[0];
        }
        public int GetAvaiResumes()
        {
            DataSet dataset = new DataSet();
            string sql = "SELECT * FROM View_GetAvaiResumes";
            SqlSelect(sql, dataset, "tbl");
            return (int)dataset.Tables["tbl"].Rows[0][0];
        }

        //preparation
        public void Insert_PreparedArticle(String title = "", String logo = "", String body = "", Boolean setAsSlider = false, Boolean Active = false)
        {
            string sql = "EXEC proc_Insert_PreparedArticle @title,@logo,@body,@setAsSlider,@active";
            conn = GetConnection();
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@title", title);
            cmd.Parameters.AddWithValue("@logo", logo);
            cmd.Parameters.AddWithValue("@body", body);
            cmd.Parameters.AddWithValue("@setAsSlider", setAsSlider);
            cmd.Parameters.AddWithValue("@active", Active);

            try
            {
                conn.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                conn.Close();
            }
        }
        public DataTable view_HiringAdvice_Category()
        {
            DataSet dataset = new DataSet();
            string sql = "SELECT * FROM view_HiringAdvice_Category";
            SqlSelect(sql, dataset, "tbl");
            return dataset.Tables["tbl"];
        }
        public int GetFirstCateId()
        {
            DataSet dataset = new DataSet();
            string sql = "SELECT TOP(1) cate_id FROM tbl_HiringAdvice_Category WHERE active=1 ORDER BY cate_id ";
            SqlSelect(sql, dataset, "tbl");
            return Convert.ToInt16(dataset.Tables["tbl"].Rows[0][0].ToString());
        }
        public DataTable view_HiringAdvice(int cateid)
        {
            DataSet dataset = new DataSet();
            string sql = "EXEC proc_HiringAdvice " + cateid;
            SqlSelect(sql, dataset, "tbl");
            return dataset.Tables["tbl"];
        }
        public DataTable View_Article(String view)
        {
            DataSet dataset = new DataSet();
            string sql = "SELECT * FROM " + view;
            SqlSelect(sql, dataset, "tbl");
            return dataset.Tables["tbl"];
        }
        public DataTable View_TestimonialArticle()
        {
            DataSet dataset = new DataSet();
            string sql = "SELECT * FROM view_Testimonial_Article";
            SqlSelect(sql, dataset, "tbl");
            return dataset.Tables["tbl"];
        }
        public DataRow GetTestimonialArticleById(int tid)
        {
            DataSet dataset = new DataSet();
            string sql = "EXEC proc_GetTestimonialArticleById " + tid;
            SqlSelect(sql, dataset, "tbl");
            return dataset.Tables["tbl"].Rows[0];
        }
        public DataRow GetHiringAdviceById(int id)
        {
            DataSet dataset = new DataSet();
            string sql = "EXEC proc_GetHiringAdviceById " + id;
            SqlSelect(sql, dataset, "tbl");
            return dataset.Tables["tbl"].Rows[0];
        }
        public void Insert_TestimonialArticle(String name = "", String citizenship = "", String logo = "", String body = "", Boolean setAsSlider = false, Boolean Active = false)
        {
            string sql = "EXEC proc_Insert_TestimonialArticle @name,@citizenship,@logo,@body,@setAsSlider,@active";
            conn = GetConnection();
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@name", name);
            cmd.Parameters.AddWithValue("@citizenship", citizenship);
            cmd.Parameters.AddWithValue("@logo", logo);
            cmd.Parameters.AddWithValue("@body", body);
            cmd.Parameters.AddWithValue("@setAsSlider", setAsSlider);
            cmd.Parameters.AddWithValue("@active", Active);

            try
            {
                conn.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                conn.Close();
            }
        }
        public DataRow GetSlider()
        {
            DataSet dataset = new DataSet();
            string sql = "SELECT * FROM view_GetSlider";
            SqlSelect(sql, dataset, "tbl");
            return dataset.Tables["tbl"].Rows[0];
        }
        public void SaveCv(string saver, string cvuserid)
        {
            string sql = "INSERT INTO tbl_SaveCV(Saver,cvUserId) VALUES(@saver,@cvuserid)";
            conn = GetConnection();
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@cvuserid", cvuserid);
            cmd.Parameters.AddWithValue("@saver", saver);

            try
            {
                conn.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                conn.Close();
            }
        }
        public DataTable GetSavedCV(string saver)
        {
            DataSet dataset = new DataSet();
            string sql = "EXEC proc_GetSavedCV '" + saver + "'";
            SqlSelect(sql, dataset, "tbl");
            return dataset.Tables["tbl"];
        }
        public void DeleteSavedCV(int id)
        {
            string sql = "EXEC proc_DeleteSavedCV @id";
            conn = GetConnection();
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@id", id);
            try
            {
                conn.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally { conn.Close(); }
        }
        public void SaveJob2(string candidate, int jId)
        {
            string sql = "INSERT INTO tbl_SaveJob2(candidate,jId) VALUES(@candidate,@jId)";
            conn = GetConnection();
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@candidate", candidate);
            cmd.Parameters.AddWithValue("@jId", jId);

            try
            {
                conn.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                conn.Close();
            }
        }
        public DataTable GetSaveJob2(string candidate)
        {
            DataSet dataset = new DataSet();
            string sql = "EXEC proc_GetSaveJob2 '" + candidate + "'";
            SqlSelect(sql, dataset, "tbl");
            return dataset.Tables["tbl"];
        }
        public void DeleteSaveJob2(int id)
        {
            string sql = "EXEC proc_DeleteSaveJob2 @id";
            conn = GetConnection();
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@id", id);
            try
            {
                conn.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                conn.Close();
            }
        }

        public void PostComment(int tid, string name, string email, string content, Boolean active)
        {
            String sql = "EXEC proc_InsertComment @tid,@name,@email,@content,@active";
            conn = GetConnection();
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@tid", tid);
            cmd.Parameters.AddWithValue("@name", name);
            cmd.Parameters.AddWithValue("@email", email);
            cmd.Parameters.AddWithValue("@content", content);
            cmd.Parameters.AddWithValue("@active", active);
            try
            {
                conn.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                conn.Close();
            }
        }
        public DataTable ViewCommentByTid(int tid)
        {
            string sql = "EXEC view_Comment " + tid;
            DataSet ds = new DataSet();
            SqlSelect(sql, ds, "tbl");
            return ds.Tables["tbl"];
        }

        public void AddHiringAdvice(string title, int cateid, string writer, bool active, string detail)
        {
            String sql = "EXEC proc_addHiringAdvice @title,@cateid,@writer,@active,@detail";
            conn = GetConnection();
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@title", title);
            cmd.Parameters.AddWithValue("@cateid", cateid);
            cmd.Parameters.AddWithValue("@writer", writer);
            cmd.Parameters.AddWithValue("@active", active);
            cmd.Parameters.AddWithValue("@detail", detail);
            try
            {
                conn.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                conn.Close();
            }
        }
        public void PostCommentHiring(int tid, string name, string content, Boolean active)
        {
            String sql = "EXEC proc_InsertCommentHiring @tid,@name,@content,@active";
            conn = GetConnection();
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@tid", tid);
            cmd.Parameters.AddWithValue("@name", name);
            cmd.Parameters.AddWithValue("@content", content);
            cmd.Parameters.AddWithValue("@active", active);
            try
            {
                conn.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                conn.Close();
            }
        }
        public DataTable ViewCommentHiringById(int tid)
        {
            string sql = "EXEC view_CommentHiring " + tid;
            DataSet ds = new DataSet();
            SqlSelect(sql, ds, "tbl");
            return ds.Tables["tbl"];
        }
        public int GetNumberOfCommentHiringById(int tid)
        {
            string sql = "EXEC proc_GetNumberOfCommentHiringById " + tid;
            DataSet ds = new DataSet();
            SqlSelect(sql, ds, "tbl");
            return Convert.ToInt16(ds.Tables["tbl"].Rows[0][0].ToString());
        }
        public DataRow GetRecentComment(int tid)
        {
            string sql = "EXEC proc_GetRecentComment " + tid;
            DataSet ds = new DataSet();
            SqlSelect(sql, ds, "tbl");
            if (ds.Tables["tbl"].Rows.Count > 0)
            {
                return ds.Tables["tbl"].Rows[0];
            }
            else
            {
                return null;
            }
        }
        public void disableRow(string tbl, string colName, int id)
        {
            string sql = "UPDATE " + tbl + " SET " + colName + "=0 WHERE id=" + id;
            conn = GetConnection();
            SqlCommand cmd = new SqlCommand(sql, conn);
            try
            {
                conn.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                conn.Close();
            }
        }
        public void removeRow(int id, string idColumnName, string tbl)
        {
            string sql = "DELETE FROM " + tbl + " WHERE " + idColumnName + "=" + id;
            conn = GetConnection();
            SqlCommand cmd = new SqlCommand(sql, conn);
            try
            {
                conn.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                conn.Close();
            }
        }
        public DataTable getJobAlert(string cate1, string cate2, string cate3, string lo1, string lo2, string lo3)
        {
            string sql = "EXEC proc_GetJobAlert @cate1,@cate2,@cate3,@lo1,@lo2,@lo3";
            DataSet dataset = new DataSet();
            SqlDataAdapter adapter = new SqlDataAdapter();
            SqlCommand cmd = new SqlCommand(sql, GetConnection());
            cmd.Parameters.AddWithValue("@cate1", cate1);
            cmd.Parameters.AddWithValue("@cate2", cate2);
            cmd.Parameters.AddWithValue("@cate3", cate3);
            cmd.Parameters.AddWithValue("@lo1", lo1);
            cmd.Parameters.AddWithValue("@lo2", lo2);
            cmd.Parameters.AddWithValue("@lo3", lo3);
            adapter.SelectCommand = cmd;
            adapter.Fill(dataset, "tbl");

            return dataset.Tables["tbl"];
        }
        public string GetLastestJobIdByGuid(string guid)
        {
            DataSet dataset = new DataSet();
            string sql = "EXEC proc_GetLastestJobByGuid '" + guid + "'";
            SqlSelect(sql, dataset, "tbl");
            if (dataset.Tables["tbl"].Rows.Count > 0)
            {
                return dataset.Tables["tbl"].Rows[0][0].ToString();
            }
            else
            {
                return null;
            }
        }
    }
}
