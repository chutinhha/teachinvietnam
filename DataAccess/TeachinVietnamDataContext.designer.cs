﻿#pragma warning disable 1591
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.269
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DataAccess
{
	using System.Data.Linq;
	using System.Data.Linq.Mapping;
	using System.Data;
	using System.Collections.Generic;
	using System.Reflection;
	using System.Linq;
	using System.Linq.Expressions;
	using System.ComponentModel;
	using System;
	
	
	[global::System.Data.Linq.Mapping.DatabaseAttribute(Name="TeachingJob")]
	public partial class TeachinVietnamDataContextDataContext : System.Data.Linq.DataContext
	{
		
		private static System.Data.Linq.Mapping.MappingSource mappingSource = new AttributeMappingSource();
		
    #region Extensibility Method Definitions
    partial void OnCreated();
    partial void Inserttbl_TrainingCourse(tbl_TrainingCourse instance);
    partial void Updatetbl_TrainingCourse(tbl_TrainingCourse instance);
    partial void Deletetbl_TrainingCourse(tbl_TrainingCourse instance);
    #endregion
		
		public TeachinVietnamDataContextDataContext() : 
				base(global::DataAccess.Properties.Settings.Default.TeachingJobConnectionString, mappingSource)
		{
			OnCreated();
		}
		
		public TeachinVietnamDataContextDataContext(string connection) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public TeachinVietnamDataContextDataContext(System.Data.IDbConnection connection) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public TeachinVietnamDataContextDataContext(string connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public TeachinVietnamDataContextDataContext(System.Data.IDbConnection connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public System.Data.Linq.Table<tbl_TrainingCourse> tbl_TrainingCourses
		{
			get
			{
				return this.GetTable<tbl_TrainingCourse>();
			}
		}
		
		[global::System.Data.Linq.Mapping.FunctionAttribute(Name="dbo.proc_InsertTrainingCourse")]
		public int proc_InsertTrainingCourse([global::System.Data.Linq.Mapping.ParameterAttribute(DbType="UniqueIdentifier")] System.Nullable<System.Guid> tc_empId, [global::System.Data.Linq.Mapping.ParameterAttribute(DbType="NVarChar(255)")] string tc_certificate, [global::System.Data.Linq.Mapping.ParameterAttribute(DbType="VarChar(255)")] string tc_length, [global::System.Data.Linq.Mapping.ParameterAttribute(DbType="NVarChar(255)")] string tc_timetable, [global::System.Data.Linq.Mapping.ParameterAttribute(DbType="VarChar(200)")] string tc_cost, [global::System.Data.Linq.Mapping.ParameterAttribute(DbType="NVarChar(255)")] string tc_entryRequirement, [global::System.Data.Linq.Mapping.ParameterAttribute(DbType="NVarChar(255)")] string tc_contact, [global::System.Data.Linq.Mapping.ParameterAttribute(DbType="Text")] string tc_courseContent, [global::System.Data.Linq.Mapping.ParameterAttribute(DbType="Text")] string tc_teacherBenefit)
		{
			IExecuteResult result = this.ExecuteMethodCall(this, ((MethodInfo)(MethodInfo.GetCurrentMethod())), tc_empId, tc_certificate, tc_length, tc_timetable, tc_cost, tc_entryRequirement, tc_contact, tc_courseContent, tc_teacherBenefit);
			return ((int)(result.ReturnValue));
		}
	}
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.tbl_TrainingCourse")]
	public partial class tbl_TrainingCourse : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private short _tc_id;
		
		private System.Nullable<System.Guid> _tc_empId;
		
		private string _tc_certificate;
		
		private string _tc_length;
		
		private string _tc_timetable;
		
		private string _tc_cost;
		
		private string _tc_entryRequirement;
		
		private string _tc_contact;
		
		private string _tc_courseContent;
		
		private string _tc_teacherBenefit;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void Ontc_idChanging(short value);
    partial void Ontc_idChanged();
    partial void Ontc_empIdChanging(System.Nullable<System.Guid> value);
    partial void Ontc_empIdChanged();
    partial void Ontc_certificateChanging(string value);
    partial void Ontc_certificateChanged();
    partial void Ontc_lengthChanging(string value);
    partial void Ontc_lengthChanged();
    partial void Ontc_timetableChanging(string value);
    partial void Ontc_timetableChanged();
    partial void Ontc_costChanging(string value);
    partial void Ontc_costChanged();
    partial void Ontc_entryRequirementChanging(string value);
    partial void Ontc_entryRequirementChanged();
    partial void Ontc_contactChanging(string value);
    partial void Ontc_contactChanged();
    partial void Ontc_courseContentChanging(string value);
    partial void Ontc_courseContentChanged();
    partial void Ontc_teacherBenefitChanging(string value);
    partial void Ontc_teacherBenefitChanged();
    #endregion
		
		public tbl_TrainingCourse()
		{
			OnCreated();
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_tc_id", AutoSync=AutoSync.OnInsert, DbType="SmallInt NOT NULL IDENTITY", IsPrimaryKey=true, IsDbGenerated=true)]
		public short tc_id
		{
			get
			{
				return this._tc_id;
			}
			set
			{
				if ((this._tc_id != value))
				{
					this.Ontc_idChanging(value);
					this.SendPropertyChanging();
					this._tc_id = value;
					this.SendPropertyChanged("tc_id");
					this.Ontc_idChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_tc_empId", DbType="UniqueIdentifier")]
		public System.Nullable<System.Guid> tc_empId
		{
			get
			{
				return this._tc_empId;
			}
			set
			{
				if ((this._tc_empId != value))
				{
					this.Ontc_empIdChanging(value);
					this.SendPropertyChanging();
					this._tc_empId = value;
					this.SendPropertyChanged("tc_empId");
					this.Ontc_empIdChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_tc_certificate", DbType="NVarChar(255)")]
		public string tc_certificate
		{
			get
			{
				return this._tc_certificate;
			}
			set
			{
				if ((this._tc_certificate != value))
				{
					this.Ontc_certificateChanging(value);
					this.SendPropertyChanging();
					this._tc_certificate = value;
					this.SendPropertyChanged("tc_certificate");
					this.Ontc_certificateChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_tc_length", DbType="VarChar(255)")]
		public string tc_length
		{
			get
			{
				return this._tc_length;
			}
			set
			{
				if ((this._tc_length != value))
				{
					this.Ontc_lengthChanging(value);
					this.SendPropertyChanging();
					this._tc_length = value;
					this.SendPropertyChanged("tc_length");
					this.Ontc_lengthChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_tc_timetable", DbType="NVarChar(255)")]
		public string tc_timetable
		{
			get
			{
				return this._tc_timetable;
			}
			set
			{
				if ((this._tc_timetable != value))
				{
					this.Ontc_timetableChanging(value);
					this.SendPropertyChanging();
					this._tc_timetable = value;
					this.SendPropertyChanged("tc_timetable");
					this.Ontc_timetableChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_tc_cost", DbType="VarChar(200)")]
		public string tc_cost
		{
			get
			{
				return this._tc_cost;
			}
			set
			{
				if ((this._tc_cost != value))
				{
					this.Ontc_costChanging(value);
					this.SendPropertyChanging();
					this._tc_cost = value;
					this.SendPropertyChanged("tc_cost");
					this.Ontc_costChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_tc_entryRequirement", DbType="NVarChar(255)")]
		public string tc_entryRequirement
		{
			get
			{
				return this._tc_entryRequirement;
			}
			set
			{
				if ((this._tc_entryRequirement != value))
				{
					this.Ontc_entryRequirementChanging(value);
					this.SendPropertyChanging();
					this._tc_entryRequirement = value;
					this.SendPropertyChanged("tc_entryRequirement");
					this.Ontc_entryRequirementChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_tc_contact", DbType="NVarChar(255)")]
		public string tc_contact
		{
			get
			{
				return this._tc_contact;
			}
			set
			{
				if ((this._tc_contact != value))
				{
					this.Ontc_contactChanging(value);
					this.SendPropertyChanging();
					this._tc_contact = value;
					this.SendPropertyChanged("tc_contact");
					this.Ontc_contactChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_tc_courseContent", DbType="Text", UpdateCheck=UpdateCheck.Never)]
		public string tc_courseContent
		{
			get
			{
				return this._tc_courseContent;
			}
			set
			{
				if ((this._tc_courseContent != value))
				{
					this.Ontc_courseContentChanging(value);
					this.SendPropertyChanging();
					this._tc_courseContent = value;
					this.SendPropertyChanged("tc_courseContent");
					this.Ontc_courseContentChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_tc_teacherBenefit", DbType="Text", UpdateCheck=UpdateCheck.Never)]
		public string tc_teacherBenefit
		{
			get
			{
				return this._tc_teacherBenefit;
			}
			set
			{
				if ((this._tc_teacherBenefit != value))
				{
					this.Ontc_teacherBenefitChanging(value);
					this.SendPropertyChanging();
					this._tc_teacherBenefit = value;
					this.SendPropertyChanged("tc_teacherBenefit");
					this.Ontc_teacherBenefitChanged();
				}
			}
		}
		
		public event PropertyChangingEventHandler PropertyChanging;
		
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if ((this.PropertyChanging != null))
			{
				this.PropertyChanging(this, emptyChangingEventArgs);
			}
		}
		
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if ((this.PropertyChanged != null))
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
	}
}
#pragma warning restore 1591
