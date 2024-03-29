ALTER DATABASE [TeachingJob] SET Single_User WITH Rollback Immediate
GO
ALTER DATABASE [TeachingJob] SET Multi_User
GO
use teachingjob
GO

------------------------------------------------
alter table tbl_intership add author uniqueidentifier

---------------------------------feature logo------------------------

create table [dbo].[tbl_feature_logo]
(
	id int primary key identity(1,1),
	OrganizationName nvarchar(255),
	logo varchar(255),
	username varchar(255),
	active bit default 1,
	SortOrder int default 10
)

CREATE PROC [dbo].[proc_feature_logo_update]
	@id int,
	@active bit,
	@sortOrder int
AS
UPDATE [dbo].[tbl_feature_logo]
SET active=@active, SortOrder=@sortOrder WHERE id=@id

CREATE PROC [dbo].[proc_feature_logo_delete]
	@id int
AS
DELETE [dbo].[tbl_feature_logo] WHERE id=@id

CREATE PROC [dbo].[proc_feature_logo_GetById]
	@id int
AS
SELECT * FROM [dbo].[tbl_feature_logo] WHERE id = @id

CREATE PROC [dbo].[proc_feature_logo_insert]
	@username varchar(255),
	@order int
AS
DECLARE @organization nvarchar(255), @logo varchar(255)
SELECT @organization= dbo.fn_GetProfileElement('OrganizationName',PropertyNames,PropertyValuesString)
	,@logo=dbo.fn_GetProfileElement('Logo',PropertyNames,PropertyValuesString) FROM dbo.aspnet_Profile p 
	INNER JOIN dbo.aspnet_Users us
ON p.UserId=us.UserId AND dbo.fn_GetProfileElement('Logo',PropertyNames,PropertyValuesString)!='NULL' AND us.username=@username
INSERT INTO [dbo].[tbl_feature_logo](OrganizationName,logo,username,SortOrder) 
VALUES(@organization,@logo,@username,@order)

EXEC [dbo].[proc_feature_logo_insert] 'newstar_vietnam@yahoo.com.vn',11
EXEC [dbo].[proc_feature_logo_insert] 'luanvt@trithucmoi.co',12
EXEC [dbo].[proc_feature_logo_insert] 'hien@cleverlearnvietnam.vn',13
EXEC [dbo].[proc_feature_logo_insert] 'toquyen16112003@gmail.com',14
EXEC [dbo].[proc_feature_logo_insert] 'Singapore International School',15
EXEC [dbo].[proc_feature_logo_insert] 'IECE',16

SELECT * FROM [dbo].[tbl_feature_logo] group by organizationname

---------------------------------services----------------------------

create table [dbo].[tbl_service_article]
(
	id int primary key identity(1,1),
	parentId int default 0,
	title nvarchar(255),
	maincontent	nvarchar(max),
	createdDate datetime default getdate(),
	displayOnMenu bit default 1,
	displayOrder int default 1,
	active bit default 1
)
GO

CREATE PROC [dbo].[proc_service_acticle_insert]
	@parentId int,
	@title nvarchar(255),
	@maincontent nvarchar(max),
	@displayOnMenu bit ,
	@displayOrder int,
	@active bit 
AS
INSERT INTO [dbo].[tbl_service_article](parentId,title,maincontent,displayOnMenu,displayOrder,active)
	VALUES(@parentId,@title,@maincontent,@displayOnMenu,@displayOrder,@active)
GO

CREATE PROC [dbo].[proc_service_article_delete]
	@id int
AS
DELETE FROM [dbo].[tbl_service_article] WHERE id = @id

CREATE PROC [dbo].[proc_service_article_getArticleById]
	@id int
AS
SELECT * FROM [dbo].[tbl_service_article] WHERE id = @id

CREATE PROC [dbo].[proc_service_article_hasParentNotRoot]
	@id int
AS
SELECT parentId FROM [dbo].[tbl_service_article] where id=@id AND parentId!=0 AND active=1

CREATE PROC [dbo].[proc_service_article_GetSubArtiles]
	@id int
AS
SELECT * FROM [dbo].[tbl_service_article] where parentid=@id  AND active=1

EXEC [dbo].[proc_service_article_GetSubArtiles] 1

CREATE PROC [dbo].[proc_service_article_updateArticleById]
	@id int,
	@parentId int,
	@title nvarchar(255),
	@maincontent nvarchar(max),
	@displayOnMenu bit ,
	@displayOrder int,
	@active bit 
AS
UPDATE [dbo].[tbl_service_article] 
SET parentId=@parentId, 
	title=@title, 
	maincontent=@maincontent, 
	displayOnMenu=@displayOnMenu, 
	displayOrder=@displayOrder, 
	active=@active 
WHERE id=@id


EXEC [dbo].[proc_service_article_getArticleById] 1

-----------------------------------

CREATE TABLE [dbo].[tbl_Internship_UserSubmit]
(
	id int primary key identity(1,1),
	title nvarchar(255),
	firstname nvarchar(255),
	lastname nvarchar(255),
	email varchar(255),
	country nvarchar(255),
	phone varchar(255),
	whenshouldwecall nvarchar(255),
	created datetime default getdate()
)
CREATE PROC [dbo].[proc_Internship_UserSubmit_Insert]
	@title nvarchar(255),
	@firstname nvarchar(255),
	@lastname nvarchar(255),
	@email varchar(255),
	@country nvarchar(255),
	@phone varchar(255),
	@whenshouldwecall nvarchar(255)
AS
INSERT INTO [dbo].[tbl_Internship_UserSubmit](title,firstname,lastname,email,country,phone,whenshouldwecall)
	VALUES(@title,@firstname,@lastname,@email,@country,@phone,@whenshouldwecall)



CREATE TABLE [dbo].[tbl_Intership]
(
	id int primary key identity(1,1),
	articleName NVARCHAR(255),
	articleIntroduction NVARCHAR(MAX),
	articleContent NVARCHAR(MAX),
	createdDate datetime default getdate(),
	active bit default 0
)
CREATE TABLE [dbo].[tbl_Internship_Guide]
(
	id int primary key identity(1,1),
	title nvarchar(255),
	firstname nvarchar(255),
	lastname nvarchar(255),
	email varchar(255),
	country nvarchar(255),
	phone varchar(255),
	created datetime default getdate()
)
CREATE PROC [dbo].[proc_Internship_Guide_Insert]
	@title nvarchar(255),
	@firstname nvarchar(255),
	@lastname nvarchar(255),
	@email varchar(255),
	@country nvarchar(255),
	@phone varchar(255)
AS
INSERT INTO [dbo].[tbl_Internship_Guide](title,firstname,lastname,email,country,phone)
	VALUES(@title,@firstname,@lastname,@email,@country,@phone)


select * FROM [dbo].[tbl_Internship_Guide]

SELECT * FROM tbl_Internship_Guide

CREATE PROC [dbo].[proc_getAllIntership]
AS
SELECT * FROM tbl_Intership order by id asc

CREATE PROC [dbo].[proc_deleteAIntershipArticle]
	@id int
AS
DELETE tbl_Intership WHERE id=@id

CREATE PROC [dbo].[proc_insertIntership]
	@articleName NVARCHAR(255),
	@articleIntroduction NVARCHAR(MAX),
	@articleContent NVARCHAR(MAX),
	@active bit
AS
INSERT INTO tbl_Intership(articleName,articleIntroduction,articleContent,active) 
	VALUES(@articleName,@articleIntroduction,@articleContent,@active)

CREATE PROC [dbo].[proc_getIntershipById]
	@id int
AS
SELECT * FROM tbl_Intership WHERE id=@id

CREATE PROC [dbo].[proc_UpdateInternship]
	@id int,
	@articleName NVARCHAR(255),
	@articleIntroduction NVARCHAR(MAX),
	@articleContent NVARCHAR(MAX),
	@active bit
AS
UPDATE tbl_Intership SET articleName=@articleName , articleIntroduction=@articleIntroduction , articleContent=@articleContent , active=@active WHERE id=@id


ALTER PROC [dbo].[proc_GetCoursesByLocation]
	@city nvarchar(100)
AS
SELECT
	tc_id
	tc_empId ,
	tc_certificate,
	tc_length ,
	tc_timetable ,
	tc_cost ,
	tc_entryRequirement ,
	tc_contact ,
	tc_courseContent ,
	tc_teacherBenefit ,
	tc_viewCount ,
	tc_premium ,
	tc_active
FROM aspnet_Profile p INNER JOIN [dbo].[tbl_TrainingCourse] tc
ON p.UserId=tc.tc_empId
WHERE dbo.fn_GetProfileElement('Organization.City',PropertyNames,PropertyValuesString) = @city
AND tc_active=1

EXEC [dbo].[proc_GetCoursesByLocation] 'Ha Noi'


ALTER PROC [dbo].[proc_InsertTrainingCourse]
	@tc_empId uniqueidentifier,
	@tc_certificate nvarchar(255),
	@tc_length varchar(255),
	@tc_timetable nvarchar(255),
	@tc_cost varchar(200),
	@tc_entryRequirement nvarchar(255),
	@tc_contact nvarchar(255),
	@tc_courseContent text,
	@tc_teacherBenefit text,
	@tc_active bit
AS
INSERT INTO [dbo].[tbl_TrainingCourse](tc_empId,tc_certificate,tc_length,tc_timetable,tc_cost,tc_entryRequirement,tc_contact,tc_courseContent,tc_teacherBenefit,tc_active)
	VALUES(@tc_empId,@tc_certificate,@tc_length,@tc_timetable,@tc_cost,@tc_entryRequirement,@tc_contact,@tc_courseContent,@tc_teacherBenefit,@tc_active)
GO

EXEC [dbo].[proc_InsertTrainingCourse] 
'C2D4FF93-8F93-423A-8A59-2542C0DC5950',
'Certificate',
'2 months',
'timetable',
'1200 USD',
'requirement',
'Mr. Quyen',
'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry',
'teacher benefit',
true
	

SELECT * FROM [dbo].[tbl_TrainingCourse]

CREATE TABLE [dbo].[tbl_TrainingCourse]
(
	tc_id smallint primary key identity(1,1),
	tc_empId uniqueidentifier,
	tc_name nvarchar(255),
	tc_certificate nvarchar(255),
	tc_category int references tbl_Job_Sector(seId),
	tc_location int references tbl_Job_Location(lId),
	tc_length nvarchar(255),
	tc_timetable nvarchar(255),
	tc_cost nvarchar(200),
	tc_entryRequirement nvarchar(255),
	tc_contact nvarchar(255),
	tc_courseContent text,
	tc_teacherBenefit text,
	tc_viewCount int default 0,
	tc_premium bit,
	tc_active bit
)
GO



ALTER PROC [dbo].[proc_GetEmployerInfo]
	@userId uniqueidentifier
AS
SELECT 
	dbo.fn_GetProfileElement('Employer.Salutation',PropertyNames,PropertyValuesString) +' '+
	dbo.fn_GetProfileElement('Employer.FirstName',PropertyNames,PropertyValuesString) +' '+
	dbo.fn_GetProfileElement('Employer.MiddleName',PropertyNames,PropertyValuesString)+' '+
	dbo.fn_GetProfileElement('Employer.LastName',PropertyNames,PropertyValuesString) AS OrganizationName,
	dbo.fn_GetProfileElement('Employer.Phone',PropertyNames,PropertyValuesString) AS Phone,
	dbo.fn_GetProfileElement('Employer.PersonalImage',PropertyNames,PropertyValuesString) AS PersonalImage,
	dbo.fn_GetProfileElement('Organization.OrganizationName',PropertyNames,PropertyValuesString) AS OrganizationName,
	dbo.fn_GetProfileElement('Organization.Logo',PropertyNames,PropertyValuesString) AS Logo,
	dbo.fn_GetProfileElement('Organization.Website',PropertyNames,PropertyValuesString) AS Website,
	dbo.fn_GetProfileElement('Organization.OrganizationType',PropertyNames,PropertyValuesString) AS OrgType,
	dbo.fn_GetProfileElement('Organization.Address1',PropertyNames,PropertyValuesString) AS [Address],
	dbo.fn_GetProfileElement('Organization.FaxNumber',PropertyNames,PropertyValuesString) AS FaxNumber,
	dbo.fn_GetProfileElement('Organization.PhoneNumber1',PropertyNames,PropertyValuesString) AS PhoneNumber,
	dbo.fn_GetProfileElement('Organization.City',PropertyNames,PropertyValuesString) AS City,
	dbo.fn_GetProfileElement('Organization.Country',PropertyNames,PropertyValuesString) AS Country,
	dbo.fn_GetProfileElement('Organization.ZipCode',PropertyNames,PropertyValuesString) AS ZipCode,
	dbo.fn_GetProfileElement('Organization.BriefInfo',PropertyNames,PropertyValuesString) AS BriefInfo,
	dbo.fn_GetProfileElement('Organization.SchoolType',PropertyNames,PropertyValuesString) AS SchoolType
FROM 
	aspnet_Profile
WHERE 
	UserId=@userId

EXEC [dbo].[proc_GetEmployerInfo] 'C2D4FF93-8F93-423A-8A59-2542C0DC5950'



ALTER PROC [dbo].[proc_GetEmployerByCity]
	@city varchar(100)
AS
SELECT
	UserId,
	dbo.fn_GetProfileElement('OrganizationName',PropertyNames,PropertyValuesString) AS OrganizationName,
	dbo.fn_GetProfileElement('OrganizationType',PropertyNames,PropertyValuesString) AS OrganizationType,
	dbo.fn_GetProfileElement('SchoolType',PropertyNames,PropertyValuesString) AS SchoolType  
FROM
	aspnet_Profile
WHERE dbo.fn_GetProfileElement('OrganizationName',PropertyNames,PropertyValuesString) != 'NULL'
	AND dbo.fn_GetProfileElement('City',PropertyNames,PropertyValuesString) = @city

EXEC [dbo].[proc_GetEmployerByCity] 'Ha Noi'

CREATE TABLE tbl_Lang
(
	lang_Id int primary key identity(1,1),
	lang_name_en varchar(50),
	lang_name_vi nvarchar(50),
)
CREATE TABLE tbl_Langlvl
(
	langlvl_Id int primary key identity(1,1),
	langlvl_name_en varchar(50),
	langlvl_name_vi nvarchar(50),
)
INSERT INTO tbl_Langlvl(langlvl_name_en) VALUES ('Native')
INSERT INTO tbl_Langlvl(langlvl_name_en) VALUES ('Beginner')
INSERT INTO tbl_Langlvl(langlvl_name_en) VALUES ('Intermediate')
INSERT INTO tbl_Langlvl(langlvl_name_en) VALUES ('Advanced')

ALTER VIEW view_GetLanglvl_en
AS
SELECT langlvl_Id,langlvl_name_en,langlvl_name_vi FROM tbl_Langlvl

SELECT * FROM view_GetLanglvl_en

ALTER VIEW view_GetLang_en
AS
SELECT TOP(300) lang_Id,lang_name_en,lang_name_vi FROM tbl_Lang ORDER BY lang_name_en ASC

SELECT * FROM view_GetLang_en

SELECT j.jId,j.jTitle_en,t2.Username,t2.OrganizationName,t2.Logo,j.jSalary_en,j.jLocation_en,j.jUploadDate,j.jClosingDate,j.jSector_en,j.jcitizenship_en,j.jEmploymentType_en,j.jViewCount FROM tbl_TeachingJob j INNER JOIN (SELECT us.UserId,us.Username,dbo.fn_GetProfileElement('Logo',PropertyNames,PropertyValuesString) AS Logo ,dbo.fn_GetProfileElement('OrganizationName',PropertyNames,PropertyValuesString) AS OrganizationName FROM dbo.aspnet_Profile p INNER JOIN dbo.aspnet_Users us ON p.UserId=us.UserId) t2 ON t2.UserId=j.jEmployer WHERE j.jClosingDate>getdate()

select * from View_GetFeaturedJobs
select * from tbl_SaveJob
CREATE TABLE tbl_Applicants(
	id,jId,
)
CREATE TABLE tbl_SaveJob
(
	id INT PRIMARY KEY IDENTITY(1,1),
	candidate uniqueidentifier REFERENCES aspnet_Users(UserId),
	jId INT REFERENCES tbl_TeachingJob(jId),
	savedate datetime default getdate(),
	stt nvarchar(100)
)
ALTER TABLE tbl_SaveJob
ADD fullname nvarchar(100)
ALTER TABLE tbl_SaveJob
ADD readbefore bit DEFAULT 0
ALTER TABLE tbl_SaveJob
ADD favorite bit DEFAULT 0

ALTER PROC proc_InsertSaveJob
	@candidate uniqueidentifier,
	@jId int,
	@fullname nvarchar(100)
AS
INSERT INTO tbl_SaveJob(candidate,jid,fullname) VALUES(@candidate,@jId,@fullname)

EXEC proc_InsertSaveJob '1d49a2e8-1eea-4004-be1c-4294a9f52627',45,'Cooker'
SELECT * FROM tbl_SaveJob

CREATE PROC proc_DeleteSaveJob
	@id int
AS
DELETE FROM tbl_SaveJob WHERE id=@id

EXEC proc_DeleteSaveJob 4

Alter PROC proc_GetSaveJobs
	@candidate uniqueidentifier
AS
SELECT sj.id,sj.candidate,sj.jid,sj.savedate,sj.stt,t3.jTitle_en,t3.OrganizationName,t3.jClosingDate FROM tbl_SaveJob sj INNER JOIN 
(SELECT j.jId,j.jTitle_en,t2.OrganizationName,jEmployer,jClosingDate FROM tbl_TeachingJob j INNER JOIN 
		(SELECT us.UserId, dbo.fn_GetProfileElement('OrganizationName',PropertyNames,PropertyValuesString) AS OrganizationName 
			FROM dbo.aspnet_Profile p INNER JOIN dbo.aspnet_Users us ON p.UserId=us.UserId) t2
		 ON t2.UserId=j.jEmployer) t3
	ON sj.jid = t3.jid
WHERE sj.candidate = @candidate 
ORDER BY sj.savedate desc

EXEC proc_GetSaveJobs '1d49a2e8-1eea-4004-be1c-4294a9f52627'

SELECT aspnetuser.UserName FROM tbl_SaveJob sj INNER JOIN dbo.aspnet_Users aspnetuser
ON sj.candidate = aspnetuser.UserId

ALTER PROC proc_GetApplicants
	@jId int
AS
SELECT t1.id,t1.candidate,t1.jid,t1.savedate,t1.stt,j.jTitle_en,j.jClosingDate,t1.UserName,t1.fullname,t1.readbefore,t1.favorite FROM tbl_TeachingJob j 
	INNER JOIN
		(SELECT sj.id,sj.candidate,sj.jid,sj.savedate,sj.stt,us.UserName,sj.fullname,sj.readbefore,sj.favorite FROM tbl_SaveJob sj 
			INNER JOIN
				dbo.aspnet_Users us 
			ON sj.candidate=us.UserId) t1
	ON j.jid=t1.jId
WHERE t1.jid=@jId
ORDER BY  t1.savedate DESC

EXEC proc_GetApplicants 45

CREATE PROC proc_MarkAsRead
	@id int,
	@readbefore bit
AS	
UPDATE tbl_SaveJob SET readbefore = @readbefore WHERE id = @id

EXEC proc_MarkAsRead 49,true

CREATE PROC proc_MarkAsInterest
	@id int,
	@favorite bit
AS	
UPDATE tbl_SaveJob SET favorite = @favorite WHERE id = @id

EXEC proc_MarkAsInterest 54,true
SELECT * FROM tbl_SAVEJOB

CREATE PROC proc_NoOfInterested
	@userId uniqueidentifier
AS
SELECT COUNT(id) AS NoOfInterested FROM tbl_SAVEJOB WHERE favorite = 1 AND candidate =@userId
	
EXEC proc_NoOfInterested '19C92C1A-B6C0-4333-9734-B646148F311A'

SELECT tj.jid,tj.jemployer,tj.jtitle_en,sj.candidate,sj.readbefore from tbl_teachingjob tj
	INNER JOIN tbl_SaveJob sj
	ON tj.jid=sj.jid
WHERE tj.jemployer = '2F40A5A8-5F79-4CCB-92DE-C16BA177CE08' AND (sj.readbefore=0 or sj.readbefore is null)

ALTER PROC proc_NoOfUnread
	@employerId uniqueidentifier
AS
SELECT COUNT(readbefore) AS NoOfUnread from tbl_teachingjob tj
	INNER JOIN tbl_SaveJob sj
	ON tj.jid=sj.jid
WHERE tj.jemployer = @employerId AND (sj.readbefore=0 or sj.readbefore is null)

EXEC proc_NoOfUnread '2F40A5A8-5F79-4CCB-92DE-C16BA177CE08'

ALTER PROC proc_AppliedNumber
	@jid int
AS	
select COUNT(candidate) from tbl_SaveJob where jid=@jid

EXEC proc_AppliedNumber 6

CREATE PROC proc_DeleteAnApplicant
	 @id int
As	
delete from tbl_SaveJob WHERE id=@id

SELECT COUNT(readbefore) from tbl_SaveJob WHERE readbefore=0


--------------
alter PROC proc_GetJobByOrgType
	@orgType nvarchar(100)
AS	
SELECT TOP(40) j.jId,j.jTitle_en,t2.OrganizationName,t2.OrganizationType,j.jViewCount 
	FROM tbl_TeachingJob j 
		INNER JOIN 
		(SELECT us.UserId,us.Username,dbo.fn_GetProfileElement('Logo',PropertyNames,PropertyValuesString) AS Logo 
			,dbo.fn_GetProfileElement('OrganizationName',PropertyNames,PropertyValuesString) AS OrganizationName 
			,dbo.fn_GetProfileElement('OrganizationType',PropertyNames,PropertyValuesString) AS OrganizationType 
			FROM dbo.aspnet_Profile p INNER JOIN dbo.aspnet_Users us ON p.UserId=us.UserId) t2
		 ON t2.UserId=j.jEmployer
	WHERE t2.OrganizationType=@orgType AND j.jClosingDate>getdate() AND j.jActive=1

EXEC proc_GetJobByOrgType 'Private Tutor'
	
create table tbl_SlideshowImage
(
	ss_id int primary key identity(1,1),
	ss_img varchar(100) unique,
	ss_description nvarchar(max)	
)
INSERT INTO tbl_SlideshowImage VALUES('img1','<h3>Grass Blades</h3>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ')
INSERT INTO tbl_SlideshowImage VALUES('img2','<h3>Flowing Rock</h3>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.')
INSERT INTO tbl_SlideshowImage VALUES('img3','<h3>Ladybug</h3>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.')
INSERT INTO tbl_SlideshowImage VALUES('img4','<h3>Lightning</h3>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.')
INSERT INTO tbl_SlideshowImage VALUES('img5','<h3>Lotus</h3>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.')

select * from tbl_SlideshowImage
CREATE table tbl_CV
(
	cv_Id int primary key identity(1,1),
	cv_UserId uniqueidentifier REFERENCES aspnet_Users(UserId),
	cv_EduLevel_en varchar(100) default 'N/A',
	cv_EduLevel_vi nvarchar(100) default 'N/A',
	cv_Major_en varchar(100) default 'N/A',
	cv_Major_vi nvarchar(100) default 'N/A',
	cv_YearsOfExp_en varchar(100) default 'N/A',
	cv_YearsOfExp_vi nvarchar(100) default 'N/A',
	cv_Achievement_en varchar(100) default 'N/A',
	cv_Achievement_vi nvarchar(100) default 'N/A',
	cv_Skill_en varchar(100) default 'N/A',
	cv_Skill_vi nvarchar(100) default 'N/A',
	cv_RelatedExperience_en varchar(100) default 'N/A',
	cv_RelatedExperience_vi nvarchar(100) default 'N/A',
	cv_SpokenLang_en varchar(100) default 'N/A',
	cv_SpokenLang_vi nvarchar(100) default 'N/A',
	cv_Membership_en varchar(100) default 'N/A',
	cv_Membership_vi nvarchar(100) default 'N/A',
	cv_DesiredTravel_en varchar(100) default 'N/A',
	cv_DesiredTravel_vi nvarchar(100) default 'N/A',
	cv_DesiredCate_en varchar(100) default 'N/A',
	cv_DesiredCate_vi nvarchar(100) default 'N/A',
	cv_DesiredJobLevel_en varchar(100) default 'N/A',
	cv_DesiredJobLevel_vi nvarchar(100) default 'N/A',
	cv_SalaryExpectation_en varchar(100) default 'N/A',
	cv_SalaryExpectation_vi nvarchar(100) default 'N/A',
	cv_WillingToRelocate_en varchar(100) default 'N/A',
	cv_WillingToRelocate_vi nvarchar(100) default 'N/A',
	cv_DesiredLocation_en varchar(100) default 'N/A',
	cv_DesiredLocation_vi nvarchar(100) default 'N/A',
	cv_HowSoon_en varchar(100) default 'N/A',
	cv_HowSoon_vi nvarchar(100) default 'N/A',
	cv_UploadDate datetime not null default getdate()
)

SELECT * FROM View_GetTop6CV

ALTER VIEW View_GetTop6CV
AS
SELECT TOP (6) cv.cv_Id, t2.UserName, t2.Logo,cv.cv_Major_en,cv.cv_UploadDate
FROM  dbo.tbl_CV AS cv INNER JOIN
                   (SELECT us.UserId, us.UserName, dbo.fn_GetProfileElement(N'Avatar', p.PropertyNames, p.PropertyValuesString) AS Logo
                    FROM   dbo.aspnet_Profile AS p INNER JOIN
                                   dbo.aspnet_Users AS us ON p.UserId = us.UserId) AS t2 ON t2.UserId = cv.cv_UserId
ORDER BY cv.cv_UploadDate DESC

ALTER PROC porc_GetFullnameFromUserId_Emp
	@userId uniqueidentifier
AS 
SELECT us.UserId, us.UserName,
			dbo.fn_GetProfileElement(N'Employer.FirstName', p.PropertyNames, p.PropertyValuesString) AS Firstname
		, dbo.fn_GetProfileElement(N'Employer.MiddleName', p.PropertyNames, p.PropertyValuesString) AS MiddleName
		, dbo.fn_GetProfileElement(N'Employer.LastName', p.PropertyNames, p.PropertyValuesString) AS Lastname											
	FROM   dbo.aspnet_Profile AS p 
	INNER JOIN
		   dbo.aspnet_Users AS us 
	ON p.UserId = us.UserId
WHERE p.UserId=@userId
EXEC porc_GetFullnameFromUserId_Emp '2F40A5A8-5F79-4CCB-92DE-C16BA177CE08'	

'2F40A5A8-5F79-4CCB-92DE-C16BA177CE08'	--luanvt
'19C92C1A-B6C0-4333-9734-B646148F311A'  --Iceberg

ALTER PROC proc_GetTop16CV
AS
DECLARE @temp TABLE(
	id int identity(1,1),
	userId uniqueidentifier,
	userName nvarchar(100),
	firstname nvarchar(100),
	lastname nvarchar(100),
	logo varchar(100),
	CreatedDate datetime,
	Major nvarchar(100),
	Searchable bit,
	Active bit
)
INSERT INTO @temp(UserId,userName,firstname,lastname,logo,CreatedDate,Major,Searchable,Active)
SELECT us.UserId, us.UserName
			, dbo.fn_GetProfileElement(N'Employee.FirstName', p.PropertyNames, p.PropertyValuesString) AS Firstname
			, dbo.fn_GetProfileElement(N'Employee.LastName', p.PropertyNames, p.PropertyValuesString) AS Lastname
			, dbo.fn_GetProfileElement(N'Avatar', p.PropertyNames, p.PropertyValuesString) AS Logo
			, dbo.fn_GetProfileElement(N'CreateDate', p.PropertyNames, p.PropertyValuesString) AS CreateDate
			, dbo.fn_GetProfileElement(N'Major', p.PropertyNames, p.PropertyValuesString) AS Major
			, dbo.fn_GetProfileElement(N'Searchable', p.PropertyNames, p.PropertyValuesString) AS Searchable												
			, dbo.fn_GetProfileElement(N'Active', p.PropertyNames, p.PropertyValuesString) AS Active
	FROM   dbo.aspnet_Profile AS p 
	INNER JOIN
		   dbo.aspnet_Users AS us 
	ON p.UserId = us.UserId
SELECT TOP (16) UserId,userName,logo,Major,CreatedDate,firstname,lastname FROM @temp	
	WHERE Searchable = 1 AND Active = 1 ORDER BY CreatedDate DESC

EXEC proc_GetTop16CV


SELECT * FROM View_GetTop16CV

SELECT *
FROM  dbo.tbl_CV AS cv INNER JOIN
   (SELECT us.UserId, us.UserName, dbo.fn_GetProfileElement(N'Avatar', p.PropertyNames, p.PropertyValuesString) AS Logo
    FROM   dbo.aspnet_Profile AS p INNER JOIN
                   dbo.aspnet_Users AS us ON p.UserId = us.UserId) AS t2 ON t2.UserId = cv.cv_UserId
select * from tbl_CV

CREATE TABLE tbl_CV_EduLevel
(
	el_id int primary key identity(1,1),
	el_name_en varchar(100),
	el_name_vi nvarchar(100)
)
INSERT INTO tbl_CV_EduLevel(el_name_en)	VALUES('Not specified')
INSERT INTO tbl_CV_EduLevel(el_name_en)	VALUES('High school Not Completed')
INSERT INTO tbl_CV_EduLevel(el_name_en)	VALUES('High school or equivalent')
INSERT INTO tbl_CV_EduLevel(el_name_en)	VALUES('Cirtification')
INSERT INTO tbl_CV_EduLevel(el_name_en)	VALUES('Associate degree')
INSERT INTO tbl_CV_EduLevel(el_name_en)	VALUES('Bachelor’s degree')
INSERT INTO tbl_CV_EduLevel(el_name_en)	VALUES('Master’s degree')
INSERT INTO tbl_CV_EduLevel(el_name_en)	VALUES('Doctorate degree')

CREATE VIEW View_GetEduLevel
AS
SELECT * FROM tbl_CV_EduLevel
 
SELECT * FROM View_GetEduLevel
--
CREATE TABLE tbl_cv_YearsOfExp
(
	yoe_id int primary key identity(1,1),
	yoe_name_en varchar(100),
	yoe_name_vi nvarchar(100)
)
INSERT INTO tbl_cv_YearsOfExp(yoe_name_en) VALUES('Available upon request')
INSERT INTO tbl_cv_YearsOfExp(yoe_name_en) VALUES('Recent graduate')
INSERT INTO tbl_cv_YearsOfExp(yoe_name_en) VALUES('1 year')
INSERT INTO tbl_cv_YearsOfExp(yoe_name_en) VALUES('2 years')
INSERT INTO tbl_cv_YearsOfExp(yoe_name_en) VALUES('3 years')
INSERT INTO tbl_cv_YearsOfExp(yoe_name_en) VALUES('4 years')
INSERT INTO tbl_cv_YearsOfExp(yoe_name_en) VALUES('5 years')
INSERT INTO tbl_cv_YearsOfExp(yoe_name_en) VALUES('More than 5 years')

CREATE VIEW View_GetYearsOfExp
AS
SELECT * FROM tbl_cv_YearsOfExp

SELECT * FROM View_GetYearsOfExp

--

CREATE TABLE tbl_cv_DesiredTravel
(
	dt_id int primary key identity(1,1),
	dt_name_en varchar(100),
	dt_name_vi nvarchar(100)
)
INSERT INTO tbl_cv_DesiredTravel(dt_name_en) VALUES('0% travel')
INSERT INTO tbl_cv_DesiredTravel(dt_name_en) VALUES('25% travel')
INSERT INTO tbl_cv_DesiredTravel(dt_name_en) VALUES('50% travel')
INSERT INTO tbl_cv_DesiredTravel(dt_name_en) VALUES('75% travel')
INSERT INTO tbl_cv_DesiredTravel(dt_name_en) VALUES('100% travel')

CREATE VIEW View_GetDesiredTravel
AS
SELECT * FROM tbl_cv_DesiredTravel

SELECT * FROM View_GetDesiredTravel
--

CREATE TABLE tbl_cv_SalaryExpectation
(
	se_id int primary key identity(1,1),
	se_name_en varchar(100),
	se_name_vi nvarchar(100)
)
INSERT INTO tbl_cv_SalaryExpectation(se_name_en) VALUES('Negotiate')
INSERT INTO tbl_cv_SalaryExpectation(se_name_en) VALUES('3-5')
INSERT INTO tbl_cv_SalaryExpectation(se_name_en) VALUES('5-7')
INSERT INTO tbl_cv_SalaryExpectation(se_name_en) VALUES('7-10')
INSERT INTO tbl_cv_SalaryExpectation(se_name_en) VALUES('over 10')

CREATE VIEW View_GetSalaryExpectation
AS
SELECT * FROM tbl_cv_SalaryExpectation

SELECT * FROM View_GetSalaryExpectation

--
--Not yet created
CREATE TABLE tbl_cv_wilingtorelocate
(
	el_id int primary key identity(1,1),
	el_name_en varchar(100),
	el_name_vi nvarchar(100)
)
INSERT INTO tbl_cv_wilingtorelocate(el_name_en) VALUES('Yes, I would relocate ')
INSERT INTO tbl_cv_wilingtorelocate(el_name_en) VALUES('No')
INSERT INTO tbl_cv_wilingtorelocate(el_name_en) VALUES('It''s depend')

CREATE VIEW View_GetWilingToRelocate
AS
select * from tbl_cv_wilingtorelocate

SELECT * FROM View_GetWilingToRelocate
--

--Proc insert
CREATE PROC Proc_InsertCV
	@cv_UserId uniqueidentifier,
	@cv_EduLevel varchar(100),	
	@cv_Major_en varchar(100),
	@cv_YearsOfExp_en varchar(100),
	@cv_Achievement_en varchar(100),
	@cv_Skill_en varchar(100),
	@cv_RelatedExperience_en varchar(100),
	@cv_SpokenLang_en varchar(100),
	@cv_Membership_en varchar(100),
	@cv_DesiredTravel_en varchar(100),
	@cv_DesiredCate_en varchar(100),
	@cv_DesiredJobLevel_en varchar(100),
	@cv_SalaryExpectation_en varchar(100),
	@cv_WillingToRelocate_en varchar(100),
	@cv_DesiredLocation_en varchar(100),
	@cv_HowSoon_en varchar(100)
AS
INSERT INTO tbl_CV
(
	cv_UserId, cv_EduLevel_en, cv_Major_en, cv_YearsOfExp_en, cv_Achievement_en, cv_Skill_en,
	 cv_RelatedExperience_en, cv_SpokenLang_en, cv_Membership_en, cv_DesiredTravel_en, cv_DesiredCate_en,
	 cv_DesiredJobLevel_en, cv_SalaryExpectation_en, cv_WillingToRelocate_en, cv_DesiredLocation_en,
	 cv_HowSoon_en
) VALUES(
	@cv_UserId,@cv_EduLevel,@cv_Major_en,@cv_YearsOfExp_en,@cv_Achievement_en,@cv_Skill_en,
	@cv_RelatedExperience_en,@cv_SpokenLang_en,@cv_Membership_en,@cv_DesiredTravel_en,@cv_DesiredCate_en,
	@cv_DesiredJobLevel_en,@cv_SalaryExpectation_en,@cv_WillingToRelocate_en,@cv_DesiredLocation_en,
	@cv_HowSoon_en
)
--DEMO EXAMPLE
EXEC Proc_InsertCV 
	'16070F09-6EC2-43DB-A02C-3F5A5A0BD4FB',
	'High school Not Completed',
	'Major',
	'More than 5 years',
	'cv_Achievement_en',
	'cv_Skill_en',
	'cv_RelatedExperience_en',
	'cv_SpokenLang_en',
	'cv_Membership_en',
	'cv_DesiredTravel_en',
	'cv_DesiredCate_en',
	'cv_DesiredJobLevel_en',
	'cv_SalaryExpectation_en',
	'cv_WillingToRelocate_en',
	'cv_DesiredLocation_en',
	'cv_HowSoon_en'

SELECT * FROM tbl_job_citizenship

--


-----------------------Employer ---------------------
Create table tbl_OrganizationType(
	id int primary key identity(1,1),
	typename_en varchar(100),
	typename_vi nvarchar(100)
)

INSERT INTO tbl_OrganizationType(typename_en) values('Pre-K-12')
INSERT INTO tbl_OrganizationType(typename_en) values('Bussiness')
INSERT INTO tbl_OrganizationType(typename_en) values('Language')
INSERT INTO tbl_OrganizationType(typename_en) values('Community Colleges')
INSERT INTO tbl_OrganizationType(typename_en) values('Colleges and universities')
INSERT INTO tbl_OrganizationType(typename_en) values('Outside Accademia')
INSERT INTO tbl_OrganizationType(typename_en) values('Distance Learning')
CREATE VIEW View_GetAllOrganizationType
AS
select * from tbl_OrganizationType

SELECT * from tbl_TeachingJob WHERE jclosingdate>GETDATE()
Create table tbl_Job_SchoolType
(
	stId int primary key identity(1,1),
	stName_en varchar(100),
	stName_vn nvarchar(100)
)
INSERT INTO tbl_Job_SchoolType VALUES ('Kinder Garden',N'Trường mầm non')
INSERT INTO tbl_Job_SchoolType VALUES ('Primary school',N'Trường cấp 1')
INSERT INTO tbl_Job_SchoolType VALUES ('Secondary school',N'Trường cấp 2')
INSERT INTO tbl_Job_SchoolType VALUES ('High school',N'Trường cấp 3')
select *   from tbl_job_Schooltype
UPDATE tbl_TeachingJob SET jSchoolType_en = 'Secondary school' WHERE jid=30
CREATE TABLE tbl_Job_Employer_vi
(
	emId INT PRIMARY KEY IDENTITY(1,1),
	emName NVARCHAR(100) unique,
	emContact nvarchar(100),	
	emIsPremium BIT not null default 0
)
GO
insert into tbl_Job_Employer_vi(emName,emContact) values(N'emname',null)
insert into tbl_Job_Employer_vi(emName,emContact,emIsPremium) values(N'premiumEmployer',null,1)
Select * from tbl_Job_Employer_vi
GO
CREATE TABLE tbl_Job_Location
(
	lId INT PRIMARY KEY IDENTITY(1,1),
	lName_en varchar(100) default null,
	lName_vi Nvarchar(100) default null,
	lParentId int/*Quan*/
)
INSERT INTO tbl_Job_Location(lName_en,lName_vi) VALUES('N/A',N'Không có thông tin')
INSERT INTO tbl_Job_Location(lName_en,lName_vi) VALUES('Cao Bang',N'Cao Bằng')
INSERT INTO tbl_Job_Location(lName_en,lName_vi) VALUES('Lang Son',N'Lạng Sơn')
INSERT INTO tbl_Job_Location(lName_en,lName_vi) VALUES('Ha Noi',N'Hà Nội')
INSERT INTO tbl_Job_Location(lName_en,lName_vi) VALUES('Ho Chi Minh City',N'TP Hồ Chí Minh')
INSERT INTO tbl_Job_Location(lName_en,lName_vi) VALUES('Nghe An',N'Nghệ An')
INSERT INTO tbl_Job_Location(lName_en,lName_vi) VALUES('Hai Phong',N'Hải Phòng')
GO

CREATE TABLE tbl_Job_Sector
(
	seId int primary key identity(1,1),
	seName_en varchar(100) default null,
	seName_vi nvarchar(100) default null,
	seParentId int default 0
)
INSERT INTO tbl_Job_Sector(seName_en,seName_vi) values('Administration',N'Hành Chính')
INSERT INTO tbl_Job_Sector(seName_en,seName_vi) values('From K-12',N'Tiểu học - Phổ thông')
INSERT INTO tbl_Job_Sector(seName_en,seName_vi) values('Academic',N'Đại học')

ALTER PROC Proc_GetSectorChild
	@parentId int
AS
select * from tbl_Job_Sector
	WHERE seParentId = @parentId
	ORDER BY len(seName_en) ASC

SELECT * FROM tbl_job_Location ORDER BY lname_en asc
/*select * from tbl_Job_Sector
	WHERE (SeId = @parentId AND seParentId=0) OR seParentId = @parentId*/
GO
ALTER PROC Proc_GetSectorFull
	@parentId int
AS
select * from tbl_Job_Sector
	WHERE (SeId = @parentId AND seParentId=0) OR seParentId = @parentId
	ORDER BY seName_en ASC

--example
EXEC Proc_GetSectorFull 2

CREATE TABLE tbl_Job_EmploymentType
(
	etId int primary key identity(1,1),
	etName_en varchar(100) default null,
	etName_vi nvarchar(100) default null
)
INSERT INTO tbl_Job_EmploymentType(etName_en) values('Full-Time')
INSERT INTO tbl_Job_EmploymentType(etName_en) values('Temporary full-time')
INSERT INTO tbl_Job_EmploymentType(etName_en) values('Part-time')
INSERT INTO tbl_Job_EmploymentType(etName_en) values('Temporary part-time')
INSERT INTO tbl_Job_EmploymentType(etName_en) values('Practical experience')
INSERT INTO tbl_Job_EmploymentType(etName_en) values('Volunteer')
GO
select * from tbl_teachingjob
/*
UPDATE tbl_Job_EmploymentType
SET etName_vi=N'Bán thời gian' WHERE etId=3
*/
select * from tbl_Job_EmploymentType

CREATE TABLE tbl_Job_JobLevel
(
	jrId int primary key identity(1,1),
	jrName_en varchar(100) default null,
	jrName_vi nvarchar(100) default null
)
INSERT INTO tbl_Job_JobLevel(jrName_en) values('Executive')
INSERT INTO tbl_Job_JobLevel(jrName_en) values('Teacher')
INSERT INTO tbl_Job_JobLevel(jrName_en) values('Staff')
INSERT INTO tbl_Job_JobLevel(jrName_en) values('President')
INSERT INTO tbl_Job_JobLevel(jrName_en) values('Vice president')
INSERT INTO tbl_Job_JobLevel(jrName_en) values('CEO')
INSERT INTO tbl_Job_JobLevel(jrName_en) values('Director')
INSERT INTO tbl_Job_JobLevel(jrName_en) values('Vice president')
INSERT INTO tbl_Job_JobLevel(jrName_en) values('Manager')
INSERT INTO tbl_Job_JobLevel(jrName_en) values('Academic officer')
INSERT INTO tbl_Job_JobLevel(jrName_en) values('Reseacher')
INSERT INTO tbl_Job_JobLevel(jrName_en) values('Academic teacher')
INSERT INTO tbl_Job_JobLevel(jrName_en) values('K-12 teacher')
INSERT INTO tbl_Job_JobLevel(jrName_en) values('Tutor')
GO
select * from tbl_Job_JobLevel

CREATE TABLE tbl_Job_Citizenship
(
	ctId INT PRIMARY KEY IDENTITY(1,1),
	ctName_en VARCHAR(100) default null,
	ctName_vi NVARCHAR(100) default null,
)
/* ALL non-value is not null
CREATE trigger mytrigger on tbl_Job_Citizenship for insert, update as
BEGIN
IF (select max(cnt) from (select count(i.ctName_en)
as cnt from tbl_Job_Citizenship, inserted i where tbl_Job_Citizenship.ctName_en=i.ctName_en group
by i.ctName_en) x) > 1
ROLLBACK TRAN
END
*/
INSERT INTO tbl_Job_Citizenship VALUES('United States',N'Mỹ')
INSERT INTO tbl_Job_Citizenship VALUES('United Kingdom',N'Anh')
INSERT INTO tbl_Job_Citizenship VALUES('New Zealand',N'New Zealand')
INSERT INTO tbl_Job_Citizenship VALUES('Ireland',N'Ai len')
INSERT INTO tbl_Job_Citizenship VALUES('Canada',N'Canada')
INSERT INTO tbl_Job_Citizenship VALUES('Australia',N'Úc')
INSERT INTO tbl_Job_Citizenship VALUES('South of Africa',N'Nam Phi')
INSERT INTO tbl_Job_Citizenship VALUES('Vietnam',N'Việt Nam')
INSERT INTO tbl_Job_Citizenship VALUES('Japan',N'Nhật Bản')
INSERT INTO tbl_Job_Citizenship VALUES('China',N'Trung Quốc')
INSERT INTO tbl_Job_Citizenship VALUES('France',N'Pháp')
INSERT INTO tbl_Job_Citizenship VALUES('Russia',N'Nga')
INSERT INTO tbl_Job_Citizenship VALUES('South Korea',N'Hàn Quốc')
INSERT INTO tbl_Job_Citizenship VALUES('Thailand',N'Thái Lan')
/*INSERT INTO tbl_Job_Citizenship VALUES('',N'')*/
SELECT * FROM tbl_job_Location ORDER BY lname_en asc
--main table
CREATE TABLE tbl_Job
(
	jId INT PRIMARY KEY IDENTITY(1,1),
	jTitle_en VARCHAR(100) NOT NULL,
	jTitle_vi NVARCHAR(100),
	jDescription_en VARCHAR(MAX),
	jDescription_vi NVARCHAR(MAX),
	jEmployer uniqueidentifier REFERENCES aspnet_Users(UserId),
	jLocation INT REFERENCES tbl_Job_Location(lId),
	jSalary_en decimal default 0,
	jSalary_vi decimal default 0,
	jSector INT REFERENCES tbl_Job_Sector(seId),
	jJobLevel INT REFERENCES tbl_Job_JobLevel(jrId),
	jEmploymentType INT REFERENCES tbl_Job_EmploymentType(etId),
	jEducationRequirement_en varchar(MAX),
	jEducationRequirement_vi nvarchar(MAX),
	jOtherBenefits_en varchar(MAX),
	jOtherBenefits_vi nvarchar(MAX),
	jMinimumExp_en varchar(100),
	jMinimumExp_vi varchar(100),
	jGender_en BIT default 0,
	jGender_vi BIT default 0,
	jContact varchar(100),
	jClosingDate DATETIME,
	jUploadDate DATETIME not null default getdate(),
	jFeaturedJob BIT not null default 0,
	jViewCount INT DEFAULT 0,
)

CREATE VIEW view_Membership
AS
SELECT TOP(1000) u.UserName,t1.RoleName,u.LastActivityDate FROM aspnet_Users u
	INNER JOIN
	(SELECT uir.UserId, uir.RoleId,r.RoleName FROM aspnet_UsersInRoles uir 
		INNER JOIN aspnet_Roles r ON uir.RoleId=r.RoleId) t1
	ON u.UserId=t1.UserId
ORDER BY u.LastActivityDate DESC

SELECT * FROM view_Membership
---------------------QUERY DU LIEU _---------------------
Alter VIEW View_GetFeaturedJobs
AS
SELECT TOP(12) j.jId,j.jTitle_en,t2.logo,t2.Username,t2.OrgName FROM tbl_TeachingJob j 
	INNER JOIN
		(SELECT us.UserId,us.Username
			,dbo.fn_GetProfileElement('OrganizationName',PropertyNames,PropertyValuesString) AS OrgName
			,dbo.fn_GetProfileElement('Logo',PropertyNames,PropertyValuesString) AS Logo FROM dbo.aspnet_Profile p 
			INNER JOIN dbo.aspnet_Users us
		ON p.UserId=us.UserId) t2
	ON t2.UserId=j.jEmployer
	WHERE j.jClosingDate>GETDATE()-60 AND j.jActive=1
	ORDER BY jViewCount DESC

select * from 	View_GetFeaturedJobs

select top(12) * from tbl_teachingjob where jClosingDate>GETDATE() and jActive=1 order by jviewcount desc

CREATE VIEW View_GetExecutiveFeaturedJobs
AS
SELECT TOP(12) j.jId,j.jTitle_en,t2.logo,t2.Username,j.jClosingDate FROM tbl_TeachingJob j 
	INNER JOIN
		(SELECT us.UserId,us.Username,dbo.fn_GetProfileElement('Logo',PropertyNames,PropertyValuesString) AS Logo FROM dbo.aspnet_Profile p 
			INNER JOIN dbo.aspnet_Users us
		ON p.UserId=us.UserId) t2
	ON t2.UserId=j.jEmployer
	WHERE j.jJobLevel_en='executive'
	ORDER BY jViewCount DESC

ALTER VIEW View_GetNewestJobs
AS
SELECT TOP(6) j.jId,j.jTitle_en,t2.OrgName,t2.Username,j.jClosingDate FROM tbl_TeachingJob j 
	INNER JOIN
		(SELECT us.UserId,us.Username
			,dbo.fn_GetProfileElement('OrganizationName',PropertyNames,PropertyValuesString) AS OrgName
			,dbo.fn_GetProfileElement('Logo',PropertyNames,PropertyValuesString) AS Logo FROM dbo.aspnet_Profile p 
			INNER JOIN dbo.aspnet_Users us
		ON p.UserId=us.UserId) t2
	ON t2.UserId=j.jEmployer
	WHERE j.jClosingDate>GETDATE() AND j.jActive=1
	ORDER BY jUploadDate DESC

ALTER VIEW View_GetAllJobBySector
 AS
SELECT TOP(8) j.jId,j.jTitle_en,t2.Username,j.jSalary_en,j.jClosingDate,j.jSector_en FROM tbl_TeachingJob j 
	INNER JOIN
		(SELECT us.UserId,us.Username,dbo.fn_GetProfileElement('Logo',PropertyNames,PropertyValuesString) AS Logo FROM dbo.aspnet_Profile p 
			INNER JOIN dbo.aspnet_Users us
		ON p.UserId=us.UserId) t2
	ON t2.UserId=j.jEmployer 
	ORDER BY juploaddate DESC

SELECT * FROM	View_GetAllJobBySector
	
CREATE VIEW View_GetAllExecutiveJob
AS
SELECT TOP(8) j.jId,j.jTitle_en,t2.Username,t2.OrganizationName,j.jClosingDate,j.jUploadDate FROM tbl_TeachingJob j 
	INNER JOIN
		(SELECT us.UserId,us.Username,dbo.fn_GetProfileElement('OrganizationName',PropertyNames,PropertyValuesString) AS OrganizationName					
		 FROM dbo.aspnet_Profile p 
			INNER JOIN dbo.aspnet_Users us
		ON p.UserId=us.UserId) t2
	ON t2.UserId=j.jEmployer 
	WHERE j.jjoblevel_en='executive'
	ORDER BY j.jUploadDate DESC
	
select top(5) * from view_getallexecutivejob	

select jemployer,jexecutivejob from tbl_teachingjob
SELECT * from tbl_job_sector
--fOR Executivejob.aspx	
ALTER PROC proc_GetJobsBySectorIdAndExecutive
	@SectorId int,
	@jExecutiveJob bit
AS	
SELECT  b.jid,b.jtitle_en,b.jClosingDate,b.jSalaryType,b.jSalary_en,b.jSalaryTo_en,b.jSalaryCurrency,b.jSalaryPaymentType FROM 
	(
select DISTINCT TOP(16) tj.jid,tj.jtitle_en,tj.jClosingDate,tj.jSalaryType,tj.jSalary_en,tj.jSalaryTo_en,tj.jSalaryCurrency,tj.jSalaryPaymentType,tj.juploaddate
	 from tbl_job_sector se INNER JOIN tbl_teachingjob tj 
	 on se.seName_en = tj.jSector_en OR se.seName_en=tj.jSector_en2 OR se.seName_en=tj.jSector_en3
	WHERE se.seParentId=@SectorId AND tj.jExecutiveJob=@jExecutiveJob AND tj.jClosingDate>getdate()  AND tj.jActive=1
	) b
	ORDER BY b.juploaddate DESC


EXEC proc_GetJobsBySectorIdAndExecutive 2,1
EXEC proc_GetJobsBySectorIdAndExecutive 3,1

SELECT * FROM tbl_job_sector

ALTER VIEW view_GetAllExecutiveJobs
AS
select TOP(16) jid,jtitle_en,jClosingDate,jSalaryType,jSalary_en,jSalaryTo_en,jSalaryCurrency,jSalaryPaymentType
FROM tbl_teachingjob WHERE jExecutiveJob=1 AND jClosingDate>getdate() AND jActive=1 ORDER BY juploaddate DESC
SELECT * FROM view_GetAllJobs
SELECT * FROM view_GetAllExecutiveJobs
--fOR jobsector.aspx
ALTER PROC proc_GetJobsBySectorId
	@SectorId int
AS
SELECT b.jid,b.jtitle_en,b.jClosingDate,b.jSalaryType,b.jSalary_en,b.jSalaryTo_en,b.jSalaryCurrency,b.jSalaryPaymentType FROM 
	(	
	select DISTINCT TOP(16) tj.jid,tj.jtitle_en,tj.jClosingDate,tj.jSalaryType,tj.jSalary_en,tj.jSalaryTo_en,tj.jSalaryCurrency,tj.jSalaryPaymentType,tj.juploaddate
		 from tbl_job_sector se INNER JOIN tbl_teachingjob tj 
		 on se.seName_en = tj.jSector_en OR se.seName_en=tj.jSector_en2 OR se.seName_en=tj.jSector_en3
		WHERE se.seParentId=@SectorId AND tj.jActive=1 AND tj.jClosingDate>getdate() AND jExecutiveJob=0 
	) b
	ORDER BY b.juploaddate DESC

EXEC proc_GetJobsBySectorId 3
 
SELECT * FROM tbl_teachingJob

ALTER VIEW view_GetAllJobs
AS
select TOP(16) jid,jtitle_en,jClosingDate,jSalaryType,jSalary_en,jSalaryTo_en,jSalaryCurrency,jSalaryPaymentType FROM tbl_teachingjob  WHERE jClosingDate>getdate() AND jExecutiveJob=0 AND jActive=1 ORDER BY juploaddate DESC	
----------------------------	
ALTER PROC proc_GetJobBySector
	@Sector nvarchar(100),
	@jExecutiveJob bit
AS	
	SELECT TOP(8) j.jId,j.jTitle_en,t2.Username,j.jSalary_en,j.jClosingDate,j.jSector_en,j.jExecutiveJob FROM tbl_TeachingJob j 
		INNER JOIN
			(SELECT us.UserId,us.Username,dbo.fn_GetProfileElement('Logo',PropertyNames,PropertyValuesString) AS Logo 
				FROM dbo.aspnet_Profile p 
				INNER JOIN dbo.aspnet_Users us
			ON p.UserId=us.UserId) t2
		ON t2.UserId=j.jEmployer 
	WHERE j.jSector_en=@Sector AND j.jExecutiveJob=@jExecutiveJob
	ORDER BY jViewCount DESC

EXEC proc_GetJobBySector 'Admisnistration',true


SELECT j.jId,j.jTitle_en,t2.Username,t2.OrganizationName,t2.Logo,j.jSalary_en,j.jLocation_en,j.jUploadDate,j.jClosingDate,j.jSector_en,j.jJobLevel_en,j.jEmploymentType_en,j.jViewCount FROM tbl_TeachingJob j 
		INNER JOIN
			(SELECT us.UserId,us.Username,dbo.fn_GetProfileElement('Logo',PropertyNames,PropertyValuesString) AS Logo 
										 ,dbo.fn_GetProfileElement('OrganizationName',PropertyNames,PropertyValuesString) AS OrganizationName 
				FROM dbo.aspnet_Profile p 
				INNER JOIN dbo.aspnet_Users us
			ON p.UserId=us.UserId) t2
		ON t2.UserId=j.jEmployer 
	ORDER BY jviewcount desc
	
SELECT * FROM Tbl_teachingjob

alter PROC proc_GetDetailJobById
	@id int
AS
SELECT j.jId,
			t2.OrganizationName,
			t2.BriefInfo,
			t2.Logo,
			t2.Address1,
			t2.PhoneNumber1,
			t2.Website,
			t2.Username,
			j.jEmailToApplication, 
			j.jTitle_en,
			j.jUploadDate,
			j.jClosingDate,
			j.jDescription_en,
			j.jSector_en,
			j.jSector_en2,
			j.jSector_en3,
			j.jLocation_en,
			j.jLocation_en2,
			j.jLocation_en3,
			j.jSalaryType,
			j.jSalary_en,
			j.jSalaryTo_en,
			j.jSalaryCurrency,
			j.jSalaryPaymentType,
			j.jCitizenship_en,
			j.jJobLevel_en,
			j.jEducationRequirement_en,
			j.jEmploymentType_en,
			j.jContact,
			j.jViewCount,
			t2.OrganizationType,
			t2.SchoolType
	FROM tbl_TeachingJob j 
	INNER JOIN
		(SELECT us.UserId,us.Username,dbo.fn_GetProfileElement('Logo',PropertyNames,PropertyValuesString) AS Logo 
									 ,dbo.fn_GetProfileElement('OrganizationName',PropertyNames,PropertyValuesString) AS OrganizationName 
									 ,dbo.fn_GetProfileElement('Address1',PropertyNames,PropertyValuesString) AS Address1
									 ,dbo.fn_GetProfileElement('PhoneNumber1',PropertyNames,PropertyValuesString) AS PhoneNumber1
									 ,dbo.fn_GetProfileElement('BriefInfo',PropertyNames,PropertyValuesString) AS BriefInfo
									 ,dbo.fn_GetProfileElement('Website',PropertyNames,PropertyValuesString) AS Website 
									,dbo.fn_GetProfileElement('OrganizationType',PropertyNames,PropertyValuesString) AS OrganizationType 
									,dbo.fn_GetProfileElement('SchoolType',PropertyNames,PropertyValuesString) AS SchoolType 
			FROM dbo.aspnet_Profile p 
			INNER JOIN dbo.aspnet_Users us
		ON p.UserId=us.UserId) t2
	ON t2.UserId=j.jEmployer 
WHERE j.jId =@id
/*	
alter PROC proc_GetDetailJobById
	@id int
AS
SELECT j.jId,j.jTitle_en,j.jSalary_en,j.jLocation_en,j.jUploadDate,j.jClosingDate,j.jSector_en,
		j.jJobLevel_en,j.jEmploymentType_en,j.jViewCount,j.jDescription_en,j.jMinimumExp_en,j.jContact,
		t2.Username,t2.OrganizationName,t2.Logo,t2.Address1,t2.Address2,t2.PhoneNumber1,t2.Website FROM tbl_TeachingJob j 
		INNER JOIN
			(SELECT us.UserId,us.Username,dbo.fn_GetProfileElement('Logo',PropertyNames,PropertyValuesString) AS Logo 
										 ,dbo.fn_GetProfileElement('OrganizationName',PropertyNames,PropertyValuesString) AS OrganizationName 
										 ,dbo.fn_GetProfileElement('Address1',PropertyNames,PropertyValuesString) AS Address1
										 ,dbo.fn_GetProfileElement('Address2',PropertyNames,PropertyValuesString) AS Address2
										 ,dbo.fn_GetProfileElement('PhoneNumber1',PropertyNames,PropertyValuesString) AS PhoneNumber1
										 ,dbo.fn_GetProfileElement('Website',PropertyNames,PropertyValuesString) AS Website
				FROM dbo.aspnet_Profile p 
				INNER JOIN dbo.aspnet_Users us
			ON p.UserId=us.UserId) t2
		ON t2.UserId=j.jEmployer 
	WHERE j.jId =@id
*/		
EXEC proc_GetDetailJobById 90

SELECT j.jId,j.jTitle_en,t2.Username,t2.OrganizationName,t2.Logo,j.jSalary_en,j.jLocation_en,j.jUploadDate,j.jClosingDate,j.jSector_en,j.jJobLevel_en,j.jEmploymentType_en,j.jViewCount 
FROM tbl_TeachingJob j INNER JOIN 
(SELECT us.UserId,us.Username,dbo.fn_GetProfileElement('Logo',PropertyNames,PropertyValuesString) AS Logo ,
dbo.fn_GetProfileElement('OrganizationName',PropertyNames,PropertyValuesString) AS OrganizationName 
FROM dbo.aspnet_Profile p INNER JOIN dbo.aspnet_Users us ON p.UserId=us.UserId) t2 ON t2.UserId=j.jEmployer 
WHERE jid is not null

--------------------------END QUERY DATA - -----------
CREATE TABLE tbl_Temp_TeachingJob
(
	jid int primary key identity(1,1),
	jtitle nvarchar(100),
	Logo nvarchar(100),
)

-------------------------------------------------------------
select * from tbl_teachingjob
-- Chinh sua them theo yeu  cau ngay 22.6.2012
ALTER TABLE tbl_TeachingJob
	ADD jSector_en2 varchar(100)
ALTER TABLE tbl_TeachingJob
	ADD jSector_en3 varchar(100)
ALTER TABLE tbl_TeachingJob
	ADD jOrgType varchar(100)
ALTER TABLE tbl_TeachingJob
	ADD jLocation_en2 varchar(100)
ALTER TABLE tbl_TeachingJob
	ADD jLocation_en3 varchar(100)
ALTER TABLE tbl_TeachingJob
	ADD jSalaryType bit DEFAULT 0
ALTER TABLE tbl_TeachingJob
	ADD jSalaryCurrency varchar(100)
ALTER TABLE tbl_TeachingJob
	ADD jSalaryPaymentType varchar(100)	
ALTER TABLE tbl_TeachingJob
	ADD jEmailToApplication varchar(100)
ALTER TABLE tbl_TeachingJob
	ADD jExecutiveJob bit DEFAULT 0
ALTER TABLE tbl_TeachingJob
	ADD jActive bit DEFAULT 0
			
CREATE TABLE tbl_TeachingJob
(
	jId INT PRIMARY KEY IDENTITY(1,1),
	jTitle_en VARCHAR(100) NOT NULL,
	jTitle_vi NVARCHAR(100),
	jDescription_en VARCHAR(MAX),
	jDescription_vi NVARCHAR(MAX),
	jEmployer uniqueidentifier REFERENCES aspnet_Users(UserId),
	jLocation_en Varchar(100),
	jLocation_vi NVarchar(100),
	jSalary_en decimal default 0,
	jSalary_vi decimal default 0,
	jSector_en Varchar(100),
	jSector_vi NVarchar(100),
	jJobLevel_en Varchar(100),
	jJobLevel_vi NVarchar(100),
	jEmploymentType_en Varchar(100),
	jEmploymentType_vi NVarchar(100),
	jCitizenship_en varchar(100),
	jCitizenship_vi nvarchar(100),
	jEducationRequirement_en varchar(MAX),
	jEducationRequirement_vi nvarchar(MAX),
	jOtherBenefits_en varchar(MAX),
	jOtherBenefits_vi nvarchar(MAX),
	jMinimumExp_en varchar(100),
	jMinimumExp_vi varchar(100),
	jGender_en CHAR(1) default 'n',
	jGender_vi Char(1) default 'n',
	jContact varchar(100),
	jClosingDate DATETIME,
	jUploadDate DATETIME not null default getdate(),
	jFeaturedJob BIT not null default 0,
	jViewCount INT DEFAULT 0,
)
select * from tbl_teachingjob
select * from tbl_Job_sector

--New Insert Job 22.6.2012
Alter PROC proc_InsertNewJob
	@jTitle_en NVARCHAR(100),
	@jDescription_en NVARCHAR(MAX),
	@jEmployer uniqueidentifier,
	@jSector_en NVarchar(100),
	@jSector_en2 NVarchar(100),
	@jSector_en3 NVarchar(100),
	@jCitizenShip_en Nvarchar(100),
	@jJobLevel_en NVarchar(100),
	@jEducationRequirement_en Nvarchar(100),
	@jEmploymentType_en NVarchar(100),
	@jLocation_en NVarchar(100),
	@jLocation_en2 NVarchar(100),
	@jLocation_en3 NVarchar(100),
	@jSalaryType bit,
	@jSalary_en decimal,
	@jSalaryTo_en decimal,
	@jSalaryCurrency varchar(100),
	@jSalaryPaymentType Nvarchar(100),
	@jClosingDate DATETIME,
	@jExecutiveJob bit,
	@jContact Nvarchar(100),
	@jEmailToApplication Nvarchar(100)
AS
INSERT INTO tbl_TeachingJob(
	jTitle_en,
	jDescription_en,
	jEmployer,
	jSector_en,
	jSector_en2,
	jSector_en3,
	jCitizenShip_en,
	jJobLevel_en,
	jEducationRequirement_en,
	jEmploymentType_en,
	jLocation_en,
	jLocation_en2,
	jLocation_en3,
	jSalaryType,
	jSalary_en,
	jSalaryTo_en,
	jSalaryCurrency,
	jSalaryPaymentType,
	jClosingDate,
	jExecutiveJob,
	jContact,
	jEmailToApplication
)VALUES(
	@jTitle_en,
	@jDescription_en,
	@jEmployer,
	@jSector_en,
	@jSector_en2,
	@jSector_en3,
	@jCitizenShip_en,
	@jJobLevel_en,
	@jEducationRequirement_en,
	@jEmploymentType_en,
	@jLocation_en,
	@jLocation_en2,
	@jLocation_en3,
	@jSalaryType,
	@jSalary_en,
	@jSalaryTo_en,
	@jSalaryCurrency,
	@jSalaryPaymentType,
	@jClosingDate,
	@jExecutiveJob,
	@jContact,
	@jEmailToApplication
)

--OLD INSERT JOB
Alter PROC proc_InsertJob
	@jTitle_en VARCHAR(100),
	@jDescription_en VARCHAR(MAX),
	@jEmployer uniqueidentifier,
	@jLocation_en Varchar(100),
	@jSalary_en decimal,
	@jSector_en Varchar(100),
	@jJobLevel_en Varchar(100),
	@jEmploymentType_en Varchar(100),
	@jCitizenShip_en varchar(100),
	@jEducationRequirement_en varchar(MAX),
	@jOtherBenefits_en varchar(MAX),
	@jMinimumExp_en varchar(100),
	@jGender_en CHAR(1),
	@jContact varchar(100),
	@jClosingDate DATETIME,
	@jFeaturedJob BIT,
	@jViewCount INT,
	@jSchoolType_en varchar(100)
AS
INSERT INTO tbl_TeachingJob(
		jTitle_en,
		jDescription_en,
		jEmployer,
		jLocation_en,
		jSalary_en,
		jSector_en,
		jJobLevel_en,
		jEmploymentType_en,
		jCitizenship_en,
		jEducationRequirement_en,
		jOtherBenefits_en,
		jMinimumExp_en,
		jGender_en,
		jContact,
		jClosingDate,
		jFeaturedJob,
		jViewCount,
		jSchoolType_en
	) VALUES(
		@jTitle_en,
		@jDescription_en,
		@jEmployer,
		@jLocation_en,
		@jSalary_en,
		@jSector_en,
		@jJobLevel_en,
		@jEmploymentType_en,
		@jCitizenShip_en,
		@jEducationRequirement_en,
		@jOtherBenefits_en,
		@jMinimumExp_en,
		@jGender_en,
		@jContact,
		@jClosingDate,
		@jFeaturedJob,
		@jViewCount,
		@jSchoolType_en
	)
		
---------------------------------		

INSERT INTO tbl_TeachingJob(
		jTitle_en,
		jDescription_en,
		jEmployer,
		jLocation_en,
		jSalary_en,
		jSector_en,
		jJobLevel_en,
		jEmploymentType_en,
		jEducationRequirement_en,
		jOtherBenefits_en,
		jMinimumExp_en,
		jGender_en,
		jContact,
		jClosingDate,
		jFeaturedJob,
		jViewCount
		) VALUES(
		'Principal',
		'The Yellow Door has a busy year ahead and require a Head Chef

Experienced Head Chef with at least 8-10 years experience in similar role, must be very well organised and have fine dining experience, £30-£40k.

One major advantage to these jobs is that most of the work is carried out during the daytime leaving evenings during the week free, rare for professional Chef jobs.

To apply send your CV via the apply button below.',
		'2F40A5A8-5F79-4CCB-92DE-C16BA177CE08',
		'Ha noi',
		7000,
		'Academic',
		'Teaching Staff',
		'Full-Time',
		'Post-Graduated',
		'Can be promoted to the dean of falcuty in 3 years',
		'3 years teaching exp',
		'b',
		'vuthanhluan@gmail.com',
		'4/15/2012',
		1,
		999
		)
select * from tbl_TeachingJob tj INNER JOIN aspnet_Users u
	ON tj.jEmployer =u.UserID

	
ALTER TABLE tbl_Job_vi
ALTER COLUMN jSalary decimal
select * from tbl_Job_vi where jid =29
INSERT INTO tbl_Job_vi (jTitle,jDescription,jAvatar,jEmployer,jLocation,jSalary,jSector,jJobRole,jEmploymentType,jClosingDate)
	VALUES(N'bàn ghế tủ bếp hỏi',N'Lorem Ipsum chỉ đơn giản là',N'demoAvatar1.jpg',3,30,N'$1000-$2000',
			2,2,2,N'Feb 06, 2012')
ALTER table tbl_Job_vi
Add jEducationRequirement NVarChar(100) null default 'N/A'
ALTER table tbl_Job_vi
ADD jSex nvarchar(10) not null default 'N/A'
ALTER table tbl_Job_vi
Add jMinimunExp NVarChar(100) null default 'N/A'
/*ALTER table tbl_Job_vi
Add jUploadDate datetime not null default getdate()
*/
INSERT INTO tbl_Job_vi 
	VALUES('Title1','Description1','demoAvatar1.jpg',1,11,'$1000-$2000',
			1,1,1,'12/12/2012',getdate(),1,0)
INSERT INTO tbl_Job_vi 
	VALUES('Title2','Description2','demoAvatar1.jpg',1,12,'$1000-$2000',
			1,1,1,'12/12/2012',getdate(),1,0)
INSERT INTO tbl_Job_vi 
	VALUES('Title3','Description3','demoAvatar1.jpg',1,11,'$1000-$2000',
			1,1,1,'12/12/2012',getdate(),1,0)
INSERT INTO tbl_Job_vi 
	VALUES('Title4','Description4','demoAvatar1.jpg',1,12,'$1000-$2000',
			1,1,1,'12/12/2012',getdate(),1,0)
INSERT INTO tbl_Job_vi 
	VALUES('Title5','Description5','demoAvatar1.jpg',1,11,'$1000-$2000',
			1,1,1,'12/12/2012',getdate(),1,0)		
INSERT INTO tbl_Job_vi 
	VALUES('Title6','Description6','demoAvatar1.jpg',1,11,'$1000-$2000',
			1,1,1,'12/12/2012',getdate(),1,0)
INSERT INTO tbl_Job_vi 
	VALUES('Title7','Description7','demoAvatar1.jpg',1,12,'$1000-$2000',
			1,1,1,'12/12/2012',getdate(),1,0)
INSERT INTO tbl_Job_vi 
	VALUES('Title8','Description8','demoAvatar1.jpg',1,11,'$1000-$2000',
			1,1,1,'12/12/2012',getdate(),1,0)
INSERT INTO tbl_Job_vi 
	VALUES('Title9','Description9','demoAvatar1.jpg',1,12,'$1000-$2000',
			1,1,1,'12/12/2012',getdate(),1,0)
INSERT INTO tbl_Job_vi 
	VALUES('Title10','Description10','demoAvatar1.jpg',1,11,'$1000-$2000',
			1,1,1,'12/12/2012',getdate(),1,0)		
INSERT INTO tbl_Job_vi 
	VALUES('Title11','Description1','demoAvatar1.jpg',1,11,'$1000-$2000',
			1,1,1,'12/12/2012',getdate(),1,0)		
INSERT INTO tbl_Job_vi 
	VALUES('Title12','Description1','demoAvatar1.jpg',1,11,'$1000-$2000',
			1,1,1,'12/12/2012',getdate(),1,15)		
INSERT INTO tbl_Job_vi 
	VALUES('Title15','Description1','demoAvatar1.jpg',1,11,'$1000-$2000',
			1,1,1,'6/25/2012',getdate(),1,0)														
INSERT INTO tbl_Job_vi 
	VALUES('Title22','Description1','demoAvatar1.jpg',1,11,'$1000-$2000',
			2,1,1,'12/12/2012',getdate(),1,17)		
INSERT INTO tbl_Job_vi 
	VALUES('Title25','Description1','demoAvatar1.jpg',1,11,'$1000-$2000',
			2,1,1,'6/25/2012',getdate(),1,0)
INSERT INTO tbl_Job_vi 
	VALUES('Title26','Description1','demoAvatar1.jpg',1,11,'$1000-$2000',
			2,1,1,'12/12/2012',getdate(),1,18)		
INSERT INTO tbl_Job_vi 
	VALUES('Title27','Description1','demoAvatar1.jpg',1,11,'$1000-$2000',
			3,1,1,'6/25/2012',getdate(),1,40)
INSERT INTO tbl_Job_vi 
	VALUES('Title28','Description1','demoAvatar1.jpg',1,11,'$1000-$2000',
			3,1,1,'12/12/2012',getdate(),1,27)		
INSERT INTO tbl_Job_vi 
	VALUES('Title29','Description1','demoAvatar1.jpg',1,11,'$1000-$2000',
			3,1,1,'6/25/2012',getdate(),1,9999)																		
SELECT * FROM tbl_Job_vi	
			
select j.jId,j.jTitle,j.jAvatar,j.jEmployer from tbl_Job_vi j INNER JOIN tbl_Job_Location_vi jlo
	ON j.jLocation=jlo.lId
	WHERE jlo.lId is not null
	
	
SELECT TOP(12) j.jId,j.jTitle,j.jAvatar,j.jEmployer FROM tbl_Job_vi j INNER JOIN tbl_Job_Location_vi jlo ON j.jLocation=jlo.lId
ORDER BY j.jViewCount DESC

SELECT TOP(5) j.jId,j.jTitle,j.jAvatar,j.jEmployer,j.jClosingDate FROM tbl_Job_vi j INNER JOIN tbl_Job_Location_vi jlo ON j.jLocation=jlo.lId
ORDER BY j.jUploadDate Desc

SELECT * FROM tbl_Job_Sector_vi
	SELECT * FROM tbl_Job_Employer_vi WHERE emIsPremium=1
	
SELECT TOP(10) total1.jTitle,em.emName,total1.jSalary,total1.jClosingDate,total1.jViewCount 
FROM tbl_Job_Employer_vi em INNER JOIN
	(select j.jTitle,j.jEmployer,j.jsalary,j.jclosingdate,j.jViewCount,s.seName from tbl_Job_Sector_vi s INNER JOIN tbl_Job_vi j
		ON j.jSector=s.seId) total1
	ON em.emId=total1.jEmployer WHERE total1.seName='Administration'
ORDER BY total1.jViewCount DESC
	
SELECT * FROM aspnet_roles r INNER JOIN aspnet_Users u ON r.ApplicationID = u.applicationId

select * from aspnet_profile p inner join aspnet_Users u on p.userid=u.userid	WHERE PROFILE.Employee.citizenship='vietnamese'

--Function de lay du lieu tu profile -- RAT HAY -------------------------------------------------------------------------------------
CREATE FUNCTION dbo.fn_GetElement
(
@ord AS INT,
@str AS VARCHAR(8000),
@delim AS VARCHAR(1) )
 
RETURNS INT
AS
BEGIN
  -- If input is invalid, return null.
  IF @str IS NULL
      OR LEN(@str) = 0
      OR @ord IS NULL
      OR @ord < 1
      -- @ord > [is the] expression that calculates the number of elements.
      OR @ord > LEN(@str) - LEN(REPLACE(@str, @delim, '')) + 1
    RETURN NULL
  DECLARE @pos AS INT, @curord AS INT
  SELECT @pos = 1, @curord = 1
  -- Find next element's start position and increment index.
  WHILE @curord < @ord
    SELECT
      @pos    = CHARINDEX(@delim, @str, @pos) + 1,
      @curord = @curord + 1
  RETURN
  CAST(SUBSTRING(@str, @pos, CHARINDEX(@delim, @str + @delim, @pos) - @pos) AS INT)
END
 
--And then code for the actual worker function:

CREATE FUNCTION dbo.fn_GetProfileElement
(
@fieldName AS NVARCHAR(100),
@fields AS NVARCHAR(4000),
@values AS NVARCHAR(4000))
 
RETURNS NVARCHAR(4000)
AS
BEGIN
  -- If input is invalid, return null.
  IF @fieldName IS NULL
      OR LEN(@fieldName) = 0
      OR @fields IS NULL
      OR LEN(@fields) = 0
      OR @values IS NULL
      OR LEN(@values) = 0
 
    RETURN NULL
 
-- locate FieldName in Fields
DECLARE @fieldNameToken AS NVARCHAR(20)
DECLARE @fieldNameStart AS INTEGER,
@valueStart AS INTEGER,
@valueLength AS INTEGER
 
-- Only handle string type fields (:S:)
SET @fieldNameStart = CHARINDEX(@fieldName + ':S',@Fields,0)
 
-- If field is not found, return null
IF @fieldNameStart = 0 RETURN NULL
SET @fieldNameStart = @fieldNameStart + LEN(@fieldName) + 3
 
-- Get the field token which I've defined as the start of the
-- field offset to the end of the length
SET @fieldNameToken = SUBSTRING(@Fields,@fieldNameStart,LEN(@Fields)-@fieldNameStart)
 
-- Get the values for the offset and length
SET @valueStart = dbo.fn_getelement(1,@fieldNameToken,':')
SET @valueLength = dbo.fn_getelement(2,@fieldNameToken,':')
 
-- Check for sane values, 0 length means the profile item was
-- stored, just no data
IF @valueLength = 0 RETURN ''
 
-- Return the string
RETURN SUBSTRING(@values, @valueStart+1, @valueLength)
 
END
 --Function de lay du lieu tu profile -- RAT HAY --- END!!!----------------------------------------------------------------------------------
--Now we can get first name and last name as following:
 
SELECT userid, dbo.fn_GetProfileElement('FirstName',PropertyNames,PropertyValuesString) + ' ' +
	dbo.fn_GetProfileElement('LastName',PropertyNames,PropertyValuesString) as FullName,
	dbo.fn_GetProfileElement('OrganizationName',PropertyNames,PropertyValuesString) ,
	dbo.fn_GetProfileElement('Citizenship',PropertyNames,PropertyValuesString) 
FROM aspnet_Profile

select * from aspnet_Profile


ALTER PROC proc_GetPostedJobByUser
	@user uniqueidentifier
AS	
SELECT jId,jTitle_en,jUploadDate,jClosingDate,jViewCount
FROM tbl_TeachingJob
WHERE jEmployer=@user AND jActive=1
ORDER BY jUploadDate DESC
	
EXEC proc_GetPostedJobByUser '2F40A5A8-5F79-4CCB-92DE-C16BA177CE08'	
-------------------------------------------------------
ALTER PROC proc_GetJobByEmployer
	@user uniqueidentifier
AS
SELECT TOP(5) jId,jTitle_en,jUploadDate,jClosingDate,jViewCount
FROM tbl_TeachingJob
WHERE jEmployer=@user AND jActive=1 AND jClosingDate>GetDate()
ORDER BY jViewCount DESC

EXEC proc_GetJobByEmployer '2F40A5A8-5F79-4CCB-92DE-C16BA177CE08'	

ALTER PROC proc_GetLastestJobByGuid
	@employer uniqueidentifier
AS
SELECT TOP(1) jID FROM tbl_TeachingJob WHERE jemployer=@employer AND jactive=1 AND jClosingDate	>=Getdate() ORDER BY jID DESC

EXEC proc_GetLastestJobByGuid '2F40A5A8-5F79-4CCB-92DE-C16BA177CE08'

CREATE PROC proc_GetGuidByJobId
	@jid int
AS
SELECT jEmployer FROM tbl_TeachingJob WHERE jid=@jid

EXEC proc_GetGuidByJobId 90

ALTER PROC proc_GetJobByCategory
	@cate1 nvarchar(100),
	@cate2 nvarchar(100),
	@cate3 nvarchar(100)
AS
SELECT TOP(5) jId,jTitle_en,jUploadDate,jClosingDate,jViewCount
FROM tbl_TeachingJob
WHERE (jSector_en=@cate1 OR jSector_en=@cate2 OR jSector_en=@cate3 OR jSector_en2=@cate1 OR jSector_en2=@cate2 OR jSector_en2=@cate3 OR jSector_en3=@cate1 OR jSector_en3=@cate2 OR jSector_en3=@cate3) AND jActive=1 AND jClosingDate>GetDate()
ORDER BY jViewCount DESC 

EXEC proc_GetJobByCategory '','',''
-------------------------------------------------------------------------------
ALTER PROC proc_DeleteAPostedJob
	@jId int
AS
UPDATE tbl_TeachingJob SET jActive=0 WHERE jid=@jid

EXEC proc_DeleteAPostedJob 48

INSERT INTO tbl_TeachingJob(
		jTitle_en,
		jDescription_en,
		jEmployer,
		jLocation_en,
		jSalary_en,
		jSector_en,
		jJobLevel_en,
		jEmploymentType_en,
		jEducationRequirement_en,
		jOtherBenefits_en,
		jMinimumExp_en,
		jGender_en,
		jContact,
		jClosingDate,
		jFeaturedJob,
		jViewCount
		) VALUES(
		'Principal',
		'The Yellow Door has a busy year ahead and require a Head Chef

Experienced Head Chef with at least 8-10 years experience in similar role, must be very well organised and have fine dining experience, £30-£40k.

One major advantage to these jobs is that most of the work is carried out during the daytime leaving evenings during the week free, rare for professional Chef jobs.

To apply send your CV via the apply button below.',
		'2F40A5A8-5F79-4CCB-92DE-C16BA177CE08',
		'Ha noi',
		7000,
		'Academic',
		'Teaching Staff',
		'Full-Time',
		'Post-Graduated',
		'Can be promoted to the dean of falcuty in 3 years',
		'3 years teaching exp',
		'b',
		'vuthanhluan@gmail.com',
		'4/15/2012',
		1,
		999
		)
	
SELECT * from tbl_TeachingJob tj INNER JOIN aspnet_Users us
	ON tj.jEmployer = us.UserId
WHERE tj.jSector_en = 'Administration'
ORDER BY jViewCount DESC


--SEARCH keyword trim---- TUYET HAY
--
CREATE FUNCTION fnSplit(
	@strInput NVARCHAR(4000),
	@char char(1)) 
RETURNS @Tbl TABLE (id int IDENTITY(1,1),part NVARCHAR(1000))
AS
BEGIN
	DECLARE @SubStr NVARCHAR(100), @i INT
	SET @i = CHARINDEX(@char, @strInput, 0)
	WHILE @i > 0
	BEGIN
		SET @SubStr = LEFT(@strInput,@i-1)
		INSERT INTO @Tbl
		SELECT @SubStr
		SET @strInput = SUBSTRING(@strInput, @i+1,4000)
		SET @i = CHARINDEX(@char, @strInput, 0)
	END	
	INSERT INTO @Tbl
	SELECT LTRIM(RTRIM(@strInput))
	RETURN
END
--
CREATE FUNCTION fKeySearch(@strInput NVARCHAR(400), @char char(1)) 
RETURNS @_TblTemp TABLE (id int IDENTITY(1,1),part NVARCHAR(400))
AS
BEGIN
	DECLARE @SubStr NVARCHAR(100), @i INT, @p nvarchar(400)
	SET @p=@strInput
	INSERT INTO @_TblTemp
		SELECT @strInput
	SET @i = CHARINDEX(@char, REVERSE(@strInput))
	WHILE @i >0
	BEGIN
		SET @SubStr = right(@strInput,CHARINDEX(@char, REVERSE(@strInput))) 
		SET @strInput = replace(@strInput,@SubStr,'')
		INSERT INTO @_TblTemp
		SELECT @strInput
		SET @i = CHARINDEX(@char, REVERSE(@strInput))
	END	
	INSERT INTO @_TblTemp
	SELECT part FROM dbo.fnSplit(@p,@char) WHERE id>1 AND len(rtrim(ltrim(part)))>2
	RETURN
END
--

alter PROCEDURE proc_SearchItem
	@TuKhoa nvarchar(MAX)
AS
BEGIN
	DECLARE @_Table_Job_Temp TABLE(
	indexs int IDENTITY (1,1) NOT NULL,
	id int,
	Title nvarchar(MAX),
	UserName nvarchar(100),
	OrgName nvarchar(150),
	ImgUrl nvarchar(250),
	salary decimal,
	sector nvarchar(100),
	sector2 nvarchar(100),
	sector3 nvarchar(100),
	location nvarchar(100),
	location2 nvarchar(100),
	location3 nvarchar(100),
	citizenship nvarchar(100),
	uploadDate datetime,
	closingdate datetime,
	joblevel nvarchar(100),
	employmenttype nvarchar(100),
	viewCount int,
	organizationtype nvarchar(100),
	schooltype nvarchar(100)
	)
	DECLARE @cr int, @part nvarchar(400), @check int
	DECLARE @mRow int
 	SELECT @mRow = isnull(Max([id]),0) FROM dbo.fKeySearch(@TuKhoa,' ')
	SET @cr = 1
	WHILE @cr <=@mRow
	BEGIN
		SELECT @part=part FROM dbo.fKeySearch(@TuKhoa,' ') WHERE id=@cr
		INSERT INTO @_Table_Job_Temp(id, Title,UserName,OrgName, ImgUrl,salary,sector,sector2,sector3,location,location2,location3,citizenship,uploadDate,closingdate,joblevel,employmenttype,viewCount,organizationtype,schooltype)
		SELECT j.jId,j.jTitle_en,t2.Username,t2.OrganizationName,t2.Logo,j.jSalary_en,j.jSector_en,j.jSector_en2,j.jSector_en3,j.jLocation_en,j.jLocation_en2,j.jLocation_en3,j.jcitizenship_en,j.jUploadDate,j.jClosingDate,j.jJobLevel_en,j.jEmploymentType_en,j.jViewCount,t2.OrganizationType,t2.SchoolType
		FROM tbl_TeachingJob j 
			INNER JOIN 
			(SELECT us.UserId,us.Username,dbo.fn_GetProfileElement('Logo',PropertyNames,PropertyValuesString) AS Logo ,
				dbo.fn_GetProfileElement('OrganizationName',PropertyNames,PropertyValuesString) AS OrganizationName ,
				dbo.fn_GetProfileElement('OrganizationType',PropertyNames,PropertyValuesString) AS OrganizationType ,
				dbo.fn_GetProfileElement('SchoolType',PropertyNames,PropertyValuesString) AS SchoolType
			FROM dbo.aspnet_Profile p 
				INNER JOIN dbo.aspnet_Users us 
				ON p.UserId=us.UserId) t2 
			ON t2.UserId=j.jEmployer
		WHERE (jTitle_en LIKE N'%'+@part+'%') 
			AND jActive=1
		SET @cr = @cr + 1
	END
	SELECT DISTINCT id,title,UserName ,OrgName ,ImgUrl ,salary ,sector ,sector2,sector3,location,location2,location3,
	citizenship ,uploadDate ,closingdate ,joblevel ,employmenttype ,viewCount  ,organizationtype,schooltype
	FROM  @_Table_Job_Temp
	ORDER BY uploaddate DESC
END
------

select * from tbl_teachingjob WHERE jactive=1

EXEC proc_SearchItem ' '

select jtitle_en,jSector_en,jSector_en2,jSector_en3 from tbl_teachingjob where jsector_en ='Library administration' OR jsector_en2 ='Library administration' OR jsector_en3 ='Library administration'
alter PROC proc_ResultSeach
	@keyword nvarchar(Max)
AS
SELECT j.jId,j.jTitle_en,t2.Username,t2.OrganizationName,t2.Logo,j.jSalary_en,j.jSector_en,j.jLocation_en,j.jcitizenship_en,j.jschoolType_en,j.jUploadDate,j.jClosingDate,j.jJobLevel_en,j.jEmploymentType_en,j.jViewCount,j.jDescription_en 
FROM tbl_TeachingJob j 
	INNER JOIN 
	(SELECT us.UserId,us.Username,dbo.fn_GetProfileElement('Logo',PropertyNames,PropertyValuesString) AS Logo ,
		dbo.fn_GetProfileElement('OrganizationName',PropertyNames,PropertyValuesString) AS OrganizationName 
	FROM dbo.aspnet_Profile p 
		INNER JOIN dbo.aspnet_Users us 
		ON p.UserId=us.UserId) t2 
	ON t2.UserId=j.jEmployer
WHERE (jTitle_en LIKE '%'+@keyword+'%' OR jTitle_vi LIKE N'%'+@keyword+'%' 
OR jDescription_en LIKE N'%'+@keyword+'%' OR jDescription_en LIKE N'%'+@keyword+'%') 
	AND jClosingDate>getdate()

EXEC proc_ResultSeach ' ','ad','ad','ad','ad'

SELECt * from tbl_teachingjob WHERE jid = 11 jcitizenship_en like '%uni%' AND jClosingDate>getdate()  AND (jschooltype_en like '%%' OR jschooltype_en is null)
UPDATE tbl_teachingjob SET jViewCount=12 WHERE jid=11


	
SELECT j.jId,j.jTitle_en,j.jSalary_en,j.jLocation_en,j.jUploadDate,j.jClosingDate,j.jSector_en,
		j.jJobLevel_en,j.jEmploymentType_en,j.jViewCount,j.jDescription_en,j.jMinimumExp_en,j.jContact,
		t2.OrganizationType,t2.City,t2.Country,t2.GENDER FROM tbl_TeachingJob j 
		INNER JOIN
			(SELECT us.UserId,us.Username,dbo.fn_GetProfileElement('OrganizationType',PropertyNames,PropertyValuesString) AS OrganizationType 
										 ,dbo.fn_GetProfileElement('City',PropertyNames,PropertyValuesString) AS City 
										 ,dbo.fn_GetProfileElement('Country',PropertyNames,PropertyValuesString) AS Country
										 ,dbo.fn_GetProfileElement('GENDER',PropertyNames,PropertyValuesString) AS GENDER
				FROM dbo.aspnet_Profile p 
				INNER JOIN dbo.aspnet_Users us
			ON p.UserId=us.UserId) t2
		ON t2.UserId=j.jEmployer 
	WHERE t2.OrganizationName ='Changed'

CREATE VIEW view_GetAllCitizenships
AS
SELECT ctId, ctName_en, ctName_vi FROM  dbo.tbl_Job_Citizenship
	
SELECT * FROM View_GetAllCitizenships

ALTER VIEW view_GetAvaiJobCount
AS
SELECT COUNT(jId) AS NoOfJobs FROM tbl_TeachingJob WHERE jClosingDate>GetDate() AND jactive=1

SELECT * FROM view_GetAvaiJobCount

CREATE VIEW view_GetAllEmpType
AS
SELECT TOP(1000) * FROM tbl_Job_EmploymentType ORDER BY etId DESC

SELECT * FROM view_GetAllEmpType

CREATE VIEW view_GetAllJobLevel
AS
SELECT top(1000) * FROM tbl_Job_JobLevel ORDER BY jrId DESC

SELECT * FROM view_GetAllJobLevel

CREATE VIEW view_GetAllCategory
AS
SELECT * FROM tbl_Job_Sector

SELECT * FROM view_GetAllCategory

CREATE VIEW view_
AS
select top(5) * from view_getallexecutivejob

CREATE VIEW view_GetAllLocation
AS
SELECT TOP(1000) * FROM tbl_job_Location ORDER BY lname_en asc

SELECT * FROM view_GetAllLocation

-------------------------------- SEARCH CV ---------------------------------------
ALTER PROCEDURE proc_SearchCV
	@TuKhoa nvarchar(MAX)
AS
BEGIN
	DECLARE @_Table_Temp TABLE(
		indexs int IDENTITY (1,1) NOT NULL,
		UserId uniqueidentifier,
		Username nvarchar(200),
		FullName nvarchar(200),
		Major nvarchar(200),
		MostRecentPosition nvarchar(200),
		DateOfBirth nvarchar(200),
		Avatar nvarchar(200),
		Citizenship nvarchar(200),
		DesiredEmployment nvarchar(200),
		DesiredEmployment2 nvarchar(200),
		DesiredEmployment3 nvarchar(200),
		SalaryType nvarchar(200),
		SalaryFrom nvarchar(200),
		SalaryTo nvarchar(200),
		SalaryCurrency nvarchar(20),
		SalaryPaidType nvarchar(20),
		location nvarchar(200),
		location2 nvarchar(200),
		location3 nvarchar(200),
		CreateDate nvarchar(100),
		Searchable bit,
		EduLevel nvarchar(100),
		YearsofExperience nvarchar(100),
		CurrentJobLevel nvarchar(100),
		Active bit,
		LastUpdated nvarchar(100)
	)
	DECLARE @cr int, @part nvarchar(400), @check int
	DECLARE @mRow int
 	SELECT @mRow = isnull(Max([id]),0) FROM dbo.fKeySearch(@TuKhoa,' ')
	SET @cr = 1
	WHILE @cr <=@mRow
	BEGIN
		SELECT @part=part FROM dbo.fKeySearch(@TuKhoa,' ') WHERE id=@cr
		INSERT INTO @_Table_Temp(UserId, Username,FullName,Major, MostRecentPosition,DateOfBirth,Avatar,Citizenship,DesiredEmployment,DesiredEmployment2,DesiredEmployment3,SalaryType,SalaryFrom,SalaryTo,SalaryCurrency,SalaryPaidType,location,location2,location3,CreateDate,Searchable,EduLevel,YearsofExperience,CurrentJobLevel,Active,LastUpdated)
		SELECT * FROM(
			SELECT us.UserId,us.Username,
					dbo.fn_GetProfileElement('Employee.FirstName',PropertyNames,PropertyValuesString) + ' ' + dbo.fn_GetProfileElement('Employee.LastName',PropertyNames,PropertyValuesString) AS FullName ,
					dbo.fn_GetProfileElement('Major',PropertyNames,PropertyValuesString) AS Major ,
					dbo.fn_GetProfileElement('MostRecentPosition',PropertyNames,PropertyValuesString) AS MostRecentPosition ,
					dbo.fn_GetProfileElement('DateOfBirth',PropertyNames,PropertyValuesString) AS DateOfBirth ,
					dbo.fn_GetProfileElement('Avatar',PropertyNames,PropertyValuesString) AS Avatar ,
					dbo.fn_GetProfileElement('Citizenship',PropertyNames,PropertyValuesString) AS Citizenship ,
					dbo.fn_GetProfileElement('DesiredEmployment',PropertyNames,PropertyValuesString) AS DesiredEmployment ,
					dbo.fn_GetProfileElement('DesiredEmployment2',PropertyNames,PropertyValuesString) AS DesiredEmployment2 ,
					dbo.fn_GetProfileElement('DesiredEmployment3',PropertyNames,PropertyValuesString) AS DesiredEmployment3 ,
					dbo.fn_GetProfileElement('SalaryType',PropertyNames,PropertyValuesString) AS SalaryType ,
					dbo.fn_GetProfileElement('SalaryFrom',PropertyNames,PropertyValuesString) AS SalaryFrom ,
					dbo.fn_GetProfileElement('SalaryTo',PropertyNames,PropertyValuesString) AS SalaryTo ,
					dbo.fn_GetProfileElement('SalaryCurrency',PropertyNames,PropertyValuesString) AS SalaryCurrency ,
					dbo.fn_GetProfileElement('SalaryPaidType',PropertyNames,PropertyValuesString) AS SalaryPaidType ,
					dbo.fn_GetProfileElement('DesiredLocations',PropertyNames,PropertyValuesString) AS DesiredLocations ,
					dbo.fn_GetProfileElement('DesiredLocations2',PropertyNames,PropertyValuesString) AS DesiredLocations2 ,
					dbo.fn_GetProfileElement('DesiredLocations3',PropertyNames,PropertyValuesString) AS DesiredLocations3 ,
					dbo.fn_GetProfileElement('CreateDate',PropertyNames,PropertyValuesString) AS CreateDate,
					dbo.fn_GetProfileElement('Searchable',PropertyNames,PropertyValuesString) AS Searchable,
					dbo.fn_GetProfileElement('EduLevel',PropertyNames,PropertyValuesString) AS EduLevel ,
					dbo.fn_GetProfileElement('YearsofExperience',PropertyNames,PropertyValuesString) AS YearsofExperience,
					dbo.fn_GetProfileElement('CurrentJobLevel',PropertyNames,PropertyValuesString) AS CurrentJobLevel,
					dbo.fn_GetProfileElement('Active',PropertyNames,PropertyValuesString) AS Active,
					dbo.fn_GetProfileElement('LastUpdated',PropertyNames,PropertyValuesString) AS LastUpdated
				FROM dbo.aspnet_Profile p 
					INNER JOIN dbo.aspnet_Users us 
					ON p.UserId=us.UserId) x
		WHERE (FullName LIKE N'%'+@part+'%' OR Username LIKE N'%'+@part+'%') AND Searchable='True'
		SET @cr = @cr + 1
	END
	SELECT DISTINCT UserId, Username,FullName,Major, MostRecentPosition,DateOfBirth,Avatar,Citizenship,DesiredEmployment,DesiredEmployment2,DesiredEmployment3,SalaryType,SalaryFrom,SalaryTo,SalaryCurrency,SalaryPaidType,location,location2,location3,CreateDate,Searchable,LastUpdated,EduLevel,YearsofExperience,CurrentJobLevel
	FROM  @_Table_Temp WHERE Searchable = 1 AND Active = 1
	ORDER BY CreateDate DESC
END

EXEC proc_SearchCV 'thành'


CREATE VIEW View_GetAvaiResumes
as
SELECT count(UserId) AS NumberOfResumes FROM(
			SELECT UserId,
					dbo.fn_GetProfileElement('Searchable',PropertyNames,PropertyValuesString) AS Searchable
				FROM dbo.aspnet_Profile p ) x
		WHERE  Searchable='True'

SELECT * FROM View_GetAvaiResumes


--Script khi bat dau chuyen tu 2008 sang 2005
CREATE TABLE Testimonial_Article
(
	id int primary key identity(1,1),
	title nvarchar(200),
	logo varchar(200),
	body nvarchar(max),
	setAsSlider bit default 0,
	active bit default 0
)

ALTER PROC proc_Insert_TestimonialArticle
	@name nvarchar(100),
	@citizenship nvarchar(100),
	@logo varchar(200),
	@body nvarchar(max),
	@setAsSlider bit,
	@active bit
AS
INSERT INTO Testimonial_Article VALUES(@name,@citizenship,@logo,@body,@setAsSlider,@active)

EXEC proc_Insert_TestimonialArticle 
			'Article title'
			,'mylogo'
			,'my bodye cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."Section 1.10.32 of "de Finibus Bonorum et Malorum", written by Cicero in 45 BC"Sed ut perspiciatis unde omnis iste natus err'
			,1
			,1

ALTER VIEW view_Testimonial_Article
AS
SELECT TOP(1000) * FROM Testimonial_Article WHERE active=1 ORDER BY id 

CREATE PROC proc_GetTestimonialArticleById
	@id int
AS
SELECT * FROM Testimonial_Article WHERE id=@id

EXEC proc_GetTestimonialArticleById 8

ALTER VIEW view_GetSlider
AS
SELECT TOP 1 * FROM Testimonial_Article WHERE setAsSlider=1 AND Active=1
ORDER BY NEWID()

SELECT * FROM view_GetSlider

----------PREPARATION - ADVICE CENTER
CREATE TABLE Preparation_Article
(
	id int primary key identity(1,1),
	title nvarchar(200),
	logo varchar(200),
	body nvarchar(max),
	setAsSlider bit default 0,
	active bit default 0
)
ALTER TABLE Preparation_Article
ADD sort_order smallint DEFAULT 0

select * from Preparation_Article

ALTER PROC proc_Insert_PreparedArticle
	@title nvarchar(200),
	@logo varchar(200),
	@body nvarchar(max),
	@isItRecruitArticle bit,
	@active bit
AS
INSERT INTO Preparation_Article(title,logo,body,IsItRecruitArticle,active) VALUES(@title,@logo,@body,@isItRecruitArticle,@active)

EXEC proc_Insert_PreparedArticle 
			'Article title'
			,'mylogo'
			,'my bodye cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."Section 1.10.32 of "de Finibus Bonorum et Malorum", written by Cicero in 45 BC"Sed ut perspiciatis unde omnis iste natus err'
			,0
			,1

ALTER VIEW view_Preparation_Article
AS
SELECT TOP(1000) id,title,logo,body,IsItRecruitArticle,active FROM Preparation_Article WHERE IsItRecruitArticle =0 AND active=1
ORDER BY sort_order DESC

SELECT * FROM view_Preparation_Article
--------------------------------
ALTER VIEW view_RecruitmentCenter_Article
AS
SELECT TOP(1000) id,title,logo,body,IsItRecruitArticle,active FROM Preparation_Article WHERE IsItRecruitArticle =1 AND active=1
ORDER BY sort_order DESC
------------------------------------------------------------------------------------------

CREATE TABLE tbl_HiringAdvice_Category
(
	cate_id int primary key identity(1,1),
	cate_name nvarchar(100) unique,
)
SELECT TOP(1) cate_id FROM tbl_HiringAdvice_Category
INSERT INTO tbl_HiringAdvice_Category VALUES('Category4')

ALTER VIEW view_HiringAdvice_Category
AS
SELECT TOP(1000) cate_id,cate_name,active FROM tbl_HiringAdvice_Category WHERE active=1 order by cate_id

select * from view_HiringAdvice_Category

SELECT TOP(1) cate_id FROM tbl_HiringAdvice_Category WHERE active=1 order by cate_id desc
SELECT TOP(1) cate_id FROM tbl_HiringAdvice_Category ORDER BY cate_id DESC
CREATE TABLE tbl_HiringAdvice
(
	id int primary key identity(1,1),
	title nvarchar(200),
	cate_id int references tbl_HiringAdvice_Category(cate_id),
	writer uniqueidentifier,
	active bit default 0,
	uploadedDate datetime default getdate()
)


ALTER PROC proc_addHiringAdvice
	@title nvarchar(200),
	@cate_id int,
	@writer uniqueidentifier,
	@active bit,
	@detail nvarchar(max)
AS
INSERT INTO tbl_HiringAdvice(title,cate_id,writer,active,detail) VALUES(@title,@cate_id,@writer,@active,@detail)

EXEC proc_addHiringAdvice 'title',1,'writer','Lorem Ipsum is simply dummy text of the printing and typesetting industry',1
EXEC proc_addHiringAdvice 'title2',2,'writer2','Lorem Ipsum is simply dummy text of the printing and typesetting industry2',1
EXEC proc_addHiringAdvice 'title3',3,'writer3','Lorem Ipsum is simply dummy text of the printing and typesetting industry2',1
EXEC proc_addHiringAdvice 'title4',4,'writer4','Lorem Ipsum is simply dummy text of the printing and typesetting industry2',1
EXEC proc_addHiringAdvice 'title7',1,'writer7','Lorem Ipsum is simply dummy text of the printing and typesetting industry2',1

SELECT * FROM tbl_HiringAdvice

ALTER PROC proc_HiringAdvice
	@cate_id int
AS
SELECT  ha.id,ha.title,ha.cate_id,ha.writer,ha.detail,
	dbo.fn_GetProfileElement('PersonalImage',PropertyNames,PropertyValuesString) AS Logo
	,ha.active,ha.uploadeddate	
	,dbo.fn_GetProfileElement('Employer.FirstName',PropertyNames,PropertyValuesString) + ' ' +
	dbo.fn_GetProfileElement('Employer.LastName',PropertyNames,PropertyValuesString) AS Fullname
	,dbo.fn_GetProfileElement('OrganizationName',PropertyNames,PropertyValuesString) AS OrganizationName
FROM tbl_HiringAdvice ha 
	INNER JOIN dbo.aspnet_Profile p
		ON ha.writer=p.UserId
WHERE cate_id=@cate_id and active=1 ORDER BY ha.uploadeddate DESC

EXEC proc_HiringAdvice 5

ALTER PROC proc_GetHiringAdviceById
	@id int
AS
SELECT ha.id,ha.title,ha.cate_id
	,ha.writer,ha.detail,dbo.fn_GetProfileElement('PersonalImage',PropertyNames,PropertyValuesString) AS Logo
	,ha.active,ha.uploadeddate	
	,dbo.fn_GetProfileElement('Employer.FirstName',PropertyNames,PropertyValuesString) + ' ' +
	dbo.fn_GetProfileElement('Employer.LastName',PropertyNames,PropertyValuesString) AS Fullname
	,dbo.fn_GetProfileElement('OrganizationName',PropertyNames,PropertyValuesString) AS OrganizationName
 FROM tbl_HiringAdvice ha 
	INNER JOIN dbo.aspnet_Profile p
		ON ha.writer=p.UserId
	WHERE id=@id and active=1

EXEC proc_GetHiringAdviceById 17

CREATE TABLE tbl_CommentHiring(
	id int primary key identity(1,1),
	tid int references tbl_HiringAdvice(id),
	writer uniqueidentifier,
	body nvarchar(1000),
	createddate datetime default getdate(),
	active bit default 0
)

ALTER PROC proc_InsertCommentHiring
	@tid int,
	@writername uniqueidentifier,
	@body nvarchar(1000),
	@active bit
AS
INSERT INTO tbl_CommentHiring(tid,writer,body,active)
	VALUES(@tid,@writername,@body,@active)

ALTER PROC view_CommentHiring
	@id int
AS
SELECT ha.id,ha.tid,ha.writer,ha.body,ha.createddate,ha.active,
	dbo.fn_GetProfileElement('Employer.FirstName',PropertyNames,PropertyValuesString) + ' ' +
	dbo.fn_GetProfileElement('Employer.LastName',PropertyNames,PropertyValuesString) AS Fullname
	,dbo.fn_GetProfileElement('PersonalImage',PropertyNames,PropertyValuesString) AS Logo
	,dbo.fn_GetProfileElement('OrganizationName',PropertyNames,PropertyValuesString) AS OrganizationName
 FROM tbl_CommentHiring ha 
	INNER JOIN dbo.aspnet_Profile p
		ON ha.writer=p.UserId
WHERE tid=@id and active=1 
ORDER BY createddate desc

EXEC view_CommentHiring 22
SELECT * FROM tbl_CommentHiring

ALTER PROC proc_GetNumberOfCommentHiringById
	@tid int
AS
SELECT count(id) AS NoCm FROM tbl_CommentHiring WHERE tid=@tid AND active=1

EXEC proc_GetNumberOfCommentHiringById 22

ALTER PROC proc_GetRecentComment
	@tid int
AS
SELECT TOP(1) ha.id,ha.tid,ha.writer,ha.body,ha.createddate,ha.active,
	dbo.fn_GetProfileElement('Employer.FirstName',PropertyNames,PropertyValuesString) + ' ' +
	dbo.fn_GetProfileElement('Employer.LastName',PropertyNames,PropertyValuesString) AS Fullname
	,dbo.fn_GetProfileElement('PersonalImage',PropertyNames,PropertyValuesString) AS Logo
 FROM tbl_CommentHiring ha 
	INNER JOIN dbo.aspnet_Profile p
		ON ha.writer=p.UserId
WHERE tid=@tid and active=1 
ORDER BY createddate desc

EXEC proc_GetRecentComment 53
SELECT * FROM view_GetLang_en ORDER BY lang_name_en ASC
SELECT * FROM view_GetLanglvl_en
---------------------------

CREATE TABLE tbl_SaveCV(
	id int primary key identity(1,1),
	Saver uniqueidentifier,
	cvUserId uniqueidentifier,
	createdDate datetime default getdate()
)
ALTER TABLE tbl_SaveCV
ADD favorite bit DEFAULT 0

SELECT * FROM tbl_Savecv

Alter PROC proc_GetSavedCV
	@saver uniqueidentifier
AS
SELECT id,cvUserId,createddate,favorite
	,dbo.fn_GetProfileElement('Employee.FirstName',PropertyNames,PropertyValuesString) + ' ' +
	dbo.fn_GetProfileElement('Employee.LastName',PropertyNames,PropertyValuesString) AS Fullname
	,dbo.fn_GetProfileElement('Avatar',PropertyNames,PropertyValuesString) AS Avatar
	,dbo.fn_GetProfileElement('Major',PropertyNames,PropertyValuesString) AS Major
				FROM tbl_Savecv cv
	INNER JOIN dbo.aspnet_Profile p
	ON cv.cvuserid=p.UserId
	WHERE saver=@saver

CREATE PROC proc_DeleteSavedCV
	@id int
AS 
DELETE FROM tbl_Savecv WHERE id=@id

EXEC proc_DeleteSavedCV 2

CREATE TABLE tbl_SaveJob2
(
	id int primary key identity(1,1),
	candidate uniqueidentifier REFERENCES aspnet_Users(UserId),
	jId INT REFERENCES tbl_TeachingJob(jId),
	savedate datetime default getdate(),
)
INSERT INTO tbl_SaveJob2(candidate,jId) VALUES('19C92C1A-B6C0-4333-9734-B646148F311A',99)
SELECT * FROM tbl_SAvejob2

ALTER PROC proc_GetSaveJob2
	@candidate uniqueidentifier
AS
SELECT sj.id,sj.candidate,sj.jid,j.jTitle_en,sj.savedate,j.jClosingDate FROM tbl_SAvejob2 sj INNER JOIN 
	tbl_TeachingJob j 		
	ON sj.jid = j.jid
WHERE sj.candidate = @candidate
ORDER BY sj.savedate DESC

EXEC proc_GetSaveJob2 '19C92C1A-B6C0-4333-9734-B646148F311A'

CREATE PROC proc_DeleteSaveJob2
	@id int
AS
DELETE FROM tbl_SaveJob2 WHERE id =@id

EXEC proc_DeleteSaveJob2 2

DELETE FROM tbl_CommentHiring WHERE id =14
SELECT * FROM tbl_CommentHiring

ALTER TABLE tbl_CommentHiring NOCHECK CONSTRAINT ConstraintName

EXEC Proc_GetSectorFull 1

SELECT ctId, ctName_en, ctName_vi FROM  dbo.tbl_Job_Citizenship
-------------COMMENT------------------
CREATE TABLE tbl_Comment(
	id int primary key identity(1,1),
	tid int references Testimonial_Article(id),
	writername nvarchar(100),
	email nvarchar(100),
	body nvarchar(1000),
	createddate datetime default getdate(),
	active bit default 0
)

ALTER PROC proc_InsertComment
	@tid int,
	@writername nvarchar(100),
	@email nvarchar(100),
	@body nvarchar(1000),
	@active bit
AS
INSERT INTO tbl_Comment(tid,writername,email,body,active)
	VALUES(@tid,@writername,@email,@body,@active)

INSERT INTO tbl_Comment(tid,writername,email,body,active)
	VALUES(7,'Vu Thanh Luan','bookworm6289@gmail.com','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum',1)

ALTER PROC view_Comment
	@tid int
AS
SELECT * FROM tbl_Comment WHERE tid=@tid and active=1 ORDER BY createddate desc

EXEC view_Comment 7


--SELECT jid,jtitle_en,jsector_en,jsector_en2,jsector_en3,jlocation_en,jlocation_en2,jlocation_en3,jClosingDate,jUploaddate FROM tbl_TeachingJob

Create PROC proc_GetJobAlert
	@cate1 nvarchar(100),
	@cate2 nvarchar(100),
	@cate3 nvarchar(100),
	@lo1 nvarchar(100),
	@lo2 nvarchar(100),
	@lo3 nvarchar(100)
AS
SELECT jid,jtitle_en,jClosingDate,jUploaddate FROM tbl_TeachingJob
WHERE (jsector_en=@cate1 OR jsector_en=@cate2 OR jsector_en=@cate3 
	OR jsector_en2=@cate1 OR jsector_en2=@cate2 OR jsector_en2=@cate3
	OR jsector_en3=@cate1 OR jsector_en3=@cate2 OR jsector_en3=@cate3) 
	AND 
	  (jlocation_en=@lo1 OR jlocation_en=@lo2 OR jlocation_en=@lo3 
	OR jlocation_en2=@lo1 OR jlocation_en2=@lo2 OR jlocation_en2=@lo3
	OR jlocation_en3=@lo1 OR jlocation_en3=@lo2 OR jlocation_en3=@lo3)
	AND jClosingDate > getdate() AND jactive=1
		


EXEC proc_GetJobAlert '','','','','',''

SELECT * FROM tbl_TeachingJob

---------------------------------JOB ALERT----------------------------------
CREATE TABLE tbl_JobAlert(
	id int primary key identity(1,1),
	email varchar(100),
	register_date datetime default getdate(),
	active bit default 1,
)
GO

CREATE PROC proc_RegisterJobAlert
	@email varchar(100)
AS
INSERT INTO tbl_JobAlert(email) VALUES (@email)
GO

CREATE PROC proc_IsRegisterJobAlert
	@email varchar(100)
AS
SELECT id FROM tbl_JobAlert WHERE email=@email
GO

CREATE PROC proc_IsActive
	@email varchar(100)
AS
SELECT id FROM tbl_JobAlert WHERE email=@email AND active=1
GO

CREATE PROC proc_SetOnOffJobAlert
	@email varchar(100),
	@onoff bit
AS 
UPDATE tbl_JobAlert SET active=@onoff WHERE email=@email
GO

CREATE PROC proc_JobAlert_GetActiveValue
	@email varchar(100)
AS
SELECT active FROM tbl_JobAlert WHERE email=@email
GO

EXEC proc_JobAlert_GetActiveValue 'luanvt@gmail.com'
EXEC proc_SetOnOffJobAlert 'luanvt@gmail.com',1
EXEC proc_IsRegisterJobAlert 'luanvt@gmail.com'
EXEC proc_IsActive 'iceberg.lava@gmail.com'

select * FROM tbl_JobAlert
--------------------------------------------------------------
--auto-complete
CREATE PROC proc_GetAllJobTitle
AS
SELECT jtitle_en from tbl_TeachingJob WHERE jActive=1 AND jClosingDate>GETDATE()

EXEC proc_GetAllJobTitle
-------------------------------

----Grid view admin----
Create Proc proc_Admin_GetTeachingJob
AS
SELECT jid,jtitle_en,juploaddate,jactive from tbl_TeachingJob WHERE jclosingdate>=getdate() ORDER BY juploaddate DESC

EXEC proc_Admin_GetTeachingJob

Create proc proc_admin_SetActiveJob
	@jid int,
	@active bit
AS
UPDATE tbl_teachingjob SET jactive=@active WHERE jid=@jid

exec proc_admin_SetActiveJob 130,'false'
SELECT * FROM tbl_teachingjob

Alter Proc proc_GetAllCV
AS
SELECT u.username,s1.Fullname,s1.CreateDate,s1.lastupdated,s1.active FROM aspnet_users u
INNER JOIN 
(SELECT TOP(5000) uir.UserId,
	dbo.fn_GetProfileElement('Employee.FirstName',PropertyNames,PropertyValuesString) + ' ' +
	dbo.fn_GetProfileElement('Employee.LastName',PropertyNames,PropertyValuesString) AS Fullname,
	dbo.fn_GetProfileElement('CreateDate',PropertyNames,PropertyValuesString) AS CreateDate,
	dbo.fn_GetProfileElement('LastUpdated',PropertyNames,PropertyValuesString) AS LastUpdated,
	dbo.fn_GetProfileElement('Active',PropertyNames,PropertyValuesString) AS Active
FROM dbo.aspnet_Profile p INNER JOIN aspnet_UsersInRoles uir
ON p.UserId = uir.UserId
WHERE RoleId='b9af627b-5f65-4c6b-b442-ed6459b6922f' ORDER BY CREATEDATE DESC,LASTUPDATED DESC) s1
ON s1.UserId=u.userid


SELECT * FROM view_GetAllCV

select * from aspnet_users
select * FROM dbo.aspnet_Profile 
--------------

CREATE PROC proc_GetComponent_GetRootCategory
AS
SELECT seid,sename_en,sename_vi FROM tbl_Job_Sector WHERE seParentId=0

EXEC proc_GetComponent_GetRootCategory


--List Citizen

INSERT INTO tbl_job_citizenship(ctName_en) values('Afghanistan')
INSERT INTO tbl_job_citizenship(ctName_en) values('Albania')
INSERT INTO tbl_job_citizenship(ctName_en) values('Algeria')
INSERT INTO tbl_job_citizenship(ctName_en) values('Andorra')
INSERT INTO tbl_job_citizenship(ctName_en) values('Angola')
INSERT INTO tbl_job_citizenship(ctName_en) values('Anguilla')
INSERT INTO tbl_job_citizenship(ctName_en) values('Antigua')
INSERT INTO tbl_job_citizenship(ctName_en) values('Argentina')
INSERT INTO tbl_job_citizenship(ctName_en) values('Amenia')
INSERT INTO tbl_job_citizenship(ctName_en) values('Aruba')
INSERT INTO tbl_job_citizenship(ctName_en) values('Azerbaijan')
INSERT INTO tbl_job_citizenship(ctName_en) values('Bahamas')
INSERT INTO tbl_job_citizenship(ctName_en) values('Bahrain')
INSERT INTO tbl_job_citizenship(ctName_en) values('Bangladesh')
INSERT INTO tbl_job_citizenship(ctName_en) values('Barbados')
INSERT INTO tbl_job_citizenship(ctName_en) values('Belarus')
INSERT INTO tbl_job_citizenship(ctName_en) values('Belgium')
INSERT INTO tbl_job_citizenship(ctName_en) values('Belize')
INSERT INTO tbl_job_citizenship(ctName_en) values('Benin')
INSERT INTO tbl_job_citizenship(ctName_en) values('Bermuda')
INSERT INTO tbl_job_citizenship(ctName_en) values('Bhutan')
INSERT INTO tbl_job_citizenship(ctName_en) values('Bolivia')
INSERT INTO tbl_job_citizenship(ctName_en) values('Bosnia')
INSERT INTO tbl_job_citizenship(ctName_en) values('Botswana')
INSERT INTO tbl_job_citizenship(ctName_en) values('Brazil')
INSERT INTO tbl_job_citizenship(ctName_en) values('British Virgin Islands')
INSERT INTO tbl_job_citizenship(ctName_en) values('Brunei')
INSERT INTO tbl_job_citizenship(ctName_en) values('Bulgaria')
INSERT INTO tbl_job_citizenship(ctName_en) values('Burkina Faso')
INSERT INTO tbl_job_citizenship(ctName_en) values('Burundi')
INSERT INTO tbl_job_citizenship(ctName_en) values('Cambodia')
INSERT INTO tbl_job_citizenship(ctName_en) values('Cameroon')
INSERT INTO tbl_job_citizenship(ctName_en) values('Cayman Islands')
INSERT INTO tbl_job_citizenship(ctName_en) values('Central African Republic')
INSERT INTO tbl_job_citizenship(ctName_en) values('Chad')
INSERT INTO tbl_job_citizenship(ctName_en) values('Chile')
INSERT INTO tbl_job_citizenship(ctName_en) values('Colombia')
INSERT INTO tbl_job_citizenship(ctName_en) values('Congo')
INSERT INTO tbl_job_citizenship(ctName_en) values('Costa Rica')
INSERT INTO tbl_job_citizenship(ctName_en) values('Côte d''Ivoire')
INSERT INTO tbl_job_citizenship(ctName_en) values('Croatia')
INSERT INTO tbl_job_citizenship(ctName_en) values('Cuba')
INSERT INTO tbl_job_citizenship(ctName_en) values('Cyprus')
INSERT INTO tbl_job_citizenship(ctName_en) values('Czech Republic')
INSERT INTO tbl_job_citizenship(ctName_en) values('Denmark')
INSERT INTO tbl_job_citizenship(ctName_en) values('Dominica')
INSERT INTO tbl_job_citizenship(ctName_en) values('Dominican Republic')
INSERT INTO tbl_job_citizenship(ctName_en) values('East Timor')
INSERT INTO tbl_job_citizenship(ctName_en) values('Ecuador')
INSERT INTO tbl_job_citizenship(ctName_en) values('Egypt')
INSERT INTO tbl_job_citizenship(ctName_en) values('El Salvador')
INSERT INTO tbl_job_citizenship(ctName_en) values('Equatorial Guinea')
INSERT INTO tbl_job_citizenship(ctName_en) values('Eritrea')
INSERT INTO tbl_job_citizenship(ctName_en) values('Estonia')
INSERT INTO tbl_job_citizenship(ctName_en) values('Ethiopia')
INSERT INTO tbl_job_citizenship(ctName_en) values('Fiji')
INSERT INTO tbl_job_citizenship(ctName_en) values('Finland')
INSERT INTO tbl_job_citizenship(ctName_en) values('Gabon')
INSERT INTO tbl_job_citizenship(ctName_en) values('Georgia')
INSERT INTO tbl_job_citizenship(ctName_en) values('Germany')
INSERT INTO tbl_job_citizenship(ctName_en) values('Ghana')
INSERT INTO tbl_job_citizenship(ctName_en) values('Greece')
INSERT INTO tbl_job_citizenship(ctName_en) values('Grenada')
INSERT INTO tbl_job_citizenship(ctName_en) values('Guadeloupe')
INSERT INTO tbl_job_citizenship(ctName_en) values('Guatemala')
INSERT INTO tbl_job_citizenship(ctName_en) values('Guinea')
INSERT INTO tbl_job_citizenship(ctName_en) values('Guinea-Bissau')
INSERT INTO tbl_job_citizenship(ctName_en) values('Guyana')
INSERT INTO tbl_job_citizenship(ctName_en) values('Haiti')
INSERT INTO tbl_job_citizenship(ctName_en) values('Honduras')
INSERT INTO tbl_job_citizenship(ctName_en) values('Hong Kong')
INSERT INTO tbl_job_citizenship(ctName_en) values('Hungary')
INSERT INTO tbl_job_citizenship(ctName_en) values('Iceland')
INSERT INTO tbl_job_citizenship(ctName_en) values('India')
INSERT INTO tbl_job_citizenship(ctName_en) values('Indonesia')
INSERT INTO tbl_job_citizenship(ctName_en) values('Iran')
INSERT INTO tbl_job_citizenship(ctName_en) values('Iraq')
INSERT INTO tbl_job_citizenship(ctName_en) values('Israel')
INSERT INTO tbl_job_citizenship(ctName_en) values('Italy')
INSERT INTO tbl_job_citizenship(ctName_en) values('Jamaica')
INSERT INTO tbl_job_citizenship(ctName_en) values('Jordan')
INSERT INTO tbl_job_citizenship(ctName_en) values('Kazakhstan')
INSERT INTO tbl_job_citizenship(ctName_en) values('Kenya')
INSERT INTO tbl_job_citizenship(ctName_en) values('Korea')
INSERT INTO tbl_job_citizenship(ctName_en) values('Kuwait')
INSERT INTO tbl_job_citizenship(ctName_en) values('Kyrgyzstan')
INSERT INTO tbl_job_citizenship(ctName_en) values('Latvia')
INSERT INTO tbl_job_citizenship(ctName_en) values('Lebanon')
INSERT INTO tbl_job_citizenship(ctName_en) values('Lesotho')
INSERT INTO tbl_job_citizenship(ctName_en) values('Liberia')
INSERT INTO tbl_job_citizenship(ctName_en) values('Libya')
INSERT INTO tbl_job_citizenship(ctName_en) values('Liechtenstein')
INSERT INTO tbl_job_citizenship(ctName_en) values('Lithuania')
INSERT INTO tbl_job_citizenship(ctName_en) values('Luxembourg')
INSERT INTO tbl_job_citizenship(ctName_en) values('Macau')
INSERT INTO tbl_job_citizenship(ctName_en) values('Macedonia')
INSERT INTO tbl_job_citizenship(ctName_en) values('Madagascar')
INSERT INTO tbl_job_citizenship(ctName_en) values('Malawi')
INSERT INTO tbl_job_citizenship(ctName_en) values('Malaysia')
INSERT INTO tbl_job_citizenship(ctName_en) values('Maldives')
INSERT INTO tbl_job_citizenship(ctName_en) values('Mali')
INSERT INTO tbl_job_citizenship(ctName_en) values('Malta')
INSERT INTO tbl_job_citizenship(ctName_en) values('Marshall Islands')
INSERT INTO tbl_job_citizenship(ctName_en) values('Martinique')
INSERT INTO tbl_job_citizenship(ctName_en) values('Mauritania')
INSERT INTO tbl_job_citizenship(ctName_en) values('Mauritius')
INSERT INTO tbl_job_citizenship(ctName_en) values('Mexico')
INSERT INTO tbl_job_citizenship(ctName_en) values('Moldova')
INSERT INTO tbl_job_citizenship(ctName_en) values('Monaco')
INSERT INTO tbl_job_citizenship(ctName_en) values('Mongolia')
INSERT INTO tbl_job_citizenship(ctName_en) values('Montenegro')
INSERT INTO tbl_job_citizenship(ctName_en) values('Montserrat')
INSERT INTO tbl_job_citizenship(ctName_en) values('Morocco')
INSERT INTO tbl_job_citizenship(ctName_en) values('Mozambique')
INSERT INTO tbl_job_citizenship(ctName_en) values('Myanmar')
INSERT INTO tbl_job_citizenship(ctName_en) values('Namibia')
INSERT INTO tbl_job_citizenship(ctName_en) values('Nepal')
INSERT INTO tbl_job_citizenship(ctName_en) values('Netherlands')
INSERT INTO tbl_job_citizenship(ctName_en) values('Nicaragua')
INSERT INTO tbl_job_citizenship(ctName_en) values('Niger')
INSERT INTO tbl_job_citizenship(ctName_en) values('Nigeria')
INSERT INTO tbl_job_citizenship(ctName_en) values('Norway')
INSERT INTO tbl_job_citizenship(ctName_en) values('Oman')
INSERT INTO tbl_job_citizenship(ctName_en) values('Pakistan')
INSERT INTO tbl_job_citizenship(ctName_en) values('Palestinian territories')
INSERT INTO tbl_job_citizenship(ctName_en) values('Panama')
INSERT INTO tbl_job_citizenship(ctName_en) values('Papua New Guinea')
INSERT INTO tbl_job_citizenship(ctName_en) values('Paraguay')
INSERT INTO tbl_job_citizenship(ctName_en) values('Peru')
INSERT INTO tbl_job_citizenship(ctName_en) values('Philippines')
INSERT INTO tbl_job_citizenship(ctName_en) values('Poland')
INSERT INTO tbl_job_citizenship(ctName_en) values('Portugal')
INSERT INTO tbl_job_citizenship(ctName_en) values('Qatar')
INSERT INTO tbl_job_citizenship(ctName_en) values('Romania')
INSERT INTO tbl_job_citizenship(ctName_en) values('Rwanda')
INSERT INTO tbl_job_citizenship(ctName_en) values('Saudi Arabia')
INSERT INTO tbl_job_citizenship(ctName_en) values('Scotland')
INSERT INTO tbl_job_citizenship(ctName_en) values('Senegal')
INSERT INTO tbl_job_citizenship(ctName_en) values('Serbia')
INSERT INTO tbl_job_citizenship(ctName_en) values('Seychelles')
INSERT INTO tbl_job_citizenship(ctName_en) values('Sierra Leone')
INSERT INTO tbl_job_citizenship(ctName_en) values('Singapore')
INSERT INTO tbl_job_citizenship(ctName_en) values('Slovakia')
INSERT INTO tbl_job_citizenship(ctName_en) values('Slovenia')
INSERT INTO tbl_job_citizenship(ctName_en) values('Somalia')
INSERT INTO tbl_job_citizenship(ctName_en) values('Spain')
INSERT INTO tbl_job_citizenship(ctName_en) values('Sri Lanka')
INSERT INTO tbl_job_citizenship(ctName_en) values('Sudan')
INSERT INTO tbl_job_citizenship(ctName_en) values('Sweden')
INSERT INTO tbl_job_citizenship(ctName_en) values('Switzerland')
INSERT INTO tbl_job_citizenship(ctName_en) values('Syria')
INSERT INTO tbl_job_citizenship(ctName_en) values('Taiwan')
INSERT INTO tbl_job_citizenship(ctName_en) values('Tajikistan')
INSERT INTO tbl_job_citizenship(ctName_en) values('Tanzania')
INSERT INTO tbl_job_citizenship(ctName_en) values('Togo')
INSERT INTO tbl_job_citizenship(ctName_en) values('Trinidad and Tobago')
INSERT INTO tbl_job_citizenship(ctName_en) values('Tunisia')
INSERT INTO tbl_job_citizenship(ctName_en) values('Turkey')
INSERT INTO tbl_job_citizenship(ctName_en) values('Turkmenistan')
INSERT INTO tbl_job_citizenship(ctName_en) values('Uganda')
INSERT INTO tbl_job_citizenship(ctName_en) values('Ukraine')
INSERT INTO tbl_job_citizenship(ctName_en) values('United Arab Emirates')
INSERT INTO tbl_job_citizenship(ctName_en) values('Uruguay')
INSERT INTO tbl_job_citizenship(ctName_en) values('Uzbekistan')
INSERT INTO tbl_job_citizenship(ctName_en) values('Venezuela')
INSERT INTO tbl_job_citizenship(ctName_en) values('Yemen')
INSERT INTO tbl_job_citizenship(ctName_en) values('Zambia')
INSERT INTO tbl_job_citizenship(ctName_en) values('Zimbabwe')

--SECTOR
SELECT * FROM tbl_Job_Sector
INSERT INTO tbl_Job_Sector VALUES('Admisnistration affairs',N'Admisnistration affairs',1)
INSERT INTO tbl_Job_Sector(seName_en,seParentId) values('President, provost, VP',1)
INSERT INTO tbl_Job_Sector(seName_en,seParentId) values('Human Resoures',1)
INSERT INTO tbl_Job_Sector(seName_en,seParentId) values('Expertise and training',1)
INSERT INTO tbl_Job_Sector(seName_en,seParentId) values('Student affairs, residential life',1)
INSERT INTO tbl_Job_Sector(seName_en,seParentId) values('Advising/counseling/ Fellowship',1)
INSERT INTO tbl_Job_Sector(seName_en,seParentId) values('Computer services, IT',1)
INSERT INTO tbl_Job_Sector(seName_en,seParentId) values('Library administration',1)
INSERT INTO tbl_Job_Sector(seName_en,seParentId) values('Childcare and Medical',1)

INSERT INTO tbl_Job_Sector(seName_en,seParentId) values('English, ESL, Writing',2)
INSERT INTO tbl_Job_Sector(seName_en,seParentId) values('Languages & literature',2)
INSERT INTO tbl_Job_Sector(seName_en,seParentId) values('Psychology, Education of schools',2)
INSERT INTO tbl_Job_Sector(seName_en,seParentId) values('Arts-visual & performing arts',2)
INSERT INTO tbl_Job_Sector(seName_en,seParentId) values('History & anthropology',2)
INSERT INTO tbl_Job_Sector(seName_en,seParentId) values('Law & criminal justice',2)
INSERT INTO tbl_Job_Sector(seName_en,seParentId) values('Agriculture & horticulture',2)
INSERT INTO tbl_Job_Sector(seName_en,seParentId) values('Athletics, coach & sports management',2)
INSERT INTO tbl_Job_Sector(seName_en,seParentId) values('Biology/biotechnology',2)
INSERT INTO tbl_Job_Sector(seName_en,seParentId) values('Chemistry',2)
INSERT INTO tbl_Job_Sector(seName_en,seParentId) values('Physics',2)
INSERT INTO tbl_Job_Sector(seName_en,seParentId) values('Mathematics & statistics',2)
INSERT INTO tbl_Job_Sector(seName_en,seParentId) values('Medicine, dentistry, pharmacy',2)
INSERT INTO tbl_Job_Sector(seName_en,seParentId) values('Health sciences, nursing',2)
INSERT INTO tbl_Job_Sector(seName_en,seParentId) values('Computer Science, IT',2)
INSERT INTO tbl_Job_Sector(seName_en,seParentId) values('Construction & architecture',2)
INSERT INTO tbl_Job_Sector(seName_en,seParentId) values('Engineering, applied sciences',2)
INSERT INTO tbl_Job_Sector(seName_en,seParentId) values('Marketing, PR',2)
INSERT INTO tbl_Job_Sector(seName_en,seParentId) values('Communications, journalism, film, TV',2)
INSERT INTO tbl_Job_Sector(seName_en,seParentId) values('Accounting, economics, finance',2)
INSERT INTO tbl_Job_Sector(seName_en,seParentId) values('Hotel and tourism',2)
INSERT INTO tbl_Job_Sector(seName_en,seParentId) values('Management',2)
INSERT INTO tbl_Job_Sector(seName_en,seParentId) values('Human Society and Environment',2)
INSERT INTO tbl_Job_Sector(seName_en,seParentId) values('Social and Political studies',2)
INSERT INTO tbl_Job_Sector(seName_en,seParentId) values('TEFL',2)

INSERT INTO tbl_Job_Sector(seName_en,seParentId) values('English, ESL, Writing',3)
INSERT INTO tbl_Job_Sector(seName_en,seParentId) values('Languages & literature',3)
INSERT INTO tbl_Job_Sector(seName_en,seParentId) values('Psychology, Education of schools',3)
INSERT INTO tbl_Job_Sector(seName_en,seParentId) values('Arts-visual & performing arts',3)
INSERT INTO tbl_Job_Sector(seName_en,seParentId) values('History & anthropology',3)
INSERT INTO tbl_Job_Sector(seName_en,seParentId) values('Law & criminal justice',3)
INSERT INTO tbl_Job_Sector(seName_en,seParentId) values('Agriculture & horticulture',3)
INSERT INTO tbl_Job_Sector(seName_en,seParentId) values('Athletics, coach & sports management',3)
INSERT INTO tbl_Job_Sector(seName_en,seParentId) values('Biology/biotechnology',3)
INSERT INTO tbl_Job_Sector(seName_en,seParentId) values('Chemistry',3)
INSERT INTO tbl_Job_Sector(seName_en,seParentId) values('Physics',3)
INSERT INTO tbl_Job_Sector(seName_en,seParentId) values('Mathematics & statistics',3)
INSERT INTO tbl_Job_Sector(seName_en,seParentId) values('Medicine, dentistry, pharmacy',3)
INSERT INTO tbl_Job_Sector(seName_en,seParentId) values('Health sciences, nursing',3)
INSERT INTO tbl_Job_Sector(seName_en,seParentId) values('Computer Science, IT',3)
INSERT INTO tbl_Job_Sector(seName_en,seParentId) values('Construction & architecture',3)
INSERT INTO tbl_Job_Sector(seName_en,seParentId) values('Engineering, applied sciences',3)
INSERT INTO tbl_Job_Sector(seName_en,seParentId) values('Marketing, PR',3)
INSERT INTO tbl_Job_Sector(seName_en,seParentId) values('Communications, journalism, film, TV',3)
INSERT INTO tbl_Job_Sector(seName_en,seParentId) values('Accounting, economics, finance',3)
INSERT INTO tbl_Job_Sector(seName_en,seParentId) values('Hotel and tourism',3)
INSERT INTO tbl_Job_Sector(seName_en,seParentId) values('Management ',3)
INSERT INTO tbl_Job_Sector(seName_en,seParentId) values('Human Society and Environment',3)
INSERT INTO tbl_Job_Sector(seName_en,seParentId) values('Social and Political studies',3)
INSERT INTO tbl_Job_Sector(seName_en,seParentId) values('TEFL',3)



INSERT INTO tbl_Lang(lang_name_en) VALUES('Arabic')
INSERT INTO tbl_Lang(lang_name_en) VALUES('Bengali')
INSERT INTO tbl_Lang(lang_name_en) VALUES('Bulgarian')
INSERT INTO tbl_Lang(lang_name_en) VALUES('Burmese')
INSERT INTO tbl_Lang(lang_name_en) VALUES('Cambodian')
INSERT INTO tbl_Lang(lang_name_en) VALUES('CeBuano')
INSERT INTO tbl_Lang(lang_name_en) VALUES('Chinese (Cantonese)')
INSERT INTO tbl_Lang(lang_name_en) VALUES('Chinese (Mandarin)')
INSERT INTO tbl_Lang(lang_name_en) VALUES('Czech')
INSERT INTO tbl_Lang(lang_name_en) VALUES('Danish')
INSERT INTO tbl_Lang(lang_name_en) VALUES('Dutch')
INSERT INTO tbl_Lang(lang_name_en) VALUES('English')
INSERT INTO tbl_Lang(lang_name_en) VALUES('Finnish')
INSERT INTO tbl_Lang(lang_name_en) VALUES('French')
INSERT INTO tbl_Lang(lang_name_en) VALUES('German')
INSERT INTO tbl_Lang(lang_name_en) VALUES('Greek')
INSERT INTO tbl_Lang(lang_name_en) VALUES('Hindi')
INSERT INTO tbl_Lang(lang_name_en) VALUES('Hungarian')
INSERT INTO tbl_Lang(lang_name_en) VALUES('Vietnamese')
INSERT INTO tbl_Lang(lang_name_en) VALUES('Korean')

SELECT * FROM tbl_lang
SELECT j.jId,j.jTitle_en,j.jEmployer,t2.Username,t2.OrganizationName,t2.Logo,j.jSalary_en,j.jSector_en,j.jLocation_en,j.jcitizenship_en,j.jUploadDate,j.jClosingDate,j.jJobLevel_en,j.jEmploymentType_en,j.jViewCount 
FROM tbl_TeachingJob j 
	INNER JOIN 
	(SELECT us.UserId,us.Username,dbo.fn_GetProfileElement('Logo',PropertyNames,PropertyValuesString) AS Logo ,
		dbo.fn_GetProfileElement('OrganizationName',PropertyNames,PropertyValuesString) AS OrganizationName 
	FROM dbo.aspnet_Profile p 
		INNER JOIN dbo.aspnet_Users us 
		ON p.UserId=us.UserId) t2 
	ON t2.UserId=j.jEmployer
	
	
ALTER DATABASE [TeachingJob] SET Multi_User	

