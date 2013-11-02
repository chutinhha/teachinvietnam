using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;

namespace DataAccess.Data.Employer
{
    public class TrainingCourse
    {
        SqlConnection sqlConn;
        DataSet ds;
        public TrainingCourse(string connStr)
        {
            sqlConn = new SqlConnection(connStr);
            ds = new DataSet();
        }
        //public void InsertNewCourse(string _guid, string _certificate, string _length, string _timetable, string _cost, string _entry, string _contact, string _content, string _benefit)
        //{
        //    string sqlQuery = "EXEC [dbo].[proc_InsertTrainingCourse] @guid,@certificate,@length,@timetable,@cost,@entry,@contact,@content,@benefit";
        //    SqlCommand cmd;

        //    try
        //    {
        //        cmd = new SqlCommand(sqlQuery, sqlConn);
        //        cmd.Parameters.AddWithValue("@guid", _guid);
        //        cmd.Parameters.AddWithValue("@certificate", _certificate);
        //        cmd.Parameters.AddWithValue("@length", _length);
        //        cmd.Parameters.AddWithValue("@timetable", _timetable);
        //        cmd.Parameters.AddWithValue("@cost", _cost);
        //        cmd.Parameters.AddWithValue("@entry", _entry);
        //        cmd.Parameters.AddWithValue("@contact", _contact);
        //        cmd.Parameters.AddWithValue("@content", _content);
        //        cmd.Parameters.AddWithValue("@benefit", _benefit);

        //        sqlConn.Open();
        //        cmd.ExecuteNonQuery();
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //    finally
        //    {
        //        sqlConn.Close();
        //    }
        //}
        public void InsertNewCourse(string _guid, string _certificate, string _length, string _timetable, string _cost, string _entry, string _contact, string _content, string _benefit)
        {
            TeachinVietnamDataContextDataContext dbContext = new TeachinVietnamDataContextDataContext();
            //tbl_TrainingCourse tc = new tbl_TrainingCourse();
            Guid guid = new Guid(_guid);
            dbContext.proc_InsertTrainingCourse(guid, _certificate, _length, _timetable, _cost, _entry, _contact, _content, _benefit);
            dbContext.SubmitChanges();
        }
    }
}

