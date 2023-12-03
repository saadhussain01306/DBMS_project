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

-- INSERTION

-- Inserting the data into the above tables
-- Insert data into Clients table
INSERT INTO Clients (ClientID, Name, Email, Phone, BillingAddress, AccountManager)
VALUES
(1, 'Client1', 'client1@example.com', '123-456-7890', 'Billing Address 1', 'Manager1'),
(2, 'Client2', 'client2@example.com', '234-567-8901', 'Billing Address 2', 'Manager2'),
(3, 'Client3', 'client3@example.com', '345-678-9012', 'Billing Address 3', 'Manager3'),
(4, 'Client4', 'client4@example.com', '456-789-0123', 'Billing Address 4', 'Manager4'),
(5, 'Client5', 'client5@example.com', '567-890-1234', 'Billing Address 5', 'Manager5'),
(6, 'Client6', 'client6@example.com', '678-901-2345', 'Billing Address 6', 'Manager6'),
(7, 'Client7', 'client7@example.com', '789-012-3456', 'Billing Address 7', 'Manager7'),
(8, 'Client8', 'client8@example.com', '890-123-4567', 'Billing Address 8', 'Manager8'),
(9, 'Client9', 'client9@example.com', '901-234-5678', 'Billing Address 9', 'Manager9'),
(10, 'Client10', 'client10@example.com', '012-345-6789', 'Billing Address 10', 'Manager10');

-- Insert data into Campaigns table
INSERT INTO Campaigns (CampaignID, ClientID, Name, Budget, StartDate, EndDate, CreativeDirector)
VALUES
(1, 1, 'Campaign1', 5000.00, '2023-01-01', '2023-02-01', 'Director1'),
(2, 1, 'Campaign2', 8000.00, '2023-03-01', '2023-04-01', 'Director2'),
(3, 2, 'Campaign3', 6000.00, '2023-02-01', '2023-03-01', 'Director3'),
(4, 2, 'Campaign4', 7000.00, '2023-04-01', '2023-05-01', 'Director4'),
(5, 3, 'Campaign5', 9000.00, '2023-03-01', '2023-04-01', 'Director5'),
(6, 3, 'Campaign6', 12000.00, '2023-05-01', '2023-06-01', 'Director6'),
(7, 4, 'Campaign7', 10000.00, '2023-04-01', '2023-05-01', 'Director7'),
(8, 4, 'Campaign8', 15000.00, '2023-06-01', '2023-07-01', 'Director8'),
(9, 5, 'Campaign9', 11000.00, '2023-05-01', '2023-06-01', 'Director9'),
(10, 5, 'Campaign10', 18000.00, '2023-07-01', '2023-08-01', 'Director10');

-- Insert data into Advertisements table
INSERT INTO Advertisements (AdvertisementID, CampaignID, Type, Content, CreativeTeam)
VALUES
(1, 1, 'Banner', 'Banner Content 1', 'Team1'),
(2, 1, 'Video', 'Video Content 1', 'Team2'),
(3, 2, 'Banner', 'Banner Content 2', 'Team3'),
(4, 2, 'Video', 'Video Content 2', 'Team4'),
(5, 3, 'Banner', 'Banner Content 3', 'Team5'),
(6, 3, 'Video', 'Video Content 3', 'Team6'),
(7, 4, 'Banner', 'Banner Content 4', 'Team7'),
(8, 4, 'Video', 'Video Content 4', 'Team8'),
(9, 5, 'Banner', 'Banner Content 5', 'Team9'),
(10, 5, 'Video', 'Video Content 5', 'Team10');

-- Insert data into Employees table
INSERT INTO Employees (EmployeeID, Name, Position, Email, Phone, Salary, Department)
VALUES
(1, 'Employee1', 'Manager', 'employee1@example.com', '345-678-9012', 60000.00, 'Marketing'),
(2, 'Employee2', 'Designer', 'employee2@example.com', '456-789-0123', 55000.00, 'Design'),
(3, 'Employee3', 'Analyst', 'employee3@example.com', '567-890-1234', 70000.00, 'Analytics'),
(4, 'Employee4', 'Developer', 'employee4@example.com', '678-901-2345', 80000.00, 'IT'),
(5, 'Employee5', 'Manager', 'employee5@example.com', '789-012-3456', 65000.00, 'Marketing'),
(6, 'Employee6', 'Designer', 'employee6@example.com', '890-123-4567', 60000.00, 'Design'),
(7, 'Employee7', 'Analyst', 'employee7@example.com', '901-234-5678', 75000.00, 'Analytics'),
(8, 'Employee8', 'Developer', 'employee8@example.com', '012-345-6789', 85000.00, 'IT'),
(9, 'Employee9', 'Manager', 'employee9@example.com', '123-456-7890', 70000.00, 'Marketing'),
(10, 'Employee10', 'Designer', 'employee10@example.com', '234-567-8901', 60000.00, 'Design');

-- Insert data into AdvertisementPlacements table
INSERT INTO AdvertisementPlacements (PlacementID, AdvertisementID, PlacementDetails, Cost, Duration)
VALUES
(1, 1, 'Top Banner', 1000.00, 30),
(2, 2, 'Sidebar Ad', 800.00, 15),
(3, 3, 'Homepage Banner', 1200.00, 45),
(4, 4, 'Video Pre-roll', 1500.00, 60),
(5, 5, 'Featured Ad', 2000.00, 30),
(6, 6, 'Social Media Promo', 1800.00, 30),
(7, 7, 'In-article Banner', 900.00, 20),
(8, 8, 'Video Ad Overlay', 1300.00, 45),
(9, 9, 'Homepage Takeover', 2500.00, 60),
(10, 10, 'Sponsored Content', 1600.00, 30);

-- Insert data into Invoices table
INSERT INTO Invoices (InvoiceID, ClientID, CampaignID, InvoiceDate, PaymentStatus, TotalAmount)
VALUES
(1, 1, 1, '2023-02-15', 'Paid', 5000.00),
(2, 1, 2, '2023-04-15', 'Pending', 8000.00),
(3, 2, 3, '2023-03-15', 'Paid', 6000.00),
(4, 2, 4, '2023-05-15', 'Pending', 7000.00),
(5, 3, 5, '2023-04-15', 'Paid', 9000.00),
(6, 3, 6, '2023-06-15', 'Pending', 12000.00),
(7, 4, 7, '2023-05-15', 'Paid', 10000.00),
(8, 4, 8, '2023-07-15', 'Pending', 15000.00),
(9, 5, 9, '2023-06-15', 'Paid', 11000.00),
(10, 5, 10, '2023-08-15', 'Pending', 18000.00);

-- Insert data into Payments table
INSERT INTO Payments (PaymentID, InvoiceID, EmployeeID, PaymentDate, PaymentMethod, TransactionReference)
VALUES
(1, 1, 1, '2023-02-20', 'Credit Card', 'TRX12345'),
(2, 2, 2, '2023-04-20', 'Bank Transfer', 'TRX67890'),
(3, 3, 3, '2023-03-20', 'Credit Card', 'TRX23456'),
(4, 4, 4, '2023-05-20', 'Bank Transfer', 'TRX78901'),
(5, 5, 5, '2023-04-20', 'Credit Card', 'TRX34567'),
(6, 6, 6, '2023-06-20', 'Bank Transfer', 'TRX89012'),
(7, 7, 7, '2023-05-20', 'Credit Card', 'TRX45678'),
(8, 8, 8, '2023-07-20', 'Bank Transfer', 'TRX90123'),
(9, 9, 9, '2023-06-20', 'Credit Card', 'TRX56789'),
(10, 10, 10, '2023-08-20', 'Bank Transfer', 'TRX01234');

-- Insert data into VendorSupplierInformation table
INSERT INTO VendorSupplierInformation (VendorID, VendorName, ContactInfo, ServicesProvided, PaymentTerms)
VALUES
(1, 'Vendor1', 'vendor1@example.com', 'Ad Design', 'Net 30'),
(2, 'Vendor2', 'vendor2@example.com', 'Video Production', 'Net 45'),
(3, 'Vendor3', 'vendor3@example.com', 'Analytics Services', 'Net 60'),
(4, 'Vendor4', 'vendor4@example.com', 'Ad Placement', 'Net 30'),
(5, 'Vendor5', 'vendor5@example.com', 'Social Media Promotion', 'Net 45'),
(6, 'Vendor6', 'vendor6@example.com', 'Content Creation', 'Net 60'),
(7, 'Vendor7', 'vendor7@example.com', 'Graphic Design', 'Net 30'),
(8, 'Vendor8', 'vendor8@example.com', 'Video Editing', 'Net 45'),
(9, 'Vendor9', 'vendor9@example.com', 'SEO Services', 'Net 60'),
(10, 'Vendor10', 'vendor10@example.com', 'Copywriting', 'Net 30');

-- Insert data into VendorInvoices table
INSERT INTO VendorInvoices (InvoiceID, PaymentID, VendorID, InvoiceDate, TotalAmount, PaymentStatus)
VALUES
(1, 1, 1, '2023-02-25', 1000.00, 'Paid'),
(2, 2, 2, '2023-04-25', 800.00, 'Pending'),
(3, 3, 3, '2023-03-25', 1200.00, 'Paid'),
(4, 4, 4, '2023-05-25', 1500.00, 'Pending'),
(5, 5, 5, '2023-04-25', 2000.00, 'Paid'),
(6, 6, 6, '2023-06-25', 1800.00, 'Pending'),
(7, 7, 7, '2023-05-25', 900.00, 'Paid'),
(8, 8, 8, '2023-07-25', 1300.00, 'Pending'),
(9, 9, 9, '2023-06-25', 2500.00, 'Paid'),
(10, 10, 10, '2023-08-25', 1600.00, 'Pending');

-- Insert data into PerformanceMetrics table
INSERT INTO PerformanceMetrics (MetricID, AdvertisementID, Impressions, Clicks, Conversions, Date)
VALUES
(1, 1, 50000, 1000, 50, '2023-02-01'),
(2, 2, 70000, 1200, 70, '2023-02-01'),
(3, 3, 60000, 800, 40, '2023-03-01'),
(4, 4, 80000, 1500, 80, '2023-03-01'),
(5, 5, 90000, 1800, 90, '2023-04-01'),
(6, 6, 120000, 2000, 120, '2023-04-01'),
(7, 7, 100000, 1300, 100, '2023-05-01'),
(8, 8, 150000, 2500, 150, '2023-05-01'),
(9, 9, 110000, 1600, 110, '2023-06-01'),
(10, 10, 180000, 3000, 180, '2023-06-01');
