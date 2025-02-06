-- Ensure the database exists
CREATE DATABASE IF NOT EXISTS ALX_BOOK_STORE;
USE ALX_BOOK_STORE;

-- Create Authors table
CREATE TABLE IF NOT EXISTS Authors (
   author_id  INT AUTO_INCREMENT PRIMARY KEY,
     author_name VARCHAR(215) NOT NULL
   
);

-- Create Books table
CREATE TABLE IF NOT EXISTS Books (
      book_id  INT AUTO_INCREMENT PRIMARY KEY,
      title VARCHAR(130) NOT NULL,
     author_id INT,
    price  DOUBLE NOT NULL,
    publication_date  DATE,
    FOREIGN KEY (AUTHOR_ID) REFERENCES AUTHORS(AUTHOR_ID)
);
    
-- Create Customers table
CREATE TABLE IF NOT EXISTS Customers (
     customer_id INT AUTO_INCREMENT PRIMARY KEY,
     customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) UNIQUE NOT NULL,
    address TEXT
);

-- Create Orders table
CREATE TABLE IF NOT EXISTS Orders (
     order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
     order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
 
-- Create Order_Details table
CREATE TABLE IF NOT EXISTS ORDER_DETAILS (
   orderdetailid  INT AUTO_INCREMENT PRIMARY KEY,
     order_id INT,
 book_id INT,
quantity DOUBLE NOT NULL,
    FOREIGN KEY (ORDER_ID) REFERENCES ORDERS(ORDER_ID),
    FOREIGN KEY (BOOK_ID) REFERENCES BOOKS(BOOK_ID)
);
 
