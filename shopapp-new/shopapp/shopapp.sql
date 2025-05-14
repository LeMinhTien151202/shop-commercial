-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 14, 2025 at 03:39 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shopapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int NOT NULL,
  `name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(5, 'Đồ công nghệ'),
(2, 'Đồ điện tử'),
(3, 'Đồ gia dụng'),
(6, 'đồ mỹ nghệ tốt nhất'),
(4, 'Hàng Bánh kẹo');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int NOT NULL,
  `product_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `product_id`, `user_id`, `content`, `created_at`, `updated_at`) VALUES
(1, 1, 14, 'this is user comment', '2025-03-27 14:03:07', '2025-03-27 14:03:07'),
(2, 1, 14, 'this is user comment second 2 update', '2025-03-27 14:18:05', '2025-03-27 14:21:21');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` int NOT NULL,
  `code` varchar(50) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `active`) VALUES
(1, 'HEAVEN', 1),
(2, 'DISCOUNT20', 1);

-- --------------------------------------------------------

--
-- Table structure for table `coupon_conditions`
--

CREATE TABLE `coupon_conditions` (
  `id` int NOT NULL,
  `coupon_id` int NOT NULL,
  `attribute` varchar(255) NOT NULL,
  `operator` varchar(10) NOT NULL,
  `value` varchar(255) NOT NULL,
  `discount_amount` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `coupon_conditions`
--

INSERT INTO `coupon_conditions` (`id`, `coupon_id`, `attribute`, `operator`, `value`, `discount_amount`) VALUES
(1, 1, 'minimum_amount', '>', '100', 10.00),
(2, 1, 'applicable_date', 'BETWEEN', '2025-03-29', 5.00),
(3, 2, 'minimum_amount', '>', '200', 20.00);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `fullname` varchar(100) DEFAULT '',
  `email` varchar(100) DEFAULT '',
  `phone_number` varchar(20) NOT NULL,
  `address` varchar(200) NOT NULL,
  `note` varchar(100) DEFAULT '',
  `order_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` enum('pending','processing','shipped','delivered','cancelled') DEFAULT NULL COMMENT 'Trạng thái đơn hàng',
  `total_money` float DEFAULT NULL,
  `shipping_method` varchar(100) DEFAULT NULL,
  `shipping_address` varchar(200) DEFAULT NULL,
  `shipping_date` date DEFAULT NULL,
  `tracking_number` varchar(100) DEFAULT NULL,
  `payment_method` varchar(100) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  `coupon_id` int DEFAULT NULL
) ;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `fullname`, `email`, `phone_number`, `address`, `note`, `order_date`, `status`, `total_money`, `shipping_method`, `shipping_address`, `shipping_date`, `tracking_number`, `payment_method`, `active`, `coupon_id`) VALUES
(1, 21, 'nguyen van an', 'vlt@gmail.com', '098467', 'viet nam ha', 'nhan vat dac biet', NULL, 'processing', 123, 'oto', NULL, NULL, NULL, 'cod', 0, NULL),
(2, 22, 'Eric Thompson', 'eric@example.com', '9876543210', '456 Elm St', 'Note 2', '2025-03-23 23:02:48', 'pending', 400, NULL, NULL, NULL, NULL, NULL, 1, NULL),
(3, 21, 'Hans', 'hans@example.com', '5555555555', '789 Oak St', 'Note 3', '2025-03-23 23:02:48', 'pending', 300, NULL, NULL, NULL, NULL, NULL, 1, NULL),
(4, 22, 'Alice Johnson', 'alice@example.com', '5551234567', '789 Cherry Ave', 'Note 4', '2025-03-23 23:02:48', 'pending', 200, NULL, NULL, NULL, NULL, NULL, 1, NULL),
(5, 21, 'Robert Williams', 'robert@example.com', '5559876543', '321 Maple Rd', 'Note 5', '2025-03-23 23:02:48', 'pending', 100, NULL, NULL, NULL, NULL, NULL, 1, NULL),
(6, 21, 'Sarah Davis', 'sarah@example.com', '5554445555', '987 Elm St', 'Note 6', '2025-03-23 23:02:48', 'pending', 250, NULL, NULL, NULL, NULL, NULL, 1, NULL),
(7, 22, 'Michael Anderson', 'michael@example.com', '5556667777', '654 Oak Ave', 'Note 7', '2025-03-23 23:02:48', 'pending', 350, NULL, NULL, NULL, NULL, NULL, 1, NULL),
(8, 21, 'Emma Wilson', 'emma@example.com', '5558889999', '789 Maple Ln', 'Note 8', '2025-03-23 23:02:48', 'pending', 450, NULL, NULL, NULL, NULL, NULL, 1, NULL),
(9, 21, 'Olivia Brown', 'olivia@example.com', '5551112222', '987 Pine St', 'Note 47', '2025-03-23 23:02:48', 'pending', 350, NULL, NULL, NULL, NULL, NULL, 1, NULL),
(10, 22, 'William Davis', 'william@example.com', '5553334444', '654 Elm Ave', 'Note 48', '2025-03-23 23:02:48', 'pending', 250, NULL, NULL, NULL, NULL, NULL, 1, NULL),
(11, 21, 'Sophia Wilson', 'sophia@example.com', '5555556666', '789 Oak Ln', 'Note 49', '2025-03-23 23:02:48', 'pending', 150, NULL, NULL, NULL, NULL, NULL, 1, NULL),
(12, 22, 'Alexander Anderson', 'alexander@example.com', '5557778888', '456 Maple Lane', 'Note 50', '2025-03-23 23:02:48', 'pending', 450, NULL, NULL, NULL, NULL, NULL, 1, NULL),
(13, 21, 'Ava Thompson', 'ava@example.com', '5559990000', '987 Walnut Rd', 'Note 51', '2025-03-23 23:02:48', 'pending', 550, NULL, NULL, NULL, NULL, NULL, 1, NULL),
(14, 22, 'Daniel Johnson', 'daniel@example.com', '5552223333', '654 Pine Ave', 'Note 52', '2025-03-23 23:02:48', 'pending', 650, NULL, NULL, NULL, NULL, NULL, 1, NULL),
(15, 21, 'Mia Williams', 'mia@example.com', '5554445555', '789 Elm St', 'Note 53', '2025-03-23 23:02:48', 'pending', 750, NULL, NULL, NULL, NULL, NULL, 1, NULL),
(16, 22, 'James Davis', 'james@example.com', '5556667777', '456 Oak Ave', 'Note 54', '2025-03-23 23:02:48', 'pending', 850, NULL, NULL, NULL, NULL, NULL, 1, NULL),
(17, 22, 'Benjamin Thompson', 'benjamin@example.com', '5550001111', '654 Walnut Rd', 'Note 56', '2025-03-23 23:02:48', 'pending', 550, NULL, NULL, NULL, NULL, NULL, 1, NULL),
(18, 21, 'Sophia Anderson', 'sophia@example.com', '5551112222', '987 Pine St', 'Note 57', '2025-03-23 23:02:48', 'pending', 350, NULL, NULL, NULL, NULL, NULL, 1, NULL),
(19, 22, 'Elijah Davis', 'elijah@example.com', '5553334444', '654 Elm Ave', 'Note 58', '2025-03-23 23:02:48', 'pending', 250, NULL, NULL, NULL, NULL, NULL, 1, NULL),
(20, 21, 'Ava Wilson', 'ava@example.com', '5555556666', '789 Oak Ln', 'Note 59', '2025-03-23 23:02:48', 'pending', 150, NULL, NULL, NULL, NULL, NULL, 1, NULL),
(21, 22, 'Oliver Thompson', 'oliver@example.com', '5557778888', '456 Maple Lane', 'Note 60', '2025-03-23 23:02:48', 'pending', 450, NULL, NULL, NULL, NULL, NULL, 1, NULL),
(22, 21, 'Mia Johnson', 'mia@example.com', '5559990000', '987 Walnut Rd', 'Note 61', '2025-03-23 23:02:48', 'pending', 550, NULL, NULL, NULL, NULL, NULL, 1, NULL),
(23, 22, 'James Williams', 'james@example.com', '5552223333', '654 Pine Ave', 'Note 62', '2025-03-23 23:02:48', 'pending', 650, NULL, NULL, NULL, NULL, NULL, 1, NULL),
(24, 21, 'Charlotte Davis', 'charlotte@example.com', '5554445555', '789 Elm St', 'Note 63', '2025-03-23 23:02:48', 'pending', 750, NULL, NULL, NULL, NULL, NULL, 1, NULL),
(25, 22, 'Benjamin Wilson', 'benjamin@example.com', '5556667777', '456 Oak Ave', 'Note 64', '2025-03-23 23:02:48', 'pending', 850, NULL, NULL, NULL, NULL, NULL, 1, NULL),
(26, 21, 'Amelia Thompson', 'amelia@example.com', '5558889999', '321 Maple Ln', 'Note 65', '2025-03-23 23:02:48', 'pending', 950, NULL, NULL, NULL, NULL, NULL, 1, NULL),
(27, 22, 'Henry Johnson', 'henry@example.com', '5550001111', '654 Walnut Rd', 'Note 66', '2025-03-23 23:02:48', 'pending', 550, NULL, NULL, NULL, NULL, NULL, 1, NULL),
(28, 22, 'Emily Davis', 'emily@example.com', '5552223333', '456 Walnut Lane', 'Note 46', '2025-03-23 23:02:48', 'pending', 150, NULL, NULL, NULL, NULL, NULL, 1, NULL),
(29, 21, 'nguyen van b', 'vlt@gmail.com', '09845897', 'viet nam han', 'nhan vat dac biet', '2025-03-25 00:00:00', 'pending', 123.45, 'oto', 'nha rieng', '2025-03-25', NULL, 'cod', 1, NULL),
(30, 21, 'hoàng xx', 'hoang234@gmail.com', '11445547', 'nhà x ngõ y', 'dễ vỡ', '2025-03-26 00:00:00', 'pending', 34.6, 'express', NULL, '2025-03-26', NULL, 'cod', 1, NULL),
(31, 21, 'nguyen van b', 'vlt@gmail.com', '09845897', 'viet nam han', 'nhan vat dac biet', '2025-03-27 00:00:00', 'pending', 123.45, 'oto', 'nha rieng', '2025-03-27', NULL, 'cod', 1, NULL),
(32, 23, 'hoàng xx', 'hoang234@gmail.com', '11445547', 'nhà x ngõ y', 'dễ vỡ', '2025-04-01 00:00:00', 'pending', 111.07, 'express', NULL, '2025-04-01', NULL, 'cod', 1, NULL),
(33, 23, 'hoàng vlxx', 'hoang234@gmail.com', '11445547', 'nhà x ngõ y', 'dễ vỡ', '2025-04-03 00:00:00', 'pending', 434.31, 'express', NULL, '2025-04-03', NULL, 'cod', 1, NULL),
(34, 23, 'hoàng xx', 'hoang234@gmail.com', '11445547', 'nhà x ngõ y', 'dễ vỡ', '2025-04-03 00:00:00', 'pending', 265.68, 'express', NULL, '2025-04-03', NULL, 'cod', 1, NULL),
(35, 29, 'hoàng xx', 'hoang234@gmail.com', '11445547', 'nhà x ngõ y', 'dễ vỡ', '2025-04-03 00:00:00', 'pending', 263.87, 'express', NULL, '2025-04-03', NULL, 'cod', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` int NOT NULL,
  `order_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `number_of_products` int DEFAULT '1',
  `total_money` decimal(10,2) DEFAULT '0.00',
  `color` varchar(20) DEFAULT '',
  `coupon_id` int DEFAULT NULL
) ;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `price`, `number_of_products`, `total_money`, `color`, `coupon_id`) VALUES
(1, 2, 2, 12.34, 4, 34.56, '#000000', NULL),
(2, 1, 2, 5.99, 3, 17.97, 'Blue', NULL),
(3, 1, 3, 8.49, 1, 8.49, 'Green', NULL),
(4, 2, 1, 10.99, 2, 21.98, 'Red', NULL),
(5, 2, 2, 5.99, 3, 17.97, 'Blue', NULL),
(6, 2, 3, 8.49, 1, 8.49, 'Green', NULL),
(7, 3, 6, 12.99, 3, 38.97, 'Purple', NULL),
(8, 4, 7, 6.99, 1, 6.99, 'Pink', NULL),
(9, 5, 8, 14.99, 2, 29.98, 'Gray', NULL),
(10, 6, 9, 11.49, 1, 11.49, 'Brown', NULL),
(11, 7, 10, 8.99, 3, 26.97, 'Black', NULL),
(12, 8, 11, 13.99, 2, 27.98, 'Silver', NULL),
(13, 9, 12, 10.49, 1, 10.49, 'Gold', NULL),
(14, 10, 13, 7.49, 2, 14.98, 'White', NULL),
(15, 11, 1, 10.99, 2, 21.98, 'Red', NULL),
(16, 11, 2, 5.99, 3, 17.97, 'Blue', NULL),
(17, 11, 3, 8.49, 1, 8.49, 'Green', NULL),
(18, 11, 14, 9.99, 2, 19.98, 'Red', NULL),
(19, 12, 15, 5.99, 3, 17.97, 'Blue', NULL),
(20, 13, 16, 8.49, 1, 8.49, 'Green', NULL),
(21, 14, 17, 10.99, 2, 21.98, 'Yellow', NULL),
(22, 15, 18, 5.99, 3, 17.97, 'Orange', NULL),
(23, 16, 19, 8.49, 1, 8.49, 'Purple', NULL),
(24, 17, 20, 6.99, 2, 13.98, 'Pink', NULL),
(25, 17, 21, 14.99, 1, 14.99, 'Gray', NULL),
(26, 17, 22, 11.49, 3, 34.47, 'Brown', NULL),
(27, 18, 23, 8.99, 2, 17.98, 'Black', NULL),
(28, 18, 24, 13.99, 1, 13.99, 'Silver', NULL),
(29, 18, 25, 10.49, 3, 31.47, 'Gold', NULL),
(30, 19, 26, 7.49, 2, 14.98, 'White', NULL),
(31, 19, 27, 9.99, 1, 9.99, 'Red', NULL),
(32, 19, 28, 5.99, 3, 17.97, 'Blue', NULL),
(33, 20, 29, 8.49, 1, 8.49, 'Green', NULL),
(34, 20, 30, 10.99, 2, 21.98, 'Yellow', NULL),
(35, 20, 31, 5.99, 3, 17.97, 'Orange', NULL),
(36, 21, 32, 8.49, 1, 8.49, 'Purple', NULL),
(37, 21, 33, 6.99, 2, 13.98, 'Pink', NULL),
(38, 21, 34, 14.99, 1, 14.99, 'Gray', NULL),
(39, 22, 35, 11.49, 3, 34.47, 'Brown', NULL),
(40, 22, 36, 8.99, 2, 17.98, 'Black', NULL),
(41, 22, 37, 13.99, 1, 13.99, 'Silver', NULL),
(42, 23, 38, 10.49, 3, 31.47, 'Gold', NULL),
(43, 23, 39, 7.49, 2, 14.98, 'White', NULL),
(44, 23, 40, 9.99, 1, 9.99, 'Red', NULL),
(45, 24, 41, 5.99, 3, 17.97, 'Blue', NULL),
(46, 24, 42, 8.49, 1, 8.49, 'Green', NULL),
(47, 24, 43, 10.99, 2, 21.98, 'Yellow', NULL),
(48, 25, 44, 5.99, 3, 17.97, 'Orange', NULL),
(49, 25, 45, 8.49, 1, 8.49, 'Purple', NULL),
(50, 25, 46, 6.99, 2, 13.98, 'Pink', NULL),
(51, 29, 1, 34.60, 3, NULL, NULL, NULL),
(52, 29, 3, 76.40, 3, NULL, NULL, NULL),
(53, 29, 5, 56.80, 7, NULL, NULL, NULL),
(54, 2, 4, 12.34, 3, 34.56, '#666666', NULL),
(55, 30, 1, 34.60, 1, NULL, NULL, NULL),
(56, 31, 1, 34.60, 3, NULL, NULL, NULL),
(57, 31, 3, 76.40, 3, NULL, NULL, NULL),
(58, 31, 5, 56.80, 7, NULL, NULL, NULL),
(59, 32, 1, 34.67, 1, NULL, NULL, NULL),
(60, 32, 3, 76.40, 1, NULL, NULL, NULL),
(61, 33, 1, 34.67, 3, NULL, NULL, NULL),
(62, 33, 5, 56.80, 3, NULL, NULL, NULL),
(63, 33, 8, 53.30, 3, NULL, NULL, NULL),
(64, 34, 2, 23.40, 3, NULL, NULL, NULL),
(65, 34, 1, 34.67, 4, NULL, NULL, NULL),
(66, 34, 5, 56.80, 1, NULL, NULL, NULL),
(67, 35, 1, 34.67, 1, NULL, NULL, NULL),
(68, 35, 3, 76.40, 3, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int NOT NULL,
  `name` varchar(350) DEFAULT NULL COMMENT 'Tên sản phẩm',
  `price` decimal(10,2) DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `description` longtext,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `category_id` int DEFAULT NULL
) ;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `thumbnail`, `description`, `created_at`, `updated_at`, `category_id`) VALUES
(1, 'ghế ngồi đa năng ', 34.67, 'd167307d-2e3b-49f6-b468-ce0608146732_bandoi.jpg', 'hihihihihihi', '2025-03-04 13:23:32', '2025-04-02 14:11:29', 3),
(2, 'Ergonomic Copper Plate', 23.40, '9fc80bb1-4372-4583-8f72-fd98e0b6e87b_angel-face.jpg', 'Ullam et est.', '2025-03-06 14:11:50', '2025-03-06 14:11:50', 2),
(3, 'Small Paper Shoes', 76.40, '70688036-0cde-4933-b8f5-686567b62349_country.jpg', 'Facilis aperiam natus blanditiis.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 2),
(4, 'Durable Copper Wallet', 23.50, '26359591-2ecc-4d9d-a0b9-816d2b04d2dd_cungtrang.jpg', 'Rerum cupiditate qui reprehenderit.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 4),
(5, 'Fantastic Paper Hat', 56.80, 'da5615be-94d5-4344-9cd4-3606efaead6a_edc.jpg', 'Quidem quis velit.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 3),
(6, 'Synergistic Linen Hat', 23.45, NULL, 'this is des', '2025-03-06 14:11:51', '2025-03-25 06:20:03', 2),
(7, 'Sleek Aluminum Computer', 73.90, '27fd13a4-186e-4cc0-8b6b-1701b294ff81_instrumental.jpg', 'Porro aut enim vitae.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 2),
(8, 'Small Paper Gloves', 53.30, '3cb997fc-cb62-48f5-a58f-078b7b1512ba_jjam.jpg', 'Quam incidunt sed ad hic commodi expedita.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 4),
(9, 'Gorgeous Wooden Coat', 22.40, '097b1176-4b5f-4f99-89b8-217055371d9f_love-elution.jpg', 'Ducimus et ut qui facere voluptates at.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 3),
(10, 'Mediocre Aluminum Shoes', 29.20, 'b4b2388d-3433-4aa6-a0e0-78af37e00985_mrtt.jpg', 'Molestiae saepe quo ipsa.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 3),
(11, 'Awesome Aluminum Hat', 84.20, '7dca75bd-bb7a-46e7-a1e1-6bceeed8e097_nhactre.jpg', 'Animi in harum.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 2),
(12, 'Sleek Cotton Wallet', 9.00, 'ca316a68-6e9a-446f-8aa3-61f3debbac9b_piano.jpg', 'Molestiae saepe omnis.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 4),
(13, 'Ergonomic Granite Plate', 30.90, '6a10f7f2-4afb-48d3-8ea7-ec0d18c97820_rapviet.jpg', 'Earum iste aut.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 3),
(14, 'Practical Aluminum Wallet', 165631.00, '80ae8d86-9549-44d4-9eb7-158f58c1d706_silence.jpg', 'Possimus repellat dolore qui.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 3),
(15, 'Incredible Rubber Clock', 25.80, '772ec3f2-5b21-4b2d-af3f-bcd52a486e2d_slide4.jpg', 'Numquam soluta ipsa.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 3),
(16, 'Gorgeous Iron Computer', 56.50, NULL, 'Reprehenderit ea omnis voluptatibus iusto est quaerat ullam.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 3),
(17, 'Durable Rubber Bottle', 38.20, NULL, 'Libero voluptatem labore at.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 2),
(18, 'Mediocre Wooden Table', 37.60, NULL, 'Aliquid dolor eum dolore eos et natus.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 3),
(19, 'Sleek Wooden Coat', 81.90, NULL, 'Consequuntur maxime velit ipsum inventore.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 2),
(20, 'Mediocre Leather Table', 19.80, NULL, 'Ut vel perspiciatis unde.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 3),
(21, 'Incredible Concrete Bottle', 22.80, NULL, 'In repellat neque accusamus cumque.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 3),
(22, 'Synergistic Iron Computer', 23.00, NULL, 'Molestias ratione mollitia odio quia.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 4),
(23, 'Durable Linen Table', 78.50, NULL, 'Rerum harum repellendus quaerat cum dicta eveniet.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 3),
(24, 'Fantastic Steel Plate', 31.10, NULL, 'Sunt eos dolor.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 3),
(25, 'Synergistic Iron Plate', 78.60, NULL, 'Voluptatem aut facere eos maiores.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 3),
(26, 'Heavy Duty Plastic Chair', 59.80, NULL, 'Aut cum excepturi suscipit.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 3),
(27, 'Intelligent Granite Coat', 79.30, NULL, 'Repellat ut voluptas porro.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 2),
(28, 'Small Silk Keyboard', 51.60, NULL, 'Ipsam omnis quo rerum est est dicta est.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 3),
(29, 'Gorgeous Granite Plate', 20.10, NULL, 'Ea nemo omnis distinctio consequuntur unde saepe.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 3),
(30, 'Intelligent Plastic Gloves', 62.50, NULL, 'Quos nihil inventore voluptas libero impedit a.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 2),
(31, 'Sleek Granite Pants', 88.80, NULL, 'Quidem et consequatur tempore sit tenetur.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 2),
(32, 'Mediocre Copper Computer', 45.00, NULL, 'Quia est ipsum at laboriosam.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 3),
(33, 'Synergistic Iron Knife', 46.20, NULL, 'Tenetur doloribus tempora recusandae.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 4),
(34, 'Synergistic Leather Plate', 32.80, NULL, 'Doloribus delectus nisi.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 4),
(35, 'Mediocre Aluminum Shirt', 43.70, NULL, 'Ut aliquid reiciendis dolore repellat reprehenderit eveniet.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 3),
(36, 'Enormous Steel Bottle', 54.10, NULL, 'Repellendus sit esse autem suscipit.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 3),
(37, 'Aerodynamic Concrete Shoes', 53.20, NULL, 'Asperiores odit velit fugit dolorum qui officia laboriosam.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 3),
(38, 'Practical Wooden Table', 71.80, NULL, 'Impedit quia ipsum dolorem delectus nihil.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 3),
(39, 'Intelligent Wooden Car', 64.20, NULL, 'Voluptatum ut sed qui et dolor consequatur.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 2),
(40, 'Fantastic Paper Wallet', 57.20, NULL, 'Praesentium repellendus sequi optio inventore ut quo.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 3),
(41, 'Mediocre Marble Chair', 75.50, NULL, 'Maiores quos quo et ducimus nihil ducimus.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 3),
(42, 'Ergonomic Granite Pants', 15.00, NULL, 'Dolore porro quasi nobis eum quisquam facere.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 2),
(43, 'Ergonomic Linen Shirt', 65.50, NULL, 'Aliquid illo odio at consequuntur similique corrupti.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 2),
(44, 'Small Iron Table', 71.60, NULL, 'Pariatur quidem totam sit sed.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 2),
(45, 'Intelligent Paper Gloves', 79.00, NULL, 'Qui aspernatur maiores aut sed repellendus aut.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 3),
(46, 'Sleek Leather Table', 41.50, NULL, 'Ipsum optio amet asperiores ipsam non.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 4),
(47, 'Synergistic Paper Lamp', 37.20, NULL, 'Aut quo totam laborum dolores enim eligendi.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 3),
(48, 'Enormous Wool Chair', 87.30, NULL, 'Enim veniam odio modi itaque doloribus laudantium.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 3),
(49, 'Heavy Duty Bronze Knife', 33.50, NULL, 'Neque est iusto.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 3),
(50, 'Aerodynamic Concrete Pants', 73.40, NULL, 'Sint nesciunt est reprehenderit.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 3),
(51, 'Lightweight Iron Bench', 25.70, NULL, 'Minima doloremque incidunt et odio atque expedita exercitationem.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 2),
(52, 'Small Aluminum Shirt', 25.50, NULL, 'Eaque voluptates libero cum enim doloribus.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 3),
(53, 'Heavy Duty Bronze Plate', 7.10, NULL, 'Explicabo vero autem.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 3),
(54, 'Awesome Copper Watch', 8.20, NULL, 'Dolore rerum qui quia magnam.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 3),
(55, 'Durable Steel Knife', 51.50, NULL, 'Numquam quis dolorem.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 2),
(56, 'Ergonomic Silk Bottle', 86.10, NULL, 'Tenetur consequatur unde commodi quia inventore alias velit.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 2),
(57, 'Lightweight Granite Keyboard', 48.00, NULL, 'Rerum et dignissimos sint.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 4),
(58, 'Intelligent Wool Wallet', 56.10, NULL, 'Veniam omnis accusantium eos.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 2),
(59, 'Synergistic Bronze Knife', 13.10, NULL, 'Et est sunt doloribus magnam officia ea at.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 3),
(60, 'Intelligent Plastic Knife', 13.40, NULL, 'Excepturi sequi iusto alias.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 3),
(61, 'Small Bronze Clock', 75.20, NULL, 'Molestias fugiat voluptatem sequi autem ut.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 2),
(62, 'Awesome Wooden Bag', 68.00, NULL, 'Inventore ad laborum culpa amet assumenda incidunt.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 2),
(63, 'Mediocre Leather Wallet', 66.30, NULL, 'Mollitia veritatis sint autem molestias delectus temporibus voluptates.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 3),
(64, 'Durable Linen Lamp', 880167.00, NULL, 'Voluptatibus veritatis recusandae dolor adipisci neque.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 2),
(65, 'Incredible Concrete Keyboard', 46.60, NULL, 'Dolorem aut debitis excepturi.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 2),
(66, 'Awesome Marble Keyboard', 18.60, NULL, 'Blanditiis harum inventore.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 3),
(67, 'Sleek Wool Bottle', 68.90, NULL, 'Autem provident aspernatur eum quam.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 2),
(68, 'Rustic Iron Table', 35.40, NULL, 'Ut occaecati quia animi alias.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 2),
(69, 'Incredible Concrete Bag', 65.00, NULL, 'Numquam enim quisquam consequatur veniam et.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 2),
(70, 'Heavy Duty Leather Car', 69.20, NULL, 'Reprehenderit consequuntur necessitatibus iste fugiat ducimus fugit et.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 3),
(71, 'Small Steel Car', 36.20, NULL, 'Expedita in ut rem dignissimos mollitia culpa ipsam.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 4),
(72, 'Synergistic Plastic Coat', 8.60, NULL, 'Est consectetur reprehenderit.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 3),
(73, 'Enormous Leather Bottle', 1.80, NULL, 'Qui dolore dolorem et pariatur deserunt et aut.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 3),
(74, 'Intelligent Bronze Wallet', 40.80, NULL, 'Numquam vel earum perferendis.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 3),
(75, 'Small Wool Gloves', 23.10, NULL, 'Est molestiae doloremque sit et dolor.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 3),
(76, 'Ergonomic Wool Shirt', 89.70, NULL, 'Sit quibusdam dicta excepturi quia.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 2),
(77, 'Heavy Duty Cotton Bottle', 16.40, NULL, 'Cupiditate beatae ut officia debitis est.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 3),
(78, 'Practical Marble Shoes', 50.90, NULL, 'Rerum cum rerum totam quae blanditiis.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 3),
(79, 'Gorgeous Granite Bench', 32.10, NULL, 'Eum ut esse voluptas quo.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 3),
(80, 'Heavy Duty Wool Bottle', 71.40, NULL, 'A enim omnis.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 3),
(81, 'Heavy Duty Bronze Knife', 73.90, NULL, 'Recusandae voluptatibus ut.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 3),
(82, 'Fantastic Silk Car', 55.80, NULL, 'Dignissimos est et temporibus maiores.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 4),
(83, 'Small Marble Bottle', 69.10, NULL, 'Reiciendis reiciendis et rerum fugiat sunt.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 3),
(84, 'Durable Aluminum Bag', 1.00, NULL, 'Optio nulla aliquid id dolorem est nihil itaque.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 3),
(85, 'Gorgeous Bronze Chair', 23.60, NULL, 'Rem explicabo nemo omnis voluptatum.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 3),
(86, 'Ergonomic Plastic Gloves', 80.70, NULL, 'Soluta velit et voluptas enim in.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 3),
(87, 'Aerodynamic Wooden Gloves', 33.20, NULL, 'Voluptate optio animi quae quia est.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 3),
(88, 'Practical Iron Pants', 68.90, NULL, 'Impedit quibusdam maxime accusamus ut ut ab culpa.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 3),
(89, 'Awesome Rubber Hat', 13.70, NULL, 'Ipsa corrupti beatae incidunt.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 2),
(90, 'Sleek Rubber Shirt', 5.70, NULL, 'Accusantium esse saepe quos reiciendis distinctio non.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 3),
(91, 'Gorgeous Marble Wallet', 89.40, NULL, 'Quasi mollitia delectus.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 2),
(92, 'Fantastic Wool Shirt', 39.60, NULL, 'Eum optio libero hic expedita aut.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 4),
(93, 'Heavy Duty Plastic Computer', 39.30, NULL, 'Ut et quod iste sit ut numquam.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 2),
(94, 'Rustic Marble Lamp', 37.50, NULL, 'Veritatis iste libero sint.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 2),
(95, 'Synergistic Steel Wallet', 35.70, NULL, 'Eum quos sed voluptatem ea error.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 2),
(96, 'Mediocre Paper Knife', 81.10, NULL, 'Necessitatibus asperiores dolor.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 2),
(97, 'Heavy Duty Granite Table', 23.70, NULL, 'Omnis totam ea.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 3),
(98, 'Enormous Copper Watch', 88.00, NULL, 'Est temporibus dolorem deserunt dolore eum.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 2),
(99, 'Intelligent Iron Pants', 6.50, NULL, 'Quis adipisci molestiae.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 3),
(100, 'Ergonomic Rubber Table', 65.60, NULL, 'Eos consequatur quia vero itaque vero.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 3),
(101, 'Enormous Marble Bag', 14.10, NULL, 'Et quia qui.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 2),
(102, 'Heavy Duty Iron Gloves', 56.80, NULL, 'Sunt laboriosam in tempore sit praesentium omnis nostrum.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 4),
(103, 'Lightweight Concrete Plate', 51.50, NULL, 'Quis dolores eveniet eum quae.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 2),
(104, 'Small Aluminum Chair', 12.10, NULL, 'Eos omnis cupiditate.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 3),
(105, 'Sleek Silk Bag', 75.80, NULL, 'Occaecati dignissimos et illo et debitis sit quo.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 2),
(106, 'Ergonomic Copper Computer', 71.90, NULL, 'Cupiditate sapiente et cum consequatur.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 3),
(107, 'Synergistic Granite Shirt', 74.10, NULL, 'Distinctio enim quod.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 3),
(108, 'Fantastic Plastic Bottle', 23.80, NULL, 'Mollitia labore perferendis ipsam itaque quae ut eos.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 3),
(109, 'Rustic Wooden Shirt', 31.80, NULL, 'Corporis numquam praesentium cupiditate.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 2),
(110, 'Fantastic Silk Chair', 66.80, NULL, 'Delectus dolor tempore qui eligendi soluta.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 2),
(111, 'Rustic Silk Wallet', 37.70, NULL, 'Voluptates quia omnis molestiae reprehenderit aliquid amet.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 4),
(112, 'Intelligent Bronze Shirt', 30.20, NULL, 'Inventore qui rerum reiciendis.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 3),
(113, 'Durable Bronze Keyboard', 62.10, NULL, 'Velit doloribus qui.', '2025-03-06 14:11:51', '2025-03-06 14:11:51', 4),
(114, 'Sleek Marble Wallet', 52.10, NULL, 'Harum adipisci qui mollitia ut.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(115, 'Ergonomic Rubber Gloves', 32.50, NULL, 'Omnis ea aut optio soluta.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(116, 'Mediocre Wooden Chair', 40.10, NULL, 'Corrupti laborum eius enim iste sit nemo omnis.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 2),
(117, 'Sleek Wooden Keyboard', 85.30, NULL, 'Quas sint alias fugiat cum quas aut.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(118, 'Enormous Wool Hat', 74.10, NULL, 'Tempore voluptatem dolorem.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 2),
(119, 'Mediocre Wooden Hat', 9.50, NULL, 'Et consectetur non enim et.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(120, 'Sleek Cotton Plate', 86.90, NULL, 'Aliquam ex et at illo.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 2),
(121, 'Lightweight Marble Bottle', 6.90, NULL, 'Molestiae ipsam ut laudantium magnam asperiores.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(122, 'Aerodynamic Wool Pants', 26.10, NULL, 'Sed error ducimus animi fuga.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 4),
(123, 'Ergonomic Wool Plate', 71.50, NULL, 'Inventore est sint voluptatem qui.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 2),
(124, 'Rustic Iron Bottle', 83.80, NULL, 'Libero totam qui.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 4),
(125, 'Intelligent Paper Chair', 29.80, NULL, 'Repellat sed atque cum distinctio.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(126, 'Synergistic Cotton Watch', 82.70, NULL, 'Eum pariatur ipsa.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(127, 'Aerodynamic Rubber Watch', 63.10, NULL, 'Nemo iure voluptatem a quo non enim hic.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(128, 'Synergistic Plastic Bench', 12.80, NULL, 'Eos possimus impedit consequatur quaerat aut.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 2),
(129, 'Incredible Cotton Hat', 68.10, NULL, 'Et repellat molestias.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(130, 'Mediocre Granite Computer', 54.00, NULL, 'Blanditiis tempora ut eum ducimus voluptates.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(131, 'Rustic Concrete Clock', 74.30, NULL, 'Eos voluptatem praesentium est necessitatibus quod.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 4),
(132, 'Gorgeous Cotton Clock', 82.50, NULL, 'Aut atque deleniti molestias numquam iure sed et.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(133, 'Ergonomic Leather Bench', 63.40, NULL, 'Iste fugit est facere.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 2),
(134, 'Intelligent Linen Pants', 37.70, NULL, 'Quidem sed eveniet sunt.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(135, 'Intelligent Leather Shoes', 10.30, NULL, 'Unde voluptate voluptatem nemo atque dolor in.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(136, 'Heavy Duty Iron Shoes', 41.80, NULL, 'Voluptatem soluta architecto dolorem incidunt et optio accusantium.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(137, 'Ergonomic Aluminum Wallet', 10.60, NULL, 'Vel illum aliquam rerum deleniti et ut.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(138, 'Intelligent Cotton Bag', 85.90, NULL, 'Sapiente adipisci ab voluptatem explicabo quo.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 4),
(139, 'Small Cotton Shirt', 62.10, NULL, 'Quia animi accusamus repudiandae.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(140, 'Synergistic Granite Coat', 88.00, NULL, 'Est at ut est quasi fugiat.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(141, 'Durable Copper Shoes', 70.90, NULL, 'Aut voluptates nemo.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(142, 'Mediocre Copper Knife', 5.30, NULL, 'Quisquam quis laborum et possimus.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 2),
(143, 'Aerodynamic Steel Shirt', 66.80, NULL, 'Consectetur tenetur et quam sequi modi suscipit earum.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 2),
(144, 'Ergonomic Copper Knife', 54.10, NULL, 'Sunt quo nulla possimus vitae corrupti quaerat voluptatum.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 4),
(145, 'Heavy Duty Aluminum Bag', 71.50, NULL, 'Sunt quas veniam mollitia.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 2),
(146, 'Gorgeous Paper Coat', 77.80, NULL, 'Voluptatem voluptatem quae voluptatem est.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(147, 'Ergonomic Granite Clock', 80.50, NULL, 'Ipsum hic sit recusandae.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(148, 'Awesome Bronze Bag', 70.10, NULL, 'Id inventore sunt sed quia libero omnis itaque.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 2),
(149, 'Mediocre Bronze Plate', 9.70, NULL, 'Est fugit aut qui quo.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 4),
(150, 'Practical Rubber Gloves', 77.70, NULL, 'Quos laborum explicabo aliquid.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(151, 'Enormous Linen Shirt', 79.00, NULL, 'Quos expedita neque ex deserunt aspernatur.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(152, 'Synergistic Rubber Shirt', 52.00, NULL, 'Commodi tempore vel distinctio suscipit culpa reprehenderit.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 2),
(153, 'Heavy Duty Linen Chair', 83.60, NULL, 'Error incidunt et ut non hic sunt.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(154, 'Incredible Granite Car', 9.30, NULL, 'Est nihil et veritatis quasi neque aperiam.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 2),
(155, 'Intelligent Aluminum Watch', 20.90, NULL, 'Qui quaerat voluptate qui quia reiciendis.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(156, 'Aerodynamic Wooden Table', 62.80, NULL, 'Consequatur est sequi fuga.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(157, 'Heavy Duty Steel Shoes', 5.70, NULL, 'Ut similique est harum.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 2),
(158, 'Mediocre Linen Chair', 84.30, NULL, 'Impedit eveniet in esse aut facere.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 2),
(159, 'Awesome Iron Bottle', 72.20, NULL, 'Et sequi ab et voluptas aperiam.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(160, 'Small Iron Bench', 37.20, NULL, 'Exercitationem et mollitia dolor.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(161, 'Durable Marble Knife', 51.20, NULL, 'Magni eum assumenda similique quos et esse quidem.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(162, 'Ergonomic Concrete Plate', 68.00, NULL, 'Necessitatibus ut quo aspernatur veniam labore aut.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(163, 'Rustic Rubber Shirt', 38.90, NULL, 'Reprehenderit totam itaque a.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 2),
(164, 'Mediocre Plastic Chair', 64.40, NULL, 'Adipisci sit nobis magnam sed quas voluptas.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(165, 'Practical Wooden Car', 58.70, NULL, 'Impedit deserunt porro quia consectetur animi sint.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 2),
(166, 'Gorgeous Aluminum Watch', 49.70, NULL, 'Eveniet sint porro ut fugit harum explicabo qui.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(167, 'Gorgeous Wooden Keyboard', 8.00, NULL, 'Ex sed repellendus aut facilis consequuntur.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 4),
(168, 'Small Cotton Shoes', 48.60, NULL, 'Blanditiis vel a minima ut laboriosam cumque.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 2),
(169, 'Practical Linen Computer', 34.30, NULL, 'Sed quos voluptatibus at dolore reprehenderit.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(170, 'Aerodynamic Copper Bench', 73.20, NULL, 'Amet quibusdam sit voluptatem distinctio aliquid aperiam error.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(171, 'Awesome Steel Clock', 23.80, NULL, 'Et nobis rerum recusandae consequatur officiis esse qui.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 2),
(172, 'Lightweight Wool Car', 54.40, NULL, 'Sit iusto occaecati.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(173, 'Awesome Leather Clock', 57.80, NULL, 'Dicta sit hic sit.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(174, 'Heavy Duty Leather Wallet', 66.90, NULL, 'Ea aliquid quia aperiam architecto nihil vitae nostrum.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(175, 'Enormous Copper Watch', 32.90, NULL, 'Et voluptas similique dolorum.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(176, 'Fantastic Wool Shoes', 40.20, NULL, 'Enim amet esse quibusdam enim laudantium quia.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(177, 'Heavy Duty Paper Bottle', 38.70, NULL, 'Voluptatem sunt laborum quam id magni amet.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 2),
(178, 'Heavy Duty Wool Gloves', 50.00, NULL, 'Similique facilis enim.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(179, 'Small Paper Hat', 67.90, NULL, 'Sequi et nisi pariatur natus nemo est.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 2),
(180, 'Incredible Plastic Watch', 30.10, NULL, 'Et et ratione.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(181, 'Awesome Linen Lamp', 35.60, NULL, 'Distinctio soluta voluptatem odio maxime.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 2),
(182, 'Incredible Wooden Table', 57.60, NULL, 'Nihil molestias adipisci non.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 2),
(183, 'Small Linen Chair', 77.90, NULL, 'Qui ut voluptatibus est molestiae aperiam.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 4),
(184, 'Fantastic Plastic Lamp', 7.40, NULL, 'Modi explicabo ut maiores qui sed eos earum.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 2),
(185, 'Sleek Linen Bag', 2.00, NULL, 'Earum ex autem dignissimos.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(186, 'Lightweight Copper Bottle', 43.20, NULL, 'Dolor eveniet harum facilis in officiis sed.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(187, 'Practical Copper Bottle', 34.70, NULL, 'Quaerat odio sit est iusto.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 2),
(188, 'Gorgeous Leather Wallet', 43.90, NULL, 'Aut dolore dolores accusamus nostrum.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(189, 'Lightweight Steel Watch', 6.40, NULL, 'Odit doloremque maiores qui et.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(190, 'Incredible Paper Clock', 55.60, NULL, 'Architecto qui adipisci animi.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 2),
(191, 'Ergonomic Marble Car', 34.20, NULL, 'Ipsam recusandae aut dolor id inventore.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 2),
(192, 'Aerodynamic Concrete Keyboard', 74.70, NULL, 'Officia doloribus soluta incidunt praesentium.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(193, 'Awesome Bronze Knife', 24.30, NULL, 'Est ea quisquam saepe est accusamus sequi nihil.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 2),
(194, 'Incredible Marble Keyboard', 85.30, NULL, 'Eum ut consequatur incidunt ut dicta.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(195, 'Rustic Linen Shirt', 22.60, NULL, 'Quae illum qui et et.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 2),
(196, 'Intelligent Leather Lamp', 87.80, NULL, 'Sapiente quos accusantium voluptatem numquam enim qui nemo.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 2),
(197, 'Practical Copper Table', 62.40, NULL, 'Natus doloremque voluptatem ea.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(198, 'Small Iron Plate', 59.10, NULL, 'Id error deserunt consequuntur.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 2),
(199, 'Aerodynamic Plastic Gloves', 24.10, NULL, 'Eum exercitationem ullam qui ipsam.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(200, 'Mediocre Silk Clock', 88.90, NULL, 'Voluptate et est amet corporis.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(201, 'Lightweight Silk Plate', 13.50, NULL, 'Saepe inventore consequuntur corrupti deserunt.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 4),
(202, 'Awesome Copper Shoes', 83.30, NULL, 'Enim sit praesentium.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 4),
(203, 'Synergistic Steel Shoes', 56.70, NULL, 'Tenetur quia non.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(204, 'Heavy Duty Aluminum Wallet', 89.20, NULL, 'Dolores tempore animi nemo harum est non ut.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 2),
(205, 'Incredible Steel Chair', 14.90, NULL, 'Enim molestias quos expedita assumenda sed quos.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 2),
(206, 'Aerodynamic Cotton Shoes', 53.50, NULL, 'Excepturi et ut culpa.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(207, 'Practical Concrete Plate', 56.40, NULL, 'Est officia aut veritatis numquam cumque.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(208, 'Incredible Steel Shoes', 75.30, NULL, 'Veritatis expedita dolor.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(209, 'Aerodynamic Granite Clock', 50.00, NULL, 'Enim vel id quia repudiandae enim.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(210, 'Incredible Linen Coat', 9.80, NULL, 'Quos quis nulla vel aut quaerat.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(211, 'Synergistic Marble Chair', 7.50, NULL, 'Maxime cupiditate excepturi est dolores amet ipsam earum.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 2),
(212, 'Practical Wooden Car', 4.10, NULL, 'Quos quos consequatur ab.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 4),
(213, 'Fantastic Aluminum Computer', 54.10, NULL, 'Ratione neque accusantium earum soluta dignissimos rem.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(214, 'Ergonomic Granite Computer', 2.10, NULL, 'Illo doloremque fugit quis eos repudiandae est.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 4),
(215, 'Awesome Wooden Coat', 23.10, NULL, 'Magni veniam ullam sequi natus modi modi.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 2),
(216, 'Ergonomic Copper Lamp', 47.10, NULL, 'Animi qui voluptates laborum voluptates omnis.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 2),
(217, 'Practical Linen Bag', 65.00, NULL, 'Dolorem nam et et nobis et.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 4),
(218, 'Rustic Aluminum Keyboard', 54.70, NULL, 'Quia recusandae eius non quia consequatur blanditiis.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(219, 'Synergistic Wooden Table', 84.60, NULL, 'Perspiciatis tempore velit perferendis nobis nobis doloribus laborum.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 2),
(220, 'Synergistic Leather Car', 39.90, NULL, 'Aut quo consequatur error non qui maxime.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(221, 'Awesome Granite Pants', 69.00, NULL, 'Quia sapiente officiis qui error cumque.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(222, 'Awesome Aluminum Car', 57.50, NULL, 'Hic qui repellendus ullam nulla quis non rerum.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(223, 'Aerodynamic Linen Hat', 11.30, NULL, 'Nulla velit ea corrupti rerum.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(224, 'Rustic Concrete Coat', 68.20, NULL, 'Soluta est ut veniam qui voluptas iste.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(225, 'Small Paper Coat', 61.20, NULL, 'Natus dolorum inventore quas aut laborum aut.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 4),
(226, 'Small Paper Coat', 45.80, NULL, 'Sequi laboriosam dignissimos.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(227, 'Enormous Rubber Car', 55.20, NULL, 'Ut a rerum quis doloremque repellat.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(228, 'Sleek Bronze Bench', 86.00, NULL, 'Veniam autem consequatur autem.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 2),
(229, 'Enormous Plastic Table', 37.80, NULL, 'Pariatur distinctio ea quas sit tempora nihil.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(230, 'Fantastic Copper Coat', 59.10, NULL, 'Sint consequuntur cupiditate nulla ipsa.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 2),
(231, 'Aerodynamic Copper Watch', 78.60, NULL, 'Impedit ea sed omnis.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(232, 'Enormous Paper Wallet', 45.70, NULL, 'Voluptatem laudantium sapiente laudantium praesentium ut.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(233, 'Small Granite Bench', 41.30, NULL, 'Consequuntur ratione consectetur velit.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 2),
(234, 'Intelligent Concrete Bench', 55.70, NULL, 'Magnam dolor dolor sit provident quia.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(235, 'Small Leather Bottle', 13.70, NULL, 'Suscipit enim ut.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(236, 'Ergonomic Wooden Car', 55.00, NULL, 'Itaque ex quis incidunt saepe vel dicta.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(237, 'Intelligent Steel Pants', 16.60, NULL, 'Et dolore facere dignissimos a.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(238, 'Gorgeous Steel Lamp', 83.60, NULL, 'Magni facilis eius aspernatur illo et ut.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 4),
(239, 'Gorgeous Linen Lamp', 13.80, NULL, 'Dolorum recusandae atque voluptas sit tempora voluptatem exercitationem.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 2),
(240, 'Enormous Paper Keyboard', 13.20, NULL, 'Eum ipsam molestias sunt sunt harum repellendus.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 2),
(241, 'Aerodynamic Wooden Knife', 80.10, NULL, 'Impedit molestias magni reprehenderit quia mollitia est cumque.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(242, 'Awesome Iron Hat', 36.10, NULL, 'Culpa omnis ducimus totam et eos.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(243, 'Mediocre Aluminum Watch', 27.00, NULL, 'Dolorum vel voluptates qui.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 4),
(244, 'Aerodynamic Concrete Bottle', 73.50, NULL, 'Et consequatur voluptatibus blanditiis dolores eveniet.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(245, 'Fantastic Linen Clock', 37.70, NULL, 'Sed non voluptatum.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 2),
(246, 'Practical Concrete Bench', 2.10, NULL, 'Rerum quia quasi.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(247, 'Practical Iron Computer', 5.50, NULL, 'Est beatae magni ipsum cupiditate nesciunt dolore eveniet.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 2),
(248, 'Aerodynamic Wool Table', 76.20, NULL, 'Deleniti est dolorem qui ipsam saepe quia sit.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(249, 'Lightweight Iron Lamp', 43.20, NULL, 'Porro eos quaerat sit dolorum deserunt.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(250, 'Rustic Bronze Lamp', 77.00, NULL, 'Repellendus provident molestiae provident veritatis autem aut vero.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(251, 'Intelligent Plastic Chair', 89.10, NULL, 'Quae ullam cupiditate et.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(252, 'Rustic Steel Pants', 81.40, NULL, 'Dignissimos exercitationem voluptas dolores totam ut magnam praesentium.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 2),
(253, 'Rustic Concrete Watch', 7.80, NULL, 'Ea dicta et laborum qui qui eos eius.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(254, 'Durable Marble Wallet', 29.60, NULL, 'Non eos beatae nam provident distinctio.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(255, 'Practical Plastic Knife', 39.40, NULL, 'Iste deleniti tempore unde facere dolores.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 2),
(256, 'Heavy Duty Rubber Keyboard', 84.10, NULL, 'Qui odio in quia et consequatur voluptatibus molestiae.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 2),
(257, 'Heavy Duty Wooden Shirt', 70.40, NULL, 'Eligendi vel est cumque ex.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(258, 'Sleek Linen Clock', 60.50, NULL, 'Sed tempore mollitia.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(259, 'Incredible Bronze Plate', 26.20, NULL, 'A aut corporis.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 4),
(260, 'Fantastic Paper Plate', 21.00, NULL, 'Eum sed corrupti quam.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(261, 'Practical Cotton Bottle', 74.80, NULL, 'Aperiam sapiente veniam.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(262, 'Fantastic Wooden Bench', 84.50, NULL, 'Culpa sunt rerum voluptas et et aut.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 2),
(263, 'Ergonomic Marble Knife', 73.30, NULL, 'Esse qui quos occaecati.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(264, 'Heavy Duty Leather Lamp', 25.40, NULL, 'Ea voluptatum mollitia ex minus soluta aliquid fugiat.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 2),
(265, 'Enormous Concrete Shirt', 78.00, NULL, 'Quaerat perferendis quo.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 4),
(266, 'Heavy Duty Marble Plate', 71.70, NULL, 'Accusamus voluptatibus minima facere qui corrupti.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(267, 'Fantastic Linen Gloves', 15.00, NULL, 'Ab quia aut debitis.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(268, 'Heavy Duty Cotton Bag', 68.30, NULL, 'Ipsum eligendi eaque molestiae architecto voluptas ut quasi.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(269, 'Fantastic Silk Bottle', 48.60, NULL, 'Tenetur explicabo velit perferendis.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(270, 'Durable Paper Knife', 56.40, NULL, 'Est quia aut et explicabo ipsa vero.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(271, 'Small Paper Watch', 22.60, NULL, 'Blanditiis alias molestiae.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 4),
(272, 'Aerodynamic Wooden Pants', 87.40, NULL, 'Nam qui vitae quod.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(273, 'Lightweight Linen Bottle', 80.60, NULL, 'Qui nulla sint quae aut voluptatem sit.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 2),
(274, 'Ergonomic Aluminum Chair', 85.80, NULL, 'Dicta et vitae libero iusto rerum iure.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 2),
(275, 'Gorgeous Leather Table', 8.10, NULL, 'Quibusdam magnam cupiditate inventore molestiae sit.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 4),
(276, 'Gorgeous Plastic Table', 76.40, NULL, 'Magnam eaque voluptatem cum corrupti praesentium esse ab.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(277, 'Small Rubber Bottle', 11.80, NULL, 'Doloremque ipsam laborum deserunt.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 2),
(278, 'Mediocre Linen Keyboard', 61.40, NULL, 'Soluta quae nihil neque.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(279, 'Synergistic Copper Shirt', 57.70, NULL, 'Omnis veritatis est blanditiis.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(280, 'Heavy Duty Granite Bottle', 83.10, NULL, 'Et nam sed aspernatur ut unde autem voluptate.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(281, 'Practical Concrete Lamp', 2.20, NULL, 'Itaque velit alias eius perspiciatis qui deserunt.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(282, 'Sleek Linen Clock', 28.70, NULL, 'Facilis porro velit molestiae qui numquam.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 2),
(283, 'Lightweight Concrete Lamp', 43.70, NULL, 'Ducimus sed voluptas occaecati repudiandae.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(284, 'Intelligent Bronze Shoes', 28.20, NULL, 'Velit reiciendis a praesentium deleniti eum ratione.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 2),
(285, 'Rustic Granite Table', 76.30, NULL, 'Neque explicabo eos commodi aut omnis voluptates a.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 2),
(286, 'Sleek Granite Gloves', 85.20, NULL, 'At quidem animi eum ab aut ab.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(287, 'Awesome Steel Keyboard', 38.60, NULL, 'Minus sapiente perferendis architecto magnam.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 4),
(288, 'Sleek Copper Coat', 68.50, NULL, 'Repellat consequatur harum.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(289, 'Synergistic Copper Pants', 87.20, NULL, 'Mollitia harum voluptatem explicabo aperiam aut explicabo sequi.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(290, 'Incredible Leather Table', 27.50, NULL, 'Eos quae pariatur quo possimus ut consequuntur rerum.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 4),
(291, 'Intelligent Cotton Coat', 42.30, NULL, 'Facilis autem laudantium repellat dolorem vero quae sit.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(292, 'Synergistic Bronze Shoes', 16.90, NULL, 'Accusantium voluptate impedit ut dolor voluptatum pariatur.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 2),
(293, 'Lightweight Iron Lamp', 64.20, NULL, 'Sequi ullam ut aut qui.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(294, 'Awesome Wooden Bag', 70.00, NULL, 'Ducimus veniam eum eos qui dolorum id dolorem.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 4),
(295, 'Ergonomic Silk Shirt', 31.90, NULL, 'Amet nam corporis est est sed ipsum molestiae.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(296, 'Aerodynamic Leather Knife', 33.60, NULL, 'Dolor atque quo omnis omnis.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(297, 'Small Cotton Table', 22.20, NULL, 'Sit necessitatibus adipisci sed.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(298, 'Mediocre Silk Bottle', 17.70, NULL, 'Aut doloremque nihil.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 2),
(299, 'Rustic Copper Wallet', 40.30, NULL, 'Dolorem eos blanditiis.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 2),
(300, 'Durable Rubber Shoes', 58.80, NULL, 'Quia ut eos excepturi iste facere quia.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(301, 'Heavy Duty Leather Pants', 83.20, NULL, 'Ut ipsa quas amet velit tenetur.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(302, 'Heavy Duty Copper Bag', 53.30, NULL, 'Possimus laborum optio at doloremque velit.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 4),
(303, 'Ergonomic Marble Shoes', 67.50, NULL, 'Vero aut aut quod.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 4),
(304, 'Intelligent Bronze Table', 72.60, NULL, 'Animi eaque dolorum consectetur quia tenetur repellendus.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 4),
(305, 'Aerodynamic Granite Shoes', 80.90, NULL, 'Cum repellendus a et enim consequatur aut perferendis.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 2),
(306, 'Sleek Marble Computer', 16.60, NULL, 'Rem eos doloremque fugit magnam.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(307, 'Intelligent Linen Shirt', 62.10, NULL, 'Reiciendis ea esse et asperiores impedit voluptate quisquam.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(308, 'Aerodynamic Granite Knife', 88.60, NULL, 'Ea sunt sunt nesciunt libero fuga qui saepe.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(309, 'Ergonomic Linen Clock', 37.40, NULL, 'Illo dolor nihil quo inventore quibusdam enim non.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(310, 'Ergonomic Iron Bench', 53.90, NULL, 'Dolores aut dolore nemo.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(311, 'Durable Linen Car', 5.50, NULL, 'Molestiae est quo molestiae hic.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(312, 'Incredible Granite Computer', 4.20, NULL, 'Accusamus sit ratione illum enim dolore.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 4),
(313, 'Small Concrete Bag', 67.50, NULL, 'Deserunt tempora ex.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(314, 'Fantastic Iron Knife', 505178.00, NULL, 'Alias repellendus consequatur.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(315, 'Heavy Duty Paper Bottle', 1.50, NULL, 'Consectetur sed et sed placeat nostrum blanditiis.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(316, 'Durable Linen Bottle', 16.50, NULL, 'Eius rerum facilis modi nemo quia cupiditate dignissimos.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(317, 'Lightweight Paper Shirt', 21.70, NULL, 'Totam ut et eligendi.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(318, 'Synergistic Iron Pants', 34.20, NULL, 'Debitis fuga magni.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 2),
(319, 'Lightweight Bronze Wallet', 80.50, NULL, 'Ut quis rerum.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 4),
(320, 'Synergistic Granite Hat', 35.00, NULL, 'Quo et dolorum adipisci id omnis fuga fugiat.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(321, 'Sleek Steel Wallet', 45.20, NULL, 'Illum exercitationem rerum sit.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 2),
(322, 'Practical Bronze Car', 24.00, NULL, 'Sunt aperiam autem nisi voluptas.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(323, 'Synergistic Aluminum Watch', 11.30, NULL, 'Et est alias mollitia.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(324, 'Small Silk Bench', 53.10, NULL, 'Eos et dolorem omnis delectus omnis.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 4),
(325, 'Heavy Duty Steel Computer', 35.60, NULL, 'Maxime enim sed explicabo.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 4),
(326, 'Enormous Cotton Wallet', 85.70, NULL, 'Velit perferendis ratione in qui totam.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(327, 'Incredible Wooden Bottle', 5.00, NULL, 'Nobis doloremque velit sit quo saepe voluptatibus.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(328, 'Lightweight Paper Bottle', 89.90, NULL, 'Exercitationem error molestiae non.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(329, 'Small Aluminum Wallet', 5.10, NULL, 'Voluptatem nam aliquam.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(330, 'Gorgeous Linen Bench', 48.50, NULL, 'Corrupti et sapiente omnis voluptates itaque.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(331, 'Sleek Silk Bag', 38.20, NULL, 'Consectetur eius quia est.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(332, 'Ergonomic Iron Pants', 7.60, NULL, 'Optio omnis quia rerum nihil explicabo.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(333, 'Fantastic Copper Lamp', 46.60, NULL, 'Dignissimos sint et sequi.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(334, 'Practical Cotton Computer', 45.50, NULL, 'A quisquam alias tempora.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(335, 'Durable Wool Car', 2.10, NULL, 'Doloribus blanditiis corrupti.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 2),
(336, 'Intelligent Leather Hat', 65.90, NULL, 'Ea non aut.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 2),
(337, 'Lightweight Copper Watch', 62.10, NULL, 'Voluptas et excepturi iusto accusamus nam.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(338, 'Intelligent Granite Table', 45.00, NULL, 'Ut maiores officiis id sed mollitia iure assumenda.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(339, 'Intelligent Steel Table', 39.00, NULL, 'Inventore voluptatem nihil minus dolorum odit dolorem reprehenderit.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 2),
(340, 'Rustic Marble Gloves', 83.60, NULL, 'Voluptas a dolorem ipsum rerum.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 2),
(341, 'Rustic Paper Bench', 10.90, NULL, 'Dolorum voluptas voluptatem minus id iure.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 4),
(342, 'Aerodynamic Bronze Pants', 62.80, NULL, 'Sint sit debitis et velit quidem iure deserunt.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(343, 'Ergonomic Plastic Keyboard', 62.60, NULL, 'Facilis omnis sit numquam qui.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(344, 'Practical Aluminum Gloves', 60.80, NULL, 'Beatae necessitatibus earum amet aut voluptatem.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(345, 'Awesome Silk Gloves', 60.00, NULL, 'Ducimus labore natus dolorem consequatur reprehenderit.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(346, 'Durable Copper Bag', 79.20, NULL, 'Consequatur ut similique.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 4),
(347, 'Awesome Rubber Coat', 74.70, NULL, 'Aut ut reprehenderit omnis qui quia.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(348, 'Heavy Duty Steel Plate', 86.00, NULL, 'Quos nobis sit qui quas eum laboriosam.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 2),
(349, 'Durable Silk Shirt', 61.90, NULL, 'Fuga qui atque facere sunt ea dolores hic.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(350, 'Aerodynamic Paper Knife', 83.90, NULL, 'Et maxime voluptatibus distinctio ut odit veniam.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(351, 'Fantastic Concrete Pants', 13.30, NULL, 'Adipisci ea consequatur distinctio.', '2025-03-06 14:11:52', '2025-03-06 14:11:52', 3),
(352, 'Incredible Aluminum Table', 87.80, NULL, 'Similique ab optio eos sit consequuntur id quia.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 2),
(353, 'Fantastic Iron Bench', 1.40, NULL, 'Voluptatem quia veniam possimus.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(354, 'Gorgeous Concrete Pants', 86.20, NULL, 'Perspiciatis alias accusamus.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 2),
(355, 'Enormous Linen Coat', 8.60, NULL, 'Nihil occaecati non rem accusantium nihil.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(356, 'Sleek Marble Chair', 3.90, NULL, 'Consequatur aut inventore ad.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(357, 'Fantastic Wooden Shirt', 12.00, NULL, 'Voluptatem ut officia non iusto.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 2),
(358, 'Sleek Linen Table', 61.40, NULL, 'Possimus cum quibusdam et.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(359, 'Rustic Concrete Watch', 25.40, NULL, 'Vitae a eos impedit ut et.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 2),
(360, 'Lightweight Steel Lamp', 28.00, NULL, 'Eaque quidem dolores nulla ea neque doloribus.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(361, 'Durable Leather Keyboard', 52.70, NULL, 'Quod consequatur eum ipsam et aliquid ut officiis.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(362, 'Sleek Aluminum Wallet', 65.80, NULL, 'Tempora officia quo id maxime sit qui nostrum.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 2),
(363, 'Awesome Copper Table', 80.90, NULL, 'Vel sit enim nihil debitis doloremque voluptatibus.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(364, 'Enormous Aluminum Coat', 16.90, NULL, 'Reprehenderit accusantium odio.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(365, 'Heavy Duty Plastic Watch', 21.60, NULL, 'Ipsa consequatur deleniti asperiores aliquid.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 4),
(366, 'Intelligent Aluminum Shoes', 81.70, NULL, 'Ullam nam vel.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(367, 'Awesome Silk Computer', 9.50, NULL, 'Eum deleniti numquam mollitia odio enim eveniet.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(368, 'Aerodynamic Aluminum Gloves', 63.10, NULL, 'Aspernatur nisi sit.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3);
INSERT INTO `products` (`id`, `name`, `price`, `thumbnail`, `description`, `created_at`, `updated_at`, `category_id`) VALUES
(369, 'Practical Silk Shoes', 67.30, NULL, 'Ipsam tenetur suscipit repudiandae molestias.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 2),
(370, 'Synergistic Steel Knife', 77.50, NULL, 'Doloribus odio nam officiis maxime eos distinctio sed.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 2),
(371, 'Gorgeous Wooden Bag', 61.00, NULL, 'Reprehenderit architecto a.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(372, 'Intelligent Paper Bag', 14.10, NULL, 'Doloremque sit aliquid sunt alias.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(373, 'Sleek Marble Bench', 52.10, NULL, 'Ipsum qui sequi.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(374, 'Mediocre Wool Knife', 57.40, NULL, 'Sint laborum aliquid dolorum dolorem.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 4),
(375, 'Practical Wool Chair', 52.40, NULL, 'Soluta optio occaecati.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 4),
(376, 'Practical Cotton Shirt', 53.80, NULL, 'Ut velit soluta.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(377, 'Intelligent Rubber Plate', 38.70, NULL, 'Ducimus voluptatum eum.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(378, 'Sleek Cotton Wallet', 52.10, NULL, 'Id ratione voluptas dolor tempora.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(379, 'Gorgeous Paper Table', 54.10, NULL, 'Iusto sunt aliquid ut sint.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(380, 'Small Wooden Wallet', 16.40, NULL, 'Sit iusto doloribus eveniet explicabo debitis.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(381, 'Aerodynamic Steel Bench', 15.50, NULL, 'Repellat praesentium odio aperiam nesciunt non quia natus.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(382, 'Mediocre Concrete Gloves', 76.80, NULL, 'Optio aut minima qui sed vel.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 4),
(383, 'Synergistic Plastic Chair', 85.60, NULL, 'Quia dolores recusandae cumque nam qui magni blanditiis.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(384, 'Heavy Duty Iron Chair', 81.70, NULL, 'Dolorem non rerum.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 2),
(385, 'Gorgeous Marble Car', 19.90, NULL, 'Alias mollitia aperiam maiores qui possimus sit sunt.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(386, 'Incredible Leather Shoes', 64.80, NULL, 'Accusamus vero dolor.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(387, 'Aerodynamic Marble Gloves', 17.40, NULL, 'Omnis et assumenda expedita provident laboriosam.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 2),
(388, 'Intelligent Rubber Knife', 28.90, NULL, 'Suscipit omnis architecto rerum natus aliquid tenetur ut.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 2),
(389, 'Gorgeous Copper Bag', 68.20, NULL, 'Accusamus vel eveniet doloremque suscipit velit.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(390, 'Small Leather Hat', 70.70, NULL, 'Possimus non nostrum esse voluptatem.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 4),
(391, 'Awesome Wool Lamp', 2.10, NULL, 'Quisquam distinctio ipsam et est ipsum.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(392, 'Intelligent Bronze Pants', 21.50, NULL, 'Nesciunt sint sunt voluptas.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 2),
(393, 'Synergistic Plastic Hat', 79.50, NULL, 'Fugit maiores corporis magni odio tempora occaecati.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 2),
(394, 'Rustic Concrete Plate', 3.70, NULL, 'Consectetur et est accusamus accusamus cupiditate.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(395, 'Durable Concrete Plate', 41.30, NULL, 'Sapiente ea quod.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 4),
(396, 'Synergistic Wool Car', 19.70, NULL, 'Consequuntur quisquam tenetur.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 4),
(397, 'Synergistic Paper Bottle', 48.50, NULL, 'Consequatur iure sint et.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(398, 'Small Plastic Bottle', 64.20, NULL, 'Minima eaque molestias.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(399, 'Mediocre Wool Chair', 11.80, NULL, 'Consequuntur dolore et non quia repudiandae.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(400, 'Rustic Granite Chair', 8.50, NULL, 'Id cum assumenda rerum.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 4),
(401, 'Practical Wool Computer', 55.80, NULL, 'Harum voluptatibus eligendi nesciunt quibusdam.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(402, 'Awesome Granite Hat', 11.80, NULL, 'Est omnis debitis minima.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(403, 'Durable Rubber Watch', 80.60, NULL, 'Veniam aliquid quaerat.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(404, 'Sleek Iron Hat', 40.80, NULL, 'Rerum et et et qui.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 2),
(405, 'Aerodynamic Linen Lamp', 64.60, NULL, 'Provident est eius facilis at.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 2),
(406, 'Mediocre Iron Shirt', 646658.00, NULL, 'Tempora modi vero.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 2),
(407, 'Lightweight Linen Chair', 16.20, NULL, 'Voluptatum dolores modi et doloremque.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(408, 'Synergistic Linen Lamp', 5.10, NULL, 'Eligendi autem dicta minima suscipit.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 4),
(409, 'Aerodynamic Leather Bag', 34.80, NULL, 'Eos natus consequatur.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 2),
(410, 'Mediocre Concrete Shirt', 12.70, NULL, 'Quia adipisci autem eaque velit.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 2),
(411, 'Lightweight Aluminum Table', 54.10, NULL, 'Necessitatibus quisquam rerum ut ea dolor.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(412, 'Practical Rubber Bag', 38.90, NULL, 'Sunt excepturi dolores culpa autem.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(413, 'Awesome Concrete Pants', 8.90, NULL, 'Distinctio nulla officia impedit eius.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 2),
(414, 'Gorgeous Wool Shoes', 8.10, NULL, 'Aliquam aut nihil cupiditate non.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(415, 'Rustic Granite Watch', 7.10, NULL, 'Repellat consequuntur harum omnis minima.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(416, 'Durable Linen Pants', 79.00, NULL, 'Sed doloribus qui est ipsum odit.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 2),
(417, 'Incredible Iron Gloves', 83.10, NULL, 'Dolor consequuntur expedita.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(418, 'Ergonomic Iron Computer', 82.00, NULL, 'Cumque rerum enim dolorem necessitatibus facilis sequi.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 4),
(419, 'Enormous Silk Plate', 67.80, NULL, 'Est enim omnis praesentium voluptas voluptas esse.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(420, 'Practical Copper Bag', 28.40, NULL, 'Et sint illo sed et.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 2),
(421, 'Synergistic Copper Bag', 62.70, NULL, 'Porro error earum.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(422, 'Enormous Wooden Hat', 9.20, NULL, 'Velit repellendus delectus.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 4),
(423, 'Sleek Aluminum Coat', 32.00, NULL, 'Accusantium saepe numquam.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(424, 'Awesome Wooden Wallet', 39.00, NULL, 'Est harum soluta minus non sapiente fuga est.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(425, 'Small Aluminum Keyboard', 46.10, NULL, 'Aut esse laboriosam consequuntur molestiae aut autem voluptatum.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 4),
(426, 'Fantastic Copper Bottle', 15.70, NULL, 'Optio est eos pariatur dolores velit iste.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 2),
(427, 'Aerodynamic Cotton Bag', 60.30, NULL, 'Vero repellendus soluta et in sint dolores.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 2),
(428, 'Sleek Wool Coat', 27.80, NULL, 'Architecto eos provident ut qui voluptatem et ut.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(429, 'Incredible Rubber Knife', 1.00, NULL, 'Quia vel officiis autem minima autem.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 4),
(430, 'Synergistic Bronze Gloves', 17.70, NULL, 'Ut eum totam necessitatibus omnis beatae.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(431, 'Small Iron Table', 63.50, NULL, 'Nisi sint blanditiis reiciendis alias dolorem.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 2),
(432, 'Fantastic Aluminum Table', 1.40, NULL, 'Dicta illo ullam qui rerum.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 4),
(433, 'Rustic Plastic Plate', 7.20, NULL, 'Natus quibusdam eveniet eius.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(434, 'Small Wool Knife', 58.70, NULL, 'Et cum voluptas non.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(435, 'Durable Paper Bottle', 33.90, NULL, 'Eaque hic aut in fugiat.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(436, 'Mediocre Steel Hat', 28.80, NULL, 'Quo porro aliquam quaerat unde quidem.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 2),
(437, 'Lightweight Paper Gloves', 13.00, NULL, 'Placeat dolorum eius.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(438, 'Fantastic Paper Knife', 89.00, NULL, 'Voluptatem omnis fugit et perferendis sapiente nesciunt.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(439, 'Incredible Bronze Keyboard', 58.60, NULL, 'Non eveniet quas vel reiciendis.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(440, 'Fantastic Copper Car', 87.30, NULL, 'Dicta laborum itaque.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(441, 'Awesome Silk Table', 90.00, NULL, 'Minima nihil laborum exercitationem vero quis reiciendis.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(442, 'Lightweight Granite Lamp', 81.90, NULL, 'Similique repellat dolorem nisi animi tempora rerum.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(443, 'Heavy Duty Silk Clock', 77.30, NULL, 'Maiores eius laudantium repellendus omnis omnis cumque iste.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(444, 'Rustic Granite Lamp', 43.50, NULL, 'Nihil rerum et eius qui.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 2),
(445, 'Mediocre Leather Bottle', 7.30, NULL, 'Expedita dolores ipsam qui vel repellat cum reprehenderit.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 4),
(446, 'Synergistic Copper Keyboard', 60.40, NULL, 'Dolore minima qui excepturi totam.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(447, 'Synergistic Linen Watch', 49.30, NULL, 'Sint dicta occaecati.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(448, 'Ergonomic Marble Keyboard', 41.60, NULL, 'Dolorem magni natus ipsum odio facilis.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(449, 'Small Steel Shoes', 19.20, NULL, 'Qui et qui alias.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(450, 'Fantastic Leather Hat', 56.60, NULL, 'Asperiores ut velit quis laborum quas numquam.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 2),
(451, 'Mediocre Cotton Gloves', 67.20, NULL, 'Vel velit veritatis velit nihil nulla earum a.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(452, 'Awesome Silk Plate', 33.70, NULL, 'Autem iure veniam quo et dolorem asperiores ut.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(453, 'Enormous Copper Pants', 15.30, NULL, 'Minus minus minus.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(454, 'Small Paper Wallet', 42.20, NULL, 'Aliquam itaque amet quis vitae deleniti fugiat.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(455, 'Gorgeous Granite Bench', 65.30, NULL, 'Ea non dolor aliquam id.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(456, 'Synergistic Wool Hat', 19.30, NULL, 'Blanditiis odio sint neque.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(457, 'Gorgeous Rubber Watch', 62.20, NULL, 'Rerum cum eligendi ut possimus.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 2),
(458, 'Enormous Leather Watch', 9.70, NULL, 'Maiores esse quod explicabo perspiciatis sint iste quas.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 2),
(459, 'Synergistic Aluminum Watch', 71.80, NULL, 'Voluptas officiis adipisci quam dignissimos est.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 2),
(460, 'Heavy Duty Bronze Shoes', 7.10, NULL, 'Dolorum laborum magnam et eos et culpa.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 4),
(461, 'Intelligent Granite Bag', 3.40, NULL, 'Amet non quo aut eius esse perferendis atque.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 2),
(462, 'Lightweight Wool Wallet', 67.10, NULL, 'Provident excepturi ipsum nihil perspiciatis vel.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(463, 'Intelligent Iron Computer', 13.90, NULL, 'Magni praesentium nobis.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(464, 'Heavy Duty Paper Car', 45.80, NULL, 'Id officia et nulla pariatur odit.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(465, 'Ergonomic Silk Table', 73.80, NULL, 'Ducimus laudantium in quo ad quas sed exercitationem.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(466, 'Rustic Concrete Table', 46.80, NULL, 'Iste cum in at delectus quia.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 2),
(467, 'Practical Concrete Lamp', 57.60, NULL, 'Facere exercitationem quia maxime voluptatem.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(468, 'Mediocre Leather Table', 16.70, NULL, 'Consequatur repellat neque ab ea magni.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(469, 'Fantastic Iron Lamp', 7.00, NULL, 'Voluptates provident necessitatibus nesciunt rerum in quasi qui.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 2),
(470, 'Aerodynamic Aluminum Pants', 2.80, NULL, 'Dolores eos vel.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 2),
(471, 'Synergistic Rubber Shoes', 78.20, NULL, 'Fugiat et repudiandae sunt.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(472, 'Awesome Silk Watch', 74.10, NULL, 'Minima aliquid eius velit recusandae exercitationem et praesentium.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 2),
(473, 'Practical Leather Car', 81.00, NULL, 'Repellat saepe aut porro dolore beatae illum aut.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 2),
(474, 'Synergistic Copper Bottle', 76.80, NULL, 'Voluptatem accusamus sit distinctio esse aut nisi.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 4),
(475, 'Gorgeous Marble Table', 61.70, NULL, 'Cupiditate aut non cumque illo.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(476, 'Awesome Marble Table', 60.70, NULL, 'Et molestiae aut error consequatur id nobis quis.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(477, 'Awesome Plastic Table', 42.50, NULL, 'Voluptatem incidunt maxime omnis aut.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 2),
(478, 'Heavy Duty Granite Lamp', 49.30, NULL, 'Soluta eaque praesentium officia repellat est laborum.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 2),
(479, 'Heavy Duty Silk Coat', 78.50, NULL, 'Et voluptas doloribus ad commodi neque rerum architecto.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(480, 'Sleek Rubber Bottle', 78.30, NULL, 'Enim enim aspernatur suscipit sapiente excepturi sit.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(481, 'Rustic Wool Table', 61.90, NULL, 'Ex dolor tempore est ut.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(482, 'Awesome Bronze Lamp', 33.00, NULL, 'Tempore sed consequatur nobis fugit error laudantium.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 2),
(483, 'Intelligent Iron Car', 63.40, NULL, 'Aperiam repudiandae quas quae inventore ducimus asperiores.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(484, 'Lightweight Iron Coat', 83.10, NULL, 'Saepe hic explicabo reprehenderit eligendi.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(485, 'Lightweight Aluminum Bench', 47.40, NULL, 'Corporis molestias corporis temporibus.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 2),
(486, 'Lightweight Plastic Computer', 68.40, NULL, 'Provident et commodi.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 2),
(487, 'Enormous Granite Car', 34.60, NULL, 'Deserunt labore asperiores sit aspernatur.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(488, 'Awesome Iron Lamp', 73.90, NULL, 'Et alias laboriosam accusamus non delectus eum vel.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(489, 'Practical Granite Shoes', 50.80, NULL, 'Dolorem nam libero et repellendus.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 4),
(490, 'Sleek Plastic Hat', 51.80, NULL, 'Sit voluptatem pariatur et ipsam exercitationem.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 2),
(491, 'Aerodynamic Cotton Knife', 35.70, NULL, 'Temporibus assumenda odio optio commodi iure harum corrupti.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(492, 'Synergistic Steel Watch', 2.60, NULL, 'Amet libero aut ut ea ea.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(493, 'Ergonomic Concrete Knife', 79.30, NULL, 'Ea saepe adipisci quis pariatur autem.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 4),
(494, 'Incredible Silk Lamp', 14.90, NULL, 'Accusantium eum consequatur blanditiis qui libero autem consequatur.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 2),
(495, 'Enormous Concrete Bench', 14.90, NULL, 'Voluptates cumque rem.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 4),
(496, 'Intelligent Concrete Watch', 75.60, NULL, 'Ullam sed laudantium natus et facilis.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 2),
(497, 'Synergistic Plastic Bag', 24.50, NULL, 'Rem quia magnam expedita sint omnis et.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 2),
(498, 'Synergistic Concrete Bottle', 21.50, NULL, 'Cum cumque et ducimus.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 2),
(499, 'Sleek Cotton Knife', 6.20, NULL, 'Ab velit et incidunt eligendi repellat quia excepturi.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(500, 'Practical Aluminum Hat', 16.60, NULL, 'Et consequatur quos qui.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(501, 'Fantastic Leather Coat', 76.80, NULL, 'Explicabo voluptatem reprehenderit ut quas sint in molestias.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 2),
(502, 'Heavy Duty Aluminum Shoes', 38.20, NULL, 'Ipsum sapiente repudiandae.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(503, 'Rustic Bronze Bench', 72.10, NULL, 'Dolor tempore consequatur dolores qui ipsum ab.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 2),
(504, 'Durable Paper Shirt', 45.40, NULL, 'Dolor dolor voluptatem.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 2),
(505, 'Aerodynamic Leather Keyboard', 40.40, NULL, 'Dolor quasi occaecati unde sunt.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 2),
(506, 'Rustic Paper Wallet', 62.10, NULL, 'Asperiores accusantium eos aut voluptates.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 4),
(507, 'Intelligent Paper Chair', 51.70, NULL, 'Non natus facilis reprehenderit nobis error.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(508, 'Practical Aluminum Car', 84.90, NULL, 'Aut autem qui qui.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(509, 'Gorgeous Wool Table', 25.00, NULL, 'Fuga ad culpa ut.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(510, 'Ergonomic Bronze Plate', 24.30, NULL, 'Praesentium maxime sed quo quia sit eaque autem.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 2),
(511, 'Awesome Bronze Coat', 49.70, NULL, 'Officiis a debitis autem molestiae.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 2),
(512, 'Intelligent Wool Pants', 33.70, NULL, 'Modi qui tempora aut adipisci minima laudantium.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(513, 'Heavy Duty Cotton Computer', 23.70, NULL, 'Ut reprehenderit aut a similique deleniti nesciunt commodi.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 2),
(514, 'Aerodynamic Linen Keyboard', 13.80, NULL, 'Magni nihil vel fuga error sit deleniti.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(515, 'Intelligent Paper Gloves', 43.70, NULL, 'Repellat voluptates autem id cumque earum ipsam laboriosam.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(516, 'Aerodynamic Wool Clock', 49.00, NULL, 'Eum et rerum.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(517, 'Practical Leather Wallet', 602954.00, NULL, 'Quibusdam iste provident voluptates harum.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 4),
(518, 'Gorgeous Silk Bottle', 89.60, NULL, 'Pariatur voluptatem nobis dolorem dolores optio.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 2),
(519, 'Enormous Wool Bag', 27.80, NULL, 'Ex et consectetur et.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 2),
(520, 'Ergonomic Iron Clock', 19.90, NULL, 'Ut enim ipsa fugiat unde dolore.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(521, 'Incredible Wooden Bench', 67.20, NULL, 'Velit exercitationem sed quos.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(522, 'Enormous Silk Knife', 28.00, NULL, 'Et dolore natus tempora.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(523, 'Incredible Leather Car', 25.60, NULL, 'Vel perspiciatis blanditiis ut.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 2),
(524, 'Awesome Wooden Gloves', 39.20, NULL, 'Ipsum itaque ut ut dolorem sed libero.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(525, 'Aerodynamic Concrete Bottle', 69.90, NULL, 'Velit ex laboriosam aliquid earum voluptates qui odio.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(526, 'Ergonomic Bronze Bottle', 62.30, NULL, 'Repellat deserunt et et et accusantium.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(527, 'Fantastic Concrete Keyboard', 30.30, NULL, 'Et ab quae ea.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(528, 'Ergonomic Wooden Knife', 28.20, NULL, 'Voluptas et ut voluptates modi ipsam dolore.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(529, 'Enormous Silk Table', 76.70, NULL, 'Voluptatibus tempora aperiam exercitationem nihil nemo dolores aut.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 4),
(530, 'Mediocre Wooden Chair', 87.70, NULL, 'Et delectus commodi sint veritatis nemo.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 2),
(531, 'Heavy Duty Cotton Bag', 64.80, NULL, 'In sit reprehenderit dolor ut fugiat vitae.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(532, 'Small Aluminum Bench', 55.20, NULL, 'Quos asperiores eos est.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(533, 'Mediocre Granite Hat', 22.80, NULL, 'Temporibus velit accusamus aperiam.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(534, 'Aerodynamic Linen Gloves', 69.30, NULL, 'Blanditiis vitae cumque animi a.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(535, 'Intelligent Wooden Shirt', 75.60, NULL, 'Nihil et recusandae commodi labore.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 2),
(536, 'Rustic Wooden Keyboard', 16.30, NULL, 'Est quaerat ipsam perspiciatis vitae at modi.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(537, 'Mediocre Cotton Coat', 82.10, NULL, 'Earum reprehenderit at qui consequatur quod.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(538, 'Gorgeous Marble Lamp', 67.00, NULL, 'Ut rerum mollitia iure blanditiis expedita est laudantium.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(539, 'Durable Leather Table', 12.10, NULL, 'Quidem sapiente nobis ea harum nostrum.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(540, 'Sleek Iron Pants', 12.50, NULL, 'Sit nobis sunt totam qui qui.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 2),
(541, 'Sleek Aluminum Pants', 66.70, NULL, 'Blanditiis quia qui nihil.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(542, 'Synergistic Paper Coat', 45.10, NULL, 'At amet fuga.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(543, 'Enormous Granite Bottle', 55.90, NULL, 'Eos vel magnam aspernatur cupiditate.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(544, 'Small Concrete Gloves', 89.50, NULL, 'Rerum sed voluptate placeat recusandae.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(545, 'Sleek Leather Shoes', 4.70, NULL, 'Officia omnis sapiente tempora commodi consequatur corrupti numquam.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(546, 'Gorgeous Wool Clock', 79.50, NULL, 'Exercitationem sit velit totam sed fuga est aperiam.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(547, 'Aerodynamic Concrete Clock', 33.40, NULL, 'Vel autem quae fuga ex quidem ratione.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(548, 'Sleek Linen Clock', 13.20, NULL, 'Et cupiditate consectetur harum totam sit.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 4),
(549, 'Rustic Wooden Shoes', 18.40, NULL, 'Vero eligendi odit maxime facilis facilis.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(550, 'Practical Marble Pants', 44.80, NULL, 'Rerum commodi laudantium reiciendis nihil repellat.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(551, 'Lightweight Silk Table', 64.40, NULL, 'Eos facere voluptas quibusdam neque ea.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 2),
(552, 'Rustic Copper Hat', 64.40, NULL, 'Vel aut explicabo fugiat autem illo.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(553, 'Synergistic Aluminum Bottle', 37.50, NULL, 'Nihil aspernatur consequatur placeat id.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 2),
(554, 'Mediocre Linen Computer', 4.70, NULL, 'Ipsa at inventore quia sint.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(555, 'Mediocre Paper Clock', 60.60, NULL, 'Qui doloribus aut aut.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(556, 'Small Bronze Computer', 61.20, NULL, 'Rerum voluptatem iure est et veniam quisquam ut.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(557, 'Practical Copper Bench', 79.30, NULL, 'Dolores voluptatem dolor amet eveniet voluptate similique.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(558, 'Practical Plastic Lamp', 80.30, NULL, 'Facilis sed voluptatem et non facilis consequatur reiciendis.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 2),
(559, 'Heavy Duty Steel Coat', 82.70, NULL, 'Sed a sit excepturi.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(560, 'Heavy Duty Marble Bench', 32.50, NULL, 'Quos mollitia id aliquid occaecati quidem consequatur beatae.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(561, 'Rustic Rubber Car', 48.00, NULL, 'Sapiente magnam error possimus.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(562, 'Heavy Duty Iron Bag', 55.90, NULL, 'Necessitatibus quasi perferendis nihil eos cupiditate consequatur.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 2),
(563, 'Heavy Duty Cotton Pants', 17.40, NULL, 'Explicabo cumque quia.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(564, 'Mediocre Concrete Computer', 69.50, NULL, 'Inventore vel ducimus aut repellendus.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(565, 'Durable Leather Watch', 55.00, NULL, 'Totam eos iste quaerat omnis nobis.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 4),
(566, 'Lightweight Marble Plate', 46.10, NULL, 'Porro dolor aperiam.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(567, 'Enormous Plastic Keyboard', 22.60, NULL, 'Perspiciatis omnis est.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(568, 'Incredible Bronze Hat', 23.60, NULL, 'Necessitatibus ratione in.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(569, 'Intelligent Marble Hat', 4.70, NULL, 'At numquam sequi.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(570, 'Mediocre Iron Keyboard', 33.90, NULL, 'Ut id iste sit nulla.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 4),
(571, 'Practical Paper Bench', 80.10, NULL, 'Facere enim animi est.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(572, 'Lightweight Wool Keyboard', 41.40, NULL, 'Nemo et omnis et voluptas dolorum.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(573, 'Fantastic Iron Watch', 16.60, NULL, 'Quia odio non tenetur autem non numquam.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 2),
(574, 'Rustic Marble Computer', 15.10, NULL, 'Ea sunt quia nihil molestiae consequatur hic.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(575, 'Incredible Rubber Watch', 83.50, NULL, 'Soluta nihil ea nostrum nihil.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(576, 'Gorgeous Iron Clock', 10.90, NULL, 'Ipsa eos molestiae et dolor accusamus ipsa soluta.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(577, 'Aerodynamic Steel Gloves', 38.40, NULL, 'Repellendus et enim quidem perspiciatis quas laboriosam.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(578, 'Enormous Cotton Gloves', 83.00, NULL, 'Officia et quae esse totam.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 4),
(579, 'Heavy Duty Leather Keyboard', 85902.00, NULL, 'Magni aut incidunt accusantium.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(580, 'Lightweight Silk Bench', 51.70, NULL, 'Et ut dolores harum earum eius omnis.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 2),
(581, 'Durable Granite Wallet', 2.10, NULL, 'Tempore laudantium esse sit neque non quia eaque.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(582, 'Durable Leather Table', 50.00, NULL, 'Maiores ut sit itaque.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 2),
(583, 'Incredible Steel Bottle', 16.40, NULL, 'Ea cupiditate blanditiis ea.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(584, 'Awesome Wooden Watch', 3.00, NULL, 'Omnis minus odio unde voluptatem.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(585, 'Enormous Paper Car', 37.40, NULL, 'Quae sed culpa eaque quis in et.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 4),
(586, 'Sleek Silk Car', 39.40, NULL, 'Quisquam ab sit quaerat est ducimus.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 2),
(587, 'Enormous Granite Gloves', 84.90, NULL, 'Aspernatur esse consequatur autem.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(588, 'Lightweight Bronze Knife', 53.20, NULL, 'Qui mollitia rerum.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(589, 'Fantastic Wooden Coat', 36.20, NULL, 'Necessitatibus nihil ut fugit.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(590, 'Gorgeous Granite Computer', 83.00, NULL, 'Modi ea at perspiciatis quidem officia.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(591, 'Small Iron Shirt', 77.70, NULL, 'Quos sint exercitationem voluptatem sunt quo minima.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 2),
(592, 'Intelligent Wool Shoes', 77.60, NULL, 'Rerum et pariatur porro reiciendis officiis placeat a.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(593, 'Lightweight Bronze Watch', 47.10, NULL, 'Nostrum dolore sint velit temporibus sunt quos quia.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 2),
(594, 'Aerodynamic Bronze Keyboard', 8.70, NULL, 'Pariatur occaecati magnam.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 2),
(595, 'Awesome Marble Bag', 64.70, NULL, 'Libero fugit eum sit quisquam officia distinctio aut.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 2),
(596, 'Enormous Concrete Hat', 40.00, NULL, 'Cum ducimus debitis.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(597, 'Incredible Aluminum Bottle', 76.00, NULL, 'Aperiam velit facilis ea aut ipsa consequatur blanditiis.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 2),
(598, 'Rustic Wooden Pants', 53.60, NULL, 'Qui minus autem consequatur aut.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(599, 'Synergistic Leather Car', 78.80, NULL, 'Ut voluptate aperiam dolorem iure tempora.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 2),
(600, 'Practical Linen Table', 9.50, NULL, 'Consequatur error voluptatem culpa vero.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 2),
(601, 'Rustic Wool Keyboard', 12.00, NULL, 'Molestias fuga minus sit earum distinctio eum.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(602, 'Practical Wooden Clock', 67.70, NULL, 'Dicta soluta quisquam ratione.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 4),
(603, 'Incredible Paper Clock', 86.60, NULL, 'Impedit qui quam sed alias.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(604, 'Sleek Marble Bench', 82.90, NULL, 'Sed tenetur non aut nam voluptas nam.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(605, 'Mediocre Linen Shoes', 15.20, NULL, 'Dolorum fugiat consequuntur dolorum repellendus enim.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(606, 'Heavy Duty Silk Clock', 37.80, NULL, 'Rerum explicabo numquam repellat est nisi et.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 2),
(607, 'Awesome Iron Hat', 52.60, NULL, 'Sunt est inventore beatae nulla.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 2),
(608, 'Ergonomic Rubber Watch', 1.40, NULL, 'Eum velit ex ipsum.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 2),
(609, 'Fantastic Concrete Hat', 16.60, NULL, 'Molestiae laborum velit voluptas.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 2),
(610, 'Lightweight Plastic Clock', 3.50, NULL, 'Tenetur voluptatem et odio amet ut ab.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(611, 'Sleek Concrete Pants', 49.70, NULL, 'Perspiciatis quos amet laudantium et et.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(612, 'Sleek Iron Gloves', 85.70, NULL, 'Vel illum aperiam qui qui dignissimos consequuntur.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(613, 'Heavy Duty Marble Pants', 69.50, NULL, 'Aut explicabo rerum officia velit.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(614, 'Rustic Aluminum Shoes', 5.50, NULL, 'Quo alias sapiente eum magni molestias nulla.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 2),
(615, 'Practical Silk Coat', 59.90, NULL, 'Molestiae est rerum.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 2),
(616, 'Aerodynamic Iron Computer', 61.20, NULL, 'Totam et eos quas ut quia sed aut.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(617, 'Synergistic Iron Shirt', 88.30, NULL, 'Rem illo iusto sit non commodi quibusdam assumenda.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(618, 'Aerodynamic Granite Bench', 66.50, NULL, 'Magni aut qui sequi omnis.', '2025-03-06 14:11:53', '2025-03-06 14:11:53', 3),
(619, 'Intelligent Concrete Table', 35.30, NULL, 'Itaque dolor qui architecto maiores perferendis.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 2),
(620, 'Lightweight Wooden Bench', 63.20, NULL, 'Ut dolorem autem qui quia voluptas.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(621, 'Heavy Duty Wooden Watch', 34.60, NULL, 'Ipsum omnis accusamus nihil doloremque aut quasi.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(622, 'Rustic Marble Clock', 43.30, NULL, 'Ea et nisi eos.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(623, 'Awesome Marble Clock', 994981.00, NULL, 'Voluptas culpa vero sit eos architecto.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 2),
(624, 'Small Iron Computer', 82.30, NULL, 'Quam similique optio eius.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 2),
(625, 'Gorgeous Plastic Shirt', 51.80, NULL, 'Sequi corporis ut quibusdam unde.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(626, 'Ergonomic Paper Shoes', 33.30, NULL, 'Quod quidem reprehenderit.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 4),
(627, 'Fantastic Wooden Knife', 31.00, NULL, 'Soluta vel eum consequuntur.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 2),
(628, 'Intelligent Linen Clock', 83.60, NULL, 'Aliquid voluptatem quos qui laborum fugiat sit veniam.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 2),
(629, 'Rustic Paper Bench', 83.00, NULL, 'Minus exercitationem esse vel sit est sapiente voluptatem.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(630, 'Awesome Bronze Lamp', 35.30, NULL, 'Et est amet.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(631, 'Small Wooden Computer', 37.70, NULL, 'Aut est error fugiat aliquid.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(632, 'Aerodynamic Iron Watch', 62.00, NULL, 'Vero dignissimos blanditiis.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 2),
(633, 'Enormous Paper Hat', 42.90, NULL, 'Vel natus sint laborum.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 4),
(634, 'Fantastic Wool Hat', 57.00, NULL, 'Numquam distinctio hic sed quis veritatis quibusdam accusamus.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(635, 'Mediocre Paper Wallet', 48.80, NULL, 'Eum dolores ab adipisci animi ipsam voluptatem.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 4),
(636, 'Incredible Cotton Bench', 56.60, NULL, 'Iusto consectetur in nobis rerum aut inventore tempora.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(637, 'Ergonomic Linen Wallet', 57.00, NULL, 'Et ratione libero aliquid porro inventore esse.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 2),
(638, 'Durable Linen Hat', 21.70, NULL, 'Molestiae est qui.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(639, 'Enormous Copper Wallet', 17.00, NULL, 'Sint reiciendis repellendus culpa et molestias excepturi eaque.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(640, 'Durable Cotton Table', 14.70, NULL, 'Atque et voluptates non vitae suscipit nostrum aspernatur.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 2),
(641, 'Enormous Silk Pants', 42.30, NULL, 'Non autem et repellendus numquam temporibus.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 4),
(642, 'Lightweight Concrete Bag', 75.90, NULL, 'Qui eius autem et dignissimos ut saepe eum.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(643, 'Sleek Marble Table', 454928.00, NULL, 'Consequatur ut beatae labore tempore.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(644, 'Gorgeous Iron Clock', 11.30, NULL, 'Nam nostrum recusandae.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(645, 'Fantastic Linen Bench', 86.00, NULL, 'Voluptatem consequatur omnis accusamus alias aut autem.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 2),
(646, 'Heavy Duty Paper Bench', 70.30, NULL, 'Omnis amet cupiditate nemo maiores provident sit.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(647, 'Gorgeous Marble Bag', 66.20, NULL, 'Dolore id id ullam ut cum.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(648, 'Practical Granite Pants', 40.10, NULL, 'Nesciunt ut qui repellendus dolorem aut soluta perferendis.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 2),
(649, 'Awesome Concrete Chair', 28.50, NULL, 'At soluta tempora itaque corporis eius ipsa quam.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(650, 'Ergonomic Copper Gloves', 14.00, NULL, 'Dolorum voluptatibus amet ut eum sit rerum asperiores.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(651, 'Incredible Concrete Table', 46.20, NULL, 'Ipsam repellat omnis harum.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(652, 'Practical Bronze Plate', 65.50, NULL, 'Ratione enim aliquam in amet maiores laborum.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 2),
(653, 'Incredible Iron Bench', 87.30, NULL, 'Dolor rerum doloribus illo eos qui consectetur voluptatem.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(654, 'Gorgeous Cotton Plate', 90.00, NULL, 'Quos nihil ipsum minima aut praesentium.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(655, 'Rustic Silk Computer', 61.40, NULL, 'Ipsum perferendis non debitis vitae voluptatum quasi voluptas.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(656, 'Intelligent Silk Shirt', 35.80, NULL, 'Qui delectus voluptatem quam.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 4),
(657, 'Practical Plastic Coat', 12.90, NULL, 'Blanditiis recusandae quia eos dolores.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(658, 'Synergistic Aluminum Bottle', 48.90, NULL, 'Nesciunt molestiae dolorem.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(659, 'Enormous Leather Bench', 50.00, NULL, 'Est ut quisquam.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(660, 'Practical Wool Car', 1.10, NULL, 'Fuga aut sint recusandae sed perspiciatis sed.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 4),
(661, 'Sleek Wool Chair', 31.30, NULL, 'Est non aperiam maxime et.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(662, 'Aerodynamic Silk Bottle', 53.60, NULL, 'Optio ut sunt nihil perspiciatis dolorem.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 4),
(663, 'Small Paper Pants', 20.30, NULL, 'Iusto dolores est beatae impedit mollitia.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 2),
(664, 'Durable Leather Pants', 49.80, NULL, 'Voluptas totam ut reiciendis a.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 4),
(665, 'Awesome Marble Table', 58.20, NULL, 'Omnis id ut dolores quidem rerum.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 2),
(666, 'Mediocre Wool Pants', 61.90, NULL, 'Qui neque voluptates nemo et.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 2),
(667, 'Fantastic Granite Pants', 64.00, NULL, 'Commodi odio voluptates dolorem veniam.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(668, 'Heavy Duty Cotton Table', 60.80, NULL, 'Est sed recusandae in accusantium autem.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 2),
(669, 'Ergonomic Leather Clock', 82.20, NULL, 'Ut tempore debitis explicabo.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(670, 'Aerodynamic Wooden Knife', 30.30, NULL, 'Ratione qui odit ut ipsum quos placeat amet.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(671, 'Fantastic Paper Bag', 88.40, NULL, 'Dolorem omnis quibusdam voluptatibus sit voluptas aliquid.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(672, 'Fantastic Leather Bag', 35.90, NULL, 'Aut nulla assumenda sequi.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 2),
(673, 'Enormous Aluminum Table', 68.10, NULL, 'Tempore dolor ut nemo eum porro earum.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 4),
(674, 'Rustic Granite Shoes', 70.00, NULL, 'At repudiandae ut delectus aspernatur cumque maxime quia.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(675, 'Enormous Wooden Pants', 67.20, NULL, 'Esse et vel ipsum.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(676, 'Enormous Wooden Bag', 46.70, NULL, 'Sequi aliquid sint nostrum.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(677, 'Gorgeous Marble Plate', 79.80, NULL, 'Iste nobis quaerat est nesciunt et.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(678, 'Practical Bronze Shirt', 66.20, NULL, 'Ullam quae aliquid ipsa est.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(679, 'Heavy Duty Linen Wallet', 19.00, NULL, 'Amet sapiente nemo earum delectus aspernatur repudiandae.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(680, 'Incredible Marble Keyboard', 12.40, NULL, 'Et animi reprehenderit commodi consequatur et a cumque.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(681, 'Intelligent Paper Pants', 4.00, NULL, 'Placeat doloremque ut.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(682, 'Synergistic Concrete Knife', 11.30, NULL, 'Possimus aut aut natus.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(683, 'Ergonomic Aluminum Table', 23.10, NULL, 'Odit beatae consequuntur dignissimos sit et.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(684, 'Enormous Paper Watch', 27.30, NULL, 'Quis expedita voluptas iste temporibus amet odio.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(685, 'Enormous Marble Bottle', 13.20, NULL, 'Inventore occaecati sit maiores sapiente autem quia.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 2),
(686, 'Gorgeous Rubber Computer', 33.00, NULL, 'Voluptas quia omnis dolores porro.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(687, 'Sleek Cotton Car', 16.30, NULL, 'Maiores autem accusamus quia architecto accusantium deserunt est.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 2),
(688, 'Intelligent Plastic Hat', 43.60, NULL, 'Odio dignissimos in.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 2),
(689, 'Incredible Bronze Hat', 42.20, NULL, 'Sed inventore et voluptas dolorum voluptas sunt.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(690, 'Incredible Copper Bottle', 80.10, NULL, 'Adipisci voluptatem quia a id.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(691, 'Intelligent Paper Hat', 49.60, NULL, 'Facilis ratione corrupti.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(692, 'Synergistic Steel Bag', 72.00, NULL, 'Et est tenetur voluptatem soluta voluptatem consequatur.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(693, 'Incredible Bronze Lamp', 13.50, NULL, 'Reprehenderit cupiditate quisquam explicabo accusantium quia.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 2),
(694, 'Durable Iron Plate', 76.80, NULL, 'Illum eius dolores voluptas earum quod.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 2),
(695, 'Rustic Linen Hat', 45.80, NULL, 'Qui eum eius et non ad.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(696, 'Enormous Granite Clock', 50.00, NULL, 'Hic ut dolore labore voluptatum rerum.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(697, 'Awesome Steel Shirt', 84.00, NULL, 'Enim nihil illum velit dicta nihil.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 2),
(698, 'Enormous Leather Lamp', 57.30, NULL, 'Nulla itaque tempora qui voluptas qui rerum sint.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(699, 'Enormous Aluminum Watch', 50.40, NULL, 'Neque in aliquid expedita natus earum ad.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 2),
(700, 'Gorgeous Silk Coat', 66.00, NULL, 'Voluptatem vel quo blanditiis consequatur sit deserunt consequatur.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 2),
(701, 'Sleek Steel Computer', 87.60, NULL, 'Non rerum optio dolor.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(702, 'Gorgeous Bronze Clock', 41.50, NULL, 'Quasi quaerat temporibus sequi eum eius.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 2),
(703, 'Awesome Iron Shirt', 21.50, NULL, 'Voluptas voluptatem dolor consequatur perferendis soluta nulla ex.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 4),
(704, 'Gorgeous Concrete Shirt', 2.60, NULL, 'Enim consequatur voluptate error optio voluptates eos.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(705, 'Incredible Wool Hat', 64.40, NULL, 'Aspernatur adipisci alias reiciendis architecto est.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 2),
(706, 'Intelligent Leather Watch', 31.90, NULL, 'Similique omnis harum necessitatibus beatae consequatur voluptatem doloremque.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(707, 'Rustic Aluminum Shoes', 20.60, NULL, 'Quia et earum eveniet cum.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 2),
(708, 'Awesome Concrete Shirt', 57.20, NULL, 'Illum maiores qui eum.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 2),
(709, 'Enormous Marble Shoes', 18.40, NULL, 'Numquam consectetur magnam dignissimos sequi.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(710, 'Mediocre Paper Shirt', 57.20, NULL, 'Quos eaque enim et error rerum doloremque rerum.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(711, 'Small Concrete Knife', 21.10, NULL, 'Maiores quo ut.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 4),
(712, 'Synergistic Linen Knife', 2.70, NULL, 'Ut qui earum tempora soluta architecto necessitatibus ullam.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(713, 'Rustic Granite Coat', 64.80, NULL, 'Consequuntur sunt ipsa et nobis voluptates voluptates.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(714, 'Ergonomic Plastic Bottle', 66.70, NULL, 'Aut reiciendis delectus eum ullam et voluptas.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 4),
(715, 'Synergistic Marble Wallet', 51.80, NULL, 'Adipisci dignissimos ratione fugit sint non.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 2),
(716, 'Aerodynamic Granite Keyboard', 68.20, NULL, 'Incidunt velit quo in earum.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 2),
(717, 'Mediocre Bronze Shirt', 60.10, NULL, 'Nesciunt nulla consequatur sit doloribus adipisci consequatur.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 2),
(718, 'Awesome Silk Bag', 57.30, NULL, 'Sint et odit reiciendis animi nostrum architecto sed.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 4),
(719, 'Small Iron Plate', 41.40, NULL, 'Illum optio laudantium debitis beatae voluptas.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(720, 'Aerodynamic Rubber Watch', 64.70, NULL, 'Vel qui temporibus.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 2),
(721, 'Intelligent Rubber Bag', 74.20, NULL, 'Modi ut aut rerum molestiae aspernatur rerum.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(722, 'Intelligent Leather Watch', 29.10, NULL, 'Non sint deleniti inventore.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(723, 'Mediocre Leather Coat', 60.60, NULL, 'Voluptates animi incidunt.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(724, 'Durable Linen Computer', 53.40, NULL, 'Qui laudantium iste quis eius.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(725, 'Mediocre Aluminum Bench', 88.10, NULL, 'Quia sit aspernatur.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(726, 'Small Aluminum Shirt', 89.10, NULL, 'Dolore soluta sint ut dolores natus.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(727, 'Enormous Granite Clock', 63.80, NULL, 'Itaque sapiente omnis expedita quos sed consequatur ab.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(728, 'Awesome Bronze Hat', 74.00, NULL, 'Animi distinctio qui.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 4),
(729, 'Practical Leather Clock', 3.20, NULL, 'Quo eos est vel optio molestiae architecto.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(730, 'Intelligent Concrete Knife', 76.70, NULL, 'Deleniti odit nihil quis rerum.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 2),
(731, 'Heavy Duty Plastic Bottle', 19.30, NULL, 'Necessitatibus vel cum praesentium eligendi sed itaque.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(732, 'Fantastic Copper Clock', 9.50, NULL, 'Vitae ea minima quod adipisci magnam.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 2),
(733, 'Aerodynamic Concrete Wallet', 56.50, NULL, 'Neque est dolore eaque optio facilis est.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(734, 'Durable Cotton Car', 47.90, NULL, 'Ut vel adipisci mollitia ut omnis rerum.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 4),
(735, 'Incredible Concrete Gloves', 1.40, NULL, 'Nisi ut id.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(736, 'Heavy Duty Bronze Bag', 82.10, NULL, 'Veniam magnam maxime velit at.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 2),
(737, 'Rustic Cotton Bag', 47.70, NULL, 'Aliquam delectus ea eum ratione et cupiditate.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(738, 'Heavy Duty Concrete Car', 14.40, NULL, 'Deserunt modi distinctio qui perferendis aut.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 2);
INSERT INTO `products` (`id`, `name`, `price`, `thumbnail`, `description`, `created_at`, `updated_at`, `category_id`) VALUES
(739, 'Mediocre Rubber Shoes', 55.30, NULL, 'Veritatis consequatur quia necessitatibus ut.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(740, 'Enormous Wool Keyboard', 19.80, NULL, 'Facilis quaerat debitis ab temporibus et ut repellendus.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 2),
(741, 'Synergistic Wool Watch', 68.70, NULL, 'Doloremque suscipit neque sed sit totam.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(742, 'Intelligent Aluminum Knife', 62.00, NULL, 'Tempora dolorem ducimus non voluptatem voluptatum.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 4),
(743, 'Small Cotton Watch', 49.70, NULL, 'Voluptates sunt repellat.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(744, 'Rustic Wooden Coat', 20.20, NULL, 'Et nam saepe.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 2),
(745, 'Small Copper Gloves', 19.90, NULL, 'Ipsum quae cum rem id quas.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(746, 'Ergonomic Leather Chair', 10.80, NULL, 'Molestiae vel ab dolores qui.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 4),
(747, 'Aerodynamic Plastic Watch', 24.70, NULL, 'Doloribus esse fugiat laborum ipsam molestias aut qui.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 2),
(748, 'Durable Silk Knife', 19.50, NULL, 'Quaerat maiores ex ex.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(749, 'Lightweight Copper Pants', 42.80, NULL, 'Enim et repellendus minima animi.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 2),
(750, 'Practical Cotton Table', 31.80, NULL, 'Ab accusamus non aperiam natus.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(751, 'Rustic Wool Plate', 5.50, NULL, 'Nulla molestiae iste.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 2),
(752, 'Intelligent Cotton Shirt', 45.30, NULL, 'Natus ad inventore accusamus expedita quam.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(753, 'Incredible Silk Table', 33.40, NULL, 'Aut quaerat occaecati error dicta est aperiam.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 4),
(754, 'Durable Linen Car', 89.20, NULL, 'Est accusantium aliquid occaecati et et quam eos.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(755, 'Ergonomic Iron Computer', 23.90, NULL, 'Laborum iusto veniam delectus eius atque.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(756, 'Incredible Paper Shoes', 86.30, NULL, 'Et id est voluptatum dolorem est impedit blanditiis.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(757, 'Durable Aluminum Clock', 16.60, NULL, 'Earum est est.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(758, 'Small Rubber Pants', 77.80, NULL, 'Consequuntur atque et dolor rerum in quo.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(759, 'Awesome Aluminum Table', 30.30, NULL, 'Necessitatibus sed vel.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 2),
(760, 'Aerodynamic Bronze Shoes', 82.70, NULL, 'In facere mollitia rerum dolores.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 4),
(761, 'Small Copper Hat', 35.10, NULL, 'Ut earum optio nostrum et.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(762, 'Lightweight Steel Plate', 15.00, NULL, 'Eveniet consequuntur et harum ipsum suscipit quam.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 2),
(763, 'Mediocre Steel Wallet', 31.30, NULL, 'Et quibusdam praesentium et repudiandae iure accusantium.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(764, 'Rustic Marble Gloves', 74.60, NULL, 'Sequi culpa et nisi ea.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 2),
(765, 'Durable Rubber Gloves', 86.30, NULL, 'Et velit et aut molestiae.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 2),
(766, 'Fantastic Leather Pants', 84.10, NULL, 'Natus dolorem unde dignissimos sequi quos.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 2),
(767, 'Sleek Cotton Shirt', 5.60, NULL, 'Dolores cupiditate quidem.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 4),
(768, 'Mediocre Concrete Chair', 4.40, NULL, 'Illo voluptatum et numquam.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 2),
(769, 'Mediocre Wooden Keyboard', 44.60, NULL, 'Quia ut possimus nihil quia totam molestiae voluptatum.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 2),
(770, 'Small Marble Watch', 66.10, NULL, 'Magni atque voluptatem.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(771, 'Awesome Paper Bottle', 8.40, NULL, 'Occaecati quis reiciendis.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(772, 'Mediocre Concrete Hat', 75.30, NULL, 'Quod officiis eaque voluptates quos sed.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 4),
(773, 'Mediocre Leather Plate', 19.90, NULL, 'Odit aut rem nesciunt ea odio porro.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(774, 'Durable Iron Pants', 12.30, NULL, 'Atque veritatis amet quibusdam quis.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 2),
(775, 'Synergistic Leather Car', 5.90, NULL, 'Totam nam quae.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(776, 'Sleek Leather Chair', 24.60, NULL, 'Sed voluptas beatae eum vitae in sit consequatur.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(777, 'Durable Paper Computer', 59.10, NULL, 'Blanditiis nihil et et velit itaque exercitationem suscipit.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 4),
(778, 'Aerodynamic Silk Lamp', 86.30, NULL, 'Dolore minima occaecati vero minima.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 2),
(779, 'Ergonomic Leather Knife', 2.70, NULL, 'Eum deserunt fuga iste ipsam praesentium.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 2),
(780, 'Synergistic Wool Bench', 58.50, NULL, 'Omnis ea mollitia qui iste.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 4),
(781, 'Fantastic Linen Plate', 57.70, NULL, 'Voluptate dolorum eum voluptatibus ex.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(782, 'Intelligent Iron Chair', 45.50, NULL, 'Nesciunt quas consequatur et.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(783, 'Durable Leather Bottle', 71.70, NULL, 'Qui aut consequuntur sunt voluptatem iste.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(784, 'Incredible Bronze Table', 72.90, NULL, 'Quia laboriosam ratione.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(785, 'Incredible Paper Shoes', 26.80, NULL, 'Est qui cupiditate aut eveniet non quae aliquam.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 4),
(786, 'Awesome Plastic Bench', 65.10, NULL, 'Et provident fugiat itaque quia.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(787, 'Enormous Wooden Lamp', 74.80, NULL, 'Voluptas aspernatur ipsum distinctio.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(788, 'Aerodynamic Plastic Watch', 4.80, NULL, 'Eius ratione enim assumenda perferendis.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(789, 'Enormous Wooden Hat', 33.10, NULL, 'Ipsum quia vitae est dolor.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 2),
(790, 'Aerodynamic Plastic Clock', 23.30, NULL, 'Saepe ducimus tempore perspiciatis.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(791, 'Heavy Duty Rubber Computer', 38.20, NULL, 'Est sint sit.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(792, 'Awesome Plastic Lamp', 42.90, NULL, 'Officiis quod quia qui commodi libero.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(793, 'Incredible Linen Coat', 57.70, NULL, 'Saepe iste omnis perferendis quos harum quo voluptate.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(794, 'Enormous Aluminum Computer', 23.80, NULL, 'Architecto illo voluptatem quidem qui quia.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(795, 'Lightweight Rubber Car', 33.30, NULL, 'Unde molestiae suscipit sed est.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(796, 'Synergistic Rubber Watch', 56.00, NULL, 'Et consequatur eius.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(797, 'Ergonomic Leather Clock', 63.60, NULL, 'Et est laboriosam molestiae magnam architecto.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 2),
(798, 'Rustic Plastic Bag', 75.90, NULL, 'Doloremque aut qui in excepturi ipsa.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(799, 'Rustic Wooden Watch', 42.00, NULL, 'Est aut qui est inventore sequi.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(800, 'Intelligent Granite Bench', 1.20, NULL, 'Error sed quia iusto eligendi architecto in consequatur.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(801, 'Rustic Copper Keyboard', 60.30, NULL, 'Amet eius esse non maiores.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 4),
(802, 'Durable Copper Gloves', 46.40, NULL, 'Et facere omnis unde alias odit enim facere.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(803, 'Intelligent Iron Shoes', 59.00, NULL, 'Voluptatibus sint et deserunt ipsa.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 4),
(804, 'Rustic Paper Lamp', 88.20, NULL, 'Autem magnam saepe recusandae est quasi.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(805, 'Intelligent Marble Bag', 54.80, NULL, 'Aliquid qui sit natus amet beatae ratione.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(806, 'Synergistic Leather Gloves', 56.60, NULL, 'Facere adipisci ipsum officia et mollitia nisi aliquam.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(807, 'Durable Concrete Watch', 14.70, NULL, 'Et est velit qui cupiditate.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 2),
(808, 'Awesome Cotton Hat', 73.50, NULL, 'Officiis ipsam quia.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(809, 'Synergistic Plastic Gloves', 17.50, NULL, 'Aliquam reprehenderit doloremque eos dolorem eum repellendus.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(810, 'Heavy Duty Linen Gloves', 39.00, NULL, 'Hic magni in voluptatem fugit.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 4),
(811, 'Heavy Duty Rubber Watch', 13.70, NULL, 'Distinctio voluptatum in.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 2),
(812, 'Rustic Granite Gloves', 81.90, NULL, 'Sed laboriosam dolore labore et consequatur cum.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(813, 'Sleek Iron Shoes', 43.90, NULL, 'Voluptate voluptatem consequatur quas explicabo molestiae.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 2),
(814, 'Fantastic Rubber Shirt', 18.70, NULL, 'Laboriosam repudiandae ullam in.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 2),
(815, 'Enormous Leather Car', 53.50, NULL, 'Laudantium quis fugit.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(816, 'Incredible Granite Watch', 39.20, NULL, 'In aut nesciunt molestiae fugit voluptatem qui at.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(817, 'Intelligent Paper Watch', 6.80, NULL, 'Qui saepe saepe.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 2),
(818, 'Small Marble Gloves', 22.80, NULL, 'Officiis eos dolor id quos eos sit.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(819, 'Incredible Wooden Clock', 64.50, NULL, 'Quod delectus rerum.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 2),
(820, 'Intelligent Rubber Shoes', 46.60, NULL, 'Provident consequatur dolor.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(821, 'Rustic Bronze Car', 7.00, NULL, 'Repellendus quo commodi consequatur vel mollitia sed dolorum.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 2),
(822, 'Ergonomic Silk Watch', 66.50, NULL, 'Sint maxime ipsum fugiat consectetur iusto natus voluptate.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 2),
(823, 'Gorgeous Concrete Shoes', 2.10, NULL, 'Provident ipsum beatae autem officiis debitis aliquid possimus.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(824, 'Awesome Aluminum Car', 51.60, NULL, 'Quaerat natus ea totam.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 2),
(825, 'Ergonomic Aluminum Keyboard', 16.50, NULL, 'Id eius alias et ab enim.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(826, 'Lightweight Cotton Watch', 60.20, NULL, 'Omnis eveniet consequatur et laborum doloremque adipisci.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(827, 'Rustic Paper Keyboard', 9.20, NULL, 'Mollitia animi ut quia consequatur.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 2),
(828, 'Lightweight Bronze Table', 60.30, NULL, 'Veritatis quasi nihil numquam aut voluptates.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(829, 'Sleek Copper Shirt', 22.30, NULL, 'Rem et sint quia est qui officiis.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(830, 'Durable Granite Pants', 27.70, NULL, 'Odit eos ex enim.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 4),
(831, 'Rustic Granite Bottle', 65.90, NULL, 'Enim praesentium odio ab aperiam.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 2),
(832, 'Fantastic Steel Hat', 24.40, NULL, 'Repellendus eos suscipit quia.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(833, 'Awesome Leather Shirt', 50.30, NULL, 'Cum molestias aperiam consequatur nobis porro et sed.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(834, 'Awesome Wool Bottle', 82.90, NULL, 'Ullam beatae distinctio.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(835, 'Synergistic Wool Clock', 87.40, NULL, 'Ipsa animi laboriosam et quia laborum.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 4),
(836, 'Gorgeous Linen Wallet', 64.70, NULL, 'Dolorum optio odit ad dolor veniam.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 2),
(837, 'Gorgeous Wool Wallet', 79.70, NULL, 'Illo architecto et sunt illo et.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(838, 'Lightweight Plastic Lamp', 76.20, NULL, 'Omnis qui atque cumque asperiores veniam.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 2),
(839, 'Mediocre Aluminum Car', 3.20, NULL, 'Corrupti quo saepe ut non.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(840, 'Mediocre Rubber Hat', 26.40, NULL, 'Ea error consequatur sed.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 2),
(841, 'Gorgeous Rubber Knife', 20.80, NULL, 'Eveniet perspiciatis ut laudantium cum.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 2),
(842, 'Fantastic Granite Coat', 55.90, NULL, 'Corporis odit harum.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(843, 'Practical Wool Car', 55.90, NULL, 'Et et aperiam temporibus provident ipsa dolores et.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(844, 'Rustic Wool Hat', 82.20, NULL, 'Voluptatum perspiciatis quasi nihil sit et quidem et.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 2),
(845, 'Gorgeous Iron Watch', 9.90, NULL, 'Nam saepe officiis nobis maxime.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 2),
(846, 'Rustic Paper Chair', 82.10, NULL, 'Cumque repellendus numquam rerum ab molestiae.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(847, 'Fantastic Steel Car', 46.90, NULL, 'Mollitia alias sint cumque.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(848, 'Mediocre Granite Car', 22.70, NULL, 'Est et nostrum dolor voluptas praesentium distinctio labore.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 2),
(849, 'Enormous Leather Clock', 76.70, NULL, 'Mollitia qui et.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 2),
(850, 'Awesome Silk Hat', 74.80, NULL, 'Omnis ea cupiditate.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(851, 'Sleek Plastic Table', 6.20, NULL, 'Mollitia minus nam incidunt tempora sit est.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(852, 'Incredible Wool Watch', 19.70, NULL, 'Quia veniam quibusdam.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 2),
(853, 'Ergonomic Marble Shoes', 33.60, NULL, 'Sequi qui at.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 2),
(854, 'Mediocre Silk Chair', 81.40, NULL, 'Eaque atque aut eaque et.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 2),
(855, 'Awesome Aluminum Table', 30.80, NULL, 'Veritatis sed nobis ab.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(856, 'Ergonomic Granite Clock', 43.20, NULL, 'Et ipsam voluptas sequi iure assumenda et.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(857, 'Practical Leather Car', 18.30, NULL, 'Reiciendis similique nesciunt aspernatur et sequi id eveniet.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(858, 'Synergistic Marble Car', 26.60, NULL, 'Et nihil distinctio labore saepe consequatur qui.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(859, 'Aerodynamic Wooden Shoes', 26.40, NULL, 'Suscipit dicta sit rem.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(860, 'Enormous Rubber Watch', 64.90, NULL, 'Ex consequatur rerum.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(861, 'Incredible Aluminum Shoes', 66.80, NULL, 'Iusto eius accusantium a explicabo quia velit ut.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 2),
(862, 'Small Aluminum Shirt', 17.10, NULL, 'Sapiente odit et eos id doloribus omnis maxime.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 2),
(863, 'Small Rubber Wallet', 66.80, NULL, 'Quibusdam aut ipsa.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 4),
(864, 'Awesome Leather Wallet', 9.50, NULL, 'Omnis aut soluta excepturi alias quam reprehenderit.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 4),
(865, 'Heavy Duty Wool Lamp', 77.20, NULL, 'Veniam illum quasi cumque voluptatibus.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 4),
(866, 'Mediocre Cotton Computer', 32.20, NULL, 'Quia sit expedita repudiandae.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 2),
(867, 'Awesome Steel Coat', 4.80, NULL, 'Dolor nulla saepe.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 2),
(868, 'Small Wooden Shoes', 83.80, NULL, 'Repellendus magnam necessitatibus tempore id recusandae excepturi quos.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 2),
(869, 'Ergonomic Granite Shirt', 4.20, NULL, 'Doloremque explicabo voluptates.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(870, 'Fantastic Wooden Wallet', 35.60, NULL, 'Corporis neque sit quam mollitia totam commodi et.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(871, 'Rustic Silk Bench', 65.80, NULL, 'Quis accusantium qui nihil non ut.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(872, 'Gorgeous Bronze Lamp', 44.90, NULL, 'Ut culpa quia et qui.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(873, 'Gorgeous Granite Pants', 58.40, NULL, 'Vero dignissimos impedit eos.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 2),
(874, 'Gorgeous Marble Wallet', 74.60, NULL, 'Fuga dolorum eveniet rerum tempore ipsum placeat perferendis.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 4),
(875, 'Synergistic Wool Pants', 4.00, NULL, 'Quis rerum odit quis ex vitae sed dolorem.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(876, 'Enormous Bronze Knife', 7.50, NULL, 'Ea dolores aperiam et aut qui dignissimos quia.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 2),
(877, 'Synergistic Leather Wallet', 76.60, NULL, 'Aut voluptatem doloribus reprehenderit vitae.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(878, 'Fantastic Silk Pants', 43.00, NULL, 'Quidem cum ullam autem voluptas magnam molestiae dignissimos.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 4),
(879, 'Enormous Marble Plate', 29.40, NULL, 'Consequatur ut facilis ad est sint dolor dicta.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(880, 'Incredible Plastic Keyboard', 9.50, NULL, 'Sunt sint eveniet sed excepturi quia.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 4),
(881, 'Fantastic Bronze Watch', 74.90, NULL, 'Quisquam dolores quis neque.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 2),
(882, 'Incredible Leather Bag', 47.90, NULL, 'Sequi velit neque dolor.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(883, 'Durable Concrete Table', 4.60, NULL, 'Alias autem ipsum.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 4),
(884, 'Lightweight Granite Wallet', 30.90, NULL, 'Tempore explicabo voluptatibus impedit nulla dolor praesentium consequatur.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(885, 'Incredible Concrete Computer', 30.40, NULL, 'Provident commodi dolorem consequatur voluptas non quos.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 2),
(886, 'Practical Wooden Lamp', 76.50, NULL, 'Modi quia repudiandae ea sit.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(887, 'Lightweight Steel Clock', 31.40, NULL, 'Cum labore optio autem magni molestiae.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 2),
(888, 'Small Bronze Shirt', 20.60, NULL, 'Atque quis minima dolores vero in veritatis.', '2025-03-06 14:11:54', '2025-03-06 14:11:54', 3),
(889, 'Sleek Paper Gloves', 87.60, NULL, 'Dolorem et ab ipsa.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 2),
(890, 'Aerodynamic Iron Wallet', 30.00, NULL, 'At quibusdam pariatur provident sit.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 3),
(891, 'Intelligent Copper Keyboard', 78.00, NULL, 'Vel delectus qui.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 3),
(892, 'Heavy Duty Granite Hat', 84.00, NULL, 'A et ea.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 3),
(893, 'Aerodynamic Linen Shirt', 22.00, NULL, 'Deserunt commodi itaque rem occaecati.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 2),
(894, 'Aerodynamic Rubber Car', 81.30, NULL, 'Dolorem aut sunt veritatis adipisci.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 3),
(895, 'Incredible Linen Pants', 4.20, NULL, 'Pariatur possimus eaque cupiditate repudiandae iure dolores.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 3),
(896, 'Fantastic Aluminum Knife', 45.70, NULL, 'Consequuntur est rerum laborum sit asperiores et cum.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 3),
(897, 'Awesome Paper Clock', 86.70, NULL, 'Et ratione molestiae temporibus consequuntur.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 4),
(898, 'Mediocre Copper Lamp', 52.60, NULL, 'Rerum amet doloribus quaerat nesciunt ut.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 3),
(899, 'Durable Granite Table', 63.30, NULL, 'Sed possimus aut.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 2),
(900, 'Synergistic Linen Computer', 67.70, NULL, 'Qui laudantium sunt.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 2),
(901, 'Durable Silk Watch', 80.90, NULL, 'Dolores vitae soluta dolor tempore.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 3),
(902, 'Heavy Duty Steel Bench', 62.40, NULL, 'Eligendi tempore at temporibus.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 3),
(903, 'Heavy Duty Concrete Watch', 59.10, NULL, 'Aut animi corporis.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 2),
(904, 'Mediocre Steel Lamp', 73.40, NULL, 'Non quasi labore.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 2),
(905, 'Practical Iron Wallet', 62.40, NULL, 'Impedit maiores iusto dolorum ut at.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 3),
(906, 'Mediocre Copper Lamp', 10.10, NULL, 'Aliquid adipisci quisquam mollitia iste sint.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 3),
(907, 'Enormous Wool Knife', 56.60, NULL, 'Dolores reiciendis voluptate est.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 2),
(908, 'Awesome Rubber Plate', 69.30, NULL, 'Eum quam et temporibus fugit aut quisquam recusandae.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 3),
(909, 'Aerodynamic Marble Shoes', 8.60, NULL, 'Cupiditate doloremque distinctio culpa aliquid laudantium.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 3),
(910, 'Awesome Copper Hat', 2.30, NULL, 'Libero necessitatibus dolorem eligendi consequatur et tenetur doloribus.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 3),
(911, 'Aerodynamic Iron Gloves', 86.60, NULL, 'Aut amet est id consequatur natus a illum.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 3),
(912, 'Gorgeous Bronze Chair', 49.90, NULL, 'Et tenetur tempora soluta saepe.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 4),
(913, 'Aerodynamic Rubber Hat', 66.90, NULL, 'Sit est ut libero.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 3),
(914, 'Fantastic Linen Watch', 65.00, NULL, 'Hic omnis fuga vero a explicabo.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 2),
(915, 'Fantastic Paper Bottle', 32.50, NULL, 'Saepe libero inventore.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 2),
(916, 'Synergistic Plastic Car', 61.50, NULL, 'Aut nulla quos consequatur omnis ab nam.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 2),
(917, 'Aerodynamic Copper Plate', 33.70, NULL, 'Qui accusantium non repellendus.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 4),
(918, 'Enormous Wooden Pants', 78.90, NULL, 'Ratione eum debitis ducimus.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 3),
(919, 'Enormous Steel Keyboard', 74.60, NULL, 'Et eos sed.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 2),
(920, 'Small Steel Wallet', 3.20, NULL, 'Ipsum porro tempore aut voluptatibus ut quisquam.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 2),
(921, 'Lightweight Bronze Shirt', 83.90, NULL, 'Est aperiam placeat qui iste qui.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 3),
(922, 'Rustic Rubber Shirt', 55.90, NULL, 'Sequi et amet omnis.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 3),
(923, 'Fantastic Bronze Bottle', 69.50, NULL, 'Est deserunt vitae laudantium.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 2),
(924, 'Practical Granite Car', 3.10, NULL, 'Corrupti dolor eligendi optio tempora.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 3),
(925, 'Gorgeous Silk Shirt', 20.40, NULL, 'Ut sint et velit aut ut est totam.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 3),
(926, 'Fantastic Marble Shirt', 61.00, NULL, 'Sed libero dolorum laboriosam aspernatur incidunt voluptatum repudiandae.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 4),
(927, 'Sleek Bronze Plate', 29.40, NULL, 'Soluta commodi rerum.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 3),
(928, 'Practical Silk Watch', 2.00, NULL, 'Facilis amet minima.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 3),
(929, 'Lightweight Granite Knife', 47.60, NULL, 'Quibusdam a vero.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 4),
(930, 'Heavy Duty Granite Car', 80.80, NULL, 'Aliquid expedita aperiam.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 3),
(931, 'Practical Cotton Plate', 31.90, NULL, 'Dolores est ad consequatur rem enim.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 2),
(932, 'Lightweight Bronze Knife', 70.10, NULL, 'In harum harum qui et voluptatem tenetur suscipit.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 4),
(933, 'Sleek Concrete Bench', 1.60, NULL, 'Quas beatae eligendi nam non voluptatem placeat.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 3),
(934, 'Synergistic Marble Keyboard', 65.70, NULL, 'Quae nobis quo voluptatibus quis consectetur.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 3),
(935, 'Synergistic Aluminum Car', 4.00, NULL, 'Minima nemo necessitatibus maxime praesentium consequatur.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 3),
(936, 'Enormous Paper Shoes', 17.10, NULL, 'Quo at in autem esse.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 3),
(937, 'Sleek Wool Bottle', 12.40, NULL, 'Quam eos pariatur nam labore ea sint qui.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 3),
(938, 'Gorgeous Iron Hat', 55.60, NULL, 'Natus at alias reiciendis ut.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 4),
(939, 'Heavy Duty Aluminum Clock', 68.30, NULL, 'Ut enim doloremque tempora neque.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 2),
(940, 'Awesome Bronze Chair', 37.70, NULL, 'Officiis quo voluptatem qui provident.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 3),
(941, 'Gorgeous Wool Chair', 38.20, NULL, 'A quidem consequuntur.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 3),
(942, 'Practical Leather Coat', 52.80, NULL, 'Autem praesentium quibusdam atque autem.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 3),
(943, 'Lightweight Linen Shoes', 10.70, NULL, 'Officiis aperiam quo.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 4),
(944, 'Aerodynamic Rubber Pants', 4.50, NULL, 'Quia esse dignissimos aut veritatis asperiores voluptas autem.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 3),
(945, 'Rustic Concrete Table', 31.30, NULL, 'Molestiae ea eius delectus similique.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 3),
(946, 'Aerodynamic Linen Coat', 67.80, NULL, 'Perspiciatis veritatis suscipit sint maiores.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 2),
(947, 'Durable Linen Bag', 56.10, NULL, 'Repellat eos fugit possimus.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 2),
(948, 'Synergistic Bronze Watch', 81.80, NULL, 'Aut deserunt aliquam quis.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 3),
(949, 'Aerodynamic Rubber Bag', 26.60, NULL, 'Tempora illum assumenda esse debitis ducimus.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 2),
(950, 'Aerodynamic Marble Coat', 62.70, NULL, 'Sint amet ut nemo quasi.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 3),
(951, 'Lightweight Rubber Coat', 77.30, NULL, 'Tenetur atque ullam non.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 3),
(952, 'Mediocre Silk Knife', 62.10, NULL, 'Cupiditate sit est.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 3),
(953, 'Sleek Cotton Computer', 22.20, NULL, 'Natus rerum repellat distinctio.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 3),
(954, 'Durable Cotton Clock', 24.40, NULL, 'Quae est nihil dolores nihil distinctio.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 2),
(955, 'Enormous Cotton Car', 7.60, NULL, 'Rerum ea dolorem qui reiciendis.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 3),
(956, 'Intelligent Plastic Plate', 74.00, NULL, 'Inventore sint magnam sint eos fugit.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 2),
(957, 'Sleek Concrete Bench', 65.90, NULL, 'Dolores et sint vel voluptatem ullam.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 3),
(958, 'Gorgeous Marble Shoes', 7.80, NULL, 'Omnis fugiat velit quidem.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 2),
(959, 'Incredible Granite Bottle', 25.20, NULL, 'Est assumenda explicabo doloremque explicabo praesentium quibusdam.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 3),
(960, 'Lightweight Cotton Keyboard', 57.50, NULL, 'Soluta quaerat cupiditate maiores.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 2),
(961, 'Lightweight Iron Shirt', 79.40, NULL, 'Nulla nobis consectetur et alias excepturi voluptas.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 3),
(962, 'Rustic Concrete Keyboard', 52.00, NULL, 'Quam quae in incidunt sint suscipit suscipit.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 3),
(963, 'Awesome Paper Bench', 53.10, NULL, 'Et eum officiis qui et.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 4),
(964, 'Aerodynamic Leather Coat', 57.20, NULL, 'Et in labore corrupti.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 2),
(965, 'Gorgeous Aluminum Coat', 68.40, NULL, 'Quas voluptatibus dicta magnam nihil fugit est nostrum.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 4),
(966, 'Ergonomic Aluminum Gloves', 60.80, NULL, 'Tempore voluptatem autem consequatur.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 3),
(967, 'Gorgeous Wooden Bench', 45.80, NULL, 'Ratione sunt reprehenderit aut voluptas commodi aut.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 4),
(968, 'Enormous Granite Lamp', 80.40, NULL, 'Impedit sapiente id molestiae fuga odio dolores amet.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 3),
(969, 'Heavy Duty Copper Pants', 74.00, NULL, 'In quia accusantium consequuntur tempore.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 3),
(970, 'Sleek Leather Clock', 16.70, NULL, 'Qui hic quam voluptas adipisci quia aut est.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 2),
(971, 'Rustic Aluminum Car', 38.90, NULL, 'Quasi suscipit qui voluptas omnis ullam et.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 3),
(972, 'Rustic Wooden Lamp', 41.00, NULL, 'In ea officia autem.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 2),
(973, 'Synergistic Bronze Plate', 61.80, NULL, 'Eaque et non voluptatem saepe.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 4),
(974, 'Enormous Granite Bottle', 29.40, NULL, 'Non nostrum qui ullam aspernatur autem recusandae.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 3),
(975, 'Aerodynamic Bronze Shoes', 83.20, NULL, 'Officia eum voluptatem corrupti aspernatur excepturi ipsam aut.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 2),
(976, 'Practical Silk Chair', 34.70, NULL, 'Dolore ea animi.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 4),
(977, 'Heavy Duty Linen Plate', 28.40, NULL, 'Et ullam velit.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 2),
(978, 'Fantastic Marble Table', 65.30, NULL, 'Repudiandae ullam labore vel aperiam enim.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 3),
(979, 'Durable Silk Lamp', 43.60, NULL, 'Temporibus aliquam unde.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 2),
(980, 'Aerodynamic Plastic Pants', 52.50, NULL, 'Voluptatibus culpa vitae totam ut.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 3),
(981, 'Durable Paper Bottle', 41.00, NULL, 'Nam qui cumque sit similique quaerat.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 2),
(982, 'Mediocre Paper Shirt', 11.80, NULL, 'Veniam modi sed repudiandae.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 2),
(983, 'Mediocre Aluminum Bottle', 47.70, NULL, 'Est quos voluptates in qui dolor.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 3),
(984, 'Enormous Paper Bottle', 30.60, NULL, 'Occaecati ut optio excepturi libero.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 4),
(985, 'Durable Marble Lamp', 71.70, NULL, 'Itaque nam consectetur.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 3),
(986, 'Gorgeous Plastic Hat', 87.50, NULL, 'Omnis dicta repellat in aut fuga omnis.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 3),
(987, 'Intelligent Copper Hat', 63.80, NULL, 'Consequatur eum maiores eos.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 3),
(988, 'Small Paper Clock', 72.80, NULL, 'Necessitatibus rerum optio qui sit ut dolores.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 2),
(989, 'Aerodynamic Plastic Wallet', 21.10, NULL, 'Reprehenderit laboriosam eaque commodi quia eos natus et.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 3),
(990, 'Incredible Leather Lamp', 64.60, NULL, 'Quibusdam ratione in.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 3),
(991, 'Awesome Aluminum Computer', 23.60, NULL, 'Ipsa sequi dolore porro aliquam expedita.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 3),
(992, 'Enormous Copper Lamp', 79.70, NULL, 'Eligendi ea numquam ad laudantium labore illum earum.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 2),
(993, 'Ergonomic Concrete Keyboard', 26.90, NULL, 'Facilis nobis expedita quam voluptatem.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 2),
(994, 'Ergonomic Silk Lamp', 8.60, NULL, 'Fugiat facilis consequatur quidem et qui quibusdam.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 4),
(995, 'Rustic Iron Bench', 54.60, NULL, 'Voluptas quia cumque non quidem.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 3),
(996, 'Lightweight Silk Plate', 79.70, NULL, 'Vero et alias.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 3),
(997, 'Lightweight Paper Coat', 62.30, NULL, 'Laudantium dolores nulla aut ut aut aut.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 4),
(998, 'Incredible Wooden Clock', 60.60, NULL, 'Enim est pariatur fuga ratione.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 3),
(999, 'Intelligent Iron Shirt', 7.80, NULL, 'Qui voluptatibus ipsam eligendi.', '2025-03-06 14:11:55', '2025-03-06 14:11:55', 2),
(1003, 'Ban hoc sinh', 23.89, NULL, 'rat tot cho viec hoc', '2025-04-02 14:18:58', '2025-04-02 14:18:58', 3);

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` int NOT NULL,
  `product_id` int DEFAULT NULL,
  `image_url` varchar(300) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `image_url`) VALUES
(8, 1, 'd167307d-2e3b-49f6-b468-ce0608146732_bandoi.jpg'),
(9, 1, '55497e5e-fd6a-4a18-8e14-f2210426f3fa_bolero.jpg'),
(11, 2, '9fc80bb1-4372-4583-8f72-fd98e0b6e87b_angel-face.jpg'),
(12, 2, '03a7684f-485a-4c23-b6f9-941607491044_cdne.jpg'),
(13, 2, '8a5eb0d6-709d-4f5c-8e92-eeed12906f10_coffee.jpg'),
(14, 3, '70688036-0cde-4933-b8f5-686567b62349_country.jpg'),
(15, 3, 'baaaf86c-7c55-47aa-b5db-89d4d45bb254_cpop.jpg'),
(16, 3, '01364f11-f3b5-4aa3-bde9-8efae5c69fd9_ctnt.jpg'),
(17, 4, '26359591-2ecc-4d9d-a0b9-816d2b04d2dd_cungtrang.jpg'),
(18, 4, 'c64ce762-616e-4ae0-a9bb-4a52bf979ced_cxky.jpg'),
(19, 4, 'da39e736-5662-4cad-abc8-b3aa66f2b61d_dd.jpg'),
(20, 5, 'da5615be-94d5-4344-9cd4-3606efaead6a_edc.jpg'),
(21, 5, '0269767a-4458-4654-9adb-67d85560f0be_electronic.jpg'),
(22, 5, 'cc169ff0-7f68-4a05-b71c-53fbfce550ef_gnlc.jpg'),
(23, 6, '95d7019e-e1fb-41ff-92d0-710958ac1ecf_gtac.jpg'),
(24, 6, '13dffde9-eb49-41e6-86f2-f47054817c4c_hidden-luv.jpg'),
(25, 6, 'ea1a3ff1-992d-4b87-8b7d-709deac069d1_hiphopViet.jpg'),
(26, 7, '27fd13a4-186e-4cc0-8b6b-1701b294ff81_instrumental.jpg'),
(27, 7, 'ab8501aa-8129-410a-8eb1-849f5f165406_JazzViet.jpg'),
(28, 7, '7019a3be-c521-4042-aa24-4d4d57b167bd_jennie.jpg'),
(29, 8, '3cb997fc-cb62-48f5-a58f-078b7b1512ba_jjam.jpg'),
(30, 8, '384c9db7-c3a9-4995-ae66-e8842c1bd7d1_khieuvu.jpg'),
(31, 8, '8d17dad4-7d84-4eff-9f42-b3393fe6ad36_logo.png'),
(32, 9, '097b1176-4b5f-4f99-89b8-217055371d9f_love-elution.jpg'),
(33, 9, 'e16fbf28-31b9-4c0c-b85b-de2f3dc8abdf_lyly.jpg'),
(34, 9, 'a5f0bfaa-7204-4693-b4a0-3f6f0e2b1f1d_mamacita.jpg'),
(35, 10, 'b4b2388d-3433-4aa6-a0e0-78af37e00985_mrtt.jpg'),
(36, 10, '1279b4ac-4471-46e3-8d31-5992427d7714_nhacnhat.jpg'),
(37, 10, '2a74083f-5277-4f41-a0c7-936a42488b0b_nhacphim.jpg'),
(38, 11, '7dca75bd-bb7a-46e7-a1e1-6bceeed8e097_nhactre.jpg'),
(39, 11, 'dedc68ee-447d-47e5-b86c-09cb370596bd_nolove.jpg'),
(40, 11, 'fada5a5b-dcb1-4a85-8ecc-ba64ddd6f824_nvkl.jpg'),
(41, 12, 'ca316a68-6e9a-446f-8aa3-61f3debbac9b_piano.jpg'),
(42, 12, '2d465c63-c7d0-4788-94e4-d6bff48e92cc_pop-now.jpg'),
(43, 12, 'c7b87efc-1f23-4b13-bd75-2a3a693ef853_qtth.jpg'),
(44, 13, '6a10f7f2-4afb-48d3-8ea7-ec0d18c97820_rapviet.jpg'),
(45, 13, 'f07984cd-5cae-4394-9716-3a076dc5f157_rapviett.jpg'),
(46, 13, '6ffde6b3-f732-4abe-b47e-75ee56f0b8a9_remixViet.jpg'),
(47, 14, '80ae8d86-9549-44d4-9eb7-158f58c1d706_silence.jpg'),
(48, 14, 'ca4866f5-186b-4cf6-b01a-62d1926b5fbd_slide.jpg'),
(49, 14, '612ab87b-b59d-4f6f-ad33-bce9df33b951_slide2.jpg'),
(50, 15, '772ec3f2-5b21-4b2d-af3f-bcd52a486e2d_slide4.jpg'),
(51, 15, 'fec503b9-e5dc-48e4-9c00-a9c13c79911d_spedup.jpg'),
(52, 15, '3b549349-e7ff-4b52-88bf-bc20a9c0b889_sweet-song.jpg'),
(53, 16, '9f168a2e-9216-4f9d-9125-ae637c961e40_cdne.jpg'),
(54, 16, '2e6fa120-11e0-4b06-a779-f0008fde123f_coffee.jpg'),
(55, 16, '868214a6-f80f-4abf-bdfe-76cf58087a21_country.jpg'),
(59, 1, 'dc1f5684-1bc2-45d5-936e-ac0ad464bce5_013.jpg'),
(61, 1, '7a88738e-5c78-4738-b087-938dde7acf2f_020.jpg'),
(62, 1003, '469da73b-16d5-474d-a1ab-34626bef606d_015.jpg'),
(63, 1003, 'c214cafb-57fd-4235-823d-b0828631b468_016.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
(1, 'user'),
(2, 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `social_accounts`
--

CREATE TABLE `social_accounts` (
  `id` int NOT NULL,
  `provider` varchar(20) NOT NULL COMMENT 'Tên nhà social network',
  `provider_id` varchar(50) NOT NULL,
  `email` varchar(150) NOT NULL COMMENT 'Email tài khoản',
  `name` varchar(100) NOT NULL COMMENT 'Tên người dùng',
  `user_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tokens`
--

CREATE TABLE `tokens` (
  `id` int NOT NULL,
  `token` varchar(255) NOT NULL,
  `token_type` varchar(50) NOT NULL,
  `expiration_date` datetime DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expired` tinyint(1) NOT NULL,
  `user_id` int DEFAULT NULL,
  `is_mobile` tinyint(1) DEFAULT '0',
  `refresh_token` varchar(255) DEFAULT '',
  `refresh_expiration_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tokens`
--

INSERT INTO `tokens` (`id`, `token`, `token_type`, `expiration_date`, `revoked`, `expired`, `user_id`, `is_mobile`, `refresh_token`, `refresh_expiration_date`) VALUES
(26, 'eyJhbGciOiJIUzI1NiJ9.eyJwaG9uZU51bWJlciI6IjEyMzQ1Njc4OTAiLCJ1c2VySWQiOjI0LCJzdWIiOiIxMjM0NTY3ODkwIiwiZXhwIjoxNzQ1NTkzNTY4fQ.m6evghXejoRYSDm33zqpyiJBBFidI8FL2OQwjIWnfnA', 'Bearer', '2025-04-25 15:06:09', 0, 0, 24, 0, 'dd40b7c1-4e7b-476c-a746-76e702ab7ce9', '2025-05-25 15:06:09'),
(27, 'eyJhbGciOiJIUzI1NiJ9.eyJwaG9uZU51bWJlciI6IjEyMzQ1Njc4OTAiLCJ1c2VySWQiOjI0LCJzdWIiOiIxMjM0NTY3ODkwIiwiZXhwIjoxNzQ1NTk0MDMyfQ.trl8U-cWmNHRri3gGY3MuJ2cIQb7K7ines-3uF5GUbs', 'Bearer', '2025-04-25 15:13:52', 0, 0, 24, 0, '9dd81f30-2259-4dc8-9a64-38df071a434a', '2025-05-25 15:13:52'),
(31, 'eyJhbGciOiJIUzI1NiJ9.eyJwaG9uZU51bWJlciI6IjEyMzQ1NjciLCJ1c2VySWQiOjIxLCJzdWIiOiIxMjM0NTY3IiwiZXhwIjoxNzQ1NjU0MjQ5fQ.Nky9va2XjAi4wypcJTwnrOQQUSIPLCkbSpLURYJag-4', 'Bearer', '2025-04-26 07:57:30', 0, 0, 21, 0, '334903e5-56c9-458e-a4c0-f2aca598b7ff', '2025-05-26 07:57:30'),
(36, 'eyJhbGciOiJIUzI1NiJ9.eyJwaG9uZU51bWJlciI6IjMyMzMzMiIsInVzZXJJZCI6MTQsInN1YiI6IjMyMzMzMiIsImV4cCI6MTc0NTY4NzAwNX0.zQeIjdflXvMcuBwBsGdwrvIR0GecPmuai7JG6uDBPpY', 'Bearer', '2025-04-26 17:03:26', 0, 0, 14, 0, '92a857ea-c550-4551-b2d4-d26271da2034', '2025-05-26 17:03:26'),
(51, 'eyJhbGciOiJIUzI1NiJ9.eyJwaG9uZU51bWJlciI6IjMyMzMzMiIsInVzZXJJZCI6MTQsInN1YiI6IjMyMzMzMiIsImV4cCI6MTc0NjEwMTMzM30.pJw18FDlurMpDl3X75rzFlhj-iMAIcKrSaDATpBIZtw', 'Bearer', '2025-05-01 12:08:55', 0, 0, 14, 0, '02acb479-d2f7-4ddb-aae7-0822f63470f2', '2025-05-31 12:08:55'),
(58, 'eyJhbGciOiJIUzI1NiJ9.eyJwaG9uZU51bWJlciI6IjEyMzQ1NjciLCJ1c2VySWQiOjIxLCJzdWIiOiIxMjM0NTY3IiwiZXhwIjoxNzQ2MTAyNzgyfQ.N_JLTl_PlNyUp6hmZB9bsTE3Wchf139eJxUzUbO4NnE', 'Bearer', '2025-05-01 12:33:02', 0, 0, 21, 0, '76f7d24b-7671-4517-8529-ae2e179edbf2', '2025-05-31 12:33:02'),
(61, 'eyJhbGciOiJIUzI1NiJ9.eyJwaG9uZU51bWJlciI6IjEyMzQ1NjciLCJ1c2VySWQiOjIxLCJzdWIiOiIxMjM0NTY3IiwiZXhwIjoxNzQ2MTAyODQ2fQ.HDSSBZxenOmWdV6TkkZYa0e3leYTlyOZOV9DHc-uqSo', 'Bearer', '2025-05-01 12:34:06', 0, 0, 21, 0, '5f87e7b1-2588-47ea-a7e3-237553a25e1f', '2025-05-31 12:34:06'),
(106, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWJqZWN0IjoiMDk2NDg5NjIzOSIsInVzZXJJZCI6MjMsInN1YiI6IjA5NjQ4OTYyMzkiLCJleHAiOjE3NDYxNjc2NTZ9.O5HHxA_yyaMFG7GEcNQv5xwFcQsOMXeRbe7znRuJllQ', 'Bearer', '2025-05-02 06:34:17', 0, 0, 23, 0, '6c052840-a61f-4a07-a801-5eff21310075', '2025-06-01 06:34:17'),
(112, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWJqZWN0IjoiMDk2NDg5NjIzOSIsInVzZXJJZCI6MjMsInN1YiI6IjA5NjQ4OTYyMzkiLCJleHAiOjE3NDYxNzM1OTF9.gUPDkSHLyMIZygQRYhBbMKKrCYKllpwWnEwbUVmN0bQ', 'Bearer', '2025-05-02 08:13:11', 0, 0, 23, 0, '3be39542-db57-4a9d-b9b4-a001b3b358e3', '2025-06-01 08:13:11'),
(120, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWJqZWN0IjoiMDk2NDg5NjIzOSIsInVzZXJJZCI6MjMsInN1YiI6IjA5NjQ4OTYyMzkiLCJleHAiOjE3NDYyNTQ5Mzh9.KEMOqEaIbv1ZWMDR90qVKWoQLN79U85OlBduwDF4CUc', 'Bearer', '2025-05-03 06:48:59', 0, 0, 23, 0, '35c121bb-4bac-4363-898e-138ac10546e8', '2025-06-02 06:48:59'),
(132, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWJqZWN0IjoiMzIzMzMyIiwidXNlcklkIjoxNCwic3ViIjoiMzIzMzMyIiwiZXhwIjoxNzQ2MjY0OTQ5fQ.WuKGIthjP9Yk1Ibdk4jDgTt6o0RXtBQpmrSO2W8KAkk', 'Bearer', '2025-05-03 09:35:49', 0, 0, 14, 0, 'ab2f3025-6d78-46b5-90e0-7a458c04db73', '2025-06-02 09:35:49'),
(139, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWJqZWN0Ijoiam9obnNtaXRoMjNAZ21haWwuY29tIiwidXNlcklkIjoyOCwic3ViIjoiam9obnNtaXRoMjNAZ21haWwuY29tIiwiZXhwIjoxNzQ2MjY3MDI0fQ.H0AJjGOtY07YZ5mF-uBokcQemNNqRbpJIQA_jlRQr_k', 'Bearer', '2025-05-03 10:10:28', 0, 0, 28, 0, '76287d67-7354-4910-a8da-1070b50be023', '2025-06-02 10:10:28'),
(140, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWJqZWN0Ijoiam9obnNtaXRoMjNAZ21haWwuY29tIiwidXNlcklkIjoyOCwic3ViIjoiam9obnNtaXRoMjNAZ21haWwuY29tIiwiZXhwIjoxNzQ2MjY3NDc1fQ.znDj6jXzUqE9Pgl_wP14wo8td45rOb9h2QW-AEugmjs', 'Bearer', '2025-05-03 10:19:03', 0, 0, 28, 0, 'fa465e82-0165-47b9-bbc8-564e640867d9', '2025-06-02 10:19:03'),
(141, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWJqZWN0Ijoiam9obnNtaXRoMjNAZ21haWwuY29tIiwidXNlcklkIjoyOCwic3ViIjoiam9obnNtaXRoMjNAZ21haWwuY29tIiwiZXhwIjoxNzQ2MjY3OTI5fQ.ZE8_gYaF_nHRZvE8nesbFL7bGw8TKxsGAvANW6qmXfs', 'Bearer', '2025-05-03 10:25:29', 0, 0, 28, 0, 'dde838ae-d947-44be-9fa7-e10116a07e91', '2025-06-02 10:25:29'),
(150, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWJqZWN0IjoiMTEyMjMzNDQ1NSIsInVzZXJJZCI6Mywic3ViIjoiMTEyMjMzNDQ1NSIsImV4cCI6MTc0NjI3MTIxM30.GpsaRpXm1GkWyiszCKHrYWoljlgfPBD_bs2xpQRO6Vs', 'Bearer', '2025-05-03 11:20:14', 0, 0, 3, 0, '0f8d3564-e5d9-4459-a037-4bcf969268cd', '2025-06-02 11:20:14'),
(156, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWJqZWN0IjoiMTEyMjMzNDQ1NSIsInVzZXJJZCI6Mywic3ViIjoiMTEyMjMzNDQ1NSIsImV4cCI6MTc0NjI3Nzg1OH0.KiWWKqyi5nVm6KTYEOF_xLxWb7aNfqGIDzzwu3yTAaY', 'Bearer', '2025-05-03 13:10:59', 0, 0, 3, 0, '6a669282-25c9-47bb-8052-2f2385544216', '2025-06-02 13:10:59'),
(157, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWJqZWN0IjoiMTEyMjMzNDQ1NSIsInVzZXJJZCI6Mywic3ViIjoiMTEyMjMzNDQ1NSIsImV4cCI6MTc0NjI3ODcyMX0.RYvzFuKUw0mNkPN6ctm_vQz6b0RtKtwUs60AFMQ7XX8', 'Bearer', '2025-05-03 13:25:22', 0, 0, 3, 0, '6c729aea-7fc9-46b0-92da-e800bd41e9dc', '2025-06-02 13:25:22'),
(161, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWJqZWN0IjoibGVtaW5odGllbjE1MTIwMkBnbWFpbC5jb20iLCJ1c2VySWQiOjI5LCJzdWIiOiJsZW1pbmh0aWVuMTUxMjAyQGdtYWlsLmNvbSIsImV4cCI6MTc0NjI3OTM3N30.BNuN1N26ZBGKagO5n5hq6gcsSPPTBWiEEx4nC3piFPo', 'Bearer', '2025-05-03 13:36:18', 0, 0, 29, 0, 'c4506a21-358f-4811-8037-936367103712', '2025-06-02 13:36:18'),
(162, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWJqZWN0IjoibGVtaW5odGllbjE1MTIwMkBnbWFpbC5jb20iLCJ1c2VySWQiOjI5LCJzdWIiOiJsZW1pbmh0aWVuMTUxMjAyQGdtYWlsLmNvbSIsImV4cCI6MTc0NjI3OTY3OH0.22vbminAeG9q_7CSp80JHhMKV6yxhQXoPcUMdtb-dA0', 'Bearer', '2025-05-03 13:41:18', 0, 0, 29, 0, '0fef367a-84f3-4e51-9ba1-fc5799d863e4', '2025-06-02 13:41:18'),
(163, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWJqZWN0IjoibGVtaW5odGllbjE1MTIwMkBnbWFpbC5jb20iLCJ1c2VySWQiOjI5LCJzdWIiOiJsZW1pbmh0aWVuMTUxMjAyQGdtYWlsLmNvbSIsImV4cCI6MTc0NjI4MDAzMX0.JDPB8SyETMAHD04ht9_jQApXRBCbqRqD2_NX8v1vSAw', 'Bearer', '2025-05-03 13:47:11', 0, 0, 29, 0, 'ae1802e2-acd5-4b25-b9e7-6b81447bae9c', '2025-06-02 13:47:11');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `fullname` varchar(100) DEFAULT '',
  `phone_number` varchar(15) DEFAULT NULL,
  `address` varchar(200) DEFAULT '',
  `password` char(60) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `date_of_birth` date DEFAULT NULL,
  `facebook_account_id` varchar(300) DEFAULT '0',
  `google_account_id` varchar(300) DEFAULT '0',
  `role_id` int DEFAULT '1',
  `email` varchar(255) DEFAULT '',
  `profile_image` varchar(255) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fullname`, `phone_number`, `address`, `password`, `created_at`, `updated_at`, `is_active`, `date_of_birth`, `facebook_account_id`, `google_account_id`, `role_id`, `email`, `profile_image`) VALUES
(3, 'user1', '1122334455', 'admin 1', '$2a$10$CG5qGsVI2/daFbx5XlNHgeTkKwovG12z32gNUEHhf/h9m6Y1G47qy', '2025-03-09 14:11:00', '2025-03-09 14:11:00', 1, '1979-12-12', '0', '0', 2, '', ''),
(4, 'admin1', '123456', 'admin 1', '$2a$10$WPCIWHLsLURh94RiAEWsI.BDhX50/HyIX3GdIrLPIFB6eVNnGiiVW', '2025-03-11 07:56:05', '2025-03-11 07:56:05', 1, '1979-12-12', '0', '0', 2, '', ''),
(14, 'rgrg', '323332', 'viet nam', '$2a$10$T6dqcqvl21.EA/xQlvOG2.m1pfnL3SbAjZyagj2SY7bslw0GdAt.y', '2025-03-14 07:45:52', '2025-03-27 09:10:04', 1, '2002-12-04', '0', '0', 1, '', ''),
(21, 'tai khoan tien 2', '1234567', 'admin 12', '$2a$10$myds.Fllyy8UK7L5HqxtauHl9BiA/b0YLLKHjn948R/Ug165HgHmC', '2025-03-14 09:13:50', '2025-03-25 07:01:05', 1, '2010-12-12', '2', '2', 1, '', ''),
(22, 'admin1 test 2', '12345678', 'admin 1 test 23', '$2a$10$/mMt8J6whrZlgGm2Cu9qD.aoCIDw20FjYIyNtOM9MAWk/Ev2CCOHC', '2025-03-16 05:54:10', '2025-03-21 17:55:00', 1, '2002-12-05', '0', '0', 1, '', ''),
(23, 'tien', '0964896239', 'gfgff', '$2a$10$LCFJfljyWoaBmJwFDzPoO.leGZKNtaKVzHUuc06Gy1GARYObgxWVO', '2025-03-26 07:28:47', '2025-03-26 07:28:47', 1, '2002-03-04', '0', '0', 1, '', ''),
(24, 'rgrg121', '1234567890', '1212', '$2a$10$DLQpmJybCJb4caWOZYoLb.x0Wa5fzsqjWeRLW5mOWisSjHLORvEuW', '2025-03-26 15:02:28', '2025-03-26 15:02:28', 1, '2003-03-10', '0', '0', 1, '', ''),
(28, 'John Smith', NULL, 'This is John\'s address', '$2a$10$ymaa8VQVP.0l7m1LtvM1bOpwiNAy1rwxBxQ8NDKm4BT2bzH9OiZbu', '2025-04-02 06:08:41', '2025-04-02 06:08:41', 1, '1999-10-23', '0', '0', 1, 'johnsmith23@gmail.com', ''),
(29, 'Tiến Lê', '', NULL, '', '2025-04-03 09:04:14', '2025-04-03 09:04:14', 1, NULL, NULL, '114493487607113026831', 1, 'leminhtien151202@gmail.com', 'https://lh3.googleusercontent.com/a/ACg8ocIF_N7C4A9u7iCz9Faa1ZZdKoDhDyy4AlIAJekodDu2XPuXOw=s96-c');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupon_conditions`
--
ALTER TABLE `coupon_conditions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `coupon_id` (`coupon_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `fk_orders_coupon` (`coupon_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `fk_order_details_coupon` (`coupon_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_product_images_product_id` (`product_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_accounts`
--
ALTER TABLE `social_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token` (`token`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `coupon_conditions`
--
ALTER TABLE `coupon_conditions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `social_accounts`
--
ALTER TABLE `social_accounts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=164;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `coupon_conditions`
--
ALTER TABLE `coupon_conditions`
  ADD CONSTRAINT `coupon_conditions_ibfk_1` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_orders_coupon` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`),
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `fk_order_details_coupon` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`),
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `social_accounts`
--
ALTER TABLE `social_accounts`
  ADD CONSTRAINT `social_accounts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `tokens`
--
ALTER TABLE `tokens`
  ADD CONSTRAINT `tokens_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
