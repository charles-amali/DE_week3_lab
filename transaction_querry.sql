START TRANSACTION;

-- Insert new order
INSERT INTO Orders (order_id, customer_id, orderDate)
VALUES ('005', '001', '2024-11-18');

-- Insert order details
INSERT INTO order_details (order_details_id , order_id, product_id, quantity, total)
VALUES
('1001', '005', '101', 1, 1000),
('1002', '005', '102', 2, 1000);

--  Update product stock
UPDATE products
SET quantity = quantity - 1
WHERE product_id = '101';

UPDATE products
SET quantity = quantity - 2
WHERE products_id = '102';

-- Commit transaction if all steps succeed
COMMIT;




-- CREATE TABLE order_details (
--     order_details_id INT NOT NULL PRIMARY KEY,
--     order_id INT NOT NULL,
--     product_id INT NOT NULL,
--     quantity INT ,
--     total DECIMAL(10, 2),
--     FOREIGN KEY (order_id) REFERENCES orders(order_id),
--     FOREIGN KEY (product_id) REFERENCES products(product_id)
-- );