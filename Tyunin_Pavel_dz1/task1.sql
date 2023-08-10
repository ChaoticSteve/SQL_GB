CREATE TABLE MobilePhones(
    id int PRIMARY KEY,
    product_name VARCHAR(45),
    manufacturer VARCHAR(45),
    product_count int,
    price int);
    
INSERT INTO MobilePhones (id, product_name, manufacturer, product_count, price) VALUES
    (1, "IPhone X", "Apple", 3, 76000),
    (2, "IPhone 8", "Apple", 2, 51000),
    (1, "Galaxy S9", "Samsung", 2, 56000),
    (1, "Galaxy S8", "Samsung", 1, 41000),
    (1, "P20 Pro", "Huawei", 5, 360000);

SELECT product_name, manufacturer, price
FROM MobilePhones
WHERE product_count > 2;

SELECT *
FROM MobilePhones
WHERE manufacturer = "Samsung";