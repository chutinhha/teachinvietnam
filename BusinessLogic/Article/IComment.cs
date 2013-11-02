using System;
namespace BusinessLogic.Article
{
    interface IComment
    {
        bool Active { get; set; }
        string Body { get; set; }
        DateTime Createddate { get; set; }
        string Email { get; set; }
        int Id { get; set; }
        int Tid { get; set; }
        string Writername { get; set; }
    }
}
