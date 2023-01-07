
DROP TABLE IF EXISTS Store, Customer, Employee, Department, Salary, Transaction, manager, Product, 
Inventory;
DROP VIEW IF exists TotalPay;
SET FOREIGN_KEY_CHECKS=0;
CREATE TABLE Store(
	store_id INT NOT NULL,
    store_name varchar(50) NOT NULL,
    store_location varchar(70) NOT NULL,
    FOREIGN KEY (store_id) REFERENCES Employee(store_id)
);
CREATE TABLE  Customer  (
   customer_id  int(11) NOT NULL PRIMARY KEY,  
   first_name  varchar(20) NOT NULL,
   last_name  varchar(20) NOT NULL,
   customer_add  varchar(60) NOT NULL
 
);

CREATE TABLE  Department  (
	emp_id  int(11) NOT NULL PRIMARY KEY,
    man_id int(11) NOT NULL,
   dept_id  int(5) NOT NULL,
   dept_name  varchar(40) NOT NULL,
	FOREIGN KEY (emp_id) REFERENCES Employee(emp_id),
    FOREIGN KEY (man_id) REFERENCES Employee(man_id),
    FOREIGN KEY (dept_id) REFERENCES Product(dept_id)
);
CREATE TABLE  Salary (
	emp_id INT(11) NOT NULL PRIMARY KEY,
	salary INT,
	from_date DATE,
	to_date DATE,
     FOREIGN KEY(emp_id) REFERENCES Employee(emp_id),
     FOREIGN KEY (salary) REFERENCES Employee(salary)
);
CREATE TABLE  Employee  (
store_id INT(3) NOT NULL,
   first_name varchar(20) NOT NULL,
   last_name varchar(20) NOT NULL,
   emp_id int(11) NOT NULL ,
   man_id INT NOT NULL ,
   SSN  int(11) NOT NULL,
   dept_id  int(11) NOT NULL,
   salary  int(8) NOT NULL,
   phone_number  int(11) NOT NULL,
   emp_email  varchar(50) NOT NULL,
   emp_add  varchar(60) NOT NULL,
   DOB  Date NOT NULL,
   PRIMARY KEY (emp_id, store_id),
   FOREIGN KEY (store_id) REFERENCES Store(store_id),
   FOREIGN KEY (man_id) REFERENCES Department(man_id),
   FOREIGN KEY (emp_id) REFERENCES Salary(emp_id),
   FOREIGN KEY (salary) REFERENCES Salary(salary)
);
CREATE TABLE Transaction (
    transaction_id INT PRIMARY KEY,
    date DATE NOT NULL,
    payment_type VARCHAR(40) NOT NULL,
    emp_id INT NOT NULL,
    customer_id INT NOT NULL,
    
    FOREIGN KEY (emp_id) REFERENCES Employee(emp_id),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);
CREATE TABLE Product (
    prod_id INT PRIMARY KEY,
    dept_id INT,
    prod_name VARCHAR(40) NOT NULL,
    price DECIMAL NOT NULL,
    expiry_date DATE NOT NULL,
	FOREIGN KEY (dept_id) REFERENCES Department(dept_id),
	FOREIGN KEY(prod_id) REFERENCES Inventory(prod_id)
   
);
CREATE TABLE Inventory (
    prod_id INT PRIMARY KEY,
    quantity INT NOT NULL,
    FOREIGN KEY(prod_id) REFERENCES Product(prod_id)
);

INSERT INTO Store (store_id, store_name, store_location) VALUES
(23, 'Big Mart', '48 Jolly St, Glassboro, 08028');
-- insert Employee information --- 

INSERT INTO Employee ( store_id, first_name , last_name, emp_id, man_id,
SSN,dept_id, salary, phone_number,emp_email,emp_add, DOB) VALUES
(101,'Raj', 'Bhandari', 01, 45, 123456789, 1, 50000, 917932, 'bhanda64@store.schema.com', '123 Campus St, Glassboro,
 08028', '1999-5-29');
 INSERT INTO Employee ( store_id, first_name , last_name, emp_id, man_id,
SSN,dept_id, salary, phone_number,emp_email,emp_add, DOB) VALUES
(101, 'Alice', 'Red', 02, 46, 987654321, 2, 50000, 856789, 'reda54@store.schema.com', '256 Almond St, Glassboro,
 08028', '1996-06-23');
 INSERT INTO Employee (store_id, first_name , last_name, emp_id, man_id,
SSN,dept_id, salary, phone_number,emp_email,emp_add, DOB) VALUES
(101, 'Bob', 'Mantel', 3, 0, 654987321, 3, 35000, 856791, 'mantel98@store.schema.com', '23 Sranton Place, Sewell,
 08080', '2000-04-21');
 INSERT INTO Employee (store_id, first_name , last_name, emp_id, man_id,
SSN,dept_id, salary, phone_number,emp_email,emp_add, DOB) VALUES
(101, 'Simon', 'Kant', 4, 47, 321654987, 2, 70000, 856741, 'kant38@store.schema.com', '48 High West St, Washington TWP,
 08080', '1994-12-08');
 INSERT INTO Employee (store_id, first_name , last_name, emp_id, man_id,
SSN,dept_id, salary, phone_number,emp_email,emp_add, DOB) VALUES
(101, 'Josh', 'Frost', 5, 48, 954876213, 4, 75000, 985741, 'frost12@store.schema.com', '15 Carptenter St, glassboro,
 08028', '1996-08-11');
 
 -- insert Deparment info --
 INSERT INTO Department (emp_id, man_id, dept_id, dept_name) VALUES
(01, 45, 1, 'Technology');
INSERT INTO Department (emp_id, man_id, dept_id, dept_name) VALUES
(02, 46, 2, 'Pharmacy');
INSERT INTO Department (emp_id, man_id, dept_id, dept_name) VALUES
(03, 47, 3, 'Toys');
INSERT INTO Department (emp_id, man_id, dept_id, dept_name) VALUES
(04, 48, 4, 'Grocery');


-- insert customer info--
INSERT INTO Customer VALUES (1,'Glen','Rich','156 Stanton Rd, Glasboro.');
INSERT INTO Customer VALUES (2,'Monty','Trim','19 Greene St, Sewell.');
INSERT INTO Customer VALUES (3,'John','Foe','8 Diaond St, Sewell.');
INSERT INTO Customer VALUES (4,'Jane','Pringle','23 Ruby Rd, Glasboro.');
INSERT INTO Customer VALUES (5,'Mary','Sherry','2 Filly square, Glasboro.');

-- insert transaction values -- 
INSERT INTO Transaction VALUES (12,'2022-04-02','cash',2, 1);
INSERT INTO Transaction VALUES (13,'2022-03-30','credit',5, 2);
INSERT INTO Transaction VALUES (14,'2022-04-01','credit',4, 3);
INSERT INTO Transaction VALUES (15,'2022-04-01','debit',2, 4);
INSERT INTO Transaction VALUES (16,'2022-04-02','cash',1, 5);

-- insert produt info --
INSERT INTO Product VALUES (01, 4,'Apple Juice',2.99,'2022-04-02');
INSERT INTO Product VALUES (02, 4,'Banana',1.49,'2022-04-02');
INSERT INTO Product VALUES (03, 1,'Dell Laptop',1599.99,'2022-04-02');
INSERT INTO Product VALUES (04, 1,'Acer Laptop',1299.99,'2022-04-02');
INSERT INTO Product VALUES (05, 2,'Asprin',10.00,'2022-04-02');
INSERT INTO Product VALUES (06, 3,'Bike',120.00,'2022-04-02');

-- insert inventory for products --
INSERT INTO Inventory VALUES (01,100);
INSERT INTO Inventory VALUES (02,200);
INSERT INTO Inventory VALUES (03,20);
INSERT INTO Inventory VALUES (04,25);
INSERT INTO Inventory VALUES (05,52);
INSERT INTO Inventory VALUES (06,3);

-- insert salary for employees --
INSERT INTO Salary VALUES (1, 50000, '2012-12-14', '2022-04-02'); 
INSERT INTO Salary VALUES (2, 50000, '2007-08-11', '2022-04-02'); 
INSERT INTO Salary VALUES (3, 35000, '2021-01-31', '2022-04-02'); 
INSERT INTO Salary VALUES (4, 70000, '2008-06-23', '2022-04-02'); 
INSERT INTO Salary VALUES (5, 75000, '2010-05-18', '2022-04-02'); 

-- shows which department each employee belongs to. --
SELECT Employee.emp_id, Employee.first_name, Employee.last_name,  Department.dept_id , Department.dept_name 
FROM Employee 
INNER JOIN Department
ON Employee.dept_id = Department.dept_id;

-- shows number of employees each department has --
SELECT dept_id,  COUNT(emp_id) as 'Number of Employees' 
FROM Employee
GROUP BY dept_id;

-- shows quantities of products --
SELECT Product.prod_id, Product.prod_name, Inventory.quantity
FROM Product 
INNER JOIN Inventory
ON Product.prod_id = Inventory.prod_id;


CREATE VIEW TotalPay AS
SELECT emp_id, SUM(salary) AS salary
FROM Salary
GROUP BY emp_id;