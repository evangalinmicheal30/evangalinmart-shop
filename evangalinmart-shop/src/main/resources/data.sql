-- Sample catalog data, loaded automatically on startup (see application.properties).
-- Runs only against an empty table on first run with ddl-auto=update.

INSERT INTO products (name, description, category, price, stock_quantity, image_url) VALUES
('Basmati Rice 5kg', 'Premium long-grain basmati rice', 'Groceries', 450.00, 50, ''),
('Sunflower Oil 1L', 'Refined sunflower cooking oil', 'Groceries', 180.00, 80, ''),
('Toor Dal 1kg', 'High-quality split pigeon peas', 'Groceries', 140.00, 60, ''),
('Wheat Atta 5kg', 'Whole wheat flour, stone-ground', 'Groceries', 260.00, 40, ''),
('Turmeric Powder 200g', 'Pure turmeric powder', 'Spices', 60.00, 100, ''),
('Red Chilli Powder 200g', 'Spicy red chilli powder', 'Spices', 70.00, 100, ''),
('Tea Powder 500g', 'Strong Assam tea powder', 'Beverages', 220.00, 70, ''),
('Coffee Powder 200g', 'Filter coffee powder', 'Beverages', 190.00, 55, '');
