CREATE TABLE [dbo].[Subjects] (
    [SubId]     INT          NOT NULL,
    [SubName]   VARCHAR (50) NOT NULL,
    [StudentId] INT          NOT NULL,
    CONSTRAINT [FK_Subjects_StudentInfo] FOREIGN KEY ([StudentId]) REFERENCES [dbo].[StudentInfo] ([StudentId])
);

