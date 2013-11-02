using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TeachingJob.publicArea.CV
{
    public class objValue
    {
        private string name;

        public string Name
        {
            get { return name; }
            set { name = value; }
        }
        private string value;

        public string Value
        {
            get { return this.value; }
            set { this.value = value; }
        }
        public objValue() { }
        public objValue(string n, string v)
        {
            Name = n;
            Value = v;
        }

    }
}