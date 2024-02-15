USE [PERSON ]
--USERS-----------------------------------------------------------------------------------
CREATE TABLE USERS 
(
UserID SMALLINT PRIMARY KEY IDENTITY(1,1), 
FirstName NVARCHAR(50) NOT NULL,
LastName NVARCHAR(50) NOT NULL,
CITY NVARCHAR(50),
AGE INT, 
EMAIL VARCHAR(50) UNIQUE NOT NULL
)
CREATE INDEX INDEX_USERS ON USERS(FirstName , LastName, EMAIL)
--ROLES------------------------------------------------------------------------------------
CREATE TABLE ROLES
(
RoleID SMALLINT PRIMARY KEY IDENTITY(1,1),
RoleName NVARCHAR(50)
)
CREATE INDEX INDEX_ROLES ON ROLES(RoleName)
--USERS_ROLE-------------------------------------------------------------------------------
CREATE TABLE USER_ROLE 
(
UserID SMALLINT NOT NULL,
RoleID SMALLINT NOT NULL,
PRIMARY KEY (UserID,RoleID),
FOREIGN KEY (UserID) REFERENCES USERS(UserID),
FOREIGN KEY (RoleID) REFERENCES ROLES(RoleID)
)
--DUTIES------------------------------------------------------------------------------------
CREATE TABLE DUTIES
(
DutyID SMALLINT PRIMARY KEY IDENTITY(1,1),
DutyName NVARCHAR(50) UNIQUE 
)
CREATE INDEX INDEX_DUTIES ON DUTIES(DutyName)
--WORKSTATUS---------------------------------------------------------------------------------
CREATE TABLE WORKSTATUS
(
StatusID SMALLINT PRIMARY KEY IDENTITY(1,1),
[Status] NVARCHAR(50) 
)
CREATE INDEX INDEX_STATUS ON WORKSTATUS([STATUS])
--USERDUTY_DETAIL----------------------------------------------------------------------------
CREATE TABLE USERDUTY_DETAIL
(
UserID SMALLINT NOT NULL,
ManagerID SMALLINT NOT NULL,
DutyID SMALLINT NOT NULL,
StatusID SMALLINT NOT NULL,
MissionDetail TEXT NOT NULL,
Salary INT,
Agreed_FinishingTime DATETIME,
EndTime DATETIME,
PRIMARY KEY (UserID , DutyID , StatusID , ManagerID),
FOREIGN KEY (UserID) REFERENCES USERS(UserID),
FOREIGN KEY (ManagerID) REFERENCES USERS(UserID),
FOREIGN KEY (DutyID) REFERENCES DUTIES(DutyID),
FOREIGN KEY (StatusID) REFERENCES WORKSTATUS(StatusID)
)
exec sp_rename 'USERDUTY_DETAIL.Salary' , 'BasicSalary'

--------------------------------------------------------------------------------------------