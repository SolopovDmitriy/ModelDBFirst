
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 08/20/2021 19:33:43
-- Generated from EDMX file: C:\Users\LoseFace\source\repos\ModelDBFirst\ModelDBFirst\MyLib.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [Library];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_AuthorsBook]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BookSet] DROP CONSTRAINT [FK_AuthorsBook];
GO
IF OBJECT_ID(N'[dbo].[FK_PublisherBook]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BookSet] DROP CONSTRAINT [FK_PublisherBook];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[AuthorsSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AuthorsSet];
GO
IF OBJECT_ID(N'[dbo].[PublisherSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PublisherSet];
GO
IF OBJECT_ID(N'[dbo].[BookSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[BookSet];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'AuthorsSet'
CREATE TABLE [dbo].[AuthorsSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [fio] nvarchar(max)  NOT NULL,
    [birthDate] datetime  NOT NULL
);
GO

-- Creating table 'PublisherSet'
CREATE TABLE [dbo].[PublisherSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'BookSet'
CREATE TABLE [dbo].[BookSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [title] nvarchar(max)  NOT NULL,
    [Authors_id] int  NOT NULL,
    [Publisher_id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'AuthorsSet'
ALTER TABLE [dbo].[AuthorsSet]
ADD CONSTRAINT [PK_AuthorsSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'PublisherSet'
ALTER TABLE [dbo].[PublisherSet]
ADD CONSTRAINT [PK_PublisherSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'BookSet'
ALTER TABLE [dbo].[BookSet]
ADD CONSTRAINT [PK_BookSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [AuthorsId] in table 'BookSet'
ALTER TABLE [dbo].[BookSet]
ADD CONSTRAINT [FK_AuthorsBook]
    FOREIGN KEY ([Authors_id])
    REFERENCES [dbo].[AuthorsSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AuthorsBook'
CREATE INDEX [IX_FK_AuthorsBook]
ON [dbo].[BookSet]
    ([AuthorsId]);
GO

-- Creating foreign key on [PublisherId] in table 'BookSet'
ALTER TABLE [dbo].[BookSet]
ADD CONSTRAINT [FK_PublisherBook]
    FOREIGN KEY ([Publisher_id])
    REFERENCES [dbo].[PublisherSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PublisherBook'
CREATE INDEX [IX_FK_PublisherBook]
ON [dbo].[BookSet]
    ([Publisher_id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------