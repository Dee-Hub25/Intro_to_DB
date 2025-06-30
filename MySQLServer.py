import mysql.connector
from mysql.connector import Error

def create_database():
    """
    Connects to MySQL server and creates the 'alx_book_store' database
    if it does not already exist.
    """
    connection = None
    cursor = None
    try:
        # Establish connection to MySQL server
        # You may need to change host, user, password as per your MySQL setup
        connection = mysql.connector.connect(
            host='localhost',    # Replace with your MySQL host if different
            user='your_username', # Replace with your MySQL username
            password='your_password' # Replace with your MySQL password
        )

        if connection.is_connected():
            cursor = connection.cursor()

            # SQL query to create the database if it does not exist
            # This handles the requirement of not failing if the database already exists
            # without using SELECT or SHOW statements.
            create_db_query = "CREATE DATABASE IF NOT EXISTS alx_book_store"

            print(f"Attempting to create database: alx_book_store")
            cursor.execute(create_db_query)
            print("Database 'alx_book_store' created successfully or already exists.")

    except Error as e:
        print(f"Error while connecting to MySQL or creating database: {e}")

    finally:
        # Close the cursor and connection
        if cursor:
            cursor.close()
        if connection and connection.is_connected():
            connection.close()
            print("MySQL connection is closed.")

if __name__ == "__main__":
    create_database()
