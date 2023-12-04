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
(1, 'Nike India', 'manager@nike.com', '123-456-7890', '123, Kuvempu Nagar, Mysuru, Karnataka, 570023', 'Rahul Shah'),
(2, 'Haldiram Snakcs Private Limited', 'cs@haldiram.com', '234-567-8901', '456, Vijayanagar, Mysuru, Karnataka, 570016', 'Rohit Gowda'),
(3, 'A2B Restaurants', 'care@aabsweets.com', '345-678-9012', '789, Siddhartha Layout, Mysuru, Karnataka, 570011', 'Arman Singh'),
(4, 'Manipal Hospitals', 'manager@manipal.com', '456-789-0123', '234, Jayalakshmipuram, Mysuru, Karnataka, 570012', 'Bhaskar Jain'),
(5, 'Loyal World Supermarket Mysuru', 'manager@loyalworldmys.com', '567-890-1234', '567, Lakshmipuram, Mysuru, Karnataka, 570024', 'Rohini Bhat'),
(6, 'Vishal Mart Mysuru', 'manager@vishalmartmys.com', '678-901-2345', '890, Chamundi Vihar, Mysuru, Karnataka, 570019', 'Radha Shenoy'),
(7, 'DMart Bengaluru', 'manager@dmartblr.com', '789-012-3456', '789, Kuvempu Nagar, Mysuru, Karnataka, 570023', 'Raghav Sharma'),
(8, 'Dosa Point', 'manager@dosapoint.com', '890-123-4567', '890, Chamundi Vihar, Mysuru, Karnataka, 570019', 'Madhav Ullas'),
(9, 'Bhaskar''s Mane Holige', 'manager@bmholige.com', '901-234-5678', '890, Chamundi Vihar, Mysuru, Karnataka, 570019', 'Krishnamurthy Shankar'),
(10, 'Airtel Mysuru', 'manager@airtelmys.com', '012-345-6789', '789, Kuvempu Nagar, Mysuru, Karnataka, 570023', 'Naresh Reddy');

-- Insert data into Campaigns table
INSERT INTO Campaigns (CampaignID, ClientID, Name, Budget, StartDate, EndDate, CreativeDirector)
VALUES
(1, 1, 'Shoes Billboard', 5000.00, '2023-01-01', '2023-02-01', 'Nawaz Khan'),
(2, 1, 'Jerseys Social Media Campaign', 8000.00, '2023-03-01', '2023-04-01', 'Rohit Roy'),
(3, 2, 'Haldirams End Of Month Sale', 6000.00, '2023-02-01', '2023-03-01', 'Yash Dubey'),
(4, 2, 'Products billboard', 7000.00, '2023-04-01', '2023-05-01', 'Wren D Souza'),
(5, 3, 'Social media campaign', 9000.00, '2023-03-01', '2023-04-01', 'Karan Brar'),
(6, 3, 'Delicious Dosa December Campaign', 12000.00, '2023-05-01', '2023-06-01', 'Shamla Krishnan'),
(7, 4, 'Heart Disease Prrevention Campaign(Offline)', 10000.00, '2023-04-01', '2023-05-01', 'Sudha Iyer'),
(8, 4, 'Healthcare cards campaign(social media)', 15000.00, '2023-06-01', '2023-07-01', 'Walter White'),
(9, 5, 'End of Month sale', 11000.00, '2023-05-01', '2023-06-01', 'Sal Peter'),
(10, 5, '25 years anniversary campaign(social media)', 18000.00, '2023-07-01', '2023-08-01', 'Ashman Joshi');

-- Insert data into Advertisements table
INSERT INTO Advertisements (AdvertisementID, CampaignID, Type, Content, CreativeTeam)
VALUES
(1, 1, 'Billboard', 'https://hask.inc/content/1', 'Mavericks'),
(2, 1, 'Social media posts', 'https://hask.inc/content/2', 'BrandWave'),
(3, 2, 'Newspaper Ads', 'https://hask.inc/content/3', 'BuzzBlend'),
(4, 2, 'Billboard', 'https://hask.inc/content/4', 'BuzzBlend'),
(5, 3, 'Social media posts', 'https://hask.inc/content/5', 'VibeSync'),
(6, 3, 'Newspaper Ads/Banners', 'https://hask.inc/content/6', 'FusionFlow'),
(7, 4, 'Billboards/Newspaper Ads', 'https://hask.inc/content/7', 'PromoPulse'),
(8, 4, 'Social media posts', 'https://hask.inc/content/8', 'VibeSync'),
(9, 5, 'Youtube/TV Ad', 'https://hask.inc/content/9', 'PixelCraft'),
(10, 5, 'Social media posts', 'https://hask.inc/content/10', 'PromoPulse');

-- Insert data into Employees table
INSERT INTO Employees (EmployeeID, Name, Position, Email, Phone, Salary, Department)
VALUES
(1, 'Amit Sharma', 'Manager', 'amit.sharma@gmail.com', '345-678-9012', 60000.00, 'Marketing'),
(2, 'Priya Patel', 'Designer', 'priya.patel@outlook.com', '456-789-0123', 55000.00, 'Design'),
(3, 'Rajesh Kumar', 'Analyst', 'rajesh.kumar@yahoo.com', '567-890-1234', 70000.00, 'Analytics'),
(4, 'Sneha Verma', 'Developer', 'sneha.verma@gmail.com', '678-901-2345', 80000.00, 'IT'),
(5, 'Arjun Singh', 'Manager', 'arjun.singh@gmail.com', '789-012-3456', 65000.00, 'Marketing'),
(6, 'Kavita Gupta', 'Designer', 'kavita.gupta@outlook.com', '890-123-4567', 60000.00, 'Design'),
(7, 'Ananya Reddy', 'Analyst', 'ananya.reddy@yahoo.com', '901-234-5678', 75000.00, 'Analytics'),
(8, 'Vikram Patel', 'Developer', 'vikram.patel@gmail.com', '012-345-6789', 85000.00, 'IT'),
(9, 'Suman Verma', 'Manager', 'suman.verma@yahoo.com', '123-456-7890', 70000.00, 'Marketing'),
(10, 'Neha Kapoor', 'Designer', 'neha.kapoor@gmail.com', '234-567-8901', 60000.00, 'Design');

-- Insert data into AdvertisementPlacements table
INSERT INTO AdvertisementPlacements (PlacementID, AdvertisementID, PlacementDetails, Cost, Duration)
VALUES
(1, 1, 'Billboard - Top Location', 1000.00, 30),
(2, 2, 'Social Media - Sidebar Promotion', 800.00, 15),
(3, 3, 'Newspaper - Homepage Feature', 1200.00, 45),
(4, 4, 'Billboard - Video Pre-roll', 1500.00, 60),
(5, 5, 'Social Media - Featured Ad Placement', 2000.00, 30),
(6, 6, 'Newspaper - Social Media Promo', 1800.00, 30),
(7, 7, 'Billboard - In-article Banner', 900.00, 20),
(8, 8, 'Social Media - Video Ad Overlay', 1300.00, 45),
(9, 9, 'TV, Youtube- Homepage Takeover', 2500.00, 60),
(10, 10, 'Online Article - Sponsored Content', 1600.00, 30);


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
(1, 'CreativeSolutions', 'creative@gmail.com', 'Ad Design', 'Net 30'),
(2, 'VisionaryProductions', 'visionary@gmail.com', 'Video Production', 'Net 45'),
(3, 'DataInsightsCo', 'datainsights@gmail.com', 'Analytics Services', 'Net 60'),
(4, 'MediaMasters', 'media@gmail.com', 'Ad Placement', 'Net 30'),
(5, 'SocialBuzzPromo', 'socialbuzz@gmail.com', 'Social Media Promotion', 'Net 45'),
(6, 'ContentCrafters', 'crafters@gmail.com', 'Content Creation', 'Net 60'),
(7, 'DesignDynamo', 'design@gmail.com', 'Graphic Design', 'Net 30'),
(8, 'EditExpress', 'edit@gmail.com', 'Video Editing', 'Net 45'),
(9, 'SEOStrategists', 'seo@gmail.com', 'SEO Services', 'Net 60'),
(10, 'WordWizards', 'wizards@gmail.com', 'Copywriting', 'Net 30');

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

-- Retrieve all clients and their respective campaigns
SELECT Clients.Name AS ClientName, Campaigns.Name AS CampaignName
FROM Clients
JOIN Campaigns ON Clients.ClientID = Campaigns.ClientID;

 -- Retrieve the total budget spent on campaigns
SELECT SUM(Budget) AS TotalBudgetSpent
FROM Campaigns;

-- Retrieve the total revenue from invoices
SELECT SUM(TotalAmount) AS TotalRevenue
FROM Invoices;
-- the above query is for the revenue table

-- Retrieve the total cost of advertisements
SELECT SUM(Cost) AS TotalAdCost
FROM AdvertisementPlacements;

-- Retrieve the total salary expense for each department
SELECT Department, SUM(Salary) AS TotalSalaryExpense
FROM Employees
GROUP BY Department;


-- Retrieve the names of clients who have paid their invoices
SELECT Name
FROM Clients
WHERE ClientID IN (SELECT ClientID FROM Invoices WHERE PaymentStatus = 'Paid');

-- Retrieve the average impressions, clicks, and conversions for each advertisement type
SELECT Type, AVG(Impressions) AS AvgImpressions, AVG(Clicks) AS AvgClicks, AVG(Conversions) AS AvgConversions
FROM Advertisements
JOIN PerformanceMetrics ON Advertisements.AdvertisementID = PerformanceMetrics.AdvertisementID
GROUP BY Type;

-- Update the payment status of invoices with pending payments to 'Paid' if payment date has passed
UPDATE Invoices
SET PaymentStatus = 'Paid'
WHERE PaymentStatus = 'Pending' AND InvoiceDate <= CURDATE();
-- curdate not working please check once

-- Delete advertisements with zero impressions
DELETE FROM Advertisements
WHERE AdvertisementID IN (SELECT AdvertisementID FROM PerformanceMetrics WHERE Impressions = 0);


--Retrieve the vendors who have provided services with payment terms longer than 'Net 30'
SELECT VendorName
FROM VendorSupplierInformation
WHERE PaymentTerms > 'Net 30';

-- Calculate the average budget for campaigns managed by each account manager
SELECT AccountManager, AVG(Budget) AS AvgBudget
FROM Clients
JOIN Campaigns ON Clients.ClientID = Campaigns.ClientID
GROUP BY AccountManager;


-- Retrieve the top-performing advertisement (highest number of clicks) for each campaign
SELECT Campaigns.Name AS CampaignName, Advertisements.Type, Advertisements.Content, MAX(PerformanceMetrics.Clicks) AS MaxClicks
FROM Campaigns
JOIN Advertisements ON Campaigns.CampaignID = Advertisements.CampaignID
JOIN PerformanceMetrics ON Advertisements.AdvertisementID = PerformanceMetrics.AdvertisementID
GROUP BY Campaigns.CampaignID;


-- Find the client with the highest total expenditure (sum of campaign budgets)
SELECT Clients.Name AS ClientName, SUM(Campaigns.Budget) AS TotalExpenditure
FROM Clients
JOIN Campaigns ON Clients.ClientID = Campaigns.ClientID
GROUP BY Clients.ClientID
ORDER BY TotalExpenditure DESC
LIMIT 1;


-- Retrieve the employees who have not made any payments
SELECT Employees.Name AS EmployeeName
FROM Employees
LEFT JOIN Payments ON Employees.EmployeeID = Payments.EmployeeID
WHERE Payments.EmployeeID IS NULL;

-- Calculate the total revenue and total cost for each campaign
SELECT Campaigns.Name AS CampaignName, SUM(Invoices.TotalAmount) AS TotalRevenue, SUM(AdvertisementPlacements.Cost) AS TotalCost
FROM Campaigns
LEFT JOIN Invoices ON Campaigns.CampaignID = Invoices.CampaignID
LEFT JOIN AdvertisementPlacements ON Campaigns.CampaignID = AdvertisementPlacements.AdvertisementID
GROUP BY Campaigns.CampaignID;

-- Retrieve the campaigns that have exceeded their budget by more than 20%
SELECT Campaigns.Name AS CampaignName, Campaigns.Budget, SUM(AdvertisementPlacements.Cost) AS TotalCost
FROM Campaigns
LEFT JOIN AdvertisementPlacements ON Campaigns.CampaignID = AdvertisementPlacements.CampaignID
GROUP BY Campaigns.CampaignID
HAVING TotalCost > 1.2 * Budget;

-- Calculate the average duration of advertisement placements for each type
SELECT Advertisements.Type, AVG(AdvertisementPlacements.Duration) AS AvgDuration
FROM Advertisements
JOIN AdvertisementPlacements ON Advertisements.AdvertisementID = AdvertisementPlacements.AdvertisementID
GROUP BY Advertisements.Type;

-- Retrieve the campaigns where the creative director is also part of the creative team
SELECT Campaigns.Name AS CampaignName, Campaigns.CreativeDirector, Advertisements.CreativeTeam
FROM Campaigns
JOIN Advertisements ON Campaigns.CampaignID = Advertisements.CampaignID
WHERE Advertisements.CreativeDirector = Advertisements.CreativeTeam;

-- Calculate the total number of conversions for each department involved in a campaign
SELECT Employees.Department, SUM(PerformanceMetrics.Conversions) AS TotalConversions
FROM Employees
JOIN Advertisements ON Employees.Name = Advertisements.CreativeTeam
JOIN PerformanceMetrics ON Advertisements.AdvertisementID = PerformanceMetrics.AdvertisementID
GROUP BY Employees.Department;

-- Retrieve the campaigns that have not been invoiced
SELECT Campaigns.Name AS CampaignName
FROM Campaigns
LEFT JOIN Invoices ON Campaigns.CampaignID = Invoices.CampaignID
WHERE Invoices.CampaignID IS NULL;

-- Views:
-- View to display information about each advertisement placement with its associated campaign and client
CREATE VIEW vw_AdPlacementDetails AS
SELECT
    ap.PlacementID,
    ap.AdvertisementID,
    ap.PlacementDetails,
    ap.Cost,
    ap.Duration,
    c.Name AS CampaignName,
    cl.Name AS ClientName
FROM AdvertisementPlacements ap
JOIN Advertisements a ON ap.AdvertisementID = a.AdvertisementID
JOIN Campaigns c ON a.CampaignID = c.CampaignID
JOIN Clients cl ON c.ClientID = cl.ClientID;

-- View to show the total payments made by each client
CREATE VIEW vw_TotalPaymentsByClient AS
SELECT
    c.ClientID,
    c.Name AS ClientName,
    SUM(i.TotalAmount) AS TotalPayments
FROM Clients c
LEFT JOIN Invoices i ON c.ClientID = i.ClientID
GROUP BY c.ClientID;

-- Trigger to update the total budget of a campaign when a new advertisement placement is added
CREATE TRIGGER trg_UpdateCampaignBudget
AFTER INSERT ON AdvertisementPlacements
FOR EACH ROW
BEGIN
    UPDATE Campaigns
    SET Budget = Budget + NEW.Cost
    WHERE CampaignID = (SELECT CampaignID FROM Advertisements WHERE AdvertisementID = NEW.AdvertisementID);
END;

-- Trigger to enforce a constraint on the maximum duration of an advertisement placement
CREATE TRIGGER trg_CheckDuration
BEFORE INSERT ON AdvertisementPlacements
FOR EACH ROW
BEGIN
    DECLARE maxDuration INT;
    SET maxDuration = 60; -- Set the maximum duration as needed
    
    IF NEW.Duration > maxDuration THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Duration exceeds the maximum allowed duration.';
    END IF;
END;

-- Complex Views:
-- View to display performance metrics with additional calculated fields
CREATE VIEW vw_PerformanceMetricsExtended AS
SELECT
    pm.MetricID,
    pm.AdvertisementID,
    pm.Impressions,
    pm.Clicks,
    pm.Conversions,
    pm.Date,
    a.Type AS AdvertisementType,
    a.Content AS AdvertisementContent,
    c.Name AS CampaignName,
    cl.Name AS ClientName,
    (pm.Conversions / pm.Clicks) * 100 AS ConversionRate
FROM PerformanceMetrics pm
JOIN Advertisements a ON pm.AdvertisementID = a.AdvertisementID
JOIN Campaigns c ON a.CampaignID = c.CampaignID
JOIN Clients cl ON c.ClientID = cl.ClientID;

-- View to show the total amount paid and pending for each campaign
CREATE VIEW vw_CampaignPaymentStatus AS
SELECT
    c.CampaignID,
    c.Name AS CampaignName,
    SUM(i.TotalAmount) AS TotalAmountPaid,
    (c.Budget - SUM(i.TotalAmount)) AS AmountPending
FROM Campaigns c
LEFT JOIN Invoices i ON c.CampaignID = i.CampaignID
GROUP BY c.CampaignID;

-- Complex Triggers
-- Trigger to update the total amount and payment status when a new invoice is added
CREATE TRIGGER trg_UpdateCampaignPaymentStatus
AFTER INSERT ON Invoices
FOR EACH ROW
BEGIN
    UPDATE vw_CampaignPaymentStatus cps
    SET cps.TotalAmountPaid = cps.TotalAmountPaid + NEW.TotalAmount,
        cps.AmountPending = cps.AmountPending - NEW.TotalAmount
    WHERE cps.CampaignID = NEW.CampaignID;
END;

-- Trigger to prevent deleting clients with active campaigns
CREATE TRIGGER trg_PreventDeleteClient
BEFORE DELETE ON Clients
FOR EACH ROW
BEGIN
    DECLARE campaignCount INT;

    SELECT COUNT(*)
    INTO campaignCount
    FROM Campaigns
    WHERE ClientID = OLD.ClientID;

    IF campaignCount > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot delete client with active campaigns.';
    END IF;
END;

-- congestion control and store procedure to be updated
