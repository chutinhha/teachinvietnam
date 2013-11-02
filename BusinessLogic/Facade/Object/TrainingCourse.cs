using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BusinessLogic.Facade.Object
{
    public class TrainingCourse
    {
        string id;
        string guid;
        string name;
        int certificate;
        int category;
        int location;
        string length;
        string timetable;
        string cost;
        string entry;
        string contact;
        string coursecontent;
        string benefit;
        int viewCount;

        public TrainingCourse()
        {
            dbContext = new TeachinVietnamDataContext();
        }
        public TrainingCourse(string _id, string _guid, int _certificate, string _length, string _timetable, string _cost, string _entry, string _contact, string _content, string _benefit)
        {
            Id = _id;
            Guid = _guid;
            Certificate = _certificate;
            Length = _length;
            Timetable = _timetable;
            Cost = _cost;
            Entry = _entry;
            Contact = _contact;
            Coursecontent = _content;
            Benefit = _benefit;
        }
        public TrainingCourse(string _guid, int _certificate, string _length, string _timetable, string _cost, string _entry, string _contact, string _content, string _benefit)
        {
            Guid = _guid;
            Certificate = _certificate;
            Length = _length;
            Timetable = _timetable;
            Cost = _cost;
            Entry = _entry;
            Contact = _contact;
            Coursecontent = _content;
            Benefit = _benefit;
        }
        TeachinVietnamDataContext dbContext;
        public string getCertificateName(string lang = "en")
        {
            var result = from tc in dbContext.tbl_TrainingLevels
                         where tc.tlId == Certificate
                         select tc;
            foreach (var v in result)
            {
                if (lang != "en") { return v.tlName_vi; }
                else { return v.tlName_en; }
            }
            return "";
        }
        public string CertificateName
        {
            get {
                var result = from tc in dbContext.tbl_TrainingLevels
                             where tc.tlId == Certificate
                             select tc;
                foreach (var v in result)
                {
                    return v.tlName_en; 
                }
                return "";
            }
        }
        public string Id
        {
            get { return id; }
            set { id = value; }
        }
        public string Guid
        {
            get { return guid; }
            set { guid = value; }
        }
        public int Certificate
        {
            get { return certificate; }
            set { certificate = value; }
        }
        public string Length
        {
            get { return length; }
            set { length = value; }
        }
        public string Timetable
        {
            get { return timetable; }
            set { timetable = value; }
        }
        public string Cost
        {
            get { return cost; }
            set { cost = value; }
        }
        public string Entry
        {
            get { return entry; }
            set { entry = value; }
        }
        public string Contact
        {
            get { return contact; }
            set { contact = value; }
        }
        public string Coursecontent
        {
            get { return coursecontent; }
            set { coursecontent = value; }
        }
        public string Benefit
        {
            get { return benefit; }
            set { benefit = value; }
        }

        public string Name
        {
            get { return name; }
            set { name = value; }
        }
        public int Category
        {
            get { return category; }
            set { category = value; }
        }
        public int Location
        {
            get { return location; }
            set { location = value; }
        }
        public int ViewCount
        {
            get { return viewCount; }
            set { viewCount = value; }
        }

    }
}
