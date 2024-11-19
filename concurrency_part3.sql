-- Transaction 1 (Alex's Order)
START TRANSACTION;

-- Place a row-level lock on ProductID 101
SELECT * FROM Products
WHERE ProductID = 101
FOR UPDATE;

-- Decrease StockQuantity by 5
UPDATE Products
SET StockQuantity = StockQuantity - 5
WHERE ProductID = 101;

-- Commit Transaction 1
COMMIT;


-- Transaction 2 (Taylor's Order)
START TRANSACTION;

-- Wait for Transaction 1 to release the lock
SELECT * FROM Products
WHERE ProductID = 101
FOR UPDATE;

-- Verify StockQuantity and decrease by 5
UPDATE Products
SET StockQuantity = StockQuantity - 5
WHERE ProductID = 101;

-- Commit Transaction 2
COMMIT;
