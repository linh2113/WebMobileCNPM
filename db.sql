-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.32-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for shopclothes
CREATE DATABASE IF NOT EXISTS `shopclothes` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `shopclothes`;

-- Dumping structure for table shopclothes.bill_order_sum
CREATE TABLE IF NOT EXISTS `bill_order_sum` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idcustomer` varchar(45) DEFAULT NULL,
  `quantity` varchar(45) DEFAULT NULL,
  `sumtotol` varchar(45) DEFAULT NULL,
  `date` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table shopclothes.bill_order_sum: ~21 rows (approximately)
INSERT INTO `bill_order_sum` (`id`, `idcustomer`, `quantity`, `sumtotol`, `date`) VALUES
	(1, 'a', 'b', '3.2', '1'),
	(2, '1', '2', '3.2', '1'),
	(3, '1', '1', '46000.0', '2023/12/13 20:05:24'),
	(4, '1', '5', '159500.0', '2023/12/13 20:12:47'),
	(5, '1', '2', '68500.0', '2023/12/14 12:28:48'),
	(6, '1', '2', '68500.0', '2023/12/14 12:29:00'),
	(7, '1', '2', '92000.0', '2023/12/17 13:46:24'),
	(8, '1', '2', '68500.0', '2023/12/17 14:09:33'),
	(9, '102', '1', '1.0', '1'),
	(10, '1', '2', '68500.0', '2023/12/17 15:18:26'),
	(11, '6', '3', '93500.0', '2023/12/17 15:20:22'),
	(12, '1', '2', '145000.0', '2023/12/17 15:24:49'),
	(13, '6', '1', '46000.0', '2023/12/17 15:27:44'),
	(14, '1', '1', '99000.0', '2023/12/17 15:31:30'),
	(15, '1', '1', '46000.0', '2023/12/17 15:38:50'),
	(16, '1', '1', '46000.0', '2023/12/17 15:38:59'),
	(17, '1', '3', '588500.0', '2023/12/17 15:39:31'),
	(18, '1', '1', '22500.0', '2023/12/17 15:40:49'),
	(19, '1', '100', '4600000.0', '2023/12/17 16:17:45'),
	(20, '1', '100', '4600000.0', '2023/12/17 16:18:55'),
	(21, '1', '100', '4600000.0', '2023/12/17 16:20:39'),
	(22, '7', '2', '45000.0', '2024/04/17 13:35:33'),
	(23, '7', '3', '67500.0', '2024/04/17 18:08:43');

-- Dumping structure for table shopclothes.category
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table shopclothes.category: ~6 rows (approximately)
INSERT INTO `category` (`id`, `name`) VALUES
	(1, 'Samsung'),
	(2, 'IPhone'),
	(3, 'Oppo'),
	(4, 'Vivo'),
	(5, 'Realme'),
	(6, 'Xiaome');

-- Dumping structure for table shopclothes.customer
CREATE TABLE IF NOT EXISTS `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iduser` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `pricesum` varchar(45) DEFAULT NULL,
  `date` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table shopclothes.customer: ~0 rows (approximately)

-- Dumping structure for table shopclothes.product
CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `namepro` varchar(255) DEFAULT NULL,
  `imagepro` varchar(255) DEFAULT NULL,
  `pricepro` varchar(45) DEFAULT NULL,
  `title` varchar(45) DEFAULT NULL,
  `description` varchar(10000) DEFAULT NULL,
  `cateid` varchar(45) DEFAULT NULL,
  `quantity` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table shopclothes.product: ~6 rows (approximately)
INSERT INTO `product` (`id`, `namepro`, `imagepro`, `pricepro`, `title`, `description`, `cateid`, `quantity`) VALUES
	(1, 'Điện thoại Samsung Galaxy S24 Ultra 5G 256GB ', 'https://cdn.tgdd.vn/Products/Images/42/307174/TimerThumb/samsung-galaxy-s24-ultra-5g-(2).jpg', '46000', '256GB, 512GB, 1TB', 'Samsung Galaxy S24 Ultra mẫu điện thoại cao cấp được ra mắt vào đầu năm 2024, sản phẩm tiếp tục kế thừa và cải tiến từ thế hệ trước. Điểm đặc biệt là sử dụng chip Snapdragon 8 Gen 3 for Galaxy, camera 200 MP và tích hợp nhiều tính năng AI.', '1', '3'),
	(2, 'Điện thoại iPhone 15 Pro Max 256GB', 'https://cdn.tgdd.vn/Products/Images/42/305658/TimerThumb/iphone-15-pro-max-(12).jpg', '22500', '256GB, 512GB, 1TB', 'iPhone 15 Pro Max là một chiếc điện thoại thông minh cao cấp được mong đợi nhất năm 2023. Với nhiều tính năng mới và cải tiến, iPhone 15 Pro Max chắc chắn sẽ là một lựa chọn tuyệt vời cho những người dùng đang tìm kiếm một chiếc điện thoại có hiệu năng mạnh mẽ, camera chất lượng và thiết kế sang trọng.', '2', '4'),
	(3, 'Điện thoại OPPO Reno11 5G ', 'https://cdn.tgdd.vn/Products/Images/42/314209/oppo-reno-11-xanh-thumb-600x600.jpg', '25000', '256GB, 512GB, 1TB', 'OPPO Reno11 5G tiếp tục mang đến sự hấp dẫn cho người dùng, lấy cảm hứng từ những thành công trước đó. Điểm độc đáo của chiếc điện thoại nằm ở thiết kế thu hút, cấu hình mạnh mẽ và khả năng chụp ảnh ấn tượng. Được tạo ra để đáp ứng một loạt các nhu cầu từ giải trí, nhiếp ảnh đến công việc đòi hỏi hiệu năng cao.', '3', '5'),
	(4, 'Điện thoại vivo Y03 128GB ', 'https://cdn.tgdd.vn/Products/Images/42/302197/TimerThumb/vivo-y100.jpg', '99000', '256GB, 512GB, 1TB', 'vivo Y03 tiếp tục là một mẫu điện thoại giá rẻ được vivo ra mắt tại thị trường Việt Nam. Sản phẩm lần này mang đến một diện mạo đẹp mắt hơn các phiên bản trước đó, tiếp đến là cấu hình nâng cấp cùng viên pin lớn 5000 mAh.', '4', '21'),
	(5, 'Điện thoại realme Note 50 64GB ', 'https://cdn.tgdd.vn/Products/Images/42/323002/realme-c65-thumb-1-600x600.jpg', '520000', '256GB, 512GB, 1TB', 'realme Note 50 64GB tiếp tục thu hút sự chú ý nhờ vào mức giá nổi bật và hấp dẫn của mình. Mặc dù nằm trong phân khúc giá thấp, sản phẩm này vẫn mang đến nhiều công nghệ ấn tượng, tạo nên sự đáng chú ý khi trang bị màn hình lớn 6.74 inch, pin 5000 mAh và đạt chuẩn IP54.', '5', '2'),
	(6, 'Điện thoại Xiaomi 14 5G 512GB ', 'https://cdn.tgdd.vn/Products/Images/42/298538/TimerThumb/xiaomi-14.jpg', '115000', '256GB, 512GB, 1TB', 'Xiaomi 14 được ra mắt với tâm hướng mang đến những trải nghiệm mới mẻ và chất lượng. Như một lá cờ đầu trong ngành công nghệ, điện thoại không chỉ có thiết kế đẹp mà còn ấn tượng về màn hình, cấu hình mạnh mẽ, máy ảnh chất lượng và pin có thời gian sử dụng lâu dài.', '6', '30');

-- Dumping structure for table shopclothes.product_bill
CREATE TABLE IF NOT EXISTS `product_bill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_product` varchar(45) DEFAULT NULL,
  `id_custom` varchar(45) DEFAULT NULL,
  `quantity` varchar(45) DEFAULT NULL,
  `datetime` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table shopclothes.product_bill: ~3 rows (approximately)
INSERT INTO `product_bill` (`id`, `id_product`, `id_custom`, `quantity`, `datetime`, `name`, `email`, `address`, `phone`) VALUES
	(21, '1', '1', '100', '2023/12/17 16:17:45', '', '', '', ''),
	(22, '1', '1', '100', '2023/12/17 16:18:55', 'samsung', 'yum@gmail.com', 'tam bình á', '123456322222233333333333333'),
	(23, '1', '1', '100', '2023/12/17 16:20:39', 'samsung', 'yum@gmail.com', 'tam bình á', '123456322222233333333333333'),
	(24, '2', '7', '4', '2024/04/17 13:35:33', 'đẹp trai quá', NULL, 'tam bình á', '0384774118'),
	(25, '2', '7', '4', '2024/04/17 18:08:43', 'đẹp trai quá', NULL, 'wefewf', '0384774118');

-- Dumping structure for table shopclothes.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `pass` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `phonenumber` varchar(45) DEFAULT NULL,
  `isSell` varchar(45) DEFAULT NULL,
  `isAdmin` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table shopclothes.user: ~6 rows (approximately)
INSERT INTO `user` (`id`, `username`, `pass`, `email`, `phonenumber`, `isSell`, `isAdmin`) VALUES
	(1, 'hoangnv', '123', 'abc2@gmail.com', '234', '1', '0'),
	(2, 'Linh nhat tia', '123', 'linh@gmail.com', '012345678', '0', '0'),
	(3, 'admin', '123', 'admin@gmail.com', '12345', '0', '0'),
	(4, '1', '2', '3', 'abc', '0', '0'),
	(5, 'a', 'bv', 'c', 'd', '0', '0'),
	(6, 'dm860974@gmail.com', '123', '123@gmail.com', '1312', '0', '0'),
	(7, 'linh', '123', '21130091@st.hcmuaf.edu.vn', '12345', '0', '0');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
