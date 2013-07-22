/****** Object:  Table [dbo].[merchCustomer]    Script Date: 7/22/2013 9:28:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[merchCustomer](
	[id] [int] NOT NULL,
	[memberId] [int] NULL,
	[firstName] [nvarchar](50) NOT NULL,
	[lastName] [nvarchar](50) NOT NULL,
	[totalInvoiced] [money] NOT NULL,
	[totalPayments] [money] NOT NULL,
	[lastPaymentDate] [datetime] NOT NULL,
 CONSTRAINT [PK_merchCustomer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[merchCustomerAddress]    Script Date: 7/22/2013 9:28:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[merchCustomerAddress](
	[id] [int] NOT NULL,
	[customerId] [int] NULL,
	[label] [nvarchar](50) NOT NULL,
	[fullName] [nvarchar](50) NULL,
	[company] [nvarchar](50) NULL,
	[type] [int] NULL,
	[address1] [nvarchar](50) NULL,
	[address2] [nvarchar](50) NULL,
	[locality] [nvarchar](50) NULL,
	[region] [nvarchar](50) NULL,
	[postalCode] [nvarchar](50) NULL,
	[phone] [nvarchar](50) NULL,
	[updateDate] [datetime] NOT NULL,
	[createDate] [datetime] NOT NULL,
 CONSTRAINT [PK_merchCustomerAddress] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[merchInventory]    Script Date: 7/22/2013 9:28:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[merchInventory](
	[warehouseId] [int] NOT NULL,
	[sku] [nvarchar](50) NOT NULL,
	[count] [int] NOT NULL,
	[lowCount] [int] NOT NULL,
	[updateDate] [datetime] NOT NULL,
	[createDate] [datetime] NOT NULL,
 CONSTRAINT [PK_merchInventory] PRIMARY KEY CLUSTERED 
(
	[warehouseId] ASC,
	[sku] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[merchInvoice]    Script Date: 7/22/2013 9:28:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[merchInvoice](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[customerId] [int] NOT NULL,
	[invoiceNumber] [nvarchar](50) NOT NULL,
	[invoiceDate] [datetime] NOT NULL,
	[invoiceStatusId] [int] NOT NULL,
	[billToName] [nvarchar](50) NULL,
	[billToAddress1] [nvarchar](50) NULL,
	[billToAddress2] [nvarchar](50) NULL,
	[billToLocality] [nvarchar](50) NULL,
	[billToRegion] [nvarchar](50) NULL,
	[billToPostalCode] [nvarchar](50) NULL,
	[billToCountryCode] [nvarchar](2) NULL,
	[billToEmail] [nvarchar](50) NULL,
	[billToPhone] [nvarchar](50) NULL,
	[billToCompanyName] [nvarchar](50) NULL,
	[exported] [bit] NOT NULL,
	[paid] [bit] NOT NULL,
	[shipped] [bit] NOT NULL,
	[total] [money] NOT NULL,
	[updateDate] [datetime] NOT NULL,
	[createdDate] [datetime] NOT NULL,
 CONSTRAINT [PK_merchInvoice] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[merchInvoiceItem]    Script Date: 7/22/2013 9:28:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[merchInvoiceItem](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[parentId] [int] NULL,
	[invoiceId] [int] NOT NULL,
	[updateDate] [datetime] NOT NULL,
	[createDate] [datetime] NOT NULL,
 CONSTRAINT [PK_merchInvoiceItem] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[merchInvoiceStatus]    Script Date: 7/22/2013 9:28:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[merchInvoiceStatus](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[sortOrder] [int] NOT NULL,
 CONSTRAINT [PK_merchInvoiceStatus] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[merchPayment]    Script Date: 7/22/2013 9:28:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[merchPayment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[invoiceId] [int] NOT NULL,
	[memberId] [int] NOT NULL,
	[userId] [int] NULL,
	[gatewayAlias] [nchar](10) NULL,
	[amount] [money] NOT NULL,
	[exported] [bit] NOT NULL,
	[updateDate] [datetime] NOT NULL,
	[createDate] [datetime] NOT NULL,
 CONSTRAINT [PK_merchPayment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[merchPaymentTransaction]    Script Date: 7/22/2013 9:28:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[merchPaymentTransaction](
	[id] [int] NOT NULL,
	[paymentId] [int] NOT NULL,
	[type] [int] NOT NULL,
	[description] [nvarchar](50) NULL,
	[amount] [money] NOT NULL,
	[exported] [bit] NOT NULL,
	[updateDate] [datetime] NOT NULL,
	[createDate] [datetime] NOT NULL,
 CONSTRAINT [PK_merchPaymentTransaction] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[merchShipment]    Script Date: 7/22/2013 9:28:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[merchShipment](
	[id] [int] NOT NULL,
	[invoiceId] [int] NOT NULL,
	[address1] [nvarchar](50) NULL,
	[address2] [nvarchar](50) NULL,
	[locality] [nvarchar](50) NULL,
	[region] [nvarchar](50) NULL,
	[postalCode] [nvarchar](50) NULL,
	[countryCode] [nvarchar](2) NULL,
	[shipMethodId] [int] NOT NULL,
	[phone] [nvarchar](50) NULL,
	[updateDate] [datetime] NOT NULL,
	[createDate] [datetime] NOT NULL,
 CONSTRAINT [PK_merchShipment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[merchShipMethod]    Script Date: 7/22/2013 9:28:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[merchShipMethod](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[gatewayAlias] [int] NOT NULL,
	[type] [nchar](10) NULL,
	[surcharge] [money] NOT NULL,
	[serviceCode] [nvarchar](255) NOT NULL,
	[updateDate] [datetime] NOT NULL,
	[createDate] [datetime] NOT NULL,
 CONSTRAINT [PK_merchShipMethod] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[merchShipMethod2Warehouse]    Script Date: 7/22/2013 9:28:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[merchShipMethod2Warehouse](
	[shipMethodId] [int] NOT NULL,
	[warehouseId] [int] NOT NULL,
 CONSTRAINT [PK_merchShipMethod2Warehouse] PRIMARY KEY CLUSTERED 
(
	[shipMethodId] ASC,
	[warehouseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[merchWarehouse]    Script Date: 7/22/2013 9:28:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[merchWarehouse](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[address1] [nvarchar](50) NULL,
	[address2] [nvarchar](50) NULL,
	[locality] [nvarchar](50) NULL,
	[region] [nvarchar](50) NULL,
	[postalCode] [nvarchar](50) NULL,
	[updateDate] [datetime] NULL,
	[createDate] [datetime] NULL,
 CONSTRAINT [PK_merchWarehouse] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[merchCustomer] ADD  CONSTRAINT [DF_merchCustomer_memberId]  DEFAULT (NULL) FOR [memberId]
GO
ALTER TABLE [dbo].[merchCustomer] ADD  CONSTRAINT [DF_merchCustomer_balance]  DEFAULT ((0)) FOR [totalInvoiced]
GO
ALTER TABLE [dbo].[merchCustomer] ADD  CONSTRAINT [DF_merchCustomer_lastPaymentDate]  DEFAULT (getdate()) FOR [lastPaymentDate]
GO
ALTER TABLE [dbo].[merchCustomerAddress] ADD  CONSTRAINT [DF_merchCustomerAddress_updateDate]  DEFAULT (getdate()) FOR [updateDate]
GO
ALTER TABLE [dbo].[merchCustomerAddress] ADD  CONSTRAINT [DF_merchCustomerAddress_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[merchInventory] ADD  CONSTRAINT [DF_merchInventory_count]  DEFAULT ((-1)) FOR [count]
GO
ALTER TABLE [dbo].[merchInventory] ADD  CONSTRAINT [DF_merchInventory_lowCount]  DEFAULT ((-1)) FOR [lowCount]
GO
ALTER TABLE [dbo].[merchInventory] ADD  CONSTRAINT [DF_merchInventory_updateDate]  DEFAULT (getdate()) FOR [updateDate]
GO
ALTER TABLE [dbo].[merchInventory] ADD  CONSTRAINT [DF_merchInventory_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[merchInvoice] ADD  CONSTRAINT [DF_merchInvoice_orderDate]  DEFAULT (getdate()) FOR [invoiceDate]
GO
ALTER TABLE [dbo].[merchInvoice] ADD  CONSTRAINT [DF_merchInvoice_exported]  DEFAULT ((0)) FOR [exported]
GO
ALTER TABLE [dbo].[merchInvoice] ADD  CONSTRAINT [DF_merchInvoice_paid]  DEFAULT ((0)) FOR [paid]
GO
ALTER TABLE [dbo].[merchInvoice] ADD  CONSTRAINT [DF_merchInvoice_shipped]  DEFAULT ((0)) FOR [shipped]
GO
ALTER TABLE [dbo].[merchInvoice] ADD  CONSTRAINT [DF_merchInvoice_total]  DEFAULT ((0)) FOR [total]
GO
ALTER TABLE [dbo].[merchInvoice] ADD  CONSTRAINT [DF_merchInvoice_updateDate]  DEFAULT (getdate()) FOR [updateDate]
GO
ALTER TABLE [dbo].[merchInvoice] ADD  CONSTRAINT [DF_merchInvoice_createdDate]  DEFAULT (getdate()) FOR [createdDate]
GO
ALTER TABLE [dbo].[merchInvoiceItem] ADD  CONSTRAINT [DF_merchInvoiceItem_parentId]  DEFAULT (NULL) FOR [parentId]
GO
ALTER TABLE [dbo].[merchInvoiceItem] ADD  CONSTRAINT [DF_merchInvoiceItem_updateDate]  DEFAULT (getdate()) FOR [updateDate]
GO
ALTER TABLE [dbo].[merchInvoiceItem] ADD  CONSTRAINT [DF_merchInvoiceItem_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[merchPayment] ADD  CONSTRAINT [DF_merchPayment_userId]  DEFAULT (NULL) FOR [userId]
GO
ALTER TABLE [dbo].[merchPayment] ADD  CONSTRAINT [DF_merchPayment_amount]  DEFAULT ((0)) FOR [amount]
GO
ALTER TABLE [dbo].[merchPayment] ADD  CONSTRAINT [DF_merchPayment_exported]  DEFAULT ((0)) FOR [exported]
GO
ALTER TABLE [dbo].[merchPayment] ADD  CONSTRAINT [DF_merchPayment_updateDate]  DEFAULT (getdate()) FOR [updateDate]
GO
ALTER TABLE [dbo].[merchPayment] ADD  CONSTRAINT [DF_merchPayment_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[merchPaymentTransaction] ADD  CONSTRAINT [DF_merchPaymentTransaction_description]  DEFAULT (NULL) FOR [description]
GO
ALTER TABLE [dbo].[merchPaymentTransaction] ADD  CONSTRAINT [DF_merchPaymentTransaction_amount]  DEFAULT ((0)) FOR [amount]
GO
ALTER TABLE [dbo].[merchPaymentTransaction] ADD  CONSTRAINT [DF_merchPaymentTransaction_exported]  DEFAULT ((0)) FOR [exported]
GO
ALTER TABLE [dbo].[merchPaymentTransaction] ADD  CONSTRAINT [DF_merchPaymentTransaction_updateDate]  DEFAULT (getdate()) FOR [updateDate]
GO
ALTER TABLE [dbo].[merchPaymentTransaction] ADD  CONSTRAINT [DF_merchPaymentTransaction_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[merchShipment] ADD  CONSTRAINT [DF_merchShipment_updateDate]  DEFAULT (getdate()) FOR [updateDate]
GO
ALTER TABLE [dbo].[merchShipment] ADD  CONSTRAINT [DF_merchShipment_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[merchShipMethod] ADD  CONSTRAINT [DF_merchShipMethod_surcharge]  DEFAULT ((0)) FOR [surcharge]
GO
ALTER TABLE [dbo].[merchShipMethod] ADD  CONSTRAINT [DF_merchShipMethod_updateDate]  DEFAULT (getdate()) FOR [updateDate]
GO
ALTER TABLE [dbo].[merchShipMethod] ADD  CONSTRAINT [DF_merchShipMethod_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[merchWarehouse] ADD  CONSTRAINT [DF_merchWarehouse_updateDate]  DEFAULT (getdate()) FOR [updateDate]
GO
ALTER TABLE [dbo].[merchWarehouse] ADD  CONSTRAINT [DF_merchWarehouse_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[merchCustomerAddress]  WITH CHECK ADD  CONSTRAINT [FK_merchCustomerAddress_merchCustomer] FOREIGN KEY([customerId])
REFERENCES [dbo].[merchCustomer] ([id])
GO
ALTER TABLE [dbo].[merchCustomerAddress] CHECK CONSTRAINT [FK_merchCustomerAddress_merchCustomer]
GO
ALTER TABLE [dbo].[merchInventory]  WITH CHECK ADD  CONSTRAINT [FK_merchInventory_merchWarehouse] FOREIGN KEY([warehouseId])
REFERENCES [dbo].[merchWarehouse] ([id])
GO
ALTER TABLE [dbo].[merchInventory] CHECK CONSTRAINT [FK_merchInventory_merchWarehouse]
GO
ALTER TABLE [dbo].[merchInvoice]  WITH CHECK ADD  CONSTRAINT [FK_merchInvoice_merchCustomer] FOREIGN KEY([customerId])
REFERENCES [dbo].[merchCustomer] ([id])
GO
ALTER TABLE [dbo].[merchInvoice] CHECK CONSTRAINT [FK_merchInvoice_merchCustomer]
GO
ALTER TABLE [dbo].[merchInvoice]  WITH CHECK ADD  CONSTRAINT [FK_merchInvoice_merchInvoiceStatus] FOREIGN KEY([invoiceStatusId])
REFERENCES [dbo].[merchInvoiceStatus] ([id])
GO
ALTER TABLE [dbo].[merchInvoice] CHECK CONSTRAINT [FK_merchInvoice_merchInvoiceStatus]
GO
ALTER TABLE [dbo].[merchInvoiceItem]  WITH CHECK ADD  CONSTRAINT [FK_merchInvoiceItem_merchInvoice] FOREIGN KEY([invoiceId])
REFERENCES [dbo].[merchInvoice] ([id])
GO
ALTER TABLE [dbo].[merchInvoiceItem] CHECK CONSTRAINT [FK_merchInvoiceItem_merchInvoice]
GO
ALTER TABLE [dbo].[merchInvoiceItem]  WITH CHECK ADD  CONSTRAINT [FK_merchInvoiceItem_merchInvoiceItem] FOREIGN KEY([parentId])
REFERENCES [dbo].[merchInvoiceItem] ([id])
GO
ALTER TABLE [dbo].[merchInvoiceItem] CHECK CONSTRAINT [FK_merchInvoiceItem_merchInvoiceItem]
GO
ALTER TABLE [dbo].[merchPayment]  WITH CHECK ADD  CONSTRAINT [FK_merchPayment_merchInvoice] FOREIGN KEY([invoiceId])
REFERENCES [dbo].[merchInvoice] ([id])
GO
ALTER TABLE [dbo].[merchPayment] CHECK CONSTRAINT [FK_merchPayment_merchInvoice]
GO
ALTER TABLE [dbo].[merchPaymentTransaction]  WITH CHECK ADD  CONSTRAINT [FK_merchPaymentTransaction_merchPayment] FOREIGN KEY([paymentId])
REFERENCES [dbo].[merchPayment] ([id])
GO
ALTER TABLE [dbo].[merchPaymentTransaction] CHECK CONSTRAINT [FK_merchPaymentTransaction_merchPayment]
GO
ALTER TABLE [dbo].[merchShipment]  WITH CHECK ADD  CONSTRAINT [FK_merchShipment_merchInvoice] FOREIGN KEY([invoiceId])
REFERENCES [dbo].[merchInvoice] ([id])
GO
ALTER TABLE [dbo].[merchShipment] CHECK CONSTRAINT [FK_merchShipment_merchInvoice]
GO
ALTER TABLE [dbo].[merchShipment]  WITH CHECK ADD  CONSTRAINT [FK_merchShipment_merchShipMethod] FOREIGN KEY([shipMethodId])
REFERENCES [dbo].[merchShipMethod] ([id])
GO
ALTER TABLE [dbo].[merchShipment] CHECK CONSTRAINT [FK_merchShipment_merchShipMethod]
GO
ALTER TABLE [dbo].[merchShipMethod2Warehouse]  WITH CHECK ADD  CONSTRAINT [FK_merchShipMethod2Warehouse_merchShipMethod] FOREIGN KEY([shipMethodId])
REFERENCES [dbo].[merchShipMethod] ([id])
GO
ALTER TABLE [dbo].[merchShipMethod2Warehouse] CHECK CONSTRAINT [FK_merchShipMethod2Warehouse_merchShipMethod]
GO
ALTER TABLE [dbo].[merchShipMethod2Warehouse]  WITH CHECK ADD  CONSTRAINT [FK_merchShipMethod2Warehouse_merchWarehouse] FOREIGN KEY([warehouseId])
REFERENCES [dbo].[merchWarehouse] ([id])
GO
ALTER TABLE [dbo].[merchShipMethod2Warehouse] CHECK CONSTRAINT [FK_merchShipMethod2Warehouse_merchWarehouse]
GO
