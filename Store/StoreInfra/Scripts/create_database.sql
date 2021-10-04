CREATE DATABASE [BaltaStore]

CREATE TABLE [Customer]
(
	[Id] UNIQUEIDENTIFIER PRIMARY KEY NOT NULL,
	[FirstName] VARCHAR(40) NOT NULL,
	[LastName] VARCHAR(40) NOT NULL,
	[Document] CHAR(11) NOT NULL,
	[Email] VARCHAR(160) NOT NULL,
	[Phone] VARCHAR(13) NOT NULL
)

CREATE TABLE [Address]
(
	[Id] UNIQUEIDENTIFIER PRIMARY KEY NOT NULL,
	[CustomerId] UNIQUEIDENTIFIER NOT NULL,
	[Number] VARCHAR(10) NOT NULL,
	[Complement] VARCHAR(40) NOT NULL,
	[District] VARCHAR(60) NOT NULL,
	[City] VARCHAR(60) NOT NULL,
	[State] CHAR(2) NOT NULL,
	[Country] CHAR(2) NOT NULL,
	[ZipCode] CHAR(8) NOT NULL,
	[Type] INT NOT NULL DEFAULT(1),
	FOREIGN KEY ([CustomerId]) REFERENCES [Customer]([Id])
)

CREATE TABLE [Product]
(
	[Id] UNIQUEIDENTIFIER PRIMARY KEY NOT NULL,
	[Title] VARCHAR(255) NOT NULL,
	[Description] TEXT NOT NULL,
	[Image] VARCHAR(1024) NOT NULL,
	[Price] MONEY NOT NULL,
	[QuantityOnHand] DECIMAL(10, 2) NOT NULL,
)

CREATE TABLE [Order]
(
	[Id] UNIQUEIDENTIFIER PRIMARY KEY NOT NULL,
	[CustomerId] UNIQUEIDENTIFIER NOT NULL,
	[CreateDate] DATETIME NOT NULL DEFAULT(GETDATE()),
	[Status] INT NOT NULL DEFAULT(1),
	FOREIGN KEY([CustomerId]) REFERENCES [Customer]([Id])
)

CREATE TABLE [OrderItem] (
	[Id] UNIQUEIDENTIFIER PRIMARY KEY NOT NULL,
	[OrderId] UNIQUEIDENTIFIER NOT NULL,
	[ProductId] UNIQUEIDENTIFIER NOT NULL,
	[Quantity] DECIMAL(10, 2) NOT NULL,
	[Price] MONEY NOT NULL,
	FOREIGN KEY([OrderId]) REFERENCES [Order]([Id]),
	FOREIGN KEY([ProductId]) REFERENCES [Product]([Id])
)

CREATE TABLE [Delivery] (
	[Id] UNIQUEIDENTIFIER PRIMARY KEY NOT NULL,
	[OrderId] UNIQUEIDENTIFIER NOT NULL,
	[CreateDate] DATETIME NOT NULL DEFAULT(GETDATE()),
	[EstimatedDeliveryDate]  DATETIME NOT NULL,
	[Status] INT NOT NULL DEFAULT(1),
	FOREIGN KEY([OrderId]) REFERENCES [Order]([Id])
)