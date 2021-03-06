USE [master]
GO
/****** Object:  Database [CARTOLA]    Script Date: 29/05/2017 02:25:44 ******/
CREATE DATABASE [CARTOLA]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CARTOLA', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQL\MSSQL\DATA\CARTOLA.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CARTOLA_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQL\MSSQL\DATA\CARTOLA_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CARTOLA] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CARTOLA].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CARTOLA] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CARTOLA] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CARTOLA] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CARTOLA] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CARTOLA] SET ARITHABORT OFF 
GO
ALTER DATABASE [CARTOLA] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CARTOLA] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CARTOLA] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CARTOLA] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CARTOLA] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CARTOLA] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CARTOLA] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CARTOLA] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CARTOLA] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CARTOLA] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CARTOLA] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CARTOLA] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CARTOLA] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CARTOLA] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CARTOLA] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CARTOLA] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CARTOLA] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CARTOLA] SET RECOVERY FULL 
GO
ALTER DATABASE [CARTOLA] SET  MULTI_USER 
GO
ALTER DATABASE [CARTOLA] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CARTOLA] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CARTOLA] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CARTOLA] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [CARTOLA] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'CARTOLA', N'ON'
GO
USE [CARTOLA]
GO
/****** Object:  Table [dbo].[atleta]    Script Date: 29/05/2017 02:25:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[atleta](
	[id] [int] NOT NULL,
	[clubeId] [int] NOT NULL,
	[nome] [varchar](50) NULL,
	[posicao] [varchar](5) NOT NULL,
 CONSTRAINT [PK_atleta] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cartoleiro]    Script Date: 29/05/2017 02:25:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cartoleiro](
	[id] [int] NOT NULL,
	[slug] [varchar](50) NOT NULL,
 CONSTRAINT [PK_cartoleiro] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[escalacao]    Script Date: 29/05/2017 02:25:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[escalacao](
	[idCartoleiro] [int] NOT NULL,
	[idAtleta] [int] NOT NULL,
	[idRodada] [tinyint] NOT NULL,
 CONSTRAINT [PK_escalacao] PRIMARY KEY CLUSTERED 
(
	[idCartoleiro] ASC,
	[idAtleta] ASC,
	[idRodada] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ligaNacional]    Script Date: 29/05/2017 02:25:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ligaNacional](
	[idCartoleiro] [int] NOT NULL,
	[idRodada] [tinyint] NOT NULL,
	[posicao] [int] NULL,
 CONSTRAINT [PK_ligaNacional] PRIMARY KEY CLUSTERED 
(
	[idCartoleiro] ASC,
	[idRodada] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[pontuacaoDosScouts]    Script Date: 29/05/2017 02:25:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[pontuacaoDosScouts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tipo] [tinyint] NOT NULL,
	[scout] [varchar](30) NOT NULL,
	[sigla] [varchar](5) NULL,
	[pontos] [float] NOT NULL,
	[exclusivoGoleiro] [bit] NULL CONSTRAINT [DF_scouts_exclusivoGoleiro]  DEFAULT ((0)),
 CONSTRAINT [PK_scouts] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rodada]    Script Date: 29/05/2017 02:25:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rodada](
	[id] [tinyint] NOT NULL,
	[clubeId_a] [int] NOT NULL,
	[clubeId_b] [int] NOT NULL,
	[clubeMandante] [int] NOT NULL,
	[golsClube_a] [tinyint] NOT NULL,
	[golsClube_b] [tinyint] NOT NULL,
 CONSTRAINT [PK_rodada] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[scout]    Script Date: 29/05/2017 02:25:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[scout](
	[atletaId] [int] NOT NULL,
	[rodadaId] [tinyint] NOT NULL,
	[G] [float] NOT NULL,
	[A] [float] NOT NULL,
	[FT] [float] NOT NULL,
	[FD] [float] NOT NULL,
	[FF] [float] NOT NULL,
	[FS] [float] NOT NULL,
	[PP] [float] NOT NULL,
	[I] [float] NOT NULL,
	[PE] [float] NOT NULL,
	[SG] [float] NOT NULL,
	[DP] [float] NOT NULL,
	[DD] [float] NOT NULL,
	[RB] [float] NOT NULL,
	[GC] [float] NOT NULL,
	[CV] [float] NOT NULL,
	[CA] [float] NOT NULL,
	[GS] [float] NOT NULL,
	[FC] [float] NOT NULL,
 CONSTRAINT [PK_partidaAtleta] PRIMARY KEY CLUSTERED 
(
	[atletaId] ASC,
	[rodadaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tabelaEstruturada]    Script Date: 29/05/2017 02:25:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tabelaEstruturada](
	[idTabela] [int] IDENTITY(1,1) NOT NULL,
	[idItem] [int] NOT NULL,
	[descricao] [varchar](50) NOT NULL,
	[sigla] [varchar](10) NULL,
	[valorPadrao] [int] NULL,
 CONSTRAINT [PK_tabelaEstruturada] PRIMARY KEY CLUSTERED 
(
	[idTabela] ASC,
	[idItem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[pontuacaoDosScouts] ON 

INSERT [dbo].[pontuacaoDosScouts] ([id], [tipo], [scout], [sigla], [pontos], [exclusivoGoleiro]) VALUES (1, 1, N'gol', N'G', 8, 0)
INSERT [dbo].[pontuacaoDosScouts] ([id], [tipo], [scout], [sigla], [pontos], [exclusivoGoleiro]) VALUES (2, 1, N'assistência', N'A', 5, 0)
INSERT [dbo].[pontuacaoDosScouts] ([id], [tipo], [scout], [sigla], [pontos], [exclusivoGoleiro]) VALUES (3, 1, N'finalização na trave', N'FT', 3.5, 0)
INSERT [dbo].[pontuacaoDosScouts] ([id], [tipo], [scout], [sigla], [pontos], [exclusivoGoleiro]) VALUES (4, 2, N'finalização defendida', N'FD', 1, 0)
INSERT [dbo].[pontuacaoDosScouts] ([id], [tipo], [scout], [sigla], [pontos], [exclusivoGoleiro]) VALUES (5, 1, N'finalização pra fora', N'FF', 0.7, 0)
INSERT [dbo].[pontuacaoDosScouts] ([id], [tipo], [scout], [sigla], [pontos], [exclusivoGoleiro]) VALUES (6, 1, N'falta sofrida', N'FS', 0.5, 0)
INSERT [dbo].[pontuacaoDosScouts] ([id], [tipo], [scout], [sigla], [pontos], [exclusivoGoleiro]) VALUES (7, 1, N'pênalti perdido', N'PP', -3.5, 0)
INSERT [dbo].[pontuacaoDosScouts] ([id], [tipo], [scout], [sigla], [pontos], [exclusivoGoleiro]) VALUES (8, 1, N'impedimento', N'I', -0.5, 0)
INSERT [dbo].[pontuacaoDosScouts] ([id], [tipo], [scout], [sigla], [pontos], [exclusivoGoleiro]) VALUES (9, 1, N'passe errado', N'PE', -0.3, 0)
INSERT [dbo].[pontuacaoDosScouts] ([id], [tipo], [scout], [sigla], [pontos], [exclusivoGoleiro]) VALUES (10, 2, N'jogos sem sofrer gol', N'SG', 5, 1)
INSERT [dbo].[pontuacaoDosScouts] ([id], [tipo], [scout], [sigla], [pontos], [exclusivoGoleiro]) VALUES (11, 2, N'defesa de pênalti', N'DP', 7, 1)
INSERT [dbo].[pontuacaoDosScouts] ([id], [tipo], [scout], [sigla], [pontos], [exclusivoGoleiro]) VALUES (12, 2, N'defesa difícil', N'DD', 3, 1)
INSERT [dbo].[pontuacaoDosScouts] ([id], [tipo], [scout], [sigla], [pontos], [exclusivoGoleiro]) VALUES (13, 2, N'roubada de bola', N'RB', 1.7, 0)
INSERT [dbo].[pontuacaoDosScouts] ([id], [tipo], [scout], [sigla], [pontos], [exclusivoGoleiro]) VALUES (14, 2, N'gol contra', N'GC', -6, 0)
INSERT [dbo].[pontuacaoDosScouts] ([id], [tipo], [scout], [sigla], [pontos], [exclusivoGoleiro]) VALUES (15, 2, N'cartão vermelho', N'CV', -5, 0)
INSERT [dbo].[pontuacaoDosScouts] ([id], [tipo], [scout], [sigla], [pontos], [exclusivoGoleiro]) VALUES (17, 2, N'cartão amarelo', N'CA', -2, 0)
INSERT [dbo].[pontuacaoDosScouts] ([id], [tipo], [scout], [sigla], [pontos], [exclusivoGoleiro]) VALUES (18, 2, N'gol sofrido', N'SG', -2, 1)
INSERT [dbo].[pontuacaoDosScouts] ([id], [tipo], [scout], [sigla], [pontos], [exclusivoGoleiro]) VALUES (19, 2, N'falta cometida', N'FC', -0.5, 0)
SET IDENTITY_INSERT [dbo].[pontuacaoDosScouts] OFF
ALTER TABLE [dbo].[rodada] ADD  CONSTRAINT [DF_rodada_golsClube_a]  DEFAULT ((0)) FOR [golsClube_a]
GO
ALTER TABLE [dbo].[rodada] ADD  CONSTRAINT [DF_rodada_golsClube_b]  DEFAULT ((0)) FOR [golsClube_b]
GO
ALTER TABLE [dbo].[scout] ADD  CONSTRAINT [DF_partidaAtleta_G]  DEFAULT ((0)) FOR [G]
GO
ALTER TABLE [dbo].[scout] ADD  CONSTRAINT [DF_partidaAtleta_A]  DEFAULT ((0)) FOR [A]
GO
ALTER TABLE [dbo].[scout] ADD  CONSTRAINT [DF_partidaAtleta_FT]  DEFAULT ((0)) FOR [FT]
GO
ALTER TABLE [dbo].[scout] ADD  CONSTRAINT [DF_partidaAtleta_FD]  DEFAULT ((0)) FOR [FD]
GO
ALTER TABLE [dbo].[scout] ADD  CONSTRAINT [DF_partidaAtleta_FF]  DEFAULT ((0)) FOR [FF]
GO
ALTER TABLE [dbo].[scout] ADD  CONSTRAINT [DF_partidaAtleta_FS]  DEFAULT ((0)) FOR [FS]
GO
ALTER TABLE [dbo].[scout] ADD  CONSTRAINT [DF_partidaAtleta_PP]  DEFAULT ((0)) FOR [PP]
GO
ALTER TABLE [dbo].[scout] ADD  CONSTRAINT [DF_partidaAtleta_I]  DEFAULT ((0)) FOR [I]
GO
ALTER TABLE [dbo].[scout] ADD  CONSTRAINT [DF_partidaAtleta_PE]  DEFAULT ((0)) FOR [PE]
GO
ALTER TABLE [dbo].[scout] ADD  CONSTRAINT [DF_partidaAtleta_SG]  DEFAULT ((0)) FOR [SG]
GO
ALTER TABLE [dbo].[scout] ADD  CONSTRAINT [DF_partidaAtleta_DP]  DEFAULT ((0)) FOR [DP]
GO
ALTER TABLE [dbo].[scout] ADD  CONSTRAINT [DF_partidaAtleta_DD]  DEFAULT ((0)) FOR [DD]
GO
ALTER TABLE [dbo].[scout] ADD  CONSTRAINT [DF_partidaAtleta_RB]  DEFAULT ((0)) FOR [RB]
GO
ALTER TABLE [dbo].[scout] ADD  CONSTRAINT [DF_partidaAtleta_GC]  DEFAULT ((0)) FOR [GC]
GO
ALTER TABLE [dbo].[scout] ADD  CONSTRAINT [DF_partidaAtleta_CV]  DEFAULT ((0)) FOR [CV]
GO
ALTER TABLE [dbo].[scout] ADD  CONSTRAINT [DF_partidaAtleta_CA]  DEFAULT ((0)) FOR [CA]
GO
ALTER TABLE [dbo].[scout] ADD  CONSTRAINT [DF_partidaAtleta_GS]  DEFAULT ((0)) FOR [GS]
GO
ALTER TABLE [dbo].[scout] ADD  CONSTRAINT [DF_partidaAtleta_FC]  DEFAULT ((0)) FOR [FC]
GO
ALTER TABLE [dbo].[escalacao]  WITH CHECK ADD  CONSTRAINT [FK_escalacao_atleta] FOREIGN KEY([idAtleta])
REFERENCES [dbo].[atleta] ([id])
GO
ALTER TABLE [dbo].[escalacao] CHECK CONSTRAINT [FK_escalacao_atleta]
GO
ALTER TABLE [dbo].[escalacao]  WITH CHECK ADD  CONSTRAINT [FK_escalacao_cartoleiro] FOREIGN KEY([idCartoleiro])
REFERENCES [dbo].[cartoleiro] ([id])
GO
ALTER TABLE [dbo].[escalacao] CHECK CONSTRAINT [FK_escalacao_cartoleiro]
GO
ALTER TABLE [dbo].[escalacao]  WITH CHECK ADD  CONSTRAINT [FK_escalacao_rodada] FOREIGN KEY([idRodada])
REFERENCES [dbo].[rodada] ([id])
GO
ALTER TABLE [dbo].[escalacao] CHECK CONSTRAINT [FK_escalacao_rodada]
GO
ALTER TABLE [dbo].[ligaNacional]  WITH CHECK ADD  CONSTRAINT [FK_ligaNacional_cartoleiro] FOREIGN KEY([idCartoleiro])
REFERENCES [dbo].[cartoleiro] ([id])
GO
ALTER TABLE [dbo].[ligaNacional] CHECK CONSTRAINT [FK_ligaNacional_cartoleiro]
GO
ALTER TABLE [dbo].[ligaNacional]  WITH CHECK ADD  CONSTRAINT [FK_ligaNacional_rodada] FOREIGN KEY([idRodada])
REFERENCES [dbo].[rodada] ([id])
GO
ALTER TABLE [dbo].[ligaNacional] CHECK CONSTRAINT [FK_ligaNacional_rodada]
GO
ALTER TABLE [dbo].[scout]  WITH CHECK ADD  CONSTRAINT [FK_scout_atleta] FOREIGN KEY([atletaId])
REFERENCES [dbo].[atleta] ([id])
GO
ALTER TABLE [dbo].[scout] CHECK CONSTRAINT [FK_scout_atleta]
GO
ALTER TABLE [dbo].[scout]  WITH CHECK ADD  CONSTRAINT [FK_scout_rodada] FOREIGN KEY([rodadaId])
REFERENCES [dbo].[rodada] ([id])
GO
ALTER TABLE [dbo].[scout] CHECK CONSTRAINT [FK_scout_rodada]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1 - ataque
2 - defesa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'pontuacaoDosScouts', @level2type=N'COLUMN',@level2name=N'tipo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Número da rodada' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'rodada', @level2type=N'COLUMN',@level2name=N'id'
GO
USE [master]
GO
ALTER DATABASE [CARTOLA] SET  READ_WRITE 
GO
