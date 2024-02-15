--CRUD
--USERS-------------------------------------------------------------------------
CREATE PROC GETALLUSERS
AS 
SELECT * FROM USERS
GO

-----------------
CREATE PROC GETALLUSERSBYINDEX  @FNAME NVARCHAR(50) , @LNAME NVARCHAR(50) , @EMAIL VARCHAR(50)
AS
SELECT * FROM USERS 
WHERE FirstName = @FNAME
AND LastName = @LNAME
AND EMAIL = @EMAIL
GO

-----------------
CREATE PROC ADDUSERS @FNAME NVARCHAR(50) , @LNAME NVARCHAR(50) , @CITY NVARCHAR(50) , @AGE INT , @EMAIL VARCHAR(50)
AS
INSERT INTO USERS(FirstName , LastName , CITY , AGE , EMAIL)
VALUES (@FNAME , @LNAME , @CITY , @AGE , @EMAIL)
GO

-----------------
CREATE PROC UPDATEUSERS @ID INT , @FNAME NVARCHAR(50) , @LNAME NVARCHAR(50) , @CITY NVARCHAR(50) , @AGE INT , @EMAIL VARCHAR(50)
AS
UPDATE USERS
SET FirstName = @FNAME , LastName = @LNAME , CITY = @CITY , AGE = @AGE , EMAIL = @EMAIL
WHERE UserID= @ID
GO 

-----------------	
ALTER PROC DELETEUSERS @ID INT
AS
DELETE FROM USERS
WHERE UserID = @ID
DELETE FROM USER_ROLE
WHERE UserID = @ID
DELETE FROM USERDUTY_DETAIL
WHERE UserID = @ID
DELETE FROM USERDUTY_DETAIL
WHERE ManagerID = @ID
GO 

-----------------

--ROLES-------------------------------------------------------------------------
CREATE PROC GETALLROLES
AS 
SELECT * FROM ROLES
GO

-----------------
CREATE PROC ADDROLES @NAME NVARCHAR(50)
AS
INSERT INTO ROLES (RoleName)
VALUES (@NAME)
GO

-----------------
CREATE PROC UPDATEROLES @NAME NVARCHAR(50) , @ID INT
AS
UPDATE ROLES
SET RoleName=@NAME
WHERE RoleID=@ID
GO 

-----------------	
CREATE PROC DELETEROLES @ID INT
AS
DELETE FROM ROLES
WHERE RoleID = @ID
DELETE FROM USER_ROLE
WHERE RoleID = @ID
GO

-----------------

--USER_ROLE-------------------------------------------------------------------------
CREATE PROC GETALLUSERROLE
AS 
SELECT * FROM USER_ROLE
GO

-----------------
CREATE PROC GETALLUSERROLEBYID @ID SMALLINT 
AS
SELECT * FROM USER_ROLE
WHERE UserID = @ID
GO

-----------------
CREATE PROC ADDUSERROLE @USERID SMALLINT, @ROLEID SMALLINT 
AS
INSERT INTO USER_ROLE(UserID , RoleID)
VALUES (@USERID , @ROLEID)
GO

-----------------
CREATE PROC UPDATEUSERROLE @USERID SMALLINT, @ROLEID SMALLINT 
AS
UPDATE USER_ROLE
SET RoleID =@ROLEID
WHERE UserID =@USERID
GO 

-----------------	
CREATE PROC DELETEUSERROLE @USERID SMALLINT, @ROLEID SMALLINT 
AS
DELETE FROM USER_ROLE
WHERE UserID=@USERID AND RoleID = @ROLEID
GO

-----------------

--DUTIES-------------------------------------------------------------------------
CREATE PROC GETALLDUTIES
AS 
SELECT * FROM DUTIES 
GO

-----------------
CREATE PROC ADDDUTIES @NAME NVARCHAR(50)
AS
INSERT INTO DUTIES(DutyName)
VALUES (@NAME)
GO

-----------------
CREATE PROC UPDATEDUTIES @ID SMALLINT, @NAME NVARCHAR(50)
AS
UPDATE DUTIES
SET DutyName=@NAME
WHERE DutyID=@ID
GO 

-----------------	
CREATE PROC DELETEDUTIES @ID SMALLINT
AS
DELETE FROM DUTIES
WHERE DutyID =@ID
DELETE FROM USERDUTY_DETAIL
WHERE DutyID =@ID
GO

-----------------

--WORKSTATUS-------------------------------------------------------------------------
CREATE PROC GETALLWORKSTATUS
AS 
SELECT * FROM WORKSTATUS
GO

-----------------
CREATE PROC ADDWORKSTATUS @STATUS NVARCHAR (50)
AS
INSERT INTO WORKSTATUS([Status])
VALUES (@STATUS)
GO

-----------------
CREATE PROC UPDATEWORKSTATUS @ID SMALLINT , @STATUS NVARCHAR(50)
AS
UPDATE WORKSTATUS
SET [STATUS] =@STATUS
WHERE StatusID =@ID
GO 

-----------------	
CREATE PROC DELETEWORKSTATUS @ID SMALLINT
AS
DELETE FROM WORKSTATUS
WHERE StatusID =@ID
DELETE FROM USERDUTY_DETAIL
WHERE StatusID = @ID
GO

-----------------

--USERDUTY_DETAIL-------------------------------------------------------------------------
CREATE PROC GETALLUSERDUTYDETAIL
AS 
SELECT * FROM USERDUTY_DETAIL
GO

-----------------
CREATE PROC GETALLUSERDUTYDETAILBYID @ID INT
AS
SELECT * FROM USERDUTY_DETAIL
WHERE UserID = @ID
GO

-----------------
CREATE PROC ADDUSERDUTYDETAIL @USERID SMALLINT , @MANAGERID SMALLINT , @DUTYID SMALLINT , @STATUSID SMALLINT , @DETAIL TEXT , @SALARY INT , @FFINISHTIME DATETIME , @ENDTIME DATETIME
AS
INSERT INTO USERDUTY_DETAIL (UserID,ManagerID,DutyID,StatusID,MissionDetail,BasicSalary,Agreed_FinishingTime,EndTime)
VALUES (@USERID,@MANAGERID,@DUTYID,@STATUSID,@DETAIL,@SALARY,@FFINISHTIME,@ENDTIME)
GO

-----------------
CREATE PROC UPDATEUSERDUTYDETAIL  @USERID SMALLINT , @MANAGERID SMALLINT , @DUTYID SMALLINT , @STATUSID SMALLINT , @DETAIL TEXT , @SALARY INT , @FFINISHTIME DATETIME , @ENDTIME DATETIME
AS
UPDATE USERDUTY_DETAIL
SET ManagerID=@MANAGERID , DutyID = @DUTYID , StatusID = @STATUSID , MissionDetail = @DETAIL , BasicSalary = @SALARY , Agreed_FinishingTime = @FFINISHTIME , EndTime = @ENDTIME
WHERE UserID =@USERID
GO 

-----------------	
CREATE PROC DELETEUSERDUTYDETAIL @USERID SMALLINT , @MANAGERID SMALLINT
AS
DELETE FROM USERDUTY_DETAIL
WHERE UserID =@USERID AND ManagerID = @MANAGERID 
GO