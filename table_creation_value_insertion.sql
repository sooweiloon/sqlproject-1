/* Table creation */
CREATE TABLE Employee 
(Employee_ID VARCHAR2(4) PRIMARY KEY,
Employee_Name VARCHAR2(50),
Employee_IC VARCHAR2(14),
Employee_Age NUMBER(3),
Employee_Address VARCHAR2(50),
Employee_Contact_No VARCHAR2(12),
Employee_Email VARCHAR2(30),
Employee_Type VARCHAR2(20),
Employee_Salary NUMBER(10,2),
Employee_Status VARCHAR2(20));

CREATE TABLE Product 
(Product_ID VARCHAR2(4) PRIMARY KEY,
Product_Name VARCHAR2(50),
Product_Commission_Rate NUMBER(10,3),
Product_Description VARCHAR2(100),
Product_Unit_Price NUMBER(10,2),
Product_Minimum_Quantity NUMBER(10),
Product_Unit VARCHAR2(10),
Product_Weight NUMBER(10),
Product_Type VARCHAR2(30));

CREATE TABLE Customer 
(Customer_ID VARCHAR2(4) PRIMARY KEY,
Customer_Type VARCHAR2(20),
Customer_Name VARCHAR2(50),
Customer_IC VARCHAR2(14),
Customer_Age NUMBER(3),
Customer_Address VARCHAR2(50),
Customer_Contact_No VARCHAR2(12),
Customer_Email VARCHAR2(30));

CREATE TABLE Supplier 
(Supplier_ID VARCHAR2(4) PRIMARY KEY,
Supplier_Name VARCHAR2(50),
Supplier_Contact_No VARCHAR2(12),
Supplier_Address VARCHAR2(50));

CREATE TABLE Inventory 
(Inventory_ID VARCHAR2(6) PRIMARY KEY,
Product_ID VARCHAR2(4),
Supplier_ID VARCHAR2(4),
Inventory_Name VARCHAR2(50),
Inventory_Price NUMBER(10,2),
Inventory_Quantity NUMBER(5),
Inventory_Date DATE,
FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID),
FOREIGN KEY (Supplier_ID) REFERENCES Supplier(Supplier_ID));

CREATE TABLE Orders 
(Order_No NUMBER(10) PRIMARY KEY,
Customer_ID VARCHAR2(4),
Employee_ID VARCHAR2(4),
Order_Date DATE,
Order_Platform VARCHAR2(20),
Order_Status VARCHAR2(20),
Payment_Method VARCHAR2(20),
Payment_Date DATE,
FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID));

CREATE TABLE Order_Details 
(Order_No NUMBER(10),
Product_ID VARCHAR2(4),
Product_Quantity NUMBER(4),
Product_Price NUMBER(10,2),
Product_Commission NUMBER(10,2),
PRIMARY KEY (Order_No, Product_ID),
FOREIGN KEY (Order_No) REFERENCES Orders (Order_No),
FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID));

CREATE TABLE Delivery 
(Delivery_ID VARCHAR2(5) PRIMARY KEY,
Order_No NUMBER(10),
Employee_ID VARCHAR2(4),
Delivery_Address VARCHAR2(70),
Delivery_Date DATE,
Delivery_Status VARCHAR2(10),
Delivery_Service VARCHAR2(30),
Delivery_Fee NUMBER(10,2),
FOREIGN KEY (Order_No) REFERENCES Orders(Order_No),
FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID));

/* Value insertion */
INSERT INTO Employee VALUES ('E001', 'Ahmad Kamal', '880101075489', 35, '123 Jalan Teratai', '0123456789', 'ahmad.kamal@email.com', 'Marketing', 5000.00, 'Active');
INSERT INTO Employee VALUES ('E002', 'Siti Fatimah', '890202045623', 34, '456 Jalan Anggerik', '0123456790', 'siti.fatimah@email.com', 'Marketing', 5200.00, 'Active');
INSERT INTO Employee VALUES ('E003', 'Ali Bin Hassan', '900303015761', 33, '789 Jalan Melor', '0123456781', 'ali.hassan@email.com', 'Deliverer', 4500.00, 'Active');
INSERT INTO Employee VALUES ('E004', 'Nurul Aisyah', '910404085210', 32, '321 Jalan Serai', '0123456782', 'nurul.aisyah@email.com', 'Marketing', 5100.00, 'Active');
INSERT INTO Employee VALUES ('E005', 'Mohd Zaini', '920505055358', 31, '654 Jalan Kenanga', '0123456783', 'mohd.zaini@email.com', 'Deliverer', 4300.00, 'Active');
INSERT INTO Employee VALUES ('E006', 'Tan Wei Lin', '930506065494', 30, '777 Jalan Cempaka', '0123456784', 'tan.wei.lin@email.com', 'Marketing', 5300.00, 'Active');
INSERT INTO Employee VALUES ('E007', 'Kumaran a/l Subramaniam', '940607075602', 29, '888 Jalan Teratai', '0123456785', 'kumaran.subramaniam@email.com', 'Deliverer', 4200.00, 'Active');
INSERT INTO Employee VALUES ('E008', 'Angeline Chong', '950708085718', 28, '999 Jalan Melor', '0123456786', 'angeline.chong@email.com', 'Marketing', 5400.00, 'Active');
INSERT INTO Employee VALUES ('E009', 'Khor Wei Sheng', '960809095834', 27, '111 Jalan Serai', '0123456787', 'khor.wei.sheng@email.com', 'Deliverer', 4100.00, 'Active');
INSERT INTO Employee VALUES ('E010', 'Chua Mei Ling', '970910105950', 26, '222 Jalan Kenanga', '0123456788', 'chua.mei.ling@email.com', 'Marketing', 5500.00, 'Active');
INSERT INTO Employee VALUES ('E011', 'Lim Kok Seng', '981011116066', 25, '333 Jalan Dahlia', '0123456780', 'lim.kok.seng@email.com', 'Deliverer', 4000.00, 'Active');
INSERT INTO Employee VALUES ('E012', 'Farah Zainab', '991112126182', 24, '444 Jalan Mawar', '0123456791', 'farah.zainab@email.com', 'Marketing', 5600.00, 'Active');
INSERT INTO Employee VALUES ('E013', 'Syed Abdullah', '001213136298', 23, '555 Jalan Cempaka', '0123456792', 'syed.abdullah@email.com', 'Deliverer', 3900.00, 'Active');
INSERT INTO Employee VALUES ('E014', 'Nurul Hidayah', '011314146414', 22, '666 Jalan Teratai', '0123456793', 'nurul.hidayah@email.com', 'Marketing', 5700.00, 'Active');
INSERT INTO Employee VALUES ('E015', 'Mohd Faizal', '021415156530', 21, '777 Jalan Melor', '0123456794', 'mohd.faizal@email.com', 'Deliverer', 3800.00, 'Active');

INSERT INTO Customer VALUES ('C001', 'Retail', 'Rahman Bin Yusof', '790101015151', 44, '1 Jalan Meranti, Taman Bunga', '0184567758', 'rahman.yusof@email.com');
INSERT INTO Customer VALUES ('C002', 'Consumer', 'Noraini Binti Ahmad', '800202024242', 43, '2 Jalan Cempaka, Taman Desa Indah', '0124586256', 'noraini.ahmad@email.com');
INSERT INTO Customer VALUES ('C003', 'Restaurant', 'Tengku Aziz', '810303035353', 42, '3 Jalan Mawar, Taman Seri Melati', '0124478164', 'tengku.aziz@email.com');
INSERT INTO Customer VALUES ('C004', 'Restaurant', 'Syarikat Maju Sdn Bhd', '818303035353' , 42, '4 Jalan Dahlia, Taman Maju Jaya', '0146287516', 'syarikatmaju@email.com');
INSERT INTO Customer VALUES ('C005', 'Consumer', 'Kilang Berjaya Sdn Bhd', '800202028896', 43, '5 Jalan Bakawali, Taman Berjaya', '0189564725', 'kilangberjaya@email.com');
INSERT INTO Customer VALUES ('C006', 'Retail', 'Tan Ah Kow', '780201021212', 45, '6 Jalan Cempaka, Taman Bunga', '0184567760', 'tan.ahkow@email.com');
INSERT INTO Customer VALUES ('C007', 'Consumer', 'Chew Mei Ling', '790301032323', 44, '7 Jalan Mawar, Taman Desa Indah', '0124586260', 'chew.meiling@email.com');
INSERT INTO Customer VALUES ('C008', 'Restaurant', 'Rajesh Kumar', '800401043434', 43, '8 Jalan Dahlia, Taman Seri Melati', '0124478170', 'rajesh.kumar@email.com');
INSERT INTO Customer VALUES ('C009', 'Restaurant', 'Syarikat Indah Sdn Bhd', '800401042323', 43, '9 Jalan Anggerik, Taman Maju Jaya', '0146287520', 'syarikatindah@email.com');
INSERT INTO Customer VALUES ('C010', 'Consumer', 'Kilang Jaya Sdn Bhd', '790301028896', 44, '10 Jalan Bakawali, Taman Berjaya', '0189564730', 'kilangjaya@email.com');
INSERT INTO Customer VALUES ('C011', 'Retail', 'Abdul Samad', '770101015151', 46, '11 Jalan Cempaka, Taman Bunga', '0184567761', 'abdul.samad@email.com');
INSERT INTO Customer VALUES ('C012', 'Consumer', 'Aisha Binti Bakar', '760202024242', 47, '12 Jalan Mawar, Taman Desa Indah', '0124586261', 'aisha.bakar@email.com');
INSERT INTO Customer VALUES ('C013', 'Restaurant', 'Farhan Ahmad', '750303035353', 48, '13 Jalan Dahlia, Taman Seri Melati', '0124478171', 'farhan.ahmad@email.com');
INSERT INTO Customer VALUES ('C014', 'Restaurant', 'Syarikat Bakti Sdn Bhd', '750303035353', 48, '14 Jalan Anggerik, Taman Maju Jaya', '0146287521', 'syarikatbakti@email.com');
INSERT INTO Customer VALUES ('C015', 'Consumer', 'Kilang Bakti Sdn Bhd', '760202028896', 47, '15 Jalan Bakawali, Taman Berjaya', '0189564731', 'kilangbakti@email.com');

INSERT INTO Supplier VALUES ('S001', 'Sharifah Food Sdn Bhd', '0188888888', '10 Jalan Food, 12345 Kuala Lumpur');
INSERT INTO Supplier VALUES ('S002', 'Bio Packaging Supplier', '0187777777', '20 Jalan indah, 23456 Selangor');

INSERT INTO Product (Product_ID, Product_Name, Product_Type, Product_Weight, Product_Description, Product_Unit_Price, Product_Minimum_Quantity, Product_Unit, Product_Commission_Rate) VALUES ('P001', 'NASI BRIYANI GAM AYAM', 'Sharifah Product', 250, 'Ready To Eat', 11.90, 1, 'pkt', 0.1);
INSERT INTO Product (Product_ID, Product_Name, Product_Type, Product_Weight, Product_Description, Product_Unit_Price, Product_Minimum_Quantity, Product_Unit, Product_Commission_Rate) VALUES ('P002', 'SAMBAL SOTONG KERING', 'Sharifah Product', 180, 'Ready To Eat', 10.90, 1, 'pkt', 0.1);
INSERT INTO Product (Product_ID, Product_Name, Product_Type, Product_Weight, Product_Description, Product_Unit_Price, Product_Minimum_Quantity, Product_Unit, Product_Commission_Rate) VALUES ('P003', 'RENDANG DENDENG(200G)', 'Sharifah Product', 240, 'Ready To Eat', 22.50, 1, 'pkt', 0.1);
INSERT INTO Product (Product_ID, Product_Name, Product_Type, Product_Weight, Product_Description, Product_Unit_Price, Product_Minimum_Quantity, Product_Unit, Product_Commission_Rate) VALUES ('P004', 'SAMBAL TUMIS IKAN BILIS', 'Sharifah Product', 140, 'Ready To Eat', 6.10, 1, 'pkt', 0.1);
INSERT INTO Product (Product_ID, Product_Name, Product_Type, Product_Weight, Product_Description, Product_Unit_Price, Product_Minimum_Quantity, Product_Unit, Product_Commission_Rate) VALUES ('P005', 'NASI GORENG KAMPUNG', 'Sharifah Product', 250, 'Ready To Eat', 9.50, 1, 'pkt', 0.1);
INSERT INTO Product (Product_ID, Product_Name, Product_Type, Product_Weight, Product_Description, Product_Unit_Price, Product_Minimum_Quantity, Product_Unit, Product_Commission_Rate) VALUES ('P006', 'NASI GORENG UDANG', 'Sharifah Product', 250, 'Ready To Eat', 9.50, 1, 'pkt', 0.1);
INSERT INTO Product (Product_ID, Product_Name, Product_Type, Product_Weight, Product_Description, Product_Unit_Price, Product_Minimum_Quantity, Product_Unit, Product_Commission_Rate) VALUES ('P007', 'NASI GORENG IKAN MASIN', 'Sharifah Product', 250, 'Ready To Eat', 9.50, 1, 'pkt', 0.1);
INSERT INTO Product (Product_ID, Product_Name, Product_Type, Product_Weight, Product_Description, Product_Unit_Price, Product_Minimum_Quantity, Product_Unit, Product_Commission_Rate) VALUES ('P008', 'NASI GORENG AYAM', 'Sharifah Product', 250, 'Ready To Eat', 9.50, 1, 'pkt', 0.1);
INSERT INTO Product (Product_ID, Product_Name, Product_Type, Product_Weight, Product_Description, Product_Unit_Price, Product_Minimum_Quantity, Product_Unit, Product_Commission_Rate) VALUES ('P009', 'NASI GORENG DAGING', 'Sharifah Product', 250, 'Ready To Eat', 9.50, 1, 'pkt', 0.1);
INSERT INTO Product (Product_ID, Product_Name, Product_Type, Product_Weight, Product_Description, Product_Unit_Price, Product_Minimum_Quantity, Product_Unit, Product_Commission_Rate) VALUES ('P010', 'KARI AYAM', 'Sharifah Product', 140, 'Ready To Eat', 7.50, 1, 'pkt', 0.1);
INSERT INTO Product (Product_ID, Product_Name, Product_Type, Product_Weight, Product_Description, Product_Unit_Price, Product_Minimum_Quantity, Product_Unit, Product_Commission_Rate) VALUES ('P011', 'Bio Straw with single wrap', 'Biodegradable Product', NULL, '6mmx210mm', 320.00, 10, 'ctn', 0.03);
INSERT INTO Product (Product_ID, Product_Name, Product_Type, Product_Weight, Product_Description, Product_Unit_Price, Product_Minimum_Quantity, Product_Unit, Product_Commission_Rate) VALUES ('P012', 'Paper Straw with bevel end and single wrap', 'Biodegradable Product', NULL, '6mmx210mm', 180.00, 10, 'ctn', 0.03);
INSERT INTO Product (Product_ID, Product_Name, Product_Type, Product_Weight, Product_Description, Product_Unit_Price, Product_Minimum_Quantity, Product_Unit, Product_Commission_Rate) VALUES ('P013', 'S-E10 Bio Singlet Bag with 16 micron thickness', 'Biodegradable Product', NULL, '9"x11"', 4.70, 120, 'pkt', 0.03);
INSERT INTO Product (Product_ID, Product_Name, Product_Type, Product_Weight, Product_Description, Product_Unit_Price, Product_Minimum_Quantity, Product_Unit, Product_Commission_Rate) VALUES ('P014', 'M-E20 Bio Singlet Bag with 18 micron thickness', 'Biodegradable Product', NULL, '12"x12"', 6.70, 120, 'pkt', 0.03);
INSERT INTO Product (Product_ID, Product_Name, Product_Type, Product_Weight, Product_Description, Product_Unit_Price, Product_Minimum_Quantity, Product_Unit, Product_Commission_Rate) VALUES ('P015', 'L-E30 Bio Singlet Bag with 20 micron thickness', 'Biodegradable Product', NULL, '15"x15"', 11.00, 60, 'pkt', 0.03);
INSERT INTO Product (Product_ID, Product_Name, Product_Type, Product_Weight, Product_Description, Product_Unit_Price, Product_Minimum_Quantity, Product_Unit, Product_Commission_Rate) VALUES ('P016', 'XL-E40 Bio Singlet Bag with 21 micron thickness', 'Biodegradable Product', NULL, '17"x19"', 13.50, 50, 'pkt', 0.03);
INSERT INTO Product (Product_ID, Product_Name, Product_Type, Product_Weight, Product_Description, Product_Unit_Price, Product_Minimum_Quantity, Product_Unit, Product_Commission_Rate) VALUES ('P017', '2XL-E48 Bio Singlet Bag with 22 micron thickness', 'Biodegradable Product', NULL, '18"x22"', 17.50, 50, 'pkt', 0.03);
INSERT INTO Product (Product_ID, Product_Name, Product_Type, Product_Weight, Product_Description, Product_Unit_Price, Product_Minimum_Quantity, Product_Unit, Product_Commission_Rate) VALUES ('P018', '3XL-E55 Bio Singlet Bag with 24 micron thickness', 'Biodegradable Product', NULL, '22"x24"', 25.00, 25, 'pkt', 0.03);
INSERT INTO Product (Product_ID, Product_Name, Product_Type, Product_Weight, Product_Description, Product_Unit_Price, Product_Minimum_Quantity, Product_Unit, Product_Commission_Rate) VALUES ('P019', '4XL-E60 Bio Singlet Bag with 30 micron thickness', 'Biodegradable Product', NULL, '24" x30"', 41.00, 25, 'pkt', 0.03);
INSERT INTO Product (Product_ID, Product_Name, Product_Type, Product_Weight, Product_Description, Product_Unit_Price, Product_Minimum_Quantity, Product_Unit, Product_Commission_Rate) VALUES ('P020', 'SOS#8 Brown Paper Bag', 'Biodegradable Product', NULL, '305x154x100mm', 170.00, 1000, 'ctn', 0.03);
INSERT INTO Product (Product_ID, Product_Name, Product_Type, Product_Weight, Product_Description, Product_Unit_Price, Product_Minimum_Quantity, Product_Unit, Product_Commission_Rate) VALUES ('P021', 'D-cut Handle Brown Paper Bag', 'Biodegradable Product', NULL, '280x280x150mm', 300.00, 300, 'ctn', 0.03);

INSERT INTO Inventory VALUES ('I001', 'P001', 'S001', 'NASI BRIYANI GAM AYAM', 11.90, 500, TO_DATE('01-04-2023', 'DD-MM-YYYY'));
INSERT INTO Inventory VALUES ('I002', 'P002', 'S001', 'SAMBAL SOTONG KERING', 10.90, 800, TO_DATE('02-04-2023', 'DD-MM-YYYY'));
INSERT INTO Inventory VALUES ('I003', 'P003', 'S001', 'RENDANG DENDENG(200G)', 22.50, 600, TO_DATE('03-04-2023', 'DD-MM-YYYY'));
INSERT INTO Inventory VALUES ('I004', 'P004', 'S001', 'SAMBAL TUMIS IKAN BILIS', 6.10, 700, TO_DATE('04-04-2023', 'DD-MM-YYYY'));
INSERT INTO Inventory VALUES ('I005', 'P005', 'S002', 'NASI GORENG KAMPUNG', 9.50, 550, TO_DATE('05-04-2023', 'DD-MM-YYYY'));
INSERT INTO Inventory VALUES ('I006', 'P006', 'S001', 'NASI GORENG UDANG', 9.50, 750, TO_DATE('06-04-2023', 'DD-MM-YYYY'));
INSERT INTO Inventory VALUES ('I007', 'P007', 'S001', 'NASI GORENG IKAN MASIN', 9.50, 650, TO_DATE('07-04-2023', 'DD-MM-YYYY'));
INSERT INTO Inventory VALUES ('I008', 'P008', 'S001', 'NASI GORENG AYAM', 9.50, 850, TO_DATE('08-04-2023', 'DD-MM-YYYY'));
INSERT INTO Inventory VALUES ('I009', 'P009', 'S001', 'NASI GORENG DAGING', 9.50, 950, TO_DATE('09-04-2023', 'DD-MM-YYYY'));
INSERT INTO Inventory VALUES ('I010', 'P010', 'S001', 'KARI AYAM', 7.50, 500, TO_DATE('10-04-2023', 'DD-MM-YYYY'));
INSERT INTO Inventory VALUES ('I011', 'P011', 'S002', 'Bio Straw with single wrap', 320, 400, TO_DATE('11-04-2023', 'DD-MM-YYYY'));
INSERT INTO Inventory VALUES ('I012', 'P012', 'S002', 'Paper Straw with bevel end and single wrap', 180, 300, TO_DATE('12-04-2023', 'DD-MM-YYYY'));
INSERT INTO Inventory VALUES ('I013', 'P013', 'S002', 'S-E10 Bio Singlet Bag with 16 micron thickness', 4.70, 200, TO_DATE('13-04-2023', 'DD-MM-YYYY'));
INSERT INTO Inventory VALUES ('I014', 'P014', 'S002', 'M-E20 Bio Singlet Bag with 18 micron thickness', 6.70, 100, TO_DATE('14-04-2023', 'DD-MM-YYYY'));
INSERT INTO Inventory VALUES ('I015', 'P015', 'S002', 'L-E30 Bio Singlet Bag with 20 micron thickness',11.00,300, TO_DATE('15-04-2023', 'DD-MM-YYYY'));

INSERT INTO Orders VALUES (1000001, 'C001', 'E001', TO_DATE('01-02-2023', 'DD-MM-YYYY'), 'Website', 'Completed', 'Credit Card', TO_DATE('01-02-2023', 'DD-MM-YYYY'));
INSERT INTO Orders VALUES (1000002, 'C002', 'E002', TO_DATE('05-02-2023', 'DD-MM-YYYY'), 'Phone', 'Completed', 'Bank Transfer', TO_DATE('06-02-2023', 'DD-MM-YYYY'));
INSERT INTO Orders VALUES (1000003, 'C003', 'E005', TO_DATE('10-02-2023', 'DD-MM-YYYY'), 'Website', 'Completed', 'Credit Card', TO_DATE('10-02-2023', 'DD-MM-YYYY'));
INSERT INTO Orders VALUES (1000004, 'C004', 'E001', TO_DATE('15-02-2023', 'DD-MM-YYYY'), 'Email', 'Pending', 'Credit Card', NULL);
INSERT INTO Orders VALUES (1000005, 'C005', 'E003', TO_DATE('20-02-2023', 'DD-MM-YYYY'), 'Phone', 'Completed', 'Bank Transfer', TO_DATE('21-02-2023', 'DD-MM-YYYY'));
INSERT INTO Orders VALUES (1000006, 'C006', 'E006', TO_DATE('06-04-2023', 'DD-MM-YYYY'), 'Mobile App', 'Pending', 'Debit Card', TO_DATE('06-04-2023', 'DD-MM-YYYY'));
INSERT INTO Orders VALUES (1000007, 'C007', 'E007', TO_DATE('07-04-2023', 'DD-MM-YYYY'), 'Website', 'Pending', 'Bank Transfer', TO_DATE('07-04-2023', 'DD-MM-YYYY'));
INSERT INTO Orders VALUES (1000008, 'C008', 'E008', TO_DATE('08-04-2023', 'DD-MM-YYYY'), 'Mobile App', 'Pending', 'Credit Card', TO_DATE('08-04-2023', 'DD-MM-YYYY'));
INSERT INTO Orders VALUES (1000009, 'C009', 'E009', TO_DATE('09-04-2023', 'DD-MM-YYYY'), 'Website', 'Pending', 'Debit Card', TO_DATE('09-04-2023', 'DD-MM-YYYY'));
INSERT INTO Orders VALUES (1000010, 'C010', 'E010', TO_DATE('10-04-2023', 'DD-MM-YYYY'), 'Mobile App', 'Pending', 'Bank Transfer', TO_DATE('10-04-2023', 'DD-MM-YYYY'));
INSERT INTO Orders VALUES (1000011, 'C011', 'E011', TO_DATE('11-04-2023', 'DD-MM-YYYY'), 'Website', 'Pending', 'Credit Card', TO_DATE('11-04-2023', 'DD-MM-YYYY'));
INSERT INTO Orders VALUES (1000012, 'C012', 'E012', TO_DATE('12-04-2023', 'DD-MM-YYYY'), 'Mobile App', 'Pending', 'Debit Card', TO_DATE('12-04-2023', 'DD-MM-YYYY'));
INSERT INTO Orders VALUES (1000013, 'C013', 'E013', TO_DATE('13-04-2023', 'DD-MM-YYYY'), 'Website', 'Pending', 'Bank Transfer', TO_DATE('13-04-2023', 'DD-MM-YYYY'));
INSERT INTO Orders VALUES (1000014, 'C014', 'E014', TO_DATE('14-04-2023', 'DD-MM-YYYY'), 'Mobile App', 'Pending', 'Credit Card', TO_DATE('14-04-2023', 'DD-MM-YYYY'));
INSERT INTO Orders VALUES (1000015, 'C015', 'E015', TO_DATE('15-04-2023', 'DD-MM-YYYY'), 'Website', 'Pending', 'Debit Card', TO_DATE('15-04-2023', 'DD-MM-YYYY'));

INSERT INTO Order_Details (Order_No, Product_ID, Product_Quantity, Product_Price, Product_Commission)VALUES (1000001, 'P001', 2, 11.90, 0.1);
INSERT INTO Order_Details (Order_No, Product_ID, Product_Quantity, Product_Price, Product_Commission) VALUES (1000001, 'P002', 3, 10.90, 0.1);
INSERT INTO Order_Details (Order_No, Product_ID, Product_Quantity, Product_Price, Product_Commission) VALUES (1000001, 'P005', 1, 9.50, 0.1);
INSERT INTO Order_Details (Order_No, Product_ID, Product_Quantity, Product_Price, Product_Commission) VALUES (1000002, 'P007', 2, 9.50, 0.1);
INSERT INTO Order_Details (Order_No, Product_ID, Product_Quantity, Product_Price, Product_Commission) VALUES (1000002, 'P009', 1, 9.50, 0.1);
INSERT INTO Order_Details (Order_No, Product_ID, Product_Quantity, Product_Price, Product_Commission) VALUES (1000003, 'P012', 20, 180.00, 0.03);
INSERT INTO Order_Details (Order_No, Product_ID, Product_Quantity, Product_Price, Product_Commission) VALUES (1000003, 'P013', 140, 4.70, 0.03);
INSERT INTO Order_Details (Order_No, Product_ID, Product_Quantity, Product_Price, Product_Commission) VALUES (1000004, 'P015', 80, 11.00, 0.03);
INSERT INTO Order_Details (Order_No, Product_ID, Product_Quantity, Product_Price, Product_Commission) VALUES (1000005, 'P016', 60, 13.50, 0.03);
INSERT INTO Order_Details (Order_No, Product_ID, Product_Quantity, Product_Price, Product_Commission) VALUES (1000005, 'P018', 90, 25.00, 0.03);
INSERT INTO Order_Details (Order_No, Product_ID, Product_Quantity, Product_Price, Product_Commission) VALUES (1000006, 'P021', 100, 300.00, 0.03);
INSERT INTO Order_Details (Order_No, Product_ID, Product_Quantity, Product_Price, Product_Commission) VALUES (1000007, 'P016', 150, 13.50, 0.03);
INSERT INTO Order_Details (Order_No, Product_ID, Product_Quantity, Product_Price, Product_Commission) VALUES (1000007, 'P019', 200, 41.00, 0.03);
INSERT INTO Order_Details (Order_No, Product_ID, Product_Quantity, Product_Price, Product_Commission) VALUES (1000008, 'P015', 250, 11.00, 0.03);
INSERT INTO Order_Details (Order_No, Product_ID, Product_Quantity, Product_Price, Product_Commission) VALUES (1000009, 'P017', 240, 17.50, 0.03);
INSERT INTO Order_Details (Order_No, Product_ID, Product_Quantity, Product_Price, Product_Commission) VALUES (1000010, 'P020', 1500, 170.00, 0.03);

INSERT INTO Delivery VALUES ('D0001', 1000001, NULL, 'No. 10, Jalan SS2/15, 47300 Petaling Jaya, Selangor', TO_DATE('01-02-2023', 'DD-MM-YYYY'),'Delivered', 'Lalamove', 8.00);
INSERT INTO Delivery VALUES ('D0002', 1000002, NULL, 'No. 23, Jalan 9/8, Taman Setapak, 53000 Kuala Lumpur', TO_DATE('02-02-2023', 'DD-MM-YYYY'), 'Delivered', 'Lalamove', 8.00);
INSERT INTO Delivery VALUES ('D0003', 1000003, NULL, 'No. 8, Lorong Perdana 6/1, 41200 Klang, Selangor', TO_DATE('03-02-2023', 'DD-MM-YYYY'),'Delivered', 'Grabs', 10.00);
INSERT INTO Delivery VALUES ('D0004', 1000004, NULL, 'No. 30, Jalan Seri Kembangan 1, 43500 Semenyih, Selangor', TO_DATE('04-02-2023', 'DD-MM-YYYY'),'Delivered', 'Grabs', 10.00);
INSERT INTO Delivery VALUES ('D0005', 1000005, 'E004', 'No. 50, Jalan PJS 9/1A, Bandar Sunway, 47500 Subang Jaya, Selangor', TO_DATE('05-02-2023', 'DD-MM-YYYY'), 'Delivered', 'HIT', 12.00);
INSERT INTO Delivery VALUES ('D0006', 1000006, 'E004', 'No. 45, Jalan Bukit Bintang, 55100 Kuala Lumpur', TO_DATE('06-02-2023', 'DD-MM-YYYY'), 'Delivered', 'HIT', 12.00);
INSERT INTO Delivery VALUES ('D0007', 1000007, NULL, 'No. 64, Jalan Putra Permai 1, 47650 Putrajaya', TO_DATE('07-02-2023', 'DD-MM-YYYY'), 'Delivered', 'Lalamove', 8.00);
INSERT INTO Delivery VALUES ('D0008', 1000008, NULL, 'No. 89, Jalan SS15/4, 47500 Subang Jaya, Selangor', TO_DATE('08-02-2023', 'DD-MM-YYYY'), 'Delivered', 'Lalamove', 8.00);
INSERT INTO Delivery VALUES ('D0009', 1000009, 'E006', 'No. 11, Jalan Sultan Ismail, 50250 Kuala Lumpur', TO_DATE('09-02-2023', 'DD-MM-YYYY'), 'Delivered', 'HIT', 10.00);
INSERT INTO Delivery VALUES ('D0010', 1000010, NULL, 'No. 32, Jalan Ampang, 50450 Kuala Lumpur', TO_DATE('10-02-2023', 'DD-MM-YYYY'), 'Delivered', 'Grabs', 10.00);
INSERT INTO Delivery VALUES ('D0011', 1000011, 'E007', 'No. 46, Jalan Pudu, 55100 Kuala Lumpur', TO_DATE('11-02-2023', 'DD-MM-YYYY'), 'Delivered', 'HIT', 12.00);
INSERT INTO Delivery VALUES ('D0012', 1000012, 'E007', 'No. 78, Jalan Imbi, 55100 Kuala Lumpur', TO_DATE('12-02-2023', 'DD-MM-YYYY'), 'Delivered', 'HIT', 12.00);
INSERT INTO Delivery VALUES ('D0013', 1000013, 'E008', 'No. 90, Jalan Tun Razak, 50400 Kuala Lumpur', TO_DATE('13-02-2023', 'DD-MM-YYYY'), 'Delivered', 'HIT', 8.00);
INSERT INTO Delivery VALUES ('D0014', 1000014, NULL, 'No. 21, Jalan Kenanga, 55200 Kuala Lumpur', TO_DATE('14-02-2023', 'DD-MM-YYYY'), 'Delivered', 'Lalamove', 8.00);
INSERT INTO Delivery VALUES ('D0015', 1000015, NULL, 'No. 61, Jalan Petaling, 50000 Kuala Lumpur', TO_DATE('15-02-2023', 'DD-MM-YYYY'), 'Delivered', 'Grabs', 10.00);
