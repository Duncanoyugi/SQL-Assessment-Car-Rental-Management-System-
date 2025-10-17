# SQL-Assessment-Car-Rental-Management-System-
Design and implement a Car Rental Management System database 
in SQL Server. 
1. Analyze the Entities 
o Review the tables listed below and figure out how they relate to each 
other. 
o Example: A Customer can have many Rentals, but each Rental belongs 
to one Customer (One-to-Many). 
2. Define Relationships and Cardinalities 
o Apply the correct relationship types:  
▪ One-to-One (1:1) 
▪ One-to-Many (1:M) 
▪ Many-to-Many (M:M) 
o Hint: Use foreign keys to create these relationships. 
3. Create Tables with SQL 
o Write CREATE TABLE statements for all entities. 
o Choose appropriate data types (e.g., INT, VARCHAR, DATE, DECIMAL). 
o Add primary keys and foreign keys. 
4. Perform CRUD Operations 
o Create: Insert at least 5 rows of sample data into each table. 
o Read: Use SELECT queries to fetch data. 
o Update: Modify existing records using UPDATE. 
o Delete: Remove specific records using DELETE. 
5. Write Advanced Queries 
o Filtering and sorting data. 
o Modify data with UPDATE and DELETE. 
o Create User Defined Functions (UDFs). 
o Perform JOINs and Subqueries. 
1 
2 
 
Car Rental Management System DB 
Entities(tables): 
1. Car 
• Car ID 
• Car Model 
• Manufacturer 
• Year 
• Color 
• Rental Rate 
• Availability 
 
2. Customer 
• Customer ID 
• First Name 
• Last Name 
• Email 
• Phone Number 
• Address 
 
3. Rental 
• Rental ID 
• Car ID 
• Customer ID 
• Rental Start Date 
• Rental End Date 
• Total Amount 
 
4. Payment 
• Payment ID 
• Rental ID 
• Payment Date 
• Amount 
• Payment Method 
 
5. Insurance 
• Insurance ID 
• Car ID 
• Insurance Provider 
• Policy Number 
• Start Date 
• End Date 
 
6. Location 
• Location ID 
• Location Name 
• Address 
• Contact Number 
 
7. Reservation 
• Reservation ID 
• Car ID 
• Customer ID 
• Reservation Date 
• Pickup Date 
• Return Date 
 
8. Maintenance 
• Maintenance ID 
• Car ID 
• Maintenance Date 
• Description 
• Cost  
