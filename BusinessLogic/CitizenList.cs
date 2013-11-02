using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BusinessLogic
{
    public class CitizenList
    {
        Citizenship citizen;
        List<Citizenship> cList = new List<Citizenship>();

        public CitizenList()
        {

        }
        public List<Citizenship> GetCitizenList()
        {
            citizen = new Citizenship("United States");
            cList.Add(citizen);
            citizen = new Citizenship("United Kingdom");
            cList.Add(citizen);
            citizen = new Citizenship("New Zealand");
            cList.Add(citizen);
            citizen = new Citizenship("Ireland");
            cList.Add(citizen);
            citizen = new Citizenship("Canada");
            cList.Add(citizen);
            citizen = new Citizenship("Australia");
            cList.Add(citizen);
            citizen = new Citizenship("South of Africa");
            cList.Add(citizen);
            citizen = new Citizenship("VietNam");
            cList.Add(citizen);
            citizen = new Citizenship("Japan");
            cList.Add(citizen);
            citizen = new Citizenship("China");
            cList.Add(citizen);
            citizen = new Citizenship("France");
            cList.Add(citizen);
            citizen = new Citizenship("Russia");
            cList.Add(citizen);
            citizen = new Citizenship("Thailand");
            cList.Add(citizen);
            citizen = new Citizenship("Others");
            cList.Add(citizen);

            return cList;
        }

    }
}
