-- Inserting data into the customer_details table
INSERT INTO customer_details (customer_id, customer_name, contact_details)
VALUES 
    (1, 'John Doe', 'john.doe@example.com'),
    (2, 'Jane Smith', 'jane.smith@example.com'),
    (3, 'Michael Johnson', 'michael.johnson@example.com'),
    (4, 'Emily Williams', 'emily.williams@example.com'),
    (5, 'Daniel Brown', 'daniel.brown@example.com'),
    (6, 'Olivia Davis', 'olivia.davis@example.com'),
    (7, 'William Turner', 'william.turner@example.com'),
    (8, 'Sophia Lee', 'sophia.lee@example.com'),
    (9, 'Benjamin White', 'benjamin.white@example.com'),
    (10, 'Ava Johnson', 'ava.johnson@example.com'),
    (11, 'Ethan Smith', 'ethan.smith@example.com'),
    (12, 'Emma Davis', 'emma.davis@example.com'),
    (13, 'Noah Taylor', 'noah.taylor@example.com'),
    (14, 'Madison Brown', 'madison.brown@example.com'),
    (15, 'Liam Turner', 'liam.turner@example.com');

-- Inserting data into the bookings table
INSERT INTO bookings (booking_id, date, table_number)
VALUES 
    (1, '2024-02-05', 1),
    (2, '2024-02-06', 2),
    (3, '2024-02-07', 3),
    (4, '2024-02-08', 4),
    (5, '2024-02-09', 5),
    (6, '2024-02-10', 6),
    (7, '2024-02-11', 7),
    (8, '2024-02-12', 8),
    (9, '2024-02-13', 9),
    (10, '2024-02-14', 10),
    (11, '2024-02-15', 11),
    (12, '2024-02-16', 12),
    (13, '2024-02-17', 13),
    (14, '2024-02-18', 14),
    (15, '2024-02-19', 15);

-- Inserting data into the menuitems table
INSERT INTO menuitems (MenuItemsID, CourseName, StarterName, DesertName)
VALUES 
    (1, 'Main Course', 'Salad', 'Ice Cream'),
    (2, 'Dessert', 'Soup', 'Cake'),
    (3, 'Appetizer', 'Bruschetta', 'Cheesecake'),
    (4, 'Main Course', 'Pasta', 'Tiramisu'),
    (5, 'Dessert', 'Creme Brulee', 'Brownie'),
    (6, 'Appetizer', 'Shrimp Cocktail', 'Fruit Salad'),
    (7, 'Main Course', 'Steak', 'Chocolate Mousse'),
    (8, 'Dessert', 'Panna Cotta', 'Key Lime Pie'),
    (9, 'Appetizer', 'Caprese Salad', 'Fried Calamari'),
    (10, 'Main Course', 'Fish Tacos', 'Banana Split'),
    (11, 'Dessert', 'Lemon Sorbet', 'Peach Cobbler'),
    (12, 'Appetizer', 'Spinach Dip', 'Cherry Cheesecake'),
    (13, 'Main Course', 'Chicken Parmesan', 'Strawberry Shortcake'),
    (14, 'Dessert', 'Molten Lava Cake', 'Apple Pie'),
    (15, 'Appetizer', 'Garlic Bread', 'Peach Melba');

-- Inserting data into the menu table
INSERT INTO menu (menu_id, item_name, category, price, MenuItemsID)
VALUES 
    (1, 'Chicken Alfredo', 'Main Course', 15.99, 1),
    (2, 'Chocolate Cake', 'Dessert', 5.99, 2),
    (3, 'Bruschetta', 'Appetizer', 8.99, 3),
    (4, 'Spaghetti Bolognese', 'Main Course', 12.99, 4),
    (5, 'Creme Brulee', 'Dessert', 7.99, 5),
    (6, 'Shrimp Cocktail', 'Appetizer', 10.99, 6),
    (7, 'Filet Mignon', 'Main Course', 24.99, 7),
    (8, 'Panna Cotta', 'Dessert', 6.99, 8),
    (9, 'Caprese Salad', 'Appetizer', 9.99, 9),
    (10, 'Fish Tacos', 'Main Course', 18.99, 10),
    (11, 'Lemon Sorbet', 'Dessert', 4.99, 11),
    (12, 'Spinach Dip', 'Appetizer', 11.99, 12),
    (13, 'Chicken Parmesan', 'Main Course', 16.99, 13),
    (14, 'Molten Lava Cake', 'Dessert', 8.99, 14),
    (15, 'Garlic Bread', 'Appetizer', 6.99, 15);

-- Inserting data into the order_delivery_status table
INSERT INTO order_delivery_status (orderdel_id, delivery_date, status, order_id)
VALUES 
    (1, '2024-02-05', 'Delivered', '1A'),
    (2, '2024-02-06', 'Pending', '2B'),
    (3, '2024-02-07', 'Delivered', '3C'),
    (4, '2024-02-08', 'Pending', '4D'),
    (5, '2024-02-09', 'Delivered', '5E'),
    (6, '2024-02-10', 'Pending', '6F'),
    (7, '2024-02-11', 'Delivered', '7G'),
    (8, '2024-02-12', 'Pending', '8H'),
    (9, '2024-02-13', 'Delivered', '9I'),
    (10, '2024-02-14', 'Pending', '10J'),
    (11, '2024-02-15', 'Delivered', '11K'),
    (12, '2024-02-16', 'Pending', '12L'),
    (13, '2024-02-17', 'Delivered', '13M'),
    (14, '2024-02-18', 'Pending', '14N'),
    (15, '2024-02-19', 'Delivered', '15O');

-- Inserting data into the staff_information table
INSERT INTO staff_information (staff_id, role, salary, hire_date)
VALUES 
    (1, 'Waiter', '2000', '2022-01-01'),
    (2, 'Chef', '3000', '2022-01-15'),
    (3, 'Manager', '4000', '2022-02-01'),
    (4, 'Bartender', '2500', '2022-02-15'),
    (5, 'Host/Hostess', '1800', '2022-03-01'),
    (6, 'Sous Chef', '3200', '2022-03-15'),
    (7, 'Server', '2000', '2022-04-01'),
    (8, 'Dishwasher', '1800', '2022-04-15'),
    (9, 'Line Cook', '2400', '2022-05-01'),
    (10, 'Busser', '1700', '2022-05-15'),
    (11, 'Food Runner', '1700', '2022-06-01'),
    (12, 'Prep Cook', '2000', '2022-06-15'),
    (13, 'Head Chef', '4000', '2022-07-01'),
    (14, 'Floor Manager', '3500', '2022-07-15'),
    (15, 'Sommelier', '3000', '2022-08-01');

-- Inserting data into the orders table
INSERT INTO orders (order_id, order_date, quantity, total_cost, booking_id, orderdel_id, staff_id, customer_id, menu_id)
VALUES 
    (1, '2024-02-05', 2, 31.98, 1, 1, 1, 1, 1),
    (2, '2024-02-06', 1, 21.98, 2, 2, 2, 2, 2),
    (3, '2024-02-07', 3, 56.97, 3, 3, 1, 3, 2),
    (4, '2024-02-08', 2, 39.98, 4, 4, 3, 4, 3),
    (5, '2024-02-09', 1, 13.99, 5, 5, 4, 5, 4),
    (6, '2024-02-10', 4, 75.96, 6, 6, 5, 6, 5),
    (7, '2024-02-11', 3, 38.97, 7, 7, 6, 7, 6),
    (8, '2024-02-12', 2, 25.98, 8, 8, 7, 8, 7),
    (9, '2024-02-13', 1, 12.99, 9, 9, 8, 9, 8),
    (10, '2024-02-14', 4, 39.96, 10, 10, 9, 10, 9),
    (11, '2024-02-15', 3, 29.97, 11, 11, 10, 11, 10),
    (12, '2024-02-16', 2, 31.98, 12, 12, 11, 12, 11),
    (13, '2024-02-17', 1, 16.99, 13, 13, 12, 13, 12),
    (14, '2024-02-18', 4, 51.96, 14, 14, 13, 14, 13),
    (15, '2024-02-19', 3, 38.97, 15, 15, 14, 15, 14);
    