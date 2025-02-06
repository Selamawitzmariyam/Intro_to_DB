import mysql.connector


mydb = mysql.connector.connect(
    host="localhost",
    user="yourusername",
    password="Saintamanuel@28",
    database="mydb"
)
try:
    # Establish connection to MySQL
    conn = mysql.connector.connect(
        host="localhost",
        user="root",
        password="yourpassword",
        database="alx_book_store"
    )

    cursor = conn.cursor()

 
    cursor.execute("SHOW TABLES")
    for table in cursor:
        print(table)

except mysql.connector.Error as err:
    print(f"Error: {err}")

finally:
    # Close connection only if it's open
    if 'conn' in locals() and conn.is_connected():
        cursor.close()
        conn.close()
CREATE DATABASE IF NOT EXISTS alx_book_store;
USE alx_book_store;

CREATE TABLE IF NOT EXISTS Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(215) NOT NULL
);

CREATE TABLE IF NOT EXISTS Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(130) NOT NULL,
    author_id INT,
    price DOUBLE NOT NULL,
    publication_date DATE,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

CREATE TABLE IF NOT EXISTS Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) UNIQUE NOT NULL,
    address TEXT
);

CREATE TABLE IF NOT EXISTS Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
