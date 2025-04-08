create database app_booking_db;

use app_booking_db;

CREATE TABLE place (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    image_url VARCHAR(255),
    rating DOUBLE
);