
CREATE DATABASE IF NOT EXISTS alx_book_store;
USE alx_book_store;

CREATE TABLE Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(215) NOT NULL
);

CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(130) NOT NULL,
    author_id INT,
    price DOUBLE,
    publication_date DATE,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) NOT NULL,
    address TEXT
);

CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Order_Details (
    orderdetailid INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    book_id INT,
    quantity DOUBLE,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

INSERT INTO Authors (author_name) VALUES
('J.K. ROWLING'),
('GEORGE R.R. MARTIN'),
('CHINUA ACHEBE');

INSERT INTO Books (title, author_id, price, publication_date) VALUES
('HARRY POTTER AND THE SORCERER''S STONE', 1, 19.99, '1997-06-26'),
('A GAME OF THRONES', 2, 24.95, '1996-08-06'),
('THINGS FALL APART', 3, 15.50, '1958-06-17');

INSERT INTO Customers (customer_name, email, address) VALUES
('ALICE JOHNSON', 'alice@example.com', '123 MAIN ST, NAIROBI'),
('BOB MWANGI', 'bob@example.com', '456 MARKET RD, MOMBASA');

INSERT INTO Orders (customer_id, order_date) VALUES
(1, '2025-06-28'),
(2, '2025-06-29');

-- INSERT SAMPLE DATA INTO ORDER_DETAILS
INSERT INTO Order_Details (order_id, book_id, quantity) VALUES
(1, 1, 2),
(1, 3, 1),
(2, 2, 1);
