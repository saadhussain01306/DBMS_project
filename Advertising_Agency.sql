-- Create the database advertising_agency
CREATE DATABASE advertising_agency;
USE advertising_agency;

-- Create clients table
CREATE TABLE clients (
    client_id INT PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255),
    phone VARCHAR(15),
    billing_address VARCHAR(255),
    account_manager VARCHAR(255)
);

-- Create campaigns table
CREATE TABLE campaigns (
    campaign_id INT PRIMARY KEY,
    client_id INT,
    name VARCHAR(255),
    budget DECIMAL(10, 2),
    start_date date,
    end_date date,
    creative_director VARCHAR(255),
    FOREIGN KEY (client_id) REFERENCES clients(client_id)
);

-- Create advertisements table
CREATE TABLE advertisements (
    advertisement_id INT PRIMARY KEY,
    campaign_id INT,
    type VARCHAR(50),
    content TEXT,
    creative_team VARCHAR(255),
    FOREIGN KEY (campaign_id) REFERENCES campaigns(campaign_id)
);

-- Create employees table
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(255),
    position VARCHAR(50),
    email VARCHAR(255),
    phone VARCHAR(15),
    salary DECIMAL(10, 2),
    department VARCHAR(50)
);

-- Create advertisement_placements table
CREATE TABLE advertisement_placements (
    placement_id INT PRIMARY KEY,
    advertisement_id INT,
    placement_details VARCHAR(255),
    cost DECIMAL(10, 2),
    duration INT,
    FOREIGN KEY (advertisement_id) REFERENCES advertisements(advertisement_id)
);

-- Create invoices table
CREATE TABLE invoices (
    invoice_id INT PRIMARY KEY,
    client_id INT,
    campaign_id INT,
    invoice_date date,
    payment_status VARCHAR(20),
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (client_id) REFERENCES clients(client_id),
    FOREIGN KEY (campaign_id) REFERENCES campaigns(campaign_id)
);


-- Create payments table
CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    invoice_id INT,
    employee_id INT,
    payment_date date,
    payment_method VARCHAR(50),
    transaction_reference VARCHAR(255),
    FOREIGN KEY (invoice_id) REFERENCES invoices(invoice_id),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

-- Create vendor_supplier_information table
CREATE TABLE vendor_supplier_information (
    vendor_id INT PRIMARY KEY,
    vendor_name VARCHAR(255),
    contact_info VARCHAR(255),
    services_provided TEXT,
    payment_terms VARCHAR(255)
);

-- Create vendor_invoices table
CREATE TABLE vendor_invoices (
    invoice_id INT PRIMARY KEY,
    payment_id INT,
    vendor_id INT,
    invoice_date date,
    total_amount DECIMAL(10, 2),
    payment_status VARCHAR(20),
    FOREIGN KEY (vendor_id) REFERENCES vendor_supplier_information(vendor_id),
    FOREIGN KEY (payment_id) REFERENCES payments(payment_id)
);

-- Create performance_metrics table
CREATE TABLE performance_metrics (
    metric_id INT PRIMARY KEY,
    advertisement_id INT,
    impressions INT,
    clicks INT,
    conversions INT,
    date date,
    FOREIGN KEY (advertisement_id) REFERENCES advertisements(advertisement_id)
);


-- INSERTION

-- Inserting the data into the above tables
-- Insert data into clients table
INSERT INTO clients (client_id, name, email, Phone, billing_address, account_manager)
VALUES
(1, 'Nike India', 'manager@nike.com', '123-456-7890', '123, Kuvempu Nagar, Mysuru, Karnataka, 570023', 'Rahul Shah'),
(2, 'Haldiram Snacks Private Limited', 'cs@haldiram.com', '234-567-8901', '456, Vijayanagar, Mysuru, Karnataka, 570016', 'Rohit Gowda'),
(3, 'A2B Restaurants', 'care@aabsweets.com', '345-678-9012', '789, Siddhartha Layout, Mysuru, Karnataka, 570011', 'Arman Singh'),
(4, 'Manipal Hospitals', 'manager@manipal.com', '456-789-0123', '234, Jayalakshmipuram, Mysuru, Karnataka, 570012', 'Bhaskar Jain'),
(5, 'Loyal World Supermarket Mysuru', 'manager@loyalworldmys.com', '567-890-1234', '567, Lakshmipuram, Mysuru, Karnataka, 570024', 'Rohini Bhat'),
(6, 'Vishal Mart Mysuru', 'manager@vishalmartmys.com', '678-901-2345', '890, Chamundi Vihar, Mysuru, Karnataka, 570019', 'Radha Shenoy'),
(7, 'DMart Bengaluru', 'manager@dmartblr.com', '789-012-3456', '789, Kuvempu Nagar, Mysuru, Karnataka, 570023', 'Raghav Sharma'),
(8, 'Dosa Point', 'manager@dosapoint.com', '890-123-4567', '890, Chamundi Vihar, Mysuru, Karnataka, 570019', 'Madhav Ullas'),
(9, 'Bhaskar''s Mane Holige', 'manager@bmholige.com', '901-234-5678', '890, Chamundi Vihar, Mysuru, Karnataka, 570019', 'Krishnamurthy Shankar'),
(10, 'Airtel Mysuru', 'manager@airtelmys.com', '012-345-6789', '789, Kuvempu Nagar, Mysuru, Karnataka, 570023', 'Naresh Reddy');

-- Insert data into Campaigns table
INSERT INTO campaigns (campaign_id, client_id, name, budget, start_date, end_date, creative_director)
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
INSERT INTO advertisements (advertisement_id, campaign_id, type, content, creative_team)
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
INSERT INTO employees (employee_id, name, position, email, phone, salary, department)
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
INSERT INTO advertisement_placements (placement_id, advertisement_id, placement_details, cost, duration)
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
(10, 10, 'Online Article - Sponsored content', 1600.00, 30);


-- Insert data into invoices table
INSERT INTO invoices (invoice_id, client_id, campaign_id, invoice_date, payment_status, total_amount)
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

-- Insert data payments Payments table
INSERT INTO Payments (payment_id, invoice_id, employee_id, payment_date, payment_method, transaction_reference)
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
INSERT INTO vendor_supplier_information (vendor_id, vendor_name, contact_info, services_provided, payment_terms)
VALUES
(1, 'CreativeSolutions', 'creative@gmail.com', 'Ad Design', 'Net 30'),
(2, 'VisionaryProductions', 'visionary@gmail.com', 'Video Production', 'Net 45'),
(3, 'DataInsightsCo', 'datainsights@gmail.com', 'Analytics Services', 'Net 60'),
(4, 'MediaMasters', 'media@gmail.com', 'Ad Placement', 'Net 30'),
(5, 'SocialBuzzPromo', 'socialbuzz@gmail.com', 'Social Media Promotion', 'Net 45'),
(6, 'contentCrafters', 'crafters@gmail.com', 'content Creation', 'Net 60'),
(7, 'DesignDynamo', 'design@gmail.com', 'Graphic Design', 'Net 30'),
(8, 'EditExpress', 'edit@gmail.com', 'Video Editing', 'Net 45'),
(9, 'SEOStrategists', 'seo@gmail.com', 'SEO Services', 'Net 60'),
(10, 'WordWizards', 'wizards@gmail.com', 'Copywriting', 'Net 30');

-- Insert data into Vendorinvoices table
INSERT INTO vendor_invoices (invoice_id, payment_id, vendor_id, invoice_date, total_amount, payment_status)
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
INSERT INTO performance_metrics (metric_id, advertisement_id, impressions, clicks, conversions, date)
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
SELECT clients.name AS client_name, campaigns.name AS campaign_name
FROM clients
JOIN campaigns ON clients.client_id = campaigns.client_id;

 -- Retrieve the total budget spent on campaigns
SELECT SUM(budget) AS total_budget_spent
FROM campaigns;

-- Categorizing the campaigns based on the budget
SELECT
    CASE
        WHEN budget < 6000 THEN 'Less than 6000'
        WHEN budget BETWEEN 6000 AND 12000 THEN 'Between 6000 and 12000'
        WHEN budget > 12000 THEN '12000 and more'
        ELSE 'Uncategorized'
    END AS budget_category,
    COUNT(*) AS campaign_count
FROM
    campaigns
GROUP BY
    budget_category;


-- Retrieve the total revenue from invoices
SELECT SUM(total_amount) AS total_revenue
FROM invoices;
-- the above query is for the revenue table

-- Categorize the invoices based on the payment status
SELECT SUM(total_amount) AS amount, COUNT(payment_status) AS invoices_count, payment_status  
FROM invoices
GROUP BY payment_status;

-- Group invoices based on the quarter
SELECT
    EXTRACT(QUARTER FROM invoice_date) AS quarter,
    COUNT(*) AS num_invoices,
    SUM(total_amount) AS total_amount,
    AVG(total_amount) AS average_amount
FROM
    invoices
GROUP BY
    quarter
ORDER BY
    quarter;

-- Retrieve the total cost of advertisements
SELECT SUM(cost) AS total_ad_cost
FROM advertisement_placements;

-- Retrieve the total salary expense for each department
SELECT department, SUM(salary) AS total_salary_expense
FROM employees
GROUP BY department;

-- Retrieve the names of clients who have paid their invoices
SELECT name
FROM clients
WHERE client_id IN (SELECT client_id FROM invoices WHERE payment_status = 'Paid');

-- Retrieve the average impressions, clicks, and conversions for each advertisement type
SELECT type, AVG(impressions) AS avg_impressions, AVG(clicks) AS avg_clicks, AVG(conversions) AS avg_conversions
FROM advertisements
JOIN performance_metrics ON advertisements.advertisement_id = performance_metrics.advertisement_id
GROUP BY type;

-- Update the payment status of invoices with pending payments to 'Paid' if payment date has passed
UPDATE invoices
SET payment_status = 'Paid'
WHERE payment_status = 'Pending' AND invoice_date <= CURDATE();
-- curdate not working please check once

-- Delete advertisements with zero impressions
DELETE FROM advertisements
WHERE advertisement_id IN (SELECT advertisement_id FROM performance_metrics WHERE impressions = 0);

--Retrieve the vendors who have provided services with payment terms longer than 'Net 30'
SELECT vendor_name
FROM vendor_supplier_information
WHERE payment_terms > 'Net 30';

-- Calculate the average budget for campaigns managed by each account manager
SELECT account_manager, AVG(budget) AS avg_budget
FROM clients
JOIN campaigns ON clients.client_id = campaigns.client_id
GROUP BY account_manager;

-- Retrieve the top-performing advertisement (highest number of clicks) for each campaign
SELECT campaigns.name AS campaign_name, advertisements.type, advertisements.content, MAX(performance_metrics.clicks) AS max_clicks
FROM campaigns
JOIN advertisements ON campaigns.campaign_id = advertisements.campaign_id
JOIN performance_metrics ON advertisements.advertisement_id = performance_metrics.advertisement_id
GROUP BY campaigns.campaign_id;

-- Find the client with the highest total expenditure (sum of campaign budgets)
SELECT clients.name AS client_name, SUM(campaigns.budget) AS total_expenditure
FROM clients
JOIN campaigns ON clients.client_id = campaigns.client_id
GROUP BY clients.client_id
ORDER BY total_expenditure DESC
LIMIT 1;

-- Retrieve the employees who have not made any payments
SELECT employees.name AS employee_name
FROM employees
LEFT JOIN payments ON employees.employee_id = payments.employee_id
WHERE payments.employee_id IS NULL;

-- Calculate the total revenue and total cost for each campaign
SELECT campaigns.name AS campaign_name, SUM(invoices.total_amount) AS total_revenue, SUM(advertisement_placements.cost) AS total_cost
FROM campaigns
LEFT JOIN invoices ON campaigns.campaign_id = invoices.campaign_id
LEFT JOIN advertisement_placements ON campaigns.campaign_id = advertisement_placements.advertisement_id
GROUP BY campaigns.campaign_id;

-- Retrieve the campaigns that have exceeded their budget by more than 20%
SELECT campaigns.name AS campaign_name, campaigns.budget, SUM(advertisement_placements.cost) AS total_cost
FROM campaigns
LEFT JOIN advertisement_placements ON campaigns.campaign_id = advertisement_placements.campaign_id
GROUP BY campaigns.campaign_id
HAVING total_cost > 1.2 * budget;

-- Calculate the average duration of advertisement placements for each type
SELECT advertisements.type, AVG(advertisement_placements.duration_days) AS avg_duration
FROM advertisements
JOIN advertisement_placements ON advertisements.advertisement_id = advertisement_placements.advertisement_id
GROUP BY advertisements.type;

-- Retrieve the campaigns where the creative director is also part of the creative team
SELECT campaigns.name AS campaign_name, campaigns.creative_director, advertisements.creative_team
FROM campaigns
JOIN advertisements ON campaigns.campaign_id = advertisements.campaign_id
WHERE advertisements.creative_director = advertisements.creative_team;

-- Calculate the total number of conversions for each department involved in a campaign
SELECT employees.department, SUM(performance_metrics.conversions) AS total_conversions
FROM employees
JOIN advertisements ON employees.name = advertisements.creative_team
JOIN performance_metrics ON advertisements.advertisement_id = performance_metrics.advertisement_id
GROUP BY employees.department;

-- Retrieve the campaigns that have not been invoiced
SELECT campaigns.name AS campaign_name
FROM campaigns
LEFT JOIN invoices ON campaigns.campaign_id = invoices.campaign_id
WHERE invoices.campaign_id IS NULL;

-- Views:
-- View to display information about each advertisement placement with its associated campaign and client
CREATE VIEW vw_ad_placement_details AS
SELECT
    ap.placement_id,
    ap.advertisement_id,
    ap.placement_details,
    ap.cost,
    ap.duration_days,
    c.name AS campaign_name,
    cl.name AS client_name
FROM advertisement_placements ap
JOIN advertisements a ON ap.advertisement_id = a.advertisement_id
JOIN campaigns c ON a.campaign_id = c.campaign_id
JOIN clients cl ON c.client_id = cl.client_id;

-- View to show the total payments made by each client
CREATE VIEW vw_total_payments_by_client AS
SELECT
    c.client_id,
    c.name AS client_name,
    SUM(i.total_amount) AS total_payments
FROM clients c
LEFT JOIN invoices i ON c.client_id = i.client_id
GROUP BY c.client_id;

-- Trigger to update the total budget of a campaign when a new advertisement placement is added
CREATE TRIGGER trg_update_campaign_budget
AFTER INSERT ON advertisement_placements
FOR EACH ROW
BEGIN
    UPDATE campaigns
    SET budget = budget + NEW.cost
    WHERE campaign_id = (SELECT campaign_id FROM advertisements WHERE advertisement_id = NEW.advertisement_id);
END;

-- Trigger to enforce a constraint on the maximum duration of an advertisement placement
CREATE TRIGGER trg_check_duration
BEFORE INSERT ON advertisement_placements
FOR EACH ROW
BEGIN
    DECLARE max_duration INT;
    SET max_duration = 60; -- Set the maximum duration as needed
    
    IF NEW.duration_days > max_duration THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Duration exceeds the maximum allowed duration.';
    END IF;
END;

-- Complex Views:
-- View to display performance metrics with additional calculated fields
CREATE VIEW vw_performance_metrics_extended AS
SELECT
    pm.metric_id,
    pm.advertisement_id,
    pm.impressions,
    pm.clicks,
    pm.conversions,
    pm.date,
    a.type AS advertisement_type,
    a.content AS advertisement_content,
    c.name AS campaign_name,
    cl.name AS client_name,
    (pm.conversions / pm.clicks) * 100 AS conversion_rate
FROM performance_metrics pm
JOIN advertisements a ON pm.advertisement_id = a.advertisement_id
JOIN campaigns c ON a.campaign_id = c.campaign_id
JOIN clients cl ON c.client_id = cl.client_id;

-- View to show the total amount paid and pending for each campaign
CREATE VIEW vw_campaign_payment_status AS
SELECT
    c.campaign_id,
    c.name AS campaign_name,
    SUM(i.total_amount) AS total_amount_paid,
    (c.budget - SUM(i.total_amount)) AS amount_pending
FROM campaigns c
LEFT JOIN invoices i ON c.campaign_id = i.campaign_id
GROUP BY c.campaign_id;

-- Complex Triggers
-- Trigger to update the total amount and payment status when a new invoice is added
CREATE TRIGGER trg_update_campaign_payment_status
AFTER INSERT ON invoices
FOR EACH ROW
BEGIN
    UPDATE vw_campaign_payment_status cps
    SET cps.total_amount_paid = cps.total_amount_paid + NEW.total_amount,
        cps.amount_pending = cps.amount_pending - NEW.total_amount
    WHERE cps.campaign_id = NEW.campaign_id;
END;

-- Trigger to prevent deleting clients with active campaigns
CREATE TRIGGER trg_prevent_delete_client
BEFORE DELETE ON clients
FOR EACH ROW
BEGIN
    DECLARE campaign_count INT;

    SELECT COUNT(*)
    INTO campaign_count
    FROM campaigns
    WHERE client_id = OLD.client_id;

    IF campaign_count > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot delete client with active campaigns.';
    END IF;
END;

-- Indexes
CREATE INDEX idx_client_id ON campaigns (client_id);

-- Update column duration in advertisement_placements to duration_days
ALTER TABLE advertisement_placements
RENAME COLUMN duration TO duration_days;

-- congestion control and store procedure to be updated

