CREATE DATABASE IF NOT EXISTS OLGSTORE;

CREATE TABLE `Category` (
  `CategoryId` int NOT NULL,
  `Description` varchar(1000) NULL,
   CONSTRAINT CATEGORY_PK PRIMARY KEY (CategoryId)
)ENGINE=INNODB;

CREATE TABLE `Address` (
  `AddressId` int NOT NULL,
  `AddressLine1` varchar(250) NOT NULL,
  `AddressLine2` varchar(250) NULL,
  `City` varchar(100) NOT NULL,
  `State` varchar(2) NOT NULL,
  `ZipCodePt1` varchar(5) NOT NULL,
  `ZipCodePt2` varchar(5) NULL,
   CONSTRAINT ADDRESS_PK PRIMARY KEY (AddressId)
)ENGINE=INNODB;

CREATE TABLE `Person` (
  `PersonId` int NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `MiddleName` varchar(50) NULL,
  `LastName` varchar(50) NOT NULL,
  `JobTitle` varchar(20) NULL,
  `Password` char(250) NOT NULL,
  `AddressId` int NOT NULL,
  `ContactInfo` varchar(1000) NULL,
   CONSTRAINT PERSON_PK PRIMARY KEY (PersonId),
   CONSTRAINT PER_ADD_FK FOREIGN KEY (AddressId)
        REFERENCES Address(AddressId)
)ENGINE=INNODB;

CREATE TABLE `ShippingStatus` (
  `ShippingStatusId` int NOT NULL,
  `Description` varchar(1000) NULL,
   CONSTRAINT SHIP_STAT_PK PRIMARY KEY (ShippingStatusId)
)ENGINE=INNODB;

CREATE TABLE `PaymentType` (
  `PaymentTypeId` int NOT NULL,
  `Description` varchar(1000) NULL,
   CONSTRAINT PAYMENT_PK PRIMARY KEY (PaymentTypeId)
)ENGINE=INNODB;

CREATE TABLE `Customers` (
  `CustomerId` int NOT NULL,
  `PersonId` int NOT NULL,
   CONSTRAINT CUSTOMER_PK PRIMARY KEY (CustomerId),
   CONSTRAINT CUS_PER_FK FOREIGN KEY (PersonId)
        REFERENCES Person(PersonId)
)ENGINE=INNODB;

CREATE TABLE `Employee` (
  `EmployeeID` int NOT NULL,
  `PersonId` int NOT NULL,
  `AdminFlag` tinyint NULL,
   CONSTRAINT EMPLOYEE_PK PRIMARY KEY (EmployeeID),
   CONSTRAINT EMP_PER_FK FOREIGN KEY (PersonId)
        REFERENCES Person(PersonId)
)ENGINE=INNODB;

CREATE TABLE `Product` (
  `ProductId` int NOT NULL,
  `VendorId` int,
  `Name` varchar(100),
  `Description` varchar(1000),
  `CategoryId` int,
  `Quantity` int,
  `ActiveFlag` tinyint,
   CONSTRAINT PRODUCT_PK PRIMARY KEY (ProductId),
   CONSTRAINT CATE_PRO_FK FOREIGN KEY (CategoryId)
            REFERENCES Category(CategoryId)
)ENGINE=INNODB;

CREATE TABLE `Price` (
  `PriceId` int NOT NULL,
  `ProductId` int NOT NULL,
  `Amount` int NOT NULL ,
  `EffectiveDate` datetime NULL,
  `ExpirationDate` datetime NULL,
   CONSTRAINT PRICE_PK PRIMARY KEY (PriceId),
   CONSTRAINT PRI_PRO_FK FOREIGN KEY (ProductId)
		references Product(ProductId)
)ENGINE=INNODB;

CREATE TABLE `ProductOrder` (
  `ProductOrderId` int NOT NULL,
  `TransactionDatetime` datetime NOT NULL,
  `CustomerId` int NOT NULL,
  `ShippingStatusId` int NOT NULL,
  `ShippingAddressId` int NOT NULL,
   CONSTRAINT ORDER_PK PRIMARY KEY (ProductOrderId),
   CONSTRAINT ORD_CUS_FK FOREIGN KEY (CustomerId)
        REFERENCES Customers(CustomerId),
   CONSTRAINT ORD_SHIP_FK FOREIGN KEY (ShippingStatusId)
        REFERENCES ShippingStatus(ShippingStatusId)
)ENGINE=INNODB;

CREATE TABLE `OrderItem` (
  `OrderItemId` int NOT NULL,
  `ProductId` int NOT NULL,
  `ProductOrderId` int NOT NULL,
  `Quantity` int NOT NULL,
  `TransactionPrice` decimal(5, 2) NOT NULL,
   CONSTRAINT ORDER_ITEM_PK PRIMARY KEY (OrderItemId),
   CONSTRAINT ORD_PRO_FK FOREIGN KEY (ProductId)
            REFERENCES Product(ProductId),
   CONSTRAINT ORD_PROORD_FK FOREIGN KEY (ProductOrderId)
            REFERENCES ProductOrder(ProductOrderId)
)ENGINE=INNODB;


CREATE TABLE `Payment` (
  `PaymentId` int NOT NULL,
  `OrderId` int NOT NULL,
  `Amount` int NOT NULL,
  `TransactionDatetime` datetime NULL,
  `PaymentTypeId` int NULL,
  `BillingAddressId` int NOT NULL,
   CONSTRAINT PAYMENT_PK PRIMARY KEY (PaymentID),
   CONSTRAINT PAY_ORD_FK FOREIGN KEY (OrderId)
            REFERENCES ProductOrder(ProductOrderId)
)ENGINE=INNODB;

CREATE TABLE `Message` (
  `MessageId` int NOT NULL,
  `MessageToken` int NOT NULL,
  `CustomerID` int NOT NULL,
  `EmployeeId` int NOT NULL,
  `MessageText` varchar(255) NULL,
   CONSTRAINT MESSAGE_PK PRIMARY KEY (MessageId),
   CONSTRAINT MES_CUS_FK FOREIGN KEY (CustomerID)
        REFERENCES Customers(CustomerId),
   CONSTRAINT MES_EMP_FK FOREIGN KEY (EmployeeId)
        REFERENCES Employee(EmployeeID)
)ENGINE=INNODB;

CREATE TABLE `ContactInfo` (
  `ContactInfoId` int NOT NULL,
  `PhoneNumber` varchar(15) NOT NULL,
  `EmailAddress` varchar(50) NOT NULL,
   CONSTRAINT CONTACT_PK PRIMARY KEY (ContactInfoId)
)ENGINE=INNODB;

CREATE TABLE `Vendor` (
  `VendorID` int NOT NULL,
  `CompanyName` varchar(255) NOT NULL,
  `AddressId` int NOT NULL,
  `ContactInfoId` int NOT NULL,
   CONSTRAINT VENDOR_PK PRIMARY KEY (VendorID),
   CONSTRAINT VEN_ADD_FK FOREIGN  KEY (AddressId)
        REFERENCES Address(AddressId),
   CONSTRAINT VEN_CON_FK FOREIGN KEY (ContactInfoId)
        REFERENCES ContactInfo(ContactInfoId)
)ENGINE=INNODB;

CREATE TABLE `Cart` (
  `CartId` int NOT NULL,
  `CustomerId` int NOT NULL,
   CONSTRAINT CART_PK PRIMARY KEY (CartId),
   CONSTRAINT CAR_CUS FOREIGN KEY (CustomerId)
        REFERENCES Customers(CustomerId)
)ENGINE=INNODB;

CREATE TABLE `EntityType` (
  `EntityTypeId` int NOT NULL,
  `Description` varchar(1000) NULL,
   CONSTRAINT ENTITY_PK PRIMARY KEY (EntityTypeId)
)ENGINE=INNODB;

CREATE TABLE `ImageMapping` (
  `ImageMappingId` int NOT NULL,
  `ImageRelativePath` varchar(255) NULL,
  `ImageName` varchar(255) NULL,
  `EntityTypeId` int NOT NULL,
  `EntityId` int NOT NULL,
   CONSTRAINT IMAGEMAP_PK PRIMARY KEY (ImageMappingId),
   CONSTRAINT IMA_ENT_FK  FOREIGN KEY (EntityTypeId)
        REFERENCES EntityType(EntityTypeId)
)ENGINE=INNODB;

CREATE TABLE `SiteConfig` (
  `SiteConfigId` int NOT NULL,
  `ConfigCode` varchar(255),
  `DefaultSetting` varchar(255),
  `UserOverride` varchar(255),
   CONSTRAINT SITE_CON_PK PRIMARY KEY (SiteConfigId)
)ENGINE=INNODB;
