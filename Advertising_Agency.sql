-- create the database Advertising_Agency
CREATE DATABASE Advertising_Agency;
USE Advertising_Agency;

-- Create Clients Table
CREATE TABLE Clients (
    ClientID INT PRIMARY KEY,
    Name VARCHAR(255),
    Email VARCHAR(255),
    Phone VARCHAR(15),
    BillingAddress VARCHAR(255),
    AccountManager VARCHAR(255)
    
);

-- Create Campaigns Table
CREATE TABLE Campaigns (
    CampaignID INT PRIMARY KEY,
    ClientID INT,
    Name VARCHAR(255),
    Budget DECIMAL(10, 2),
    StartDate DATE,
    EndDate DATE,
    CreativeDirector VARCHAR(255),
    FOREIGN KEY (ClientID) REFERENCES Clients(ClientID)
    
);

-- Create Advertisements Table
CREATE TABLE Advertisements (
    AdvertisementID INT PRIMARY KEY,
    CampaignID INT,
    Type VARCHAR(50),
    Content TEXT,
    CreativeTeam VARCHAR(255),
    FOREIGN KEY (CampaignID) REFERENCES Campaigns(CampaignID)
);

-- Create Employees Table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(255),
    Position VARCHAR(50),
    Email VARCHAR(255),
    Phone VARCHAR(15),
    Salary DECIMAL(10, 2),
    Department VARCHAR(50)
);

-- Create Advertisement Placements Table
CREATE TABLE AdvertisementPlacements (
    PlacementID INT PRIMARY KEY,
    AdvertisementID INT,
    PlacementDetails VARCHAR(255),
    Cost DECIMAL(10, 2),
    Duration INT,
    FOREIGN KEY (AdvertisementID) REFERENCES Advertisements(AdvertisementID)
);

-- Create Invoices Table
CREATE TABLE Invoices (
    InvoiceID INT PRIMARY KEY,
    ClientID INT,
    CampaignID INT,
    InvoiceDate DATE,
    PaymentStatus VARCHAR(20),
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (ClientID) REFERENCES Clients(ClientID),
    FOREIGN KEY (CampaignID) REFERENCES Campaigns(CampaignID)
);


-- Create Payments Table
CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,
    InvoiceID INT,
    EmployeeID INT,
    PaymentDate DATE,
    PaymentMethod VARCHAR(50),
    TransactionReference VARCHAR(255),
    FOREIGN KEY (InvoiceID) REFERENCES Invoices(InvoiceID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

-- Create Vendor/Supplier Information Table
CREATE TABLE VendorSupplierInformation (
    VendorID INT PRIMARY KEY,
    VendorName VARCHAR(255),
    ContactInfo VARCHAR(255),
    ServicesProvided TEXT,
    PaymentTerms VARCHAR(255)
);

-- Create Vendor Invoices Table
CREATE TABLE VendorInvoices (
    InvoiceID INT PRIMARY KEY,
    PaymentID INT,
    VendorID INT,
    InvoiceDate DATE,
    TotalAmount DECIMAL(10, 2),
    PaymentStatus VARCHAR(20),
    FOREIGN KEY (VendorID) REFERENCES VendorSupplierInformation(VendorID),
    FOREIGN KEY (PaymentID)REFERENCES Payments(PaymentID)
);


-- Create Performance Metrics Table
CREATE TABLE PerformanceMetrics (
    MetricID INT PRIMARY KEY,
    AdvertisementID INT,
    Impressions INT,
    Clicks INT,
    Conversions INT,
    Date DATE,
    FOREIGN KEY (AdvertisementID) REFERENCES Advertisements(AdvertisementID)
);
