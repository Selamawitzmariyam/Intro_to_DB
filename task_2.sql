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
    CUSTOMER_ID INT AUTO_INCREMENT PRIMARY KEY,
    CUSTOMER_NAME VARCHAR(215) NOT NULL,
    EMAIL VARCHAR(215) UNIQUE NOT NULL,
    ADDRESS TEXT
);

-- Create Orders table
CREATE TABLE IF NOT EXISTS Orders (
    ORDER_ID INT AUTO_INCREMENT PRIMARY KEY,
    CUSTOMER_ID INT,
    ORDER_DATE DATE NOT NULL,
    FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMERS(CUSTOMER_ID)
);

-- Create Order_Details table
CREATE TABLE IF NOT EXISTS ORDER_DETAILS (
    ORDERDETAILID INT AUTO_INCREMENT PRIMARY KEY,
    ORDER_ID INT,
    BOOK_ID INT,
    QUANTITY DOUBLE NOT NULL,
    FOREIGN KEY (ORDER_ID) REFERENCES ORDERS(ORDER_ID),
    FOREIGN KEY (BOOK_ID) REFERENCES BOOKS(BOOK_ID)
);
