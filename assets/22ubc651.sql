-- Create the `orders` table
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `order_details` text,
  `total` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
);

-- Create the `products` table
CREATE TABLE IF NOT EXISTS `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `seller_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text,
  `price` decimal(10,2) NOT NULL,
  `stock` int DEFAULT '0',
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `seller_id` (`seller_id`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`seller_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
);

-- Create the `users` table with prefix length for `email` index
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `profile_picture` varchar(255) DEFAULT NULL,
  `role` enum('admin','seller','user') NOT NULL DEFAULT 'user',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`(191)) -- Use a 191 character prefix length for `email`
);

-- Insert data into `products` table
INSERT INTO `products` (`id`, `seller_id`, `name`, `description`, `price`, `stock`, `image`, `created_at`, `updated_at`) VALUES
(5, 22, 'Anto', '1', 50.00, 100, 'signature.jpg', '2025-03-04 14:50:27', '2025-03-04 14:50:27'),
(6, 22, 'evends', 'WER', 1000.00, 19, 'cb.jpg', '2025-03-04 15:00:30', '2025-03-04 15:00:30');

-- Insert data into `users` table
INSERT INTO `users` (`id`, `name`, `email`, `password`, `profile_picture`, `role`, `created_at`) VALUES
(21, 'Admin', 'admin@srinivasa.com', '$2y$10$HaMlr87YLBo.FRYYL9Qm0uVoF.o4J7bHX7DkN4E6q3nS977WeE1gu', NULL, 'admin', '2025-03-04 14:49:01'),
(22, 'Seller', 'seller@srinivasa.com', '$2y$10$hKJDoK.cDv6GZLV6x6Jf/.hliVXl.ze0RabZDxcM6SBSMMZjBtdOS', 'user.png', 'seller', '2025-03-04 14:49:20'),
(23, 'User', 'user@srinivasa.com', '$2y$10$eJHexqkOpiSI/Z.cC6NFw.6pHE7fW.nu5ntVKl17a1btoox4gcC2W', NULL, 'user', '2025-03-04 14:49:32');
