CREATE TABLE [dbo].[StudentInfo] (
    [StudentId] INT          NOT NULL,
    [name]      VARCHAR (50) NOT NULL,
    CONSTRAINT [PK_StudentInfo] PRIMARY KEY CLUSTERED ([StudentId] ASC)
);


GO
CREATE trigger [dbo].[tr_insert]
on [dbo].[StudentInfo]
after insert as 
begin
	set nocount on;
	
	select i.StudentId,i.name from inserted as i;
end;
GO
create trigger tr_delete
on dbo.StudentInfo
after delete as
begin
	declare @StudentId int;
	declare @name varchar(50);
	set nocount on;
	update p set p.name=@name
	from StudentInfo as p
	where exists(select * from deleted as d where p.StudentId=d.StudentId);
end;

GO
CREATE trigger tr_delete_insertTempDb
on dbo.StudentInfo
after delete as
begin
	declare @StudentId int;
	declare @name varchar(50);
	set nocount on;
	select * from inserted;
	select @StudentId=StudentId,@name=name from deleted;
	insert into OldValues values(@StudentId,@name) 
	
end;
