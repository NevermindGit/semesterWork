DROP table if exists users;
DROP table if exists products;
DROP table if exists basket;
DROP table if exists profiles;
DROP TABLE if exists product_parameters;
DROP TABLE if exists favourite;

CREATE TABLE users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    login varchar(20) NOT NULL,
    phone varchar(11) NOT NULL,
    password varchar(100) NOT NULL
    );

CREATE TABLE profiles (
    profile_id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER NOT NULL,
    name varchar(40) NOT NULL,
    profile_image varchar(20),
    description varchar(300),
    FOREIGN KEY (user_id) REFERENCES users(id));

CREATE TABLE products (
    product_id INTEGER PRIMARY KEY AUTOINCREMENT,
    u_id INTEGER REFERENCES users(id),
    name varchar(100) NOT NULL,
    product_image varchar(20),
    price INTEGER NOT NULL,
    description varchar(300) NOT NULL);

CREATE TABLE product_parameters(
    p_id REFERENCES products(product_id),
    size INTEGER NOT NULL,
    maker varchar(30) NOT NULL
);

CREATE TABLE basket(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id REFERENCES users(id),
    pic_id REFERENCES products(product_id) /* pic - product in cart */
);
CREATE table favourite(
    user_id REFERENCES users(id),
    pic_id REFERENCES products(product_id)
)
