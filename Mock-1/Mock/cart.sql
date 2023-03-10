USE [Wish]
GO
/****** Object:  Table [dbo].[product]    Script Date: 11/1/2020 10:53:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
	[image] [nvarchar](max) NULL,
	[price] [money] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[product] ON 

INSERT [dbo].[product] ([id], [name], [image], [price]) VALUES (1, N'Giày thể thao', N'https://canary.contestimg.wish.com/api/webimage/5f5ad3f3706bf3003d7acbd3-normal.jpg?cache_buster=10f7d3b88daf4019fa9d8be157793111', 100.0000)
INSERT [dbo].[product] ([id], [name], [image], [price]) VALUES (2, N'Giày chạy bộ', N'https://canary.contestimg.wish.com/api/webimage/5d5bd678d55c843e49fe3077-normal.jpg?cache_buster=ddfc80fb52c6bd85a67c68ceb94a91d7', 120.0000)
INSERT [dbo].[product] ([id], [name], [image], [price]) VALUES (3, N'Giày du lịch', N'https://canary.contestimg.wish.com/api/webimage/5da6e559dcf2d00d2fbc707c-normal.jpg?cache_buster=d9139cea7e503395b907432f89e292d6', 130.0000)
INSERT [dbo].[product] ([id], [name], [image], [price]) VALUES (4, N'Quần thun', N'https://canary.contestimg.wish.com/api/webimage/5dbbc705a453ef09d28a381e-normal.jpg?cache_buster=b30336931a39d86bbc6778ef17a069aa', 140.0000)
INSERT [dbo].[product] ([id], [name], [image], [price]) VALUES (5, N'Quần thun nam', N'https://canary.contestimg.wish.com/api/webimage/59424d43507b8568df114b12-normal.jpg?cache_buster=3c0a4fa00dd3ccdf90bf9d979747273b', 150.0000)
INSERT [dbo].[product] ([id], [name], [image], [price]) VALUES (6, N'Quần thun nữ', N'https://canary.contestimg.wish.com/api/webimage/5db1b1f52bd0e115d5de9e16-normal.jpg?cache_buster=aaf53e0380a7a97ff4d5a08e0a236999', 160.0000)
INSERT [dbo].[product] ([id], [name], [image], [price]) VALUES (7, N'Quần thun đôi', N'https://canary.contestimg.wish.com/api/webimage/5f685ee0c05ff0c54eeb9849-normal.jpg?cache_buster=f27df15bb7325a6abd10d835f12b6c7f', 170.0000)
SET IDENTITY_INSERT [dbo].[product] OFF
