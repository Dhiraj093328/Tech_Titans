create database saloon_management;

use saloon_management;

CREATE TABLE shop_owner (
    shop_owner_id INT AUTO_INCREMENT PRIMARY KEY,

    shop_name VARCHAR(100) NOT NULL,
    registration_no VARCHAR(50) NOT NULL,

    owner_name VARCHAR(100) NOT NULL,

    opening_time TIME NOT NULL,
    closing_time TIME NOT NULL,

    email VARCHAR(100) NOT NULL,
    contact_no VARCHAR(15) NOT NULL,

    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL
);

CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,

    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    contact_no VARCHAR(15) NOT NULL,

    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL
);

CREATE TABLE therapist (
    therapist_id INT AUTO_INCREMENT PRIMARY KEY,

    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    contact_no VARCHAR(15) NOT NULL,

    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL
);

CREATE TABLE appointments (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,

    user_id INT NOT NULL,
    shop_owner_id INT NOT NULL,

    appointment_date DATE NOT NULL,
    time_slot TIME NOT NULL,

    status VARCHAR(20) DEFAULT 'PENDING',

    FOREIGN KEY (user_id) REFERENCES users(user_id)
        ON DELETE CASCADE,

    FOREIGN KEY (shop_owner_id) REFERENCES shop_owner(shop_owner_id)
        ON DELETE CASCADE
);
show tables;

