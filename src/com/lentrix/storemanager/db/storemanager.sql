/**
 * Author:  lentrix
 * Created: 21 Apr 2021
 */

DROP DATABASE IF EXISTS storemanager;
CREATE DATABASE storemanager;
USE storemanager;

CREATE TABLE `users` (
    `id`            INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `fullname`      VARCHAR(90) NOT NULL,
    `username`      VARCHAR(25) NOT NULL,
    `password`      VARCHAR(225) NOT NULL,
    `role`          ENUM('admin','cashier') DEFAULT 'cashier',
    `last_login`    TIMESTAMP
);

INSERT INTO `users` (`fullname`, `username`, `password`, `role`, `last_login`)
VALUES  ('Benjie B. Lenteria', 'lentrix', MD5('password'), 'admin', NOW()),
        ('Emily Barrentos', 'emz20', MD5('password'), 'cashier', NOW() ),
        ('Sophie Garreta', 'sophie', MD5('password'), 'cashier', NOW() );
CREATE TABLE `logs` (
    `id`            BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `user_id`       INTEGER UNSIGNED NOT NULL,
    `log`           VARCHAR(225) NOT NULL,
    FOREIGN KEY(`user_id`) REFERENCES users(`id`)
);

CREATE TABLE `items` (
    `id`            BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `bar_code`      VARCHAR(90) UNIQUE,
    `name`          VARCHAR(100) NOT NULL,
    `description`   VARCHAR(200) NOT NULL,
    `volume`        VARCHAR(30),
    `ws_unit`       VARCHAR(30) NOT NULL,
    `ws_qty`        INTEGER UNSIGNED NOT NULL,
    `ws_price`      DECIMAL(8,2) NOT NULL,
    `rt_unit`       VARCHAR(30) NOT NULL,
    `rt_price`      DECIMAL(8,2) NOT NULL,
    `qty`           INTEGER UNSIGNED NOT NULL
);

INSERT INTO `items` ( `bar_code`, `name`, `description`, `volume`, `ws_unit`, `ws_qty`, `ws_price`, `rt_unit`, `rt_price`, `qty` )
VALUES  ( '282237256182', 'Downy Expert Antibac' , 'Fabric Conditioner with Antibac in Sachet', '38mL', 'dozen', 12, 78.50, 'sachet', 6.99, 120 ),
        ( '094734738327', 'Efficascent Oil' , 'Methyl Salicylate Camphor+Menthol' , '100mL', 'bottle', 1, 45.60, 'bottle', 45.60, 32 ),
        ( '897654566543', '555 Sardines (Green)' , 'Sardines in Tomato sauce regular', '155g', 'dozen', 12, 250.00, 'can', 21.20, 90 );