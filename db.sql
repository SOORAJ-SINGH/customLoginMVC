USE [RoleDb]
GO
/****** Object:  Table [dbo].[ProductMaster]    Script Date: 14-12-2015 18:51:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProductMaster](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [varchar](50) NOT NULL,
	[Price] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tbl_Role]    Script Date: 14-12-2015 18:51:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tbl_Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Role] [varchar](50) NULL,
 CONSTRAINT [PK_Tbl_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tbl_User]    Script Date: 14-12-2015 18:51:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tbl_User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[RoleId] [int] NULL,
 CONSTRAINT [PK_Tbl_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_Role] ON 

GO
INSERT [dbo].[Tbl_Role] ([Id], [Role]) VALUES (1, N'Admin')
GO
INSERT [dbo].[Tbl_Role] ([Id], [Role]) VALUES (2, N'PC')
GO
INSERT [dbo].[Tbl_Role] ([Id], [Role]) VALUES (3, N'SPC')
GO
SET IDENTITY_INSERT [dbo].[Tbl_Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_User] ON 

GO
INSERT [dbo].[Tbl_User] ([Id], [UserName], [Password], [RoleId]) VALUES (1, N'Rahul', N'123', 2)
GO
INSERT [dbo].[Tbl_User] ([Id], [UserName], [Password], [RoleId]) VALUES (2, N'Sooraj', N'123', 1)
GO
SET IDENTITY_INSERT [dbo].[Tbl_User] OFF
GO
ALTER TABLE [dbo].[Tbl_User]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_User_Tbl_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Tbl_Role] ([Id])
GO
ALTER TABLE [dbo].[Tbl_User] CHECK CONSTRAINT [FK_Tbl_User_Tbl_Role]
GO
