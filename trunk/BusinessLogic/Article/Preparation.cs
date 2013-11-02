using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BusinessLogic.Article
{
    public class Preparation
    {
        int id;
        string title;
        string logo;
        string body;
        Boolean setAsSlider;
        Boolean active;

        public Preparation() { }
        public Preparation(string _id, string _title, string _logo, string _body, string _setAsSlider, String _active)
        {
            Id = Convert.ToInt32(_id);
            Title = _title;
            Logo = _logo;
            Body = _body;
            SetAsSlider = Convert.ToBoolean(_setAsSlider);
            Active = Convert.ToBoolean(_active);
        }

        string name;
        string citizenship;
        
        public Preparation(string _id, string _name,string _citizenship, string _logo, string _body, string _setAsSlider, String _active)
        {
            Id = Convert.ToInt32(_id);
            Name = _name;
            Citizenship = _citizenship;
            Logo = _logo;
            Body = _body;
            SetAsSlider = Convert.ToBoolean(_setAsSlider);
            Active = Convert.ToBoolean(_active);
        }


        public int Id
        {
            get { return id; }
            set { id = value; }
        }
        public string Title
        {
            get { return title; }
            set { title = value; }
        }
        public string Name
        {
            get { return name; }
            set { name = value; }
        }
        public string Citizenship
        {
            get { return citizenship; }
            set { citizenship = value; }
        }
        public string Logo
        {
            get { return logo; }
            set { logo = value; }
        }
        public string Body
        {
            get { return body; }
            set { body = value; }
        }
        public Boolean SetAsSlider
        {
            get { return setAsSlider; }
            set { setAsSlider = value; }
        }
        public Boolean Active
        {
            get { return active; }
            set { active = value; }
        }


    }
}
