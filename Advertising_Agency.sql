-- Create the database Advertising_agency
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

-- Create contact_us table
CREATE TABLE contact_us (
    name VARCHAR(255),
    email VARCHAR(255) PRIMARY KEY,
    message TEXT
);

CREATE TABLE clients_backup (
    client_id INT PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255),
    phone VARCHAR(15),
    billing_address VARCHAR(255),
    account_manager VARCHAR(255)
);

-- Insertion
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

-- check 
SELECT * FROM clients;
+-----------+---------------------------------+---------------------------+--------------+---------------------------------------------------+-----------------------+
| client_id | name                            | email                     | phone        | billing_address                                   | account_manager       |
+-----------+---------------------------------+---------------------------+--------------+---------------------------------------------------+-----------------------+
|         1 | Nike India                      | manager@nike.com          | 123-456-7890 | 123, Kuvempu Nagar, Mysuru, Karnataka, 570023     | Rahul Shah            |
|         2 | Haldiram Snacks Private Limited | cs@haldiram.com           | 234-567-8901 | 456, Vijayanagar, Mysuru, Karnataka, 570016       | Rohit Gowda           |
|         3 | A2B Restaurants                 | care@aabsweets.com        | 345-678-9012 | 789, Siddhartha Layout, Mysuru, Karnataka, 570011 | Arman Singh           |
|         4 | Manipal Hospitals               | manager@manipal.com       | 456-789-0123 | 234, Jayalakshmipuram, Mysuru, Karnataka, 570012  | Bhaskar Jain          |
|         5 | Loyal World Supermarket Mysuru  | manager@loyalworldmys.com | 567-890-1234 | 567, Lakshmipuram, Mysuru, Karnataka, 570024      | Rohini Bhat           |
|         6 | Vishal Mart Mysuru              | manager@vishalmartmys.com | 678-901-2345 | 890, Chamundi Vihar, Mysuru, Karnataka, 570019    | Radha Shenoy          |
|         7 | DMart Bengaluru                 | manager@dmartblr.com      | 789-012-3456 | 789, Kuvempu Nagar, Mysuru, Karnataka, 570023     | Raghav Sharma         |
|         8 | Dosa Point                      | manager@dosapoint.com     | 890-123-4567 | 890, Chamundi Vihar, Mysuru, Karnataka, 570019    | Madhav Ullas          |
|         9 | Bhaskars Mane Holige           | manager@bmholige.com      | 901-234-5678 | 890, Chamundi Vihar, Mysuru, Karnataka, 570019    | Krishnamurthy Shankar |
|        10 | Airtel Mysuru                   | manager@airtelmys.com     | 012-345-6789 | 789, Kuvempu Nagar, Mysuru, Karnataka, 570023     | Naresh Reddy          |
+-----------+---------------------------------+---------------------------+--------------+---------------------------------------------------+-----------------------+

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

-- check
SELECT * FROM campaigns;

+-------------+-----------+---------------------------------------------+----------+------------+------------+-------------------+
| campaign_id | client_id | name                                        | budget   | start_date | end_date   | creative_director |
+-------------+-----------+---------------------------------------------+----------+------------+------------+-------------------+
|           1 |         1 | Shoes Billboard                             |  5000.00 | 2023-01-01 | 2023-02-01 | Nawaz Khan        |
|           2 |         1 | Jerseys Social Media Campaign               |  8000.00 | 2023-03-01 | 2023-04-01 | Rohit Roy         |
|           3 |         2 | Haldirams End Of Month Sale                 |  6000.00 | 2023-02-01 | 2023-03-01 | Yash Dubey        |
|           4 |         2 | Products billboard                          |  7000.00 | 2023-04-01 | 2023-05-01 | Wren D Souza      |
|           5 |         3 | Social media campaign                       |  9000.00 | 2023-03-01 | 2023-04-01 | Karan Brar        |
|           6 |         3 | Delicious Dosa December Campaign            | 12000.00 | 2023-05-01 | 2023-06-01 | Shamla Krishnan   |
|           7 |         4 | Heart Disease Prrevention Campaign(Offline) | 10000.00 | 2023-04-01 | 2023-05-01 | Sudha Iyer        |
|           8 |         4 | Healthcare cards campaign(social media)     | 15000.00 | 2023-06-01 | 2023-07-01 | Walter White      |
|           9 |         5 | End of Month sale                           | 11000.00 | 2023-05-01 | 2023-06-01 | Sal Peter         |
|          10 |         5 | 25 years anniversary campaign(social media) | 18000.00 | 2023-07-01 | 2023-08-01 | Ashman Joshi      |
+-------------+-----------+---------------------------------------------+----------+------------+------------+-------------------+


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

-- check 
SELECT * FROM advertisements;
+------------------+-------------+--------------------------+-----------------------------+---------------+
| advertisement_id | campaign_id | type                     | content                     | creative_team |
+------------------+-------------+--------------------------+-----------------------------+---------------+
|                1 |           1 | Billboard                | https://hask.inc/content/1  | Mavericks     |
|                2 |           1 | Social media posts       | https://hask.inc/content/2  | BrandWave     |
|                3 |           2 | Newspaper Ads            | https://hask.inc/content/3  | BuzzBlend     |
|                4 |           2 | Billboard                | https://hask.inc/content/4  | BuzzBlend     |
|                5 |           3 | Social media posts       | https://hask.inc/content/5  | VibeSync      |
|                6 |           3 | Newspaper Ads/Banners    | https://hask.inc/content/6  | FusionFlow    |
|                7 |           4 | Billboards/Newspaper Ads | https://hask.inc/content/7  | PromoPulse    |
|                8 |           4 | Social media posts       | https://hask.inc/content/8  | VibeSync      |
|                9 |           5 | Youtube/TV Ad            | https://hask.inc/content/9  | PixelCraft    |
|               10 |           5 | Social media posts       | https://hask.inc/content/10 | PromoPulse    |
+------------------+-------------+--------------------------+-----------------------------+---------------+

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

-- check
SELECT * FROM employees;
+-------------+--------------+-----------+--------------------------+--------------+----------+------------+
| employee_id | name         | position  | email                    | phone        | salary   | department |
+-------------+--------------+-----------+--------------------------+--------------+----------+------------+
|           1 | Amit Sharma  | Manager   | amit.sharma@gmail.com    | 345-678-9012 | 60000.00 | Marketing  |
|           2 | Priya Patel  | Designer  | priya.patel@outlook.com  | 456-789-0123 | 55000.00 | Design     |
|           3 | Rajesh Kumar | Analyst   | rajesh.kumar@yahoo.com   | 567-890-1234 | 70000.00 | Analytics  |
|           4 | Sneha Verma  | Developer | sneha.verma@gmail.com    | 678-901-2345 | 80000.00 | IT         |
|           5 | Arjun Singh  | Manager   | arjun.singh@gmail.com    | 789-012-3456 | 65000.00 | Marketing  |
|           6 | Kavita Gupta | Designer  | kavita.gupta@outlook.com | 890-123-4567 | 60000.00 | Design     |
|           7 | Ananya Reddy | Analyst   | ananya.reddy@yahoo.com   | 901-234-5678 | 75000.00 | Analytics  |
|           8 | Vikram Patel | Developer | vikram.patel@gmail.com   | 012-345-6789 | 85000.00 | IT         |
|           9 | Suman Verma  | Manager   | suman.verma@yahoo.com    | 123-456-7890 | 70000.00 | Marketing  |
|          10 | Neha Kapoor  | Designer  | neha.kapoor@gmail.com    | 234-567-8901 | 60000.00 | Design     |
+-------------+--------------+-----------+--------------------------+--------------+----------+------------+

    
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

-- check
SELECT * FROM advertisement_placements;
+--------------+------------------+--------------------------------------+---------+----------+
| placement_id | advertisement_id | placement_details                    | cost    | duration |
+--------------+------------------+--------------------------------------+---------+----------+
|            1 |                1 | Billboard - Top Location             | 1000.00 |       30 |
|            2 |                2 | Social Media - Sidebar Promotion     |  800.00 |       15 |
|            3 |                3 | Newspaper - Homepage Feature         | 1200.00 |       45 |
|            4 |                4 | Billboard - Video Pre-roll           | 1500.00 |       60 |
|            5 |                5 | Social Media - Featured Ad Placement | 2000.00 |       30 |
|            6 |                6 | Newspaper - Social Media Promo       | 1800.00 |       30 |
|            7 |                7 | Billboard - In-article Banner        |  900.00 |       20 |
|            8 |                8 | Social Media - Video Ad Overlay      | 1300.00 |       45 |
|            9 |                9 | TV, Youtube- Homepage Takeover       | 2500.00 |       60 |
|           10 |               10 | Online Article - Sponsored content   | 1600.00 |       30 |
+--------------+------------------+--------------------------------------+---------+----------+


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

-- check
SELECT * FROM invoices;
+------------+-----------+-------------+--------------+----------------+--------------+
| invoice_id | client_id | campaign_id | invoice_date | payment_status | total_amount |
+------------+-----------+-------------+--------------+----------------+--------------+
|          1 |         1 |           1 | 2023-02-15   | Paid           |      5000.00 |
|          2 |         1 |           2 | 2023-04-15   | Pending        |      8000.00 |
|          3 |         2 |           3 | 2023-03-15   | Paid           |      6000.00 |
|          4 |         2 |           4 | 2023-05-15   | Pending        |      7000.00 |
|          5 |         3 |           5 | 2023-04-15   | Paid           |      9000.00 |
|          6 |         3 |           6 | 2023-06-15   | Pending        |     12000.00 |
|          7 |         4 |           7 | 2023-05-15   | Paid           |     10000.00 |
|          8 |         4 |           8 | 2023-07-15   | Pending        |     15000.00 |
|          9 |         5 |           9 | 2023-06-15   | Paid           |     11000.00 |
|         10 |         5 |          10 | 2023-08-15   | Pending        |     18000.00 |
+------------+-----------+-------------+--------------+----------------+--------------+

-- Insert data payments Payments table
INSERT INTO payments (payment_id, invoice_id, employee_id, payment_date, payment_method, transaction_reference)
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

-- check
SELECT * FROM payments;
+------------+------------+-------------+--------------+----------------+-----------------------+
| payment_id | invoice_id | employee_id | payment_date | payment_method | transaction_reference |
+------------+------------+-------------+--------------+----------------+-----------------------+
|          1 |          1 |           1 | 2023-02-20   | Credit Card    | TRX12345              |
|          2 |          2 |           2 | 2023-04-20   | Bank Transfer  | TRX67890              |
|          3 |          3 |           3 | 2023-03-20   | Credit Card    | TRX23456              |
|          4 |          4 |           4 | 2023-05-20   | Bank Transfer  | TRX78901              |
|          5 |          5 |           5 | 2023-04-20   | Credit Card    | TRX34567              |
|          6 |          6 |           6 | 2023-06-20   | Bank Transfer  | TRX89012              |
|          7 |          7 |           7 | 2023-05-20   | Credit Card    | TRX45678              |
|          8 |          8 |           8 | 2023-07-20   | Bank Transfer  | TRX90123              |
|          9 |          9 |           9 | 2023-06-20   | Credit Card    | TRX56789              |
|         10 |         10 |          10 | 2023-08-20   | Bank Transfer  | TRX01234              |
+------------+------------+-------------+--------------+----------------+-----------------------+


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

-- check
SELECT * FROM vendor_supplier_information;
+-----------+----------------------+------------------------+------------------------+---------------+
| vendor_id | vendor_name          | contact_info           | services_provided      | payment_terms |
+-----------+----------------------+------------------------+------------------------+---------------+
|         1 | CreativeSolutions    | creative@gmail.com     | Ad Design              | Net 30        |
|         2 | VisionaryProductions | visionary@gmail.com    | Video Production       | Net 45        |
|         3 | DataInsightsCo       | datainsights@gmail.com | Analytics Services     | Net 60        |
|         4 | MediaMasters         | media@gmail.com        | Ad Placement           | Net 30        |
|         5 | SocialBuzzPromo      | socialbuzz@gmail.com   | Social Media Promotion | Net 45        |
|         6 | contentCrafters      | crafters@gmail.com     | content Creation       | Net 60        |
|         7 | DesignDynamo         | design@gmail.com       | Graphic Design         | Net 30        |
|         8 | EditExpress          | edit@gmail.com         | Video Editing          | Net 45        |
|         9 | SEOStrategists       | seo@gmail.com          | SEO Services           | Net 60        |
|        10 | WordWizards          | wizards@gmail.com      | Copywriting            | Net 30        |
+-----------+----------------------+------------------------+------------------------+---------------+


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

-- check
SELECT * FROM vendor_invoices;
+------------+------------+-----------+--------------+--------------+----------------+
| invoice_id | payment_id | vendor_id | invoice_date | total_amount | payment_status |
+------------+------------+-----------+--------------+--------------+----------------+
|          1 |          1 |         1 | 2023-02-25   |      1000.00 | Paid           |
|          2 |          2 |         2 | 2023-04-25   |       800.00 | Pending        |
|          3 |          3 |         3 | 2023-03-25   |      1200.00 | Paid           |
|          4 |          4 |         4 | 2023-05-25   |      1500.00 | Pending        |
|          5 |          5 |         5 | 2023-04-25   |      2000.00 | Paid           |
|          6 |          6 |         6 | 2023-06-25   |      1800.00 | Pending        |
|          7 |          7 |         7 | 2023-05-25   |       900.00 | Paid           |
|          8 |          8 |         8 | 2023-07-25   |      1300.00 | Pending        |
|          9 |          9 |         9 | 2023-06-25   |      2500.00 | Paid           |
|         10 |         10 |        10 | 2023-08-25   |      1600.00 | Pending        |
+------------+------------+-----------+--------------+--------------+----------------+


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

-- check
SELECT * FROM performance_metrics;
+-----------+------------------+-------------+--------+-------------+------------+
| metric_id | advertisement_id | impressions | clicks | conversions | date       |
+-----------+------------------+-------------+--------+-------------+------------+
|         1 |                1 |       50000 |   1000 |          50 | 2023-02-01 |
|         2 |                2 |       70000 |   1200 |          70 | 2023-02-01 |
|         3 |                3 |       60000 |    800 |          40 | 2023-03-01 |
|         4 |                4 |       80000 |   1500 |          80 | 2023-03-01 |
|         5 |                5 |       90000 |   1800 |          90 | 2023-04-01 |
|         6 |                6 |      120000 |   2000 |         120 | 2023-04-01 |
|         7 |                7 |      100000 |   1300 |         100 | 2023-05-01 |
|         8 |                8 |      150000 |   2500 |         150 | 2023-05-01 |
|         9 |                9 |      110000 |   1600 |         110 | 2023-06-01 |
|        10 |               10 |      180000 |   3000 |         180 | 2023-06-01 |
+-----------+------------------+-------------+--------+-------------+------------+
    
INSERT INTO contact_us (name, email, message) VALUES
('John Doe', 'john.doe@gmail.com', 'I have a question about the Shoes Billboard campaign.'),
('Alice Smith', 'alice.smith@gmail.com', 'Interested in the Haldirams End Of Month Sale.'),
('Bob Johnson', 'bob.johnson@gmail.com', 'I wanted to provide feedback on the Products billboard.'),
('Eva Brown', 'eva.brown@gmail.com', 'Inquiry about the Delicious Dosa December Campaign.'),
('David White', 'david.white@gmail.com', 'Looking for collaboration opportunities in the healthcare sector.'),
('Emma Davis', 'emma.davis@gmail.com', 'Complaint about the advertisement placement on social media.'),
('Michael Wilson', 'michael.wilson@gmail.com', 'Suggestions for improving the Heart Disease Prevention Campaign.'),
('Sophia Miller', 'sophia.miller@gmail.com', 'Feedback on the End of Month sale campaign.'),
('Daniel Lee', 'daniel.lee@gmail.com', 'I have a suggestion for enhancing your advertising strategies.'),
('Olivia Turner', 'olivia.turner@gmail.com', 'Greetings! Your team''s creativity in the 25 years anniversary campaign is impressive.');

-- check
    
SELECT * FROM contact_us;
+----------------+--------------------------+---------------------------------------------------------------------------------------+
| name           | email                    | message                                                                               |
+----------------+--------------------------+---------------------------------------------------------------------------------------+
| John Doe       | john.doe@gmail.com       | I have a question about the Shoes Billboard campaign.                                 |
| Alice Smith    | alice.smith@gmail.com    | Interested in the Haldirams End Of Month Sale.                                        |
| Bob Johnson    | bob.johnson@gmail.com    | I wanted to provide feedback on the Products billboard.                               |
| Eva Brown      | eva.brown@gmail.com      | Inquiry about the Delicious Dosa December Campaign.                                   |
| David White    | david.white@gmail.com    | Looking for collaboration opportunities in the healthcare sector.                     |
| Emma Davis     | emma.davis@gmail.com     | Complaint about the advertisement placement on social media.                          |
| Michael Wilson | michael.wilson@gmail.com | Suggestions for improving the Heart Disease Prevention Campaign.                      |
| Sophia Miller  | sophia.miller@gmail.com  | Feedback on the End of Month sale campaign.                                           |
| Daniel Lee     | daniel.lee@gmail.com     | I have a suggestion for enhancing your advertising strategies.                        |
| Olivia Turner  | olivia.turner@gmail.com  | Greetings! Your teams creativity in the 25 years anniversary campaign is impressive. |
+----------------+--------------------------+---------------------------------------------------------------------------------------+
   
-- Retrieve all clients and their respective campaigns
SELECT clients.name AS client_name, campaigns.name AS campaign_name
FROM clients
JOIN campaigns ON clients.client_id = campaigns.client_id;
+---------------------------------+---------------------------------------------+
| client_name                     | campaign_name                               |
+---------------------------------+---------------------------------------------+
| Nike India                      | Shoes Billboard                             |
| Nike India                      | Jerseys Social Media Campaign               |
| Haldiram Snacks Private Limited | Haldirams End Of Month Sale                 |
| Haldiram Snacks Private Limited | Products billboard                          |
| A2B Restaurants                 | Social media campaign                       |
| A2B Restaurants                 | Delicious Dosa December Campaign            |
| Manipal Hospitals               | Heart Disease Prrevention Campaign(Offline) |
| Manipal Hospitals               | Healthcare cards campaign(social media)     |
| Loyal World Supermarket Mysuru  | End of Month sale                           |
| Loyal World Supermarket Mysuru  | 25 years anniversary campaign(social media) |
+---------------------------------+---------------------------------------------+

 -- Retrieve the total budget spent on campaigns
SELECT SUM(budget) AS total_budget_spent
FROM campaigns;
+--------------------+
| total_budget_spent |
+--------------------+
|          101000.00 |
+--------------------+

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
+------------------------+----------------+
| budget_category        | campaign_count |
+------------------------+----------------+
| Less than 6000         |              1 |
| Between 6000 and 12000 |              7 |
| 12000 and more         |              2 |
+------------------------+----------------+

-- Retrieve the total revenue from invoices
SELECT SUM(total_amount) AS total_revenue
FROM invoices;
-- the above query is for the revenue table
+---------------+
| total_revenue |
+---------------+
|     101000.00 |
+---------------+

-- Categorize the invoices based on the payment status
SELECT SUM(total_amount) AS amount, COUNT(payment_status) AS invoices_count, payment_status  
FROM invoices
GROUP BY payment_status;
+----------+----------------+----------------+
| amount   | invoices_count | payment_status |
+----------+----------------+----------------+
| 41000.00 |              5 | Paid           |
| 60000.00 |              5 | Pending        |
+----------+----------------+----------------+
    
-- Group invoices based on the quarter
SELECT
    EXTRACT(QUARTER FROM invoice_date) AS quarter,
    COUNT(*) AS num_invoices,
    SUM(total_amount) AS total_amount,
    AVG(total_amount) AS average_amount
FROM invoices
GROUP BY quarter;
+---------+--------------+--------------+----------------+
| quarter | num_invoices | total_amount | average_amount |
+---------+--------------+--------------+----------------+
|       1 |            2 |     11000.00 |    5500.000000 |
|       2 |            6 |     57000.00 |    9500.000000 |
|       3 |            2 |     33000.00 |   16500.000000 |
+---------+--------------+--------------+----------------+
    
-- Retrieve the total cost of advertisements
SELECT SUM(cost) AS total_ad_cost, AVG(cost) AS avg_ad_cost
FROM advertisement_placements;

+---------------+-------------+
| total_ad_cost | avg_ad_cost |
+---------------+-------------+
|      14600.00 | 1460.000000 |
+---------------+-------------+
    
--doubt
-- -- Categorize the data based on the duration_days field into three categories and then calculate  no of ads and total cost for each category
-- SELECT
--     CASE
--         WHEN duration_days <= 20 THEN 'Less than 20 days'
--         WHEN duration_days > 20 AND duration_days <= 40 THEN 'Between 20 and 40 days'
--         WHEN duration_days > 40 THEN 'More than 40 days'
--         ELSE 'Uncategorized'
--     END AS duration_category,
--     COUNT(*) AS num_ads,
--     SUM(cost) AS total_cost
-- FROM
--     advertisement_placements
-- GROUP BY
--     duration_category;


-- Retrieve the total salary expense for each department
SELECT department, SUM(salary) AS total_salary_expense
FROM employees
GROUP BY department;
+------------+----------------------+
| department | total_salary_expense |
+------------+----------------------+
| Marketing  |            195000.00 |
| Design     |            175000.00 |
| Analytics  |            145000.00 |
| IT         |            165000.00 |
+------------+----------------------+


-- Total Number of Employees in Each Department
SELECT department, COUNT(*) AS num_employees
FROM employees
GROUP BY department;
+------------+---------------+
| department | num_employees |
+------------+---------------+
| Marketing  |             3 |
| Design     |             3 |
| Analytics  |             2 |
| IT         |             2 |
+------------+---------------+

-- Average Salary by Department: 
SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department;

+------------+--------------+
| department | avg_salary   |
+------------+--------------+
| Marketing  | 65000.000000 |
| Design     | 58333.333333 |
| Analytics  | 72500.000000 |
| IT         | 82500.000000 |
+------------+--------------+


-- Top 5 Highest Paid Employees
SELECT employee_id,name,position,salary
FROM employees
ORDER BY salary DESC
LIMIT 5;
+-------------+--------------+-----------+----------+
| employee_id | name         | position  | salary   |
+-------------+--------------+-----------+----------+
|           8 | Vikram Patel | Developer | 85000.00 |
|           4 | Sneha Verma  | Developer | 80000.00 |
|           7 | Ananya Reddy | Analyst   | 75000.00 |
|           3 | Rajesh Kumar | Analyst   | 70000.00 |
|           9 | Suman Verma  | Manager   | 70000.00 |
+-------------+--------------+-----------+----------+

-- Employees with Manager Position:
SELECT employee_id, name,position,department
FROM employees
WHERE position = 'Manager';

+-------------+-------------+----------+------------+
| employee_id | name        | position | department |
+-------------+-------------+----------+------------+
|           1 | Amit Sharma | Manager  | Marketing  |
|           5 | Arjun Singh | Manager  | Marketing  |
|           9 | Suman Verma | Manager  | Marketing  |
+-------------+-------------+----------+------------+

-- Retrieve the names of clients who have paid their invoices
SELECT name
FROM clients
WHERE client_id IN (SELECT client_id FROM invoices WHERE payment_status = 'Paid');
+---------------------------------+
| name                            |
+---------------------------------+
| Nike India                      |
| Haldiram Snacks Private Limited |
| A2B Restaurants                 |
| Manipal Hospitals               |
| Loyal World Supermarket Mysuru  |
+---------------------------------+


-- Retrieve the average impressions, clicks, and conversions for each advertisement type
SELECT type, COUNT(*) AS count, AVG(impressions) AS avg_impressions, AVG(clicks) AS avg_clicks, AVG(conversions) AS avg_conversions
FROM advertisements
JOIN performance_metrics ON advertisements.advertisement_id = performance_metrics.advertisement_id
GROUP BY type;
+--------------------------+-------+-----------------+------------+-----------------+
| type                     | count | avg_impressions | avg_clicks | avg_conversions |
+--------------------------+-------+-----------------+------------+-----------------+
| Billboard                |     2 |      65000.0000 |  1250.0000 |         65.0000 |
| Social media posts       |     4 |     122500.0000 |  2125.0000 |        122.5000 |
| Newspaper Ads            |     1 |      60000.0000 |   800.0000 |         40.0000 |
| Newspaper Ads/Banners    |     1 |     120000.0000 |  2000.0000 |        120.0000 |
| Billboards/Newspaper Ads |     1 |     100000.0000 |  1300.0000 |        100.0000 |
| Youtube/TV Ad            |     1 |     110000.0000 |  1600.0000 |        110.0000 |
+--------------------------+-------+-----------------+------------+-----------------+

-- Update the payment status of invoices with pending payments to 'Paid' if payment date has passed
UPDATE invoices
SET payment_status = 'Paid'
WHERE payment_status = 'Pending' AND invoice_date <= CURDATE();
-- curdate not working please check once

-- BEFORE TABLE
+------------+-----------+-------------+--------------+----------------+--------------+
| invoice_id | client_id | campaign_id | invoice_date | payment_status | total_amount |
+------------+-----------+-------------+--------------+----------------+--------------+
|          1 |         1 |           1 | 2023-02-15   | Paid           |      5000.00 |
|          2 |         1 |           2 | 2023-04-15   | Pending        |      8000.00 |
|          3 |         2 |           3 | 2023-03-15   | Paid           |      6000.00 |
|          4 |         2 |           4 | 2023-05-15   | Pending        |      7000.00 |
|          5 |         3 |           5 | 2023-04-15   | Paid           |      9000.00 |
|          6 |         3 |           6 | 2023-06-15   | Pending        |     12000.00 |
|          7 |         4 |           7 | 2023-05-15   | Paid           |     10000.00 |
|          8 |         4 |           8 | 2023-07-15   | Pending        |     15000.00 |
|          9 |         5 |           9 | 2023-06-15   | Paid           |     11000.00 |
|         10 |         5 |          10 | 2023-08-15   | Pending        |     18000.00 |
+------------+-----------+-------------+--------------+----------------+--------------+

-- AFTER TABLE
+------------+-----------+-------------+--------------+----------------+--------------+
| invoice_id | client_id | campaign_id | invoice_date | payment_status | total_amount |
+------------+-----------+-------------+--------------+----------------+--------------+
|          1 |         1 |           1 | 2023-02-15   | Paid           |      5000.00 |
|          2 |         1 |           2 | 2023-04-15   | Paid           |      8000.00 |
|          3 |         2 |           3 | 2023-03-15   | Paid           |      6000.00 |
|          4 |         2 |           4 | 2023-05-15   | Paid           |      7000.00 |
|          5 |         3 |           5 | 2023-04-15   | Paid           |      9000.00 |
|          6 |         3 |           6 | 2023-06-15   | Paid           |     12000.00 |
|          7 |         4 |           7 | 2023-05-15   | Paid           |     10000.00 |
|          8 |         4 |           8 | 2023-07-15   | Paid           |     15000.00 |
|          9 |         5 |           9 | 2023-06-15   | Paid           |     11000.00 |
|         10 |         5 |          10 | 2023-08-15   | Paid           |     18000.00 |
+------------+-----------+-------------+--------------+----------------+--------------+

-- Delete advertisements with zero impressions
DELETE FROM advertisements
WHERE advertisement_id IN (SELECT advertisement_id FROM performance_metrics WHERE impressions = 0);

-- Retrieve the vendors who have provided services with payment terms longer than 'Net 30'
SELECT vendor_name
FROM vendor_supplier_information
WHERE payment_terms > 'Net 30';
+----------------------+
| vendor_name          |
+----------------------+
| VisionaryProductions |
| DataInsightsCo       |
| SocialBuzzPromo      |
| contentCrafters      |
| EditExpress          |
| SEOStrategists       |
+----------------------+

-- Calculate the average budget for campaigns managed by each account manager
SELECT account_manager, AVG(budget) AS avg_budget
FROM clients
JOIN campaigns ON clients.client_id = campaigns.client_id
GROUP BY account_manager;
+-----------------+--------------+
| account_manager | avg_budget   |
+-----------------+--------------+
| Rahul Shah      |  6500.000000 |
| Rohit Gowda     |  6500.000000 |
| Arman Singh     | 10500.000000 |
| Bhaskar Jain    | 12500.000000 |
| Rohini Bhat     | 14500.000000 |
+-----------------+--------------+

-- Retrieve the top-performing advertisement (highest number of clicks) for each campaign
SELECT
    campaigns.name AS campaign_name,
    advertisements.type,
    advertisements.content,
    MAX(performance_metrics.clicks) AS max_clicks
FROM
    campaigns
JOIN
    advertisements ON campaigns.campaign_id = advertisements.campaign_id
JOIN
    performance_metrics ON advertisements.advertisement_id = performance_metrics.advertisement_id
GROUP BY
    campaigns.campaign_id,
    campaigns.name,
    advertisements.type,
    advertisements.content;
+-------------------------------+--------------------------+-----------------------------+------------+
| campaign_name                 | type                     | content                     | max_clicks |
+-------------------------------+--------------------------+-----------------------------+------------+
| Shoes Billboard               | Billboard                | https://hask.inc/content/1  |       1000 |
| Shoes Billboard               | Social media posts       | https://hask.inc/content/2  |       1200 |
| Jerseys Social Media Campaign | Newspaper Ads            | https://hask.inc/content/3  |        800 |
| Jerseys Social Media Campaign | Billboard                | https://hask.inc/content/4  |       1500 |
| Haldirams End Of Month Sale   | Social media posts       | https://hask.inc/content/5  |       1800 |
| Haldirams End Of Month Sale   | Newspaper Ads/Banners    | https://hask.inc/content/6  |       2000 |
| Products billboard            | Billboards/Newspaper Ads | https://hask.inc/content/7  |       1300 |
| Products billboard            | Social media posts       | https://hask.inc/content/8  |       2500 |
| Social media campaign         | Youtube/TV Ad            | https://hask.inc/content/9  |       1600 |
| Social media campaign         | Social media posts       | https://hask.inc/content/10 |       3000 |
+-------------------------------+--------------------------+-----------------------------+------------+

-- Find the client with the highest total expenditure (sum of campaign budgets)
SELECT clients.name AS client_name, SUM(campaigns.budget) AS total_expenditure
FROM clients
JOIN campaigns ON clients.client_id = campaigns.client_id
GROUP BY clients.client_id
ORDER BY total_expenditure DESC
LIMIT 1;
+--------------------------------+-------------------+
| client_name                    | total_expenditure |
+--------------------------------+-------------------+
| Loyal World Supermarket Mysuru |          29000.00 |
+--------------------------------+-------------------+

-- Retrieve the employees who have not made any payments
SELECT employees.name AS employee_name
FROM employees
LEFT JOIN payments ON employees.employee_id = payments.employee_id
WHERE payments.employee_id IS NULL;

Empty set (0.00 sec)

-- Calculate the total revenue and total cost for each campaign
SELECT campaigns.name AS campaign_name, SUM(invoices.total_amount) AS total_revenue, SUM(advertisement_placements.cost) AS total_cost
FROM campaigns
LEFT JOIN invoices ON campaigns.campaign_id = invoices.campaign_id
LEFT JOIN advertisement_placements ON campaigns.campaign_id = advertisement_placements.advertisement_id
GROUP BY campaigns.campaign_id;
+---------------------------------------------+---------------+------------+
| campaign_name                               | total_revenue | total_cost |
+---------------------------------------------+---------------+------------+
| Shoes Billboard                             |       5000.00 |    1000.00 |
| Jerseys Social Media Campaign               |       8000.00 |     800.00 |
| Haldirams End Of Month Sale                 |       6000.00 |    1200.00 |
| Products billboard                          |       7000.00 |    1500.00 |
| Social media campaign                       |       9000.00 |    2000.00 |
| Delicious Dosa December Campaign            |      12000.00 |    1800.00 |
| Heart Disease Prrevention Campaign(Offline) |      10000.00 |     900.00 |
| Healthcare cards campaign(social media)     |      15000.00 |    1300.00 |
| End of Month sale                           |      11000.00 |    2500.00 |
| 25 years anniversary campaign(social media) |      18000.00 |    1600.00 |
+---------------------------------------------+---------------+------------+

-- Retrieve the campaigns that have exceeded their budget by more than 20%
SELECT campaigns.name AS campaign_name, campaigns.budget, SUM(advertisement_placements.cost) AS total_cost
FROM campaigns
LEFT JOIN advertisement_placements ON campaigns.campaign_id = advertisement_placements.campaign_id
GROUP BY campaigns.campaign_id
HAVING total_cost > 1.2 * budget;

-- Update column duration in advertisement_placements to duration_days
ALTER TABLE advertisement_placements
RENAME COLUMN duration TO duration_days;

-- Calculate the average duration of advertisement placements for each type
SELECT advertisements.type, AVG(advertisement_placements.duration_days) AS avg_duration
FROM advertisements
JOIN advertisement_placements ON advertisements.advertisement_id = advertisement_placements.advertisement_id
GROUP BY advertisements.type;
+--------------------------+--------------+
| type                     | avg_duration |
+--------------------------+--------------+
| Billboard                |      45.0000 |
| Billboards/Newspaper Ads |      20.0000 |
| Newspaper Ads            |      45.0000 |
| Newspaper Ads/Banners    |      30.0000 |
| Social media posts       |      30.0000 |
| Youtube/TV Ad            |      60.0000 |
+--------------------------+--------------+

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

Empty set (0.00 sec)


-- Retrieve the campaigns that have not been invoiced
SELECT campaigns.name AS campaign_name
FROM campaigns
LEFT JOIN invoices ON campaigns.campaign_id = invoices.campaign_id
WHERE invoices.campaign_id IS NULL;

Empty set (0.00 sec)


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

-- check this view
SELECT * FROM vw_ad_placement_details;
+--------------+------------------+--------------------------------------+---------+----------+-------------------------------+---------------------------------+
| placement_id | advertisement_id | placement_details                    | cost    | duration | campaign_name                 | client_name                     |
+--------------+------------------+--------------------------------------+---------+----------+-------------------------------+---------------------------------+
|            1 |                1 | Billboard - Top Location             | 1000.00 |       30 | Shoes Billboard               | Nike India                      |
|            2 |                2 | Social Media - Sidebar Promotion     |  800.00 |       15 | Shoes Billboard               | Nike India                      |
|            3 |                3 | Newspaper - Homepage Feature         | 1200.00 |       45 | Jerseys Social Media Campaign | Nike India                      |
|            4 |                4 | Billboard - Video Pre-roll           | 1500.00 |       60 | Jerseys Social Media Campaign | Nike India                      |
|            5 |                5 | Social Media - Featured Ad Placement | 2000.00 |       30 | Haldirams End Of Month Sale   | Haldiram Snacks Private Limited |
|            6 |                6 | Newspaper - Social Media Promo       | 1800.00 |       30 | Haldirams End Of Month Sale   | Haldiram Snacks Private Limited |
|            7 |                7 | Billboard - In-article Banner        |  900.00 |       20 | Products billboard            | Haldiram Snacks Private Limited |
|            8 |                8 | Social Media - Video Ad Overlay      | 1300.00 |       45 | Products billboard            | Haldiram Snacks Private Limited |
|            9 |                9 | TV, Youtube- Homepage Takeover       | 2500.00 |       60 | Social media campaign         | A2B Restaurants                 |
|           10 |               10 | Online Article - Sponsored content   | 1600.00 |       30 | Social media campaign         | A2B Restaurants                 |
+--------------+------------------+--------------------------------------+---------+----------+-------------------------------+---------------------------------+

-- View to show the total payments made by each client
CREATE VIEW vw_total_payments_by_client AS
SELECT
    c.client_id,
    c.name AS client_name,
    SUM(i.total_amount) AS total_payments
FROM clients c
LEFT JOIN invoices i ON c.client_id = i.client_id
GROUP BY c.client_id;

-- check this view
SELECT * FROM vw_total_payments_by_client;
+-----------+---------------------------------+----------------+
| client_id | client_name                     | total_payments |
+-----------+---------------------------------+----------------+
|         1 | Nike India                      |       13000.00 |
|         2 | Haldiram Snacks Private Limited |       13000.00 |
|         3 | A2B Restaurants                 |       21000.00 |
|         4 | Manipal Hospitals               |       25000.00 |
|         5 | Loyal World Supermarket Mysuru  |       29000.00 |
|         6 | Vishal Mart Mysuru              |           NULL |
|         7 | DMart Bengaluru                 |           NULL |
|         8 | Dosa Point                      |           NULL |
|         9 | Bhaskars Mane Holige           |           NULL |
|        10 | Airtel Mysuru                   |           NULL |
+-----------+---------------------------------+----------------+

-- Complex Triggers
-- Trigger to prevent deleting clients with active campaigns
DELIMITER //
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
        SIGNAL SQLSTATE '45000' -- To signal a generic SQLSTATE value, use '45000' , which means “unhandled user-defined exception.”
        SET MESSAGE_TEXT = 'Cannot delete client with active campaigns.';
    END IF;
END;
//

-- Execution
DELETE FROM clients WHERE client_id = 4;
SELECT * FROM clients;

-- Output: Error Code: 1644. Cannot delete client with active campaigns.

-- Trigger to update the total budget of a campaign when a new advertisement placement is added
-- CREATE TRIGGER trg_update_campaign_budget
-- AFTER INSERT ON advertisement_placements
-- FOR EACH ROW
-- BEGIN
--     UPDATE campaigns
--     SET budget = budget + NEW.cost
--     WHERE campaign_id = (SELECT campaign_id FROM advertisements WHERE advertisement_id = NEW.advertisement_id);
-- END;
-- //


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
//
DELIMITER ;


-- Execution
-- Optional: avoiding manually adding placement_id
ALTER TABLE advertisement_placements
MODIFY COLUMN placement_id INT AUTO_INCREMENT;

SELECT * FROM advertisement_placements;

INSERT INTO advertisement_placements (advertisement_id, placement_details, cost, duration_days)
VALUES (2, 'Sidebar Ad', 50, 65);
-- Output: Error Code: 1644. Duration exceeds the maximum allowed duration.

-- Pushing Data into backup table trigger
-- Create Trigger
DELIMITER //
CREATE TRIGGER clients_insert_trigger
AFTER INSERT ON clients
FOR EACH ROW
BEGIN
    -- Insert into clients_backup table
    INSERT INTO clients_backup(client_id, name, email, phone, billing_address, account_manager)
    VALUES (NEW.client_id, NEW.name, NEW.email, NEW.phone, NEW.billing_address, NEW.account_manager);
END;
//

DELIMITER //
CREATE TRIGGER clients_update_trigger
AFTER UPDATE ON clients
FOR EACH ROW
BEGIN
    -- Update clients_backup table
    UPDATE clients_backup
    SET
        name = NEW.name,
        email = NEW.email,
        phone = NEW.phone,
        billing_address = NEW.billing_address,
        account_manager = NEW.account_manager
    WHERE client_id = NEW.client_id;
END;
//
DELIMITER ;

--  DROP TRIGGER clients_update_trigger;

-- Execution: 
SELECT * FROM clients;
SELECT * FROM clients_backup;
INSERT INTO clients (client_id, name, email, phone, billing_address, account_manager)
VALUES (1003, 'John Doe Motorsports', 'john@example.com', '123-456-7890', '123 Main St', 'Alice');

-- Update
SET SQL_SAFE_UPDATES = 0; -- Disable Safe Update Mode for the Current Session:
UPDATE clients SET email = 'john.doe@example.com' WHERE client_id = 1001;
SELECT * FROM clients;
SELECT * FROM clients_backup;


-- Create Trigger
DELIMITER //
CREATE TRIGGER capitalize_name_trigger
BEFORE INSERT ON clients
FOR EACH ROW
BEGIN
    -- Capitalize the first letter of the name
    SET NEW.name = CONCAT(UPPER(SUBSTRING(NEW.name, 1, 1)), SUBSTRING(NEW.name, 2));
END;
//
DELIMITER ;

-- Execution:

-- DELETE FROM clients WHERE client_id='2002';
-- DELETE FROM clients_backup WHERE client_id='2002';

INSERT INTO clients (client_id, name, email, phone, billing_address, account_manager)
VALUES (2002, 'jane street', 'jane@example.com', '987-654-3210', '456 Oak St', 'Bob');
SELECT * FROM clients;
SELECT * FROM clients_backup;

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
    
-- check this view
SELECT * FROM vw_performance_metrics_extended;
+-----------+------------------+-------------+--------+-------------+------------+--------------------------+-----------------------------+-------------------------------+---------------------------------+-----------------+
| metric_id | advertisement_id | impressions | clicks | conversions | date       | advertisement_type       | advertisement_content       | campaign_name                 | client_name                     | conversion_rate |
+-----------+------------------+-------------+--------+-------------+------------+--------------------------+-----------------------------+-------------------------------+---------------------------------+-----------------+
|         1 |                1 |       50000 |   1000 |          50 | 2023-02-01 | Billboard                | https://hask.inc/content/1  | Shoes Billboard               | Nike India                      |          5.0000 |
|         2 |                2 |       70000 |   1200 |          70 | 2023-02-01 | Social media posts       | https://hask.inc/content/2  | Shoes Billboard               | Nike India                      |          5.8333 |
|         3 |                3 |       60000 |    800 |          40 | 2023-03-01 | Newspaper Ads            | https://hask.inc/content/3  | Jerseys Social Media Campaign | Nike India                      |          5.0000 |
|         4 |                4 |       80000 |   1500 |          80 | 2023-03-01 | Billboard                | https://hask.inc/content/4  | Jerseys Social Media Campaign | Nike India                      |          5.3333 |
|         5 |                5 |       90000 |   1800 |          90 | 2023-04-01 | Social media posts       | https://hask.inc/content/5  | Haldirams End Of Month Sale   | Haldiram Snacks Private Limited |          5.0000 |
|         6 |                6 |      120000 |   2000 |         120 | 2023-04-01 | Newspaper Ads/Banners    | https://hask.inc/content/6  | Haldirams End Of Month Sale   | Haldiram Snacks Private Limited |          6.0000 |
|         7 |                7 |      100000 |   1300 |         100 | 2023-05-01 | Billboards/Newspaper Ads | https://hask.inc/content/7  | Products billboard            | Haldiram Snacks Private Limited |          7.6923 |
|         8 |                8 |      150000 |   2500 |         150 | 2023-05-01 | Social media posts       | https://hask.inc/content/8  | Products billboard            | Haldiram Snacks Private Limited |          6.0000 |
|         9 |                9 |      110000 |   1600 |         110 | 2023-06-01 | Youtube/TV Ad            | https://hask.inc/content/9  | Social media campaign         | A2B Restaurants                 |          6.8750 |
|        10 |               10 |      180000 |   3000 |         180 | 2023-06-01 | Social media posts       | https://hask.inc/content/10 | Social media campaign         | A2B Restaurants                 |          6.0000 |
+-----------+------------------+-------------+--------+-------------+------------+--------------------------+-----------------------------+-------------------------------+---------------------------------+-----------------+

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
+-------------+---------------------------------------------+-------------------+----------------+
| campaign_id | campaign_name                               | total_amount_paid | amount_pending |
+-------------+---------------------------------------------+-------------------+----------------+
|           1 | Shoes Billboard                             |           5000.00 |           0.00 |
|           2 | Jerseys Social Media Campaign               |           8000.00 |           0.00 |
|           3 | Haldirams End Of Month Sale                 |           6000.00 |           0.00 |
|           4 | Products billboard                          |           7000.00 |           0.00 |
|           5 | Social media campaign                       |           9000.00 |           0.00 |
|           6 | Delicious Dosa December Campaign            |          12000.00 |           0.00 |
|           7 | Heart Disease Prrevention Campaign(Offline) |          10000.00 |           0.00 |
|           8 | Healthcare cards campaign(social media)     |          15000.00 |           0.00 |
|           9 | End of Month sale                           |          11000.00 |           0.00 |
|          10 | 25 years anniversary campaign(social media) |          18000.00 |           0.00 |
+-------------+---------------------------------------------+-------------------+----------------+

-- Indexes
CREATE INDEX idx_clients_email ON clients(email);
CREATE INDEX idx_campaigns_name ON campaigns(name);
CREATE INDEX idx_advertisements_type ON advertisements(type);
CREATE INDEX idx_employees_email ON employees(position);

-- checking the indexes of the queries
SELECT * FROM INFORMATION_SCHEMA.STATISTICS
WHERE TABLE_NAME = 'clients' AND INDEX_NAME = 'idx_clients_email';
+---------------+---------------------+------------+------------+---------------------+-------------------+--------------+-------------+-----------+-------------+----------+--------+----------+------------+---------+---------------+------------+------------+
| TABLE_CATALOG | TABLE_SCHEMA        | TABLE_NAME | NON_UNIQUE | INDEX_SCHEMA        | INDEX_NAME        | SEQ_IN_INDEX | COLUMN_NAME | COLLATION | CARDINALITY | SUB_PART | PACKED | NULLABLE | INDEX_TYPE | COMMENT | INDEX_COMMENT | IS_VISIBLE | EXPRESSION |
+---------------+---------------------+------------+------------+---------------------+-------------------+--------------+-------------+-----------+-------------+----------+--------+----------+------------+---------+---------------+------------+------------+
| def           | Advertising_company | clients    |          1 | Advertising_company | idx_clients_email |            1 | email       | A         |          10 |     NULL |   NULL | YES      | BTREE      |         |               | YES        | NULL       |
+---------------+---------------------+------------+------------+---------------------+-------------------+--------------+-------------+-----------+-------------+----------+--------+----------+------------+---------+---------------+------------+------------+

SELECT * FROM INFORMATION_SCHEMA.STATISTICS
WHERE TABLE_NAME = 'campaigns' AND INDEX_NAME = 'idx_campaigns_name';
+---------------+---------------------+------------+------------+---------------------+--------------------+--------------+-------------+-----------+-------------+----------+--------+----------+------------+---------+---------------+------------+------------+
| TABLE_CATALOG | TABLE_SCHEMA        | TABLE_NAME | NON_UNIQUE | INDEX_SCHEMA        | INDEX_NAME         | SEQ_IN_INDEX | COLUMN_NAME | COLLATION | CARDINALITY | SUB_PART | PACKED | NULLABLE | INDEX_TYPE | COMMENT | INDEX_COMMENT | IS_VISIBLE | EXPRESSION |
+---------------+---------------------+------------+------------+---------------------+--------------------+--------------+-------------+-----------+-------------+----------+--------+----------+------------+---------+---------------+------------+------------+
| def           | Advertising_company | campaigns  |          1 | Advertising_company | idx_campaigns_name |            1 | name        | A         |          10 |     NULL |   NULL | YES      | BTREE      |         |               | YES        | NULL       |
+---------------+---------------------+------------+------------+---------------------+--------------------+--------------+-------------+-----------+-------------+----------+--------+----------+------------+---------+---------------+------------+------------+

SELECT * FROM INFORMATION_SCHEMA.STATISTICS
WHERE TABLE_NAME = 'advertisements' AND INDEX_NAME = 'idx_advertisements_type';
+---------------+---------------------+----------------+------------+---------------------+-------------------------+--------------+-------------+-----------+-------------+----------+--------+----------+------------+---------+---------------+------------+------------+
| TABLE_CATALOG | TABLE_SCHEMA        | TABLE_NAME     | NON_UNIQUE | INDEX_SCHEMA        | INDEX_NAME              | SEQ_IN_INDEX | COLUMN_NAME | COLLATION | CARDINALITY | SUB_PART | PACKED | NULLABLE | INDEX_TYPE | COMMENT | INDEX_COMMENT | IS_VISIBLE | EXPRESSION |
+---------------+---------------------+----------------+------------+---------------------+-------------------------+--------------+-------------+-----------+-------------+----------+--------+----------+------------+---------+---------------+------------+------------+
| def           | Advertising_company | advertisements |          1 | Advertising_company | idx_advertisements_type |            1 | type        | A         |           6 |     NULL |   NULL | YES      | BTREE      |         |               | YES        | NULL       |
+---------------+---------------------+----------------+------------+---------------------+-------------------------+--------------+-------------+-----------+-------------+----------+--------+----------+------------+---------+---------------+------------+------------+

SELECT * FROM INFORMATION_SCHEMA.STATISTICS
WHERE TABLE_NAME = 'employees' AND INDEX_NAME = 'idx_employees_email';
+---------------+---------------------+------------+------------+---------------------+---------------------+--------------+-------------+-----------+-------------+----------+--------+----------+------------+---------+---------------+------------+------------+
| TABLE_CATALOG | TABLE_SCHEMA        | TABLE_NAME | NON_UNIQUE | INDEX_SCHEMA        | INDEX_NAME          | SEQ_IN_INDEX | COLUMN_NAME | COLLATION | CARDINALITY | SUB_PART | PACKED | NULLABLE | INDEX_TYPE | COMMENT | INDEX_COMMENT | IS_VISIBLE | EXPRESSION |
+---------------+---------------------+------------+------------+---------------------+---------------------+--------------+-------------+-----------+-------------+----------+--------+----------+------------+---------+---------------+------------+------------+
| def           | Advertising_company | employees  |          1 | Advertising_company | idx_employees_email |            1 | position    | A         |           4 |     NULL |   NULL | YES      | BTREE      |         |               | YES        | NULL       |
+---------------+---------------------+------------+------------+---------------------+---------------------+--------------+-------------+-----------+-------------+----------+--------+----------+------------+---------+---------------+------------+------------+

-- Concurrency control and store procedure to be updated

--  Ensure that the insertion of client and campaign is atomic
START TRANSACTION;
INSERT INTO clients (client_id, name, email, Phone, billing_address, account_manager) VALUES (...);
INSERT INTO campaigns (campaign_id, client_id, name, budget, start_date, end_date, creative_director) VALUES (...);
COMMIT;

--  Set isolation level for a specific transaction
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

-- Explicit lock to prevent other transactions from modifying the same rows
START TRANSACTION;
SELECT * FROM campaigns WHERE client_id = 1 FOR UPDATE;
-- Perform updates
COMMIT;

-- Explicit lock to prevent other transactions from modifying the same rows
START TRANSACTION;
SELECT * FROM campaigns WHERE client_id = 1 FOR UPDATE;
-- Performing updates 
UPDATE campaigns SET budget = budget + 2000 WHERE client_id = 1;
COMMIT;

-- Concurrency control using timestamps: Use a timestamp column to track changes
-- CREATE TABLE campaigns (
--     campaign_id INT PRIMARY KEY,
--     client_id INT,
--     name VARCHAR(255),
--     budget DECIMAL(10, 2),
--     start_date date,
--     end_date date,
--     creative_director VARCHAR(255),
--     last_modified TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
-- );

-- Use a version column for optimistic concurrency control
CREATE TABLE campaigns (
    campaign_id INT PRIMARY KEY,
    client_id INT,
    name VARCHAR(255),
    budget DECIMAL(10, 2),
    start_date date,
    end_date date,
    creative_director VARCHAR(255),
    version INT DEFAULT 1
);
 
 -- Check for conflicts before updating
START TRANSACTION;
SELECT version INTO @version FROM campaigns WHERE campaign_id = 1;
Check @version against the expected version before updating
UPDATE campaigns SET budget = 9000.00, version = version + 1 WHERE campaign_id = 1 AND version = @version;
COMMIT;

-- Stored procedures 

-- Retrieve the total budget spent on campaigns
DELIMITER //

CREATE PROCEDURE GetTotalBudgetSpent()
BEGIN
    SELECT SUM(budget) AS total_budget_spent
    FROM campaigns;
END //

DELIMITER ;

-- Categorizing the campaigns based on the budget
DELIMITER //

CREATE PROCEDURE GetBudgetCategories()
BEGIN
    SELECT
        CASE
            WHEN budget < 6000 THEN 'Less than 6000'
            WHEN budget BETWEEN 6000 AND 12000 THEN 'Between 6000 and 12000'
            WHEN budget > 12000 THEN '12000 and more'
            ELSE 'Uncategorized'
        END AS budget_category,
        COUNT(*) AS campaign_count
    FROM campaigns
    GROUP BY budget_category;
END //

DELIMITER ;

-- Retrieve the total revenue from invoices
DELIMITER //

CREATE PROCEDURE GetTotalRevenue()
BEGIN
    SELECT SUM(total_amount) AS total_revenue
    FROM invoices;
END //

DELIMITER ;

-- Group invoices based on the quarter
DELIMITER //

CREATE PROCEDURE GroupInvoicesByQuarter()
BEGIN
    SELECT
        EXTRACT(QUARTER FROM invoice_date) AS quarter,
        COUNT(*) AS num_invoices,
        SUM(total_amount) AS total_amount,
        AVG(total_amount) AS average_amount
    FROM invoices
    GROUP BY quarter;
END //

DELIMITER ;

-- Retrieve the total salary expense for each department
DELIMITER //

CREATE PROCEDURE GetTotalSalaryExpenseByDepartment()
BEGIN
    SELECT department, SUM(salary) AS total_salary_expense
    FROM employees
    GROUP BY department;
END //

DELIMITER ;

-- Total Number of Employees in Each Department
DELIMITER //

CREATE PROCEDURE GetNumEmployeesByDepartment()
BEGIN
    SELECT department, COUNT(*) AS num_employees
    FROM employees
    GROUP BY department;
END //

DELIMITER ;

-- Retrieve the average impressions, clicks, and conversions for each advertisement type
DELIMITER //

CREATE PROCEDURE GetAvgMetricsByAdvertisementType()
BEGIN
    SELECT type, COUNT(*) AS count, AVG(impressions) AS avg_impressions, AVG(clicks) AS avg_clicks, AVG(conversions) AS avg_conversions
    FROM advertisements
    JOIN performance_metrics ON advertisements.advertisement_id = performance_metrics.advertisement_id
    GROUP BY type;
END //

DELIMITER ;

-- Paramterized Stored Procedures

-- Stored procedure 1: Stored Procedure to Retrieve Client Information
DELIMITER //

CREATE PROCEDURE GetClientInformation (IN clientID INT)
BEGIN
    SELECT * FROM clients WHERE client_id = clientID;
END //

DELIMITER ;


-- Stored procedure 2: Stored Procedure to Calculate Campaign Budget Usage 
DELIMITER //

CREATE PROCEDURE CalculateBudgetUsage (IN campaignID INT)
BEGIN
    DECLARE totalSpent DECIMAL(10, 2);

    SELECT SUM(cost) INTO totalSpent
    FROM advertisement_placements ap
    JOIN advertisements a ON ap.advertisement_id = a.advertisement_id
    WHERE a.campaign_id = campaignID;

    SELECT budget - totalSpent AS remainingBudget
    FROM campaigns
    WHERE campaign_id = campaignID;
END //

DELIMITER ;

DROP PROCEDURE CalculateBudgetUsage;

Stored Procedure 3: Get Campaign Information
DELIMITER //

CREATE PROCEDURE GetCampaignInformation (IN campaignID INT)
BEGIN
    SELECT
        c.campaign_id,
        c.name AS campaign_name,
        c.budget,
        c.start_date,
        c.end_date,
        c.creative_director,
        cl.name AS client_name,
        cl.email AS client_email
    FROM
        campaigns c
    INNER JOIN clients cl ON c.client_id = cl.client_id
    WHERE
        c.campaign_id = campaignID;
END //

DELIMITER ;


-- Stored Procedure 4: Calculate Total Cost of a Campaign
-- Stored Procedure: Calculate Total Cost of a Campaign
DELIMITER //

CREATE PROCEDURE CalculateCampaignTotalCost (IN campaignID INT, OUT totalCost DECIMAL(10, 2))
BEGIN
    -- Calculate total placement cost
    SELECT COALESCE(SUM(ap.cost), 0) -- COALESCE returns the first non-null value in a list.
    INTO totalCost
    FROM advertisement_placements ap
    WHERE ap.advertisement_id IN (
        SELECT a.advertisement_id
        FROM advertisements a
        WHERE a.campaign_id = campaignID
    );
END //

DELIMITER ;

-- DROP PROCEDURE CalculateCampaignTotalCost;

Stored Procedure 5: Get Employee Information by Department
DELIMITER //

CREATE PROCEDURE GetEmployeeInfoByDepartment (IN deptName VARCHAR(50))
BEGIN
    SELECT 
        e.employee_id,
        e.name AS employee_name,
        e.position,
        e.email,
        e.phone,
        e.salary,
        e.department
    FROM employees e
    WHERE e.department = deptName;
END //

DELIMITER ;


-- Stored Procedure 6: Get Performance Metrics for an Advertisement
DELIMITER //

CREATE PROCEDURE GetAdvertisementPerformance (IN adID INT)
BEGIN
    SELECT 
        pm.metric_id,
        pm.impressions,
        pm.clicks,
        pm.conversions,
        pm.date,
        a.type AS advertisement_type,
        a.content AS advertisement_content
    FROM performance_metrics pm
    INNER JOIN advertisements a ON pm.advertisement_id = a.advertisement_id
    WHERE pm.advertisement_id = adID;
END //

DELIMITER ;


-- Stored Procedure 7: Get Vendor Invoices for a Payment
DELIMITER //

CREATE PROCEDURE GetVendorInvoicesForPayment (IN paymentID INT)
BEGIN
    SELECT 
        vi.invoice_id,
        vi.invoice_date,
        vi.total_amount,
        vi.payment_status,
        v.vendor_name,
        v.contact_info
    FROM vendor_invoices vi
    INNER JOIN vendor_supplier_information v ON vi.vendor_id = v.vendor_id
    WHERE vi.payment_id = paymentID;
END //

DELIMITER ;


-- Stored procedure 8: Stored Procedure to Log Contact Us Messages
DELIMITER //

CREATE PROCEDURE LogContactMessage (IN contactName VARCHAR(255), IN contactEmail VARCHAR(255), IN messageText TEXT)
BEGIN
    INSERT INTO contact_us (name, email, message)
    VALUES (contactName, contactEmail, messageText);
END //

DELIMITER ;


-- execution of the above store procedures

-- Retrieve the total budget spent on campaigns
CALL GetTotalBudgetSpent();
+--------------------+
| total_budget_spent |
+--------------------+
|          101000.00 |
+--------------------+


-- Categorizing the campaigns based on the budget
CALL GetBudgetCategories();
+------------------------+----------------+
| budget_category        | campaign_count |
+------------------------+----------------+
| Less than 6000         |              1 |
| Between 6000 and 12000 |              7 |
| 12000 and more         |              2 |
+------------------------+----------------+

-- Retrieve the total revenue from invoices
CALL GetTotalRevenue();
+---------------+
| total_revenue |
+---------------+
|     101000.00 |
+---------------+

-- Group invoices based on the quarter
CALL GroupInvoicesByQuarter();
+---------+--------------+--------------+----------------+
| quarter | num_invoices | total_amount | average_amount |
+---------+--------------+--------------+----------------+
|       1 |            2 |     11000.00 |    5500.000000 |
|       2 |            6 |     57000.00 |    9500.000000 |
|       3 |            2 |     33000.00 |   16500.000000 |
+---------+--------------+--------------+----------------+

-- Retrieve the total salary expense for each department
CALL GetTotalSalaryExpenseByDepartment();
+------------+----------------------+
| department | total_salary_expense |
+------------+----------------------+
| Marketing  |            195000.00 |
| Design     |            175000.00 |
| Analytics  |            145000.00 |
| IT         |            165000.00 |
+------------+----------------------+

-- Total Number of Employees in Each Department
CALL GetNumEmployeesByDepartment();
+------------+---------------+
| department | num_employees |
+------------+---------------+
| Marketing  |             3 |
| Design     |             3 |
| Analytics  |             2 |
| IT         |             2 |
+------------+---------------+


-- Retrieve the average impressions, clicks, and conversions for each advertisement type
CALL GetAvgMetricsByAdvertisementType();
+--------------------------+-------+-----------------+------------+-----------------+
| type                     | count | avg_impressions | avg_clicks | avg_conversions |
+--------------------------+-------+-----------------+------------+-----------------+
| Billboard                |     2 |      65000.0000 |  1250.0000 |         65.0000 |
| Social media posts       |     4 |     122500.0000 |  2125.0000 |        122.5000 |
| Newspaper Ads            |     1 |      60000.0000 |   800.0000 |         40.0000 |
| Newspaper Ads/Banners    |     1 |     120000.0000 |  2000.0000 |        120.0000 |
| Billboards/Newspaper Ads |     1 |     100000.0000 |  1300.0000 |        100.0000 |
| Youtube/TV Ad            |     1 |     110000.0000 |  1600.0000 |        110.0000 |
+--------------------------+-------+-----------------+------------+-----------------+

-- Execution of Complex paramterized procedures

CALL GetClientInformation(1);
+-----------+------------+------------------+--------------+-----------------------------------------------+-----------------+
| client_id | name       | email            | phone        | billing_address                               | account_manager |
+-----------+------------+------------------+--------------+-----------------------------------------------+-----------------+
|         1 | Nike India | manager@nike.com | 123-456-7890 | 123, Kuvempu Nagar, Mysuru, Karnataka, 570023 | Rahul Shah      |
+-----------+------------+------------------+--------------+-----------------------------------------------+-----------------+

CALL CalculateBudgetUsage(1);
+-----------------+
| remainingBudget |
+-----------------+
|         3200.00 |
+-----------------+

CALL GetCampaignInformation(1);
+-------------+-----------------+---------+------------+------------+-------------------+-------------+------------------+
| campaign_id | campaign_name   | budget  | start_date | end_date   | creative_director | client_name | client_email     |
+-------------+-----------------+---------+------------+------------+-------------------+-------------+------------------+
|           1 | Shoes Billboard | 5000.00 | 2023-01-01 | 2023-02-01 | Nawaz Khan        | Nike India  | manager@nike.com |
+-------------+-----------------+---------+------------+------------+-------------------+-------------+------------------+

CALL CalculateCampaignTotalCost(1, @totalCost);
SELECT @totalCost AS "Total Cost";
+------------+
| Total Cost |
+------------+
|    1800.00 |
+------------+

CALL GetEmployeeInfoByDepartment('Marketing');
+-------------+---------------+----------+-----------------------+--------------+----------+------------+
| employee_id | employee_name | position | email                 | phone        | salary   | department |
+-------------+---------------+----------+-----------------------+--------------+----------+------------+
|           1 | Amit Sharma   | Manager  | amit.sharma@gmail.com | 345-678-9012 | 60000.00 | Marketing  |
|           5 | Arjun Singh   | Manager  | arjun.singh@gmail.com | 789-012-3456 | 65000.00 | Marketing  |
|           9 | Suman Verma   | Manager  | suman.verma@yahoo.com | 123-456-7890 | 70000.00 | Marketing  |
+-------------+---------------+----------+-----------------------+--------------+----------+------------+

CALL GetAdvertisementPerformance(1);
+-----------+-------------+--------+-------------+------------+--------------------+----------------------------+
| metric_id | impressions | clicks | conversions | date       | advertisement_type | advertisement_content      |
+-----------+-------------+--------+-------------+------------+--------------------+----------------------------+
|         1 |       50000 |   1000 |          50 | 2023-02-01 | Billboard          | https://hask.inc/content/1 |
+-----------+-------------+--------+-------------+------------+--------------------+----------------------------+

CALL GetVendorInvoicesForPayment(1);
+------------+--------------+--------------+----------------+-------------------+--------------------+
| invoice_id | invoice_date | total_amount | payment_status | vendor_name       | contact_info       |
+------------+--------------+--------------+----------------+-------------------+--------------------+
|          1 | 2023-02-25   |      1000.00 | Paid           | CreativeSolutions | creative@gmail.com |
+------------+--------------+--------------+----------------+-------------------+--------------------+

CALL LogContactMessage('John Doe', 'john@example.com', 'This is a test message.');


-- GRANT AND REVOKE PERMISSIONS
-- Grant SELECT, INSERT, UPDATE, and DELETE privileges on the clients table to user 'hussain' from 'localhost'
GRANT SELECT, INSERT, UPDATE, DELETE ON advertising_agency.clients TO 'hussain'@'localhost';

-- Grant SELECT privilege on the campaigns table to user 'hussain' from 'localhost'
GRANT SELECT ON advertising_agency.campaigns TO 'hussain'@'localhost';

-- Grant SELECT, INSERT, UPDATE, and DELETE privileges on the advertisements table to user 'hussain' from 'localhost'
GRANT SELECT, INSERT, UPDATE, DELETE ON advertising_agency.advertisements TO 'hussain'@'localhost';

-- Grant SELECT, INSERT, UPDATE, and DELETE privileges on the employees table to user 'hussain' from 'localhost'
GRANT SELECT, INSERT, UPDATE, DELETE ON advertising_agency.employees TO 'hussain'@'localhost';

-- Grant SELECT, INSERT, UPDATE, and DELETE privileges on the advertisement_placements table to user 'hussain' from 'localhost'
GRANT SELECT, INSERT, UPDATE, DELETE ON advertising_agency.advertisement_placements TO 'hussain'@'localhost';

-- Grant SELECT, INSERT, UPDATE, and DELETE privileges on the invoices table to user 'hussain' from 'localhost'
GRANT SELECT, INSERT, UPDATE, DELETE ON advertising_agency.invoices TO 'hussain'@'localhost';

-- Grant SELECT, INSERT, UPDATE, and DELETE privileges on the payments table to user 'hussain' from 'localhost'
GRANT SELECT, INSERT, UPDATE, DELETE ON advertising_agency.payments TO 'hussain'@'localhost';

-- Grant SELECT, INSERT, UPDATE, and DELETE privileges on the vendor_supplier_information table to user 'hussain' from 'localhost'
GRANT SELECT, INSERT, UPDATE, DELETE ON advertising_agency.vendor_supplier_information TO 'hussain'@'localhost';

-- Grant SELECT, INSERT, UPDATE, and DELETE privileges on the vendor_invoices table to user 'hussain' from 'localhost'
GRANT SELECT, INSERT, UPDATE, DELETE ON advertising_agency.vendor_invoices TO 'hussain'@'localhost';

-- Grant SELECT, INSERT, UPDATE, and DELETE privileges on the performance_metrics table to user 'hussain' from 'localhost'
GRANT SELECT, INSERT, UPDATE, DELETE ON advertising_agency.performance_metrics TO 'hussain'@'localhost';

-- Grant SELECT privilege on the contact_us table to user 'hussain' from 'localhost'
GRANT SELECT ON advertising_agency.contact_us TO 'hussain'@'localhost';

-- Grant EXECUTE privilege on the stored procedures to user 'hussain' from 'localhost'
GRANT EXECUTE ON PROCEDURE advertising_agency.GetTotalBudgetSpent TO 'hussain'@'localhost';
GRANT EXECUTE ON PROCEDURE advertising_agency.GetBudgetCategories TO 'hussain'@'localhost';
GRANT EXECUTE ON PROCEDURE advertising_agency.GetTotalRevenue TO 'hussain'@'localhost';
GRANT EXECUTE ON PROCEDURE advertising_agency.GroupInvoicesByQuarter TO 'hussain'@'localhost';
GRANT EXECUTE ON PROCEDURE advertising_agency.GetTotalSalaryExpenseByDepartment TO 'hussain'@'localhost';
GRANT EXECUTE ON PROCEDURE advertising_agency.GetNumEmployeesByDepartment TO 'hussain'@'localhost';
GRANT EXECUTE ON PROCEDURE advertising_agency.GetAvgMetricsByAdvertisementType TO 'hussain'@'localhost';

-- REVOKE PERMESSIONS:-
-- Revoke SELECT, INSERT, UPDATE, and DELETE privileges on the clients table from user 'hussain' from 'localhost'
REVOKE SELECT, INSERT, UPDATE, DELETE ON advertising_agency.clients FROM 'hussain'@'localhost';

-- Revoke SELECT privilege on the campaigns table from user 'hussain' from 'localhost'
REVOKE SELECT ON advertising_agency.campaigns FROM 'hussain'@'localhost';

-- Revoke SELECT, INSERT, UPDATE, and DELETE privileges on the advertisements table from user 'hussain' from 'localhost'
REVOKE SELECT, INSERT, UPDATE, DELETE ON advertising_agency.advertisements FROM 'hussain'@'localhost';

-- Revoke SELECT, INSERT, UPDATE, and DELETE privileges on the employees table from user 'hussain' from 'localhost'
REVOKE SELECT, INSERT, UPDATE, DELETE ON advertising_agency.employees FROM 'hussain'@'localhost';

-- Revoke SELECT, INSERT, UPDATE, and DELETE privileges on the advertisement_placements table from user 'hussain' from 'localhost'
REVOKE SELECT, INSERT, UPDATE, DELETE ON advertising_agency.advertisement_placements FROM 'hussain'@'localhost';

-- Revoke SELECT, INSERT, UPDATE, and DELETE privileges on the invoices table from user 'hussain' from 'localhost'
REVOKE SELECT, INSERT, UPDATE, DELETE ON advertising_agency.invoices FROM 'hussain'@'localhost';

-- Revoke SELECT, INSERT, UPDATE, and DELETE privileges on the payments table from user 'hussain' from 'localhost'
REVOKE SELECT, INSERT, UPDATE, DELETE ON advertising_agency.payments FROM 'hussain'@'localhost';

-- Revoke SELECT, INSERT, UPDATE, and DELETE privileges on the vendor_supplier_information table from user 'hussain' from 'localhost'
REVOKE SELECT, INSERT, UPDATE, DELETE ON advertising_agency.vendor_supplier_information FROM 'hussain'@'localhost';

-- Revoke SELECT, INSERT, UPDATE, and DELETE privileges on the vendor_invoices table from user 'hussain' from 'localhost'
REVOKE SELECT, INSERT, UPDATE, DELETE ON advertising_agency.vendor_invoices FROM 'hussain'@'localhost';

-- Revoke SELECT, INSERT, UPDATE, and DELETE privileges on the performance_metrics table from user 'hussain' from 'localhost'
REVOKE SELECT, INSERT, UPDATE, DELETE ON advertising_agency.performance_metrics FROM 'hussain'@'localhost';

-- Revoke SELECT privilege on the contact_us table from user 'hussain' from 'localhost'
REVOKE SELECT ON advertising_agency.contact_us FROM 'hussain'@'localhost';

-- Revoke EXECUTE privilege on the stored procedures from user 'hussain' from 'localhost'
REVOKE EXECUTE ON PROCEDURE advertising_agency.GetTotalBudgetSpent FROM 'hussain'@'localhost';
REVOKE EXECUTE ON PROCEDURE advertising_agency.GetBudgetCategories FROM 'hussain'@'localhost';
REVOKE EXECUTE ON PROCEDURE advertising_agency.GetTotalRevenue FROM 'hussain'@'localhost';
REVOKE EXECUTE ON PROCEDURE advertising_agency.GroupInvoicesByQuarter FROM 'hussain'@'localhost';
REVOKE EXECUTE ON PROCEDURE advertising_agency.GetTotalSalaryExpenseByDepartment FROM 'hussain'@'localhost';
REVOKE EXECUTE ON PROCEDURE advertising_agency.GetNumEmployeesByDepartment FROM 'hussain'@'localhost';
REVOKE EXECUTE ON PROCEDURE advertising_agency.GetAvgMetricsByAdvertisementType FROM 'hussain'@'localhost';


-- Execution of the commands that were granted to 'hussain'

-- Open a terminal on Ubuntu.

-- Log in to MySQL using the MySQL client:

mysql -u hussain -p

-- then
CALL advertising_agency.GetTotalBudgetSpent;
EXIT;

-- Implementing Normalization
-- As per our understanding, all tables appear to be in at least 1NF, and there are no apparent violations of 2NF, 3NF, or BCNF. The tables are well-structured and free of significant normalization anomalies.
 
