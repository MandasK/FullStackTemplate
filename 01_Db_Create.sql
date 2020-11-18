USE [master]

IF db_id('BestReads') IS NUll
  CREATE DATABASE [BestReads]
GO

USE [BestReads]
GO


DROP TABLE IF EXISTS [Users];
DROP TABLE IF EXISTS [Books];
DROP TABLE IF EXISTS [State];
DROP TABLE IF EXISTS [Genre];
DROP TABLE IF EXISTS [Subscription];
DROP TABLE IF EXISTS [Reviews];
DROP TABLE IF EXISTS [ReadState];
DROP TABLE IF EXISTS [UserGenre];
DROP TABLE IF EXISTS [UserProfile];
DROP TABLE IF EXISTS [UserType];



CREATE TABLE [Users] (
  [id] int PRIMARY KEY IDENTITY,
  [name] nvarchar(50) NOT NULL,
  [displayName] nvarchar(50) NOT NULL,
  [bio] nvarchar(4000),
  [imageLocation] nvarchar(255),
  [firebaseUserId] NVARCHAR(28) NOT NULL,
  [email] nvarchar(555) NOT NULL

  CONSTRAINT UQ_FirebaseUserId UNIQUE(FirebaseUserId)
)
CREATE TABLE [Genre] (
  [id] int PRIMARY KEY IDENTITY,
  [name] nvarchar(255) NOT NULL
)

CREATE TABLE [Books] (
  [id] int PRIMARY KEY IDENTITY,
  [title] nvarchar(255) NOT NULL,
  [imageLocation] nvarchar(255),
  [about] nvarchar(555) NOT NULL,
  [authorName] nvarchar(255) NOT NULL,
  [genreId] int

  CONSTRAINT [FK_Books_Genre] FOREIGN KEY ([genreId]) REFERENCES [Genre] ([Id]),
)

CREATE TABLE [State] (
  [id] int PRIMARY KEY IDENTITY,
  [title] nvarchar(255) NOT NULL
)


CREATE TABLE [Subjects] (
  [id] int PRIMARY KEY IDENTITY,
  [name] nvarchar(255) NOT NULL
)


CREATE TABLE [Reviews] (
  [id] int PRIMARY KEY IDENTITY,
  [content] nvarchar(1500) NOT NULL,
  [rating] int NOT NULL,
  [stateId] int NOT NULL

  CONSTRAINT [FK_Review_State] FOREIGN KEY ([stateId]) REFERENCES [State] ([Id])
)


CREATE TABLE [ReadState] (
  [id] int PRIMARY KEY IDENTITY,
  [stateId] int NOT NULL,
  [userId] int NOT NULL,
  [bookId] int NOT NULL

  CONSTRAINT [FK_ReadState_State] FOREIGN KEY ([stateId]) REFERENCES [State] ([Id]),
  CONSTRAINT [FK_ReadState_User] FOREIGN KEY ([userId]) REFERENCES [Users] ([Id]),
  CONSTRAINT [FK_ReadState_Book] FOREIGN KEY ([bookId]) REFERENCES [Books] ([Id])
)


CREATE TABLE [UserGenre] (
  [id] int PRIMARY KEY IDENTITY,
  [genreId] int NOT NULL,
  [userId] int NOT NULL

  CONSTRAINT [FK_UserGenre_User] FOREIGN KEY ([userId]) REFERENCES [Users] ([Id]),
  CONSTRAINT [FK_UserGenre_Genre] FOREIGN KEY ([genreId]) REFERENCES [Genre] ([Id])
)
CREATE TABLE [dbo].[Subscription] (
    [Id]                      INT      IDENTITY (1, 1) NOT NULL,
    [SubscriberUserProfileId] INT      NOT NULL,
    [ProviderUserProfileId]   INT      NOT NULL,
    [BeginDateTime]           DATETIME NOT NULL,
    [EndDateTime]             DATETIME NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Subscription_Users_Subscriber] FOREIGN KEY ([SubscriberUserProfileId]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [FK_Subscription_Users_Provider] FOREIGN KEY ([ProviderUserProfileId]) REFERENCES [dbo].[Users] ([Id])
);
GO
