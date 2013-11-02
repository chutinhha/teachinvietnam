using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BusinessLogic
{
    public class ServicesInfo
    {
        private int _ID;
        private int _ParentId;
        private string _Name;
        private string _CONTENT;
        private string _Image;
        private int _Status;
        private string _ParentName;

        public string ParentName
        {
            get { return _ParentName; }
            set { _ParentName = value; }
        }

        public int ID
        {
            get { return _ID; }
            set { _ID = value; }
        }
        public int ParentId
        {
            get { return _ParentId; }
            set { _ParentId = value; }
        }
        public string Name
        {
            get { return _Name; }
            set { _Name = value; }
        }
        public string CONTENT
        {
            get { return _CONTENT; }
            set { _CONTENT = value; }
        }
        public string Image
        {
            get { return _Image; }
            set { _Image = value; }
        }
        public int Status
        {
            get { return _Status; }
            set { _Status = value; }
        }

        public ServicesInfo() { }

    }
}
