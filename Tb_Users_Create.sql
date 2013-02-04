IF EXISTS
(
	SELECT * FROM sys.objects 
	WHERE	object_id = OBJECT_ID(N'Tb_Users')
	AND		type IN ('U')
)
    DROP TABLE Tb_Users;

--to create the table again


CREATE TABLE Tb_Users
(
	iTbUsersID			INT IDENTITY(1,1)		NOT NULL,
	vUserName			VARCHAR(50)				NOT NULL,
	vAuthVal			VARCHAR(50)				NOT NULL,
	iTbUserTypesID		INT						NOT NULL,
	iDeleteFlag			INT						NOT NULL	DEFAULT 0,
	iApprovedFlag		INT						NOT NULL	DEFAULT 0,
	dtCreatedOn			DATETIME				NOT NULL	DEFAULT GETDATE(),
	iCreatedByUserID	INT						NULL,
	dtUpdatedOn			DATETIME				NULL,
	iUpdatedByUserID	INT						NULL,
	CONSTRAINT PK_Tb_Users_UsersID
		PRIMARY KEY (iTbUsersID),
	CONSTRAINT FK_Users_iTbUserTypesID_UserTypes_iTbUserTypesID
		FOREIGN KEY (iTbUserTypesID) REFERENCES Tb_UserTypes(iTbUserTypesID)
);
