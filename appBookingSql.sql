create database app_booking_db;

use app_booking_db;

CREATE TABLE place (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    image_url VARCHAR(255),
    rating DOUBLE
);

INSERT INTO place (name, image_url, rating) VALUES
('Hoi An', 'https://cleverlearnvietnam.com/wp-content/uploads/2019/05/hoian-e1559273078151.jpg', 4.0),
('Sai Gon', 'https://cdn3.ivivu.com/2018/01/ve-dep-sai-gon-qua-ong-kinh-cua-nguoi-me-anh-ivivu-2.jpg', 4.5),
('Da Nang', 'https://cdn-media.sforum.vn/storage/app/media/ctvseo_MH/%E1%BA%A3nh%20%C4%91%E1%BA%B9p%20%C4%91%C3%A0%20n%E1%BA%B5ng/anh-dep-da-nang-thumb.jpg', 4.2),
('Ha Noi', 'https://hoanghamobile.com/tin-tuc/wp-content/uploads/2024/04/anh-ha-noi.jpg', 4.8);