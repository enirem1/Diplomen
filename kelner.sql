-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 27, 2025 at 01:42 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kelner`
--

-- --------------------------------------------------------

--
-- Table structure for table `allergies`
--

CREATE TABLE `allergies` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `allergies`
--

INSERT INTO `allergies` (`id`, `name`) VALUES
(1, 'Nuts'),
(2, 'Dairy'),
(3, 'Gluten'),
(4, 'Seafood'),
(5, 'Soy'),
(6, 'Eggs'),
(7, 'Peanuts'),
(8, 'Shellfish'),
(9, 'Wheat'),
(10, 'Sesame');

-- --------------------------------------------------------

--
-- Table structure for table `article`
--

CREATE TABLE `article` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `weight` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `article`
--

INSERT INTO `article` (`id`, `name`, `price`, `weight`) VALUES
(1, 'Margherita Pizza', 10.99, 600),
(2, 'Pepperoni Pizza', 12.99, 750),
(3, 'Veggie Burger', 9.49, 500),
(4, 'Chicken Wrap', 8.99, 450),
(5, 'Spaghetti Bolognese', 13.50, 700),
(6, 'Caesar Salad', 7.99, 400),
(7, 'Greek Salad', 7.99, 350),
(8, 'Cheeseburger', 11.99, 600),
(9, 'BBQ Ribs', 16.99, 1000),
(10, 'Grilled Salmon', 18.99, 900),
(11, 'Coca-Cola', 2.50, 330),
(12, 'Orange Juice', 3.00, 250),
(13, 'Lemonade', 2.75, 300),
(14, 'Iced Tea', 2.99, 350),
(15, 'Espresso', 1.99, 60),
(16, 'Latte', 3.50, 250),
(17, 'Chocolate Cake', 5.99, 200),
(18, 'Cheesecake', 6.49, 220),
(19, 'Apple Pie', 4.99, 230),
(20, 'Tiramisu', 6.99, 250);

-- --------------------------------------------------------

--
-- Table structure for table `article_category`
--

CREATE TABLE `article_category` (
  `id_article` int(11) NOT NULL,
  `id_category` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `article_category`
--

INSERT INTO `article_category` (`id_article`, `id_category`) VALUES
(1, 4),
(2, 4),
(3, 5),
(6, 6),
(7, 6),
(8, 5),
(9, 8),
(10, 9),
(11, 11),
(12, 11),
(13, 11),
(14, 11),
(15, 10),
(16, 10),
(17, 12),
(18, 12),
(19, 12),
(20, 12);

-- --------------------------------------------------------

--
-- Table structure for table `article_ingredient`
--

CREATE TABLE `article_ingredient` (
  `id_article` int(11) NOT NULL,
  `id_ingredient` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `article_ingredient`
--

INSERT INTO `article_ingredient` (`id_article`, `id_ingredient`) VALUES
(1, 1),
(1, 2),
(1, 9),
(1, 10),
(2, 1),
(2, 2),
(2, 3),
(2, 9),
(3, 4),
(3, 5),
(3, 6),
(4, 5),
(4, 6),
(4, 7),
(9, 11),
(10, 12),
(17, 14),
(17, 16),
(17, 20),
(18, 13),
(18, 14),
(18, 20),
(19, 15),
(19, 18),
(19, 19);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `parent_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `parent_id`) VALUES
(1, 'Main Dishes', NULL),
(2, 'Drinks', NULL),
(3, 'Desserts', NULL),
(4, 'Pizza', 1),
(5, 'Burgers', 1),
(6, 'Salads', 1),
(7, 'Pasta', 1),
(8, 'Meat Dishes', 1),
(9, 'Seafood', 1),
(10, 'Hot Beverages', 2),
(11, 'Cold Beverages', 2),
(12, 'Cakes', 3),
(13, 'Pastries', 3);

-- --------------------------------------------------------

--
-- Table structure for table `ingredients`
--

CREATE TABLE `ingredients` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ingredients`
--

INSERT INTO `ingredients` (`id`, `name`) VALUES
(1, 'Tomato Sauce'),
(2, 'Mozzarella'),
(3, 'Pepperoni'),
(4, 'Beef Patty'),
(5, 'Lettuce'),
(6, 'Cheddar Cheese'),
(7, 'Chicken'),
(8, 'Parmesan'),
(9, 'Dough'),
(10, 'Basil'),
(11, 'BBQ Sauce'),
(12, 'Salmon'),
(13, 'Cream Cheese'),
(14, 'Eggs'),
(15, 'Wheat Flour'),
(16, 'Chocolate'),
(17, 'Coffee Beans'),
(18, 'Apple'),
(19, 'Cinnamon'),
(20, 'Vanilla Extract');

-- --------------------------------------------------------

--
-- Table structure for table `ingredients_allergies`
--

CREATE TABLE `ingredients_allergies` (
  `id_ingredient` int(11) NOT NULL,
  `id_allergie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ingredients_allergies`
--

INSERT INTO `ingredients_allergies` (`id_ingredient`, `id_allergie`) VALUES
(2, 2),
(6, 2),
(9, 3),
(13, 2),
(15, 3);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `id_table` int(11) DEFAULT NULL,
  `id_article` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `id_table`, `id_article`) VALUES
(192, 1, 15);

-- --------------------------------------------------------

--
-- Table structure for table `ttable`
--

CREATE TABLE `ttable` (
  `id` int(11) NOT NULL,
  `total_Price` decimal(10,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ttable`
--

INSERT INTO `ttable` (`id`, `total_Price`) VALUES
(1, 45.98),
(2, 38.49),
(3, 21.99),
(4, 30.50),
(5, 55.99),
(6, 62.75),
(7, 12.50),
(8, 8.99),
(9, 19.50),
(10, 23.99);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `allergies`
--
ALTER TABLE `allergies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `article_category`
--
ALTER TABLE `article_category`
  ADD PRIMARY KEY (`id_article`,`id_category`),
  ADD KEY `id_category` (`id_category`);

--
-- Indexes for table `article_ingredient`
--
ALTER TABLE `article_ingredient`
  ADD PRIMARY KEY (`id_article`,`id_ingredient`),
  ADD KEY `id_ingredient` (`id_ingredient`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Indexes for table `ingredients`
--
ALTER TABLE `ingredients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ingredients_allergies`
--
ALTER TABLE `ingredients_allergies`
  ADD PRIMARY KEY (`id_ingredient`,`id_allergie`),
  ADD KEY `id_allergie` (`id_allergie`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_table` (`id_table`),
  ADD KEY `id_article` (`id_article`);

--
-- Indexes for table `ttable`
--
ALTER TABLE `ttable`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `allergies`
--
ALTER TABLE `allergies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `article`
--
ALTER TABLE `article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `ingredients`
--
ALTER TABLE `ingredients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=194;

--
-- AUTO_INCREMENT for table `ttable`
--
ALTER TABLE `ttable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `article_category`
--
ALTER TABLE `article_category`
  ADD CONSTRAINT `article_category_ibfk_1` FOREIGN KEY (`id_article`) REFERENCES `article` (`id`),
  ADD CONSTRAINT `article_category_ibfk_2` FOREIGN KEY (`id_category`) REFERENCES `category` (`id`);

--
-- Constraints for table `article_ingredient`
--
ALTER TABLE `article_ingredient`
  ADD CONSTRAINT `article_ingredient_ibfk_1` FOREIGN KEY (`id_ingredient`) REFERENCES `ingredients` (`id`),
  ADD CONSTRAINT `article_ingredient_ibfk_2` FOREIGN KEY (`id_article`) REFERENCES `article` (`id`);

--
-- Constraints for table `ingredients_allergies`
--
ALTER TABLE `ingredients_allergies`
  ADD CONSTRAINT `ingredients_allergies_ibfk_1` FOREIGN KEY (`id_ingredient`) REFERENCES `ingredients` (`id`),
  ADD CONSTRAINT `ingredients_allergies_ibfk_2` FOREIGN KEY (`id_allergie`) REFERENCES `allergies` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`id_article`) REFERENCES `article` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
