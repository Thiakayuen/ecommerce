-- Create the eCommerce database
CREATE DATABASE eCommerce;
USE eCommerce;
-- Table: brand
CREATE TABLE brand (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT
);
INSERT INTO brand (name, description)
VALUES (
        'Nike',
        'World-renowned athletic footwear and apparel'
    ),
    ('Apple', 'Consumer electronics and software'),
    (
        'Samsung',
        'Electronics, appliances, and mobile devices'
    );
-- Table: product_category
CREATE TABLE product_category (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT
);
INSERT INTO product_category (name, description)
VALUES (
        'Clothing',
        'Apparel for men, women, and children'
    ),
    (
        'Electronics',
        'Consumer electronics and gadgets'
    ),
    ('Home Goods', 'Items for the home and living');
-- Table: size_category
CREATE TABLE size_category (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL UNIQUE
);
INSERT INTO size_category (name)
VALUES ('Clothing Sizes'),
    ('Shoe Sizes'),
    ('Electronics Dimensions');
-- Table: size_option
CREATE TABLE size_option (
    id INT PRIMARY KEY AUTO_INCREMENT,
    category_id INT NOT NULL,
    value VARCHAR(50) NOT NULL,
    FOREIGN KEY (category_id) REFERENCES size_category(id)
);
INSERT INTO size_option (category_id, value)
VALUES (1, 'S'),
    (1, 'M'),
    (1, 'L'),
    (2, 'US 7'),
    (2, 'US 8'),
    (3, 'Compact'),
    (3, 'Large');
-- Table: color
CREATE TABLE color (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL UNIQUE,
    hex_code VARCHAR(10)
);
INSERT INTO color (name, hex_code)
VALUES ('Red', '#FF0000'),
    ('Blue', '#0000FF'),
    ('Black', '#000000'),
    ('White', '#FFFFFF');
-- Table: product
CREATE TABLE product (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    brand_id INT NOT NULL,
    category_id INT NOT NULL,
    base_price DECIMAL(10, 2) NOT NULL,
    description TEXT,
    FOREIGN KEY (brand_id) REFERENCES brand(id),
    FOREIGN KEY (category_id) REFERENCES product_category(id)
);
INSERT INTO product (
        name,
        brand_id,
        category_id,
        base_price,
        description
    )
VALUES (
        'T-Shirt',
        1,
        1,
        25.00,
        'Comfortable cotton t-shirt'
    ),
    (
        'iPhone 15',
        2,
        2,
        999.00,
        'Latest generation smartphone'
    ),
    (
        'Smart TV',
        3,
        2,
        499.00,
        'High-definition smart television'
    ),
    (
        'Coffee Maker',
        3,
        3,
        75.00,
        'Automatic drip coffee maker'
    );
-- Table: product_variation
CREATE TABLE product_variation (
    id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT NOT NULL,
    size_option_id INT,
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT DEFAULT 50,
    sku VARCHAR(255) UNIQUE,
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (size_option_id) REFERENCES size_option(id)
);
INSERT INTO product_variation (
        product_id,
        size_option_id,
        price,
        stock_quantity,
        sku
    )
VALUES (1, 1, 25.00, 100, 'TS-NIKE-S'),
    (1, 2, 25.00, 120, 'TS-NIKE-M'),
    (2, 6, 1049.00, 30, 'IPH15-COMPACT'),
    (3, 7, 549.00, 25, 'TV-SAMSUNG-L');
-- Table: product_item
CREATE TABLE product_item (
    id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT NOT NULL,
    color_id INT,
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT DEFAULT 100,
    sku VARCHAR(255) UNIQUE,
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (color_id) REFERENCES color(id)
);
INSERT INTO product_item (product_id, color_id, price, stock_quantity, sku)
VALUES (1, 1, 25.00, 150, 'TS-NIKE-RED'),
    (1, 3, 25.00, 130, 'TS-NIKE-BLACK'),
    (2, 4, 999.00, 40, 'IPH15-WHITE'),
    (3, 3, 499.00, 35, 'TV-SAMSUNG-BLACK'),
    (4, NULL, 75.00, 60, 'CM-SAMSUNG-001');
-- Table: product_image
CREATE TABLE product_image (
    id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT NOT NULL,
    image_url VARCHAR(255) NOT NULL,
    FOREIGN KEY (product_id) REFERENCES product(id)
);
INSERT INTO product_image (product_id, image_url)
VALUES (1, '/images/nike_tshirt_red.jpg'),
    (1, '/images/nike_tshirt_black.jpg'),
    (2, '/images/iphone15_white.jpg'),
    (3, '/images/samsung_tv.jpg'),
    (4, '/images/samsung_coffeemaker.jpg');
-- Table: attribute_category
CREATE TABLE attribute_category (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL UNIQUE
);
INSERT INTO attribute_category (name)
VALUES ('Material'),
    ('Features'),
    ('Dimensions');
-- Table: attribute_type
CREATE TABLE attribute_type (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL UNIQUE,
    data_type VARCHAR(50) NOT NULL
);
INSERT INTO attribute_type (name, data_type)
VALUES ('Fabric', 'TEXT'),
    ('Waterproof', 'BOOLEAN'),
    ('Weight', 'DECIMAL');
-- Table: product_attribute
CREATE TABLE product_attribute (
    id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT NOT NULL,
    category_id INT NOT NULL,
    type_id INT NOT NULL,
    value VARCHAR(255),
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (category_id) REFERENCES attribute_category(id),
    FOREIGN KEY (type_id) REFERENCES attribute_type(id)
);
INSERT INTO product_attribute (product_id, category_id, type_id, value)
VALUES (1, 1, 1, 'Cotton'),
    (2, 2, 2, 'TRUE'),
    (3, 3, 3, '55 inches');