USE [CCIS2781]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 2/3/2016 1:03:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Institution] [nvarchar](100) NOT NULL,
	[Branch] [nvarchar](50) NOT NULL,
	[CustAddress] [nvarchar](30) NOT NULL,
	[CustCity] [nvarchar](25) NOT NULL,
	[CustState] [nchar](2) NOT NULL,
	[CustZip] [nchar](9) NOT NULL,
	[CustPhone] [nchar](10) NOT NULL,
	[AuthAgent] [nvarchar](30) NOT NULL,
	[MAgmt] [nvarchar](1) NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[Institution] ASC,
	[Branch] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Expenses]    Script Date: 2/3/2016 1:03:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Expenses](
	[TicketNo] [int] NOT NULL,
	[ProbNo] [int] NOT NULL,
	[ResNo] [int] NOT NULL,
	[HoursWorked] [numeric](5, 2) NULL,
	[CostHours] [smallmoney] NULL,
	[Mileage] [numeric](5, 1) NULL,
	[CostMiles] [smallmoney] NULL,
	[Supplies] [smallmoney] NULL,
	[Misc] [smallmoney] NULL,
 CONSTRAINT [PK_Expenses] PRIMARY KEY CLUSTERED 
(
	[TicketNo] ASC,
	[ProbNo] ASC,
	[ResNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Problems]    Script Date: 2/3/2016 1:03:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Problems](
	[TicketNo] [int] NOT NULL,
	[ProbNo] [int] NOT NULL,
	[ProbDesc] [nvarchar](500) NOT NULL,
	[TechNo] [int] NOT NULL,
	[ProdNo] [int] NOT NULL,
 CONSTRAINT [PK_Problems] PRIMARY KEY CLUSTERED 
(
	[TicketNo] ASC,
	[ProbNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 2/3/2016 1:03:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProdNo] [int] IDENTITY(1,1) NOT NULL,
	[ProdDesc] [nvarchar](250) NOT NULL,
	[ProdHS] [nvarchar](1) NOT NULL,
	[Manufacturer] [nvarchar](100) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProdNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Resolutions]    Script Date: 2/3/2016 1:03:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Resolutions](
	[TicketNo] [int] NOT NULL,
	[ProbNo] [int] NOT NULL,
	[ResNo] [int] NOT NULL,
	[ResDesc] [nvarchar](500) NOT NULL,
	[FixDate] [smalldatetime] NULL,
	[ArrDate] [smalldatetime] NULL,
	[TechNo] [int] NOT NULL,
 CONSTRAINT [PK_Resolutions] PRIMARY KEY CLUSTERED 
(
	[TicketNo] ASC,
	[ProbNo] ASC,
	[ResNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Technicians]    Script Date: 2/3/2016 1:03:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Technicians](
	[TechNo] [int] IDENTITY(1,1) NOT NULL,
	[LName] [nvarchar](25) NOT NULL,
	[FName] [nvarchar](15) NOT NULL,
	[MInit] [nchar](1) NULL,
	[EMail] [nvarchar](50) NULL,
	[DeptName] [nvarchar](15) NULL,
	[TechPhone] [nchar](10) NOT NULL,
	[HRate] [smallmoney] NOT NULL,
 CONSTRAINT [PK_Technicians] PRIMARY KEY CLUSTERED 
(
	[TechNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tickets]    Script Date: 2/3/2016 1:03:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tickets](
	[TicketNo] [int] IDENTITY(1,1) NOT NULL,
	[Institution] [nvarchar](100) NOT NULL,
	[Branch] [nvarchar](50) NOT NULL,
	[EventDate] [smalldatetime] NOT NULL,
	[ContactPhone] [nchar](10) NOT NULL,
	[ContactName] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_Tickets] PRIMARY KEY CLUSTERED 
(
	[TicketNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Customers] ADD  CONSTRAINT [CK_Customers_MAgmt]  DEFAULT ('N') FOR [MAgmt]
GO
ALTER TABLE [dbo].[Problems] ADD  CONSTRAINT [DF_Problems_ProdNo]  DEFAULT ((1)) FOR [ProdNo]
GO
ALTER TABLE [dbo].[Technicians] ADD  CONSTRAINT [DF_Technicians_HRate]  DEFAULT ((1)) FOR [HRate]
GO
ALTER TABLE [dbo].[Tickets] ADD  CONSTRAINT [DF_Tickets_EventDate]  DEFAULT (getdate()) FOR [EventDate]
GO
ALTER TABLE [dbo].[Expenses]  WITH CHECK ADD  CONSTRAINT [FK_Expenses_Resolutions] FOREIGN KEY([TicketNo], [ProbNo], [ResNo])
REFERENCES [dbo].[Resolutions] ([TicketNo], [ProbNo], [ResNo])
GO
ALTER TABLE [dbo].[Expenses] CHECK CONSTRAINT [FK_Expenses_Resolutions]
GO
ALTER TABLE [dbo].[Problems]  WITH CHECK ADD  CONSTRAINT [FK_Problems_Products] FOREIGN KEY([ProdNo])
REFERENCES [dbo].[Products] ([ProdNo])
GO
ALTER TABLE [dbo].[Problems] CHECK CONSTRAINT [FK_Problems_Products]
GO
ALTER TABLE [dbo].[Problems]  WITH CHECK ADD  CONSTRAINT [FK_Problems_Technicians] FOREIGN KEY([TechNo])
REFERENCES [dbo].[Technicians] ([TechNo])
GO
ALTER TABLE [dbo].[Problems] CHECK CONSTRAINT [FK_Problems_Technicians]
GO
ALTER TABLE [dbo].[Problems]  WITH CHECK ADD  CONSTRAINT [FK_Problems_Tickets] FOREIGN KEY([TicketNo])
REFERENCES [dbo].[Tickets] ([TicketNo])
GO
ALTER TABLE [dbo].[Problems] CHECK CONSTRAINT [FK_Problems_Tickets]
GO
ALTER TABLE [dbo].[Resolutions]  WITH CHECK ADD  CONSTRAINT [FK_Resolutions_Problems] FOREIGN KEY([TicketNo], [ProbNo])
REFERENCES [dbo].[Problems] ([TicketNo], [ProbNo])
GO
ALTER TABLE [dbo].[Resolutions] CHECK CONSTRAINT [FK_Resolutions_Problems]
GO
ALTER TABLE [dbo].[Resolutions]  WITH CHECK ADD  CONSTRAINT [FK_Resolutions_Technicians] FOREIGN KEY([TechNo])
REFERENCES [dbo].[Technicians] ([TechNo])
GO
ALTER TABLE [dbo].[Resolutions] CHECK CONSTRAINT [FK_Resolutions_Technicians]
GO
ALTER TABLE [dbo].[Resolutions]  WITH CHECK ADD  CONSTRAINT [FK_Resolutions_Tickets] FOREIGN KEY([TicketNo])
REFERENCES [dbo].[Tickets] ([TicketNo])
GO
ALTER TABLE [dbo].[Resolutions] CHECK CONSTRAINT [FK_Resolutions_Tickets]
GO
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD  CONSTRAINT [FK_Tickets_Customers] FOREIGN KEY([Institution], [Branch])
REFERENCES [dbo].[Customers] ([Institution], [Branch])
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [FK_Tickets_Customers]
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [CK_Customers_CustPhone] CHECK  (([CustPhone] like N'[1-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'))
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [CK_Customers_CustPhone]
GO
ALTER TABLE [dbo].[Expenses]  WITH CHECK ADD  CONSTRAINT [CK_Expenses_CostHours] CHECK  (([CostHours]>=(0.0)))
GO
ALTER TABLE [dbo].[Expenses] CHECK CONSTRAINT [CK_Expenses_CostHours]
GO
ALTER TABLE [dbo].[Expenses]  WITH CHECK ADD  CONSTRAINT [CK_Expenses_CostMiles] CHECK  (([CostMiles]>=(0.0)))
GO
ALTER TABLE [dbo].[Expenses] CHECK CONSTRAINT [CK_Expenses_CostMiles]
GO
ALTER TABLE [dbo].[Expenses]  WITH CHECK ADD  CONSTRAINT [CK_Expenses_HoursWorked] CHECK  (([HoursWorked]>=(0.0)))
GO
ALTER TABLE [dbo].[Expenses] CHECK CONSTRAINT [CK_Expenses_HoursWorked]
GO
ALTER TABLE [dbo].[Expenses]  WITH CHECK ADD  CONSTRAINT [CK_Expenses_Mileage] CHECK  (([Mileage]>=(0.0)))
GO
ALTER TABLE [dbo].[Expenses] CHECK CONSTRAINT [CK_Expenses_Mileage]
GO
ALTER TABLE [dbo].[Expenses]  WITH CHECK ADD  CONSTRAINT [CK_Expenses_Misc] CHECK  (([Misc]>=(0.0)))
GO
ALTER TABLE [dbo].[Expenses] CHECK CONSTRAINT [CK_Expenses_Misc]
GO
ALTER TABLE [dbo].[Expenses]  WITH CHECK ADD  CONSTRAINT [CK_Expenses_Supplies] CHECK  (([Supplies]>=(0.0)))
GO
ALTER TABLE [dbo].[Expenses] CHECK CONSTRAINT [CK_Expenses_Supplies]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [CK_Products_ProdHS_HardwareORSoftware] CHECK  (([ProdHS]='S' OR [ProdHS]='H'))
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [CK_Products_ProdHS_HardwareORSoftware]
GO
ALTER TABLE [dbo].[Technicians]  WITH CHECK ADD  CONSTRAINT [CK_Technicians_HRate] CHECK  (([HRate]>(0)))
GO
ALTER TABLE [dbo].[Technicians] CHECK CONSTRAINT [CK_Technicians_HRate]
GO
ALTER TABLE [dbo].[Technicians]  WITH CHECK ADD  CONSTRAINT [CK_Technicians_TechPhone] CHECK  (([TechPhone] like N'[1-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'))
GO
ALTER TABLE [dbo].[Technicians] CHECK CONSTRAINT [CK_Technicians_TechPhone]
GO
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD  CONSTRAINT [CK_Tickets_ContactPhone] CHECK  (([ContactPhone] like N'[1-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'))
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [CK_Tickets_ContactPhone]
GO
