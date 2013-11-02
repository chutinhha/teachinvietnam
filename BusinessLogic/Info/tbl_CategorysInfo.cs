
using System;
using System.Data;
using DotNetNuke.Entities.Modules;
using DotNetNuke.Common.Utilities;

namespace BusinessLogic
{
	public class tbl_CategorysInfo : IHydratable
	{
	#region "Private Members"
		protected int _id;
		protected int _parentId;
		protected string _name = String.Empty;
		protected string _subContent = String.Empty;
		protected string _content = String.Empty;
		protected string _image = String.Empty;
		protected int _status;
		protected int _categoryType;
		protected string _laguageId = String.Empty;
		protected int _order;
		protected string _categoryLink = String.Empty;
		protected int _ortherInt;
		protected string _ortherText = String.Empty;
		protected double _ortherFloat;
		protected string _paramNamePK = String.Empty;
		protected string _paramOrther = String.Empty;
	#endregion
		
	#region "Constructors"
        public tbl_CategorysInfo()
        {
		}

        public tbl_CategorysInfo(int id, int parentId, string name, string subContent, string content, string image, int status, int categoryType, string laguageId, int order, string categoryLink, int ortherInt, string ortherText, double ortherFloat, string paramNamePK, string paramOrther)
		{
            this.ID = id;
            this.ParentId = parentId;
            this.Name = name;
            this.SubContent = subContent;
            this.Content = content;
            this.Image = image;
            this.Status = status;
            this.CategoryType = categoryType;
            this.LaguageId = laguageId;
            this.Order = order;
            this.CategoryLink = categoryLink;
            this.OrtherInt = ortherInt;
            this.OrtherText = ortherText;
            this.OrtherFloat = ortherFloat;
            this.ParamNamePK = paramNamePK;
            this.ParamOrther = paramOrther;
        }
	#endregion
		
		#region "Public Properties"
		public int ID
		{
			get{return _id;}
			set{_id = value;}
		}
		
		public int ParentId
		{
			get{return _parentId;}
			set{_parentId = value;}
		}

		public string Name
		{
			get{return _name;}
			set{_name = value;}
		}

		public string SubContent
		{
			get{return _subContent;}
			set{_subContent = value;}
		}

		public string Content
		{
			get{return _content;}
			set{_content = value;}
		}

		public string Image
		{
			get{return _image;}
			set{_image = value;}
		}

		public int Status
		{
			get{return _status;}
			set{_status = value;}
		}

		public int CategoryType
		{
			get{return _categoryType;}
			set{_categoryType = value;}
		}

		public string LaguageId
		{
			get{return _laguageId;}
			set{_laguageId = value;}
		}

		public int Order
		{
			get{return _order;}
			set{_order = value;}
		}

		public string CategoryLink
		{
			get{return _categoryLink;}
			set{_categoryLink = value;}
		}

		public int OrtherInt
		{
			get{return _ortherInt;}
			set{_ortherInt = value;}
		}

		public string OrtherText
		{
			get{return _ortherText;}
			set{_ortherText = value;}
		}

		public double OrtherFloat
		{
			get{return _ortherFloat;}
			set{_ortherFloat = value;}
		}

		public string ParamNamePK
		{
			get{return _paramNamePK;}
			set{_paramNamePK = value;}
		}

		public string ParamOrther
		{
			get{return _paramOrther;}
			set{_paramOrther = value;}
		}
		#endregion
		
		#region "IHydratable Interface"
		
		public int KeyID
		{
			get{return _id;}
			set{_id = value;}
		}
		
        public void Fill(IDataReader dr)
        {
		       ID = Convert.ToInt32(Null.SetNull(dr["ID"], ID));
		       ParentId = Convert.ToInt32(Null.SetNull(dr["ParentId"], ParentId));
		       Name = Convert.ToString(Null.SetNull(dr["Name"], Name));
		       SubContent = Convert.ToString(Null.SetNull(dr["SubContent"], SubContent));
		       Content = Convert.ToString(Null.SetNull(dr["Content"], Content));
		       Image = Convert.ToString(Null.SetNull(dr["Image"], Image));
		       Status = Convert.ToInt32(Null.SetNull(dr["Status"], Status));
		       CategoryType = Convert.ToInt32(Null.SetNull(dr["CategoryType"], CategoryType));
		       LaguageId = Convert.ToString(Null.SetNull(dr["LaguageId"], LaguageId));
		       Order = Convert.ToInt32(Null.SetNull(dr["Order"], Order));
		       CategoryLink = Convert.ToString(Null.SetNull(dr["CategoryLink"], CategoryLink));
		       OrtherInt = Convert.ToInt32(Null.SetNull(dr["OrtherInt"], OrtherInt));
		       OrtherText = Convert.ToString(Null.SetNull(dr["OrtherText"], OrtherText));
		       OrtherFloat = Convert.ToDouble(Null.SetNull(dr["OrtherFloat"], OrtherFloat));
		       ParamNamePK = Convert.ToString(Null.SetNull(dr["ParamNamePK"], ParamNamePK));
		       ParamOrther = Convert.ToString(Null.SetNull(dr["ParamOrther"], ParamOrther));
		}		
		#endregion
	}
}
