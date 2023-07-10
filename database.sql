-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: my_shop
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Máy in A4'),(2,'Máy in A3'),(3,'Máy in đa năng'),(4,'Máy in kim - hóa đơn - Bill'),(5,'Máy Scan'),(6,'Linh kiện máy in');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item` (
  `item_id` int NOT NULL AUTO_INCREMENT,
  `product_id` bigint NOT NULL,
  `unit_price` float NOT NULL,
  `quantity` int NOT NULL,
  `order_id` bigint NOT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (9,51,77,1,14),(10,88,50,1,14),(11,49,52,2,15),(12,50,54,1,15),(13,88,50,3,15),(14,89,48,1,15),(15,51,77,3,16),(16,47,60,1,16),(17,49,52,2,17),(18,58,59,1,17),(19,49,52,2,21),(20,60,68,1,22),(21,50,54,1,23),(22,88,49,3,23),(23,89,48,2,23),(24,51,76,2,24),(25,52,64,1,24),(26,58,59,5,25),(27,47,60,3,25),(28,50,54,1,26),(29,89,48,2,26),(30,64,71,1,27),(31,51,76,4,27),(32,77,53,1,27),(33,51,76,1,28),(34,47,60,3,28),(35,52,64,1,29),(36,47,60,1,30),(37,81,42,2,31),(38,60,68,1,31),(39,81,42,3,32),(40,98,42,1,33),(41,77,53,1,33),(42,49,52,3,34),(43,95,44,2,34),(45,55,67,2,35),(46,72,70,3,35),(47,47,60,2,36),(48,51,76,1,37),(49,51,76,1,38),(50,60,68,1,39),(52,82,7500000,1,41),(53,82,7500000,1,42),(54,47,2500000,1,43),(55,82,7500000,4,44),(56,49,3500000,1,45),(57,59,6500000,2,45),(58,59,6500000,1,46),(59,90,2800000,1,47),(60,86,1650000,1,48),(61,86,1650000,1,49);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_user`
--

DROP TABLE IF EXISTS `order_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_user` (
  `order_id` bigint NOT NULL AUTO_INCREMENT,
  `buy_date` datetime NOT NULL,
  `price_total` float NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_user`
--

LOCK TABLES `order_user` WRITE;
/*!40000 ALTER TABLE `order_user` DISABLE KEYS */;
INSERT INTO `order_user` VALUES (41,'2023-04-18 00:00:00',7500000,102),(42,'2023-04-18 00:00:00',7500000,102),(43,'2023-04-19 00:00:00',2500000,102),(44,'2023-04-19 00:00:00',30000000,102),(45,'2023-04-19 00:00:00',16500000,102),(46,'2023-04-24 00:00:00',6500000,102),(47,'2023-04-24 00:00:00',2800000,102),(48,'2023-04-24 00:00:00',1650000,102),(49,'2023-04-24 00:00:00',1650000,102);
/*!40000 ALTER TABLE `order_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `product_id` bigint NOT NULL AUTO_INCREMENT,
  `description` varchar(1000) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` float NOT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `quantity` int NOT NULL,
  `category_id` int DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  PRIMARY KEY (`product_id`),
  KEY `FK1mtsbur82frn64de7balymq9s` (`category_id`),
  CONSTRAINT `FK1mtsbur82frn64de7balymq9s` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (47,'HP M401N là dòng máy in văn phòng cao cấp của HP, tốc độ in rất nhanh, in qua USB , in mạng LAN... Mực in rẻ và thông dụng, chất lượng bản in cực kỳ đẹp','1681800912642.png',2200000,'MÁY IN HP PRO 401N',10,1,'Đang hoạt động'),(48,'Máy in HP LaserJet Pro 400 M402N với công nghệ JetIntelligence giúp bạn in nhiều trang hơn, sử dụng hộp mực lớn in đến 3.100 trang A4 với độ phủ mực 5% tiết kiệm mực mang lại hiệu quả kinh tế cao.','1681801028628.jpg',2800000,'MÁY IN HP LASER 107A',152,1,'Đang hoạt động'),(49,'Máy in laser Canon LBP 251dw đáp ứng năng suất lớn, người bạn đồng hành văn phòng đáng tin cậy.','1681801199115.jpg',3500000,'MÁY IN CANON LBP 251DW',150,1,'Đang hoạt động'),(50,'Máy in Brother HL-1111 là một sản phẩm thuộc dòng máy in laser đơn sắc dùng mực in TN – 1010. có thiết kế nhỏ gọn với công nghệ in ấn chống kẹt giấy (Hassle-free) mới sẽ mang lại giải pháp in ấn hiệu quả cho văn phòng của người sử dụng.','1681801363637.jpg',1200000,'MÁY IN BROTHER HL 1111',199,1,'Đang hoạt động'),(51,'Máy In Brother HL 2321D có thiết kế nhỏ gọn, thao tác đơn giản, được trang bị bộ đảo giấy cho phép in hai mặt giúp tiết kiệm giấy, chi phí in ấn tối đa lên đến 50%. ','1681801499162.jpg',5500000,'MÁY IN BROTHER HL 2321D',120,1,'Đang hoạt động'),(52,'Được thiết kế với khả năng in mạng 2 mặt tự động nhanh chóng, chiếc máy in laser này sẽ giúp bạn tiết kiệm được cả thời gian lẫn tiền bạc. Máy còn được trang bị khay giấy 250 tờ và một khay đa chức năng đáp ứng nhu cầu nhiều loại giấy khác nhau.','1681801672068.jpg',2800000,'MÁY IN CANON LBP 6230DN',345,1,'Đang hoạt động'),(53,'Máy in nhỏ tiện dụng nên in mỗi lần không quá 10 trang giấy và mỗi lần in cách nhau 15 phút để máy làm mát tránh tình trạng kẹt giấy và ngưng in (máy có chức năng cảm ứng nhiệt độ, nóng quá máy sẽ tự khởi động tính năng làm mát và tạm ngưng in).','1681801796924.jpg',1700000,'MÁY IN CŨ HP PRO M15A',167,1,'Đang hoạt động'),(54,'Dòng máy in văn phòng của HP, tốc độ in nhanh, in qua USB, in qua mạng NETWORK, mực in rẻ và thông dụng, chất lượng bản in đẹp','1681801880272.jpg',2000000,'MÁY IN CŨ HP 2035N',313,1,'Đang hoạt động'),(55,'ANON LBP 8610 là dòng máy in laser a3 cải tiến từ canon lbp 3500, với tốc độ in ấn nhanh được đánh giá là đối thủ nặng ký về chất lượng cũng như độ bền của 1 máy in chuyên dùng in bãn vẽ – in lụa .','1681802212539.png',5500000,'MÁY IN A3 CANON 8610',467,2,'Đang hoạt động'),(56,'Máy in Canon LBP 3970 A3 là dòng máy in laser trắng đen với khổ giấy chính là A3, A4. Với tốc độ in 25 trang/phút sẽ giúp bạn không phải chờ đợi quá lâu, dễ dàng, nhanh chóng giải quyết công việc. ','1681802660896.jpg',4500000,'MÁY IN A3 CANON 3970',276,2,'Đang hoạt động'),(57,'MÁY IN HP 5200 là dòng máy in laser a3 với tốc độ in ấn nhanh được đánh giá là đối thủ nặng ký về chất lượng cũng như độ bền của 1 máy in chuyên dùng in bãn vẽ','1681802758601.jpg',4500000,'MÁY IN A3 HP 5200',198,2,'Đang hoạt động'),(58,'Máy in canon LBP 3500 là một trong những sản phẩm máy in được sản xuất tại Nhật Bản với khả năng in khổ A3 cỡ lớn.','1681803043268.jpg',4600000,'MÁY IN A3 CANON LBP 3500',435,2,'Đang hoạt động'),(59,'Máy in HP LaserJet Pro M706N với công nghệ in laser hiện đại cho tốc độ in nhanh chóng lên đến số lượng 35 trang/phút giúp tiết kiệm thời gian, việc in ấn trở nên nhanh chóng hơn','1681803194334.jpg',6500000,'MÁY IN A3 HP PRO M706N',365,2,'Đang hoạt động'),(60,'Máy in đa chức năng Hp Laserjet Pro M28W thuộc loại máy in đa năng trắng đen HP với các chức năng: In, copy, scan màu, tốc độ 18 trang/ phút, giúp bạn giải quyết công việc anh chóng và hiệu quả với giá thành cực kỳ hấp dẫn.','1681803330210.jpg',2800000,'MÁY IN HP PRO M28W',423,3,'Đang hoạt động'),(61,'Máy in đa chức năng Canon MF 232W được thiết kế nhỏ gọn, hỗ trợ in di động, người dùng có thể in tài liệu trực tiếp từ các thiết bị di động của mình.','1681803387906.png',3100000,'MÁY IN CANON MF 232W',531,3,'Đang hoạt động'),(62,'Máy in đa chức năng Canon MF 244Dw là một chiếc máy lí tưởng, đáp ứng tốt các nhu cầu in, sao chụp, quét. Với thiết kế thời trang và kết cấu cơ khí bền bỉ, chiếc máy in Canon MF244Dw sẽ thúc đẩy hiệu suất làm việc cho văn phòng của bạn.','1681803454571.jpg',4500000,'MÁY IN CANON MF 244DW',484,3,'Đang hoạt động'),(63,'Máy in Brother MFC-L6900Dw là loại máy in đa chức năng laser đơn sắc tiết kiệm chi phí, máy in Brother 6900Dw là chiếc máy lý tưởng để dùng chung cho văn phòng làm việc với số lượng nhân viên đông và công việc nhiều.','1681803536373.jpg',5500000,'MÁY IN BROTHER MFC L6900DW',567,3,'Đang hoạt động'),(64,'Máy in HP LaserJet Pro 500 MFP M521DW Thiết kế lý tưởng phù hợp cho văn phòng vừa, nhỏ và lớn giá thành vừa phải mà vẫn đáp ứng đầy đủ các chức năng.','1681803581330.jpg',5500000,'MÁY IN HP PRO 500 MFP M521DW',462,3,'Đang hoạt động'),(65,'Tích hợp tính năng in đảo mặt tự động, chiếc máy in imageCLASS MF4820d đươc thiết kế nhằm mang lại năng suất cao, tiết kiệm chi phí mà không ảnh hưởng tới hình thức.','1681803636442.jpg',3000000,'MÁY IN CANON MF4820D',352,3,'Đang hoạt động'),(66,'Máy in đa năng dòng đời mới tốc độ nhanh của HP(in – copy – scan), máy gọn đẹp sang trọng. Kết nối USB + LAN, hỗ trợ in từ điện thoại, in + copy 2 mặt rất tiện lợi. Bản in rõ nét, mực in rẻ thông dụng.','1681803692995.jpg',2900000,'MÁY IN HP PRO M227SDN',535,4,'Đang hoạt động'),(67,'Một giải pháp lý tưởng cho văn phòng nhỏ và hộ kinh doanh, MFC-7450 giúp mang lại hiệu quả công việc cao. Máy còn có chức năng scan màu chất lượng cao với khay giấy 250 tờ và cổng single-sheet để in phong bì, in giấy dầy, giấy trong suốt.','1681803774983.jpg',2400000,'MÁY IN BROTHER 7450',215,3,'Đang hoạt động'),(68,'In kim A4A5 dùng in hóa đơn, in giấy liên tục, tốc độ in nhanh, dòng máy đời mới','1681803852839.jpg',2200000,'MÁY IN KIM EPSON LQ350',453,4,'Đang hoạt động'),(69,'Máy in kim khổ A3 Epson LQ-2090, dùng in hóa đơn, in giấy liên tục giấy 1 liên - giấy 5 liên, tốc độ in nhanh..','1681803936021.jpg',2200000,'MÁY IN KIM EPSON LQ-2090',379,4,'Đang hoạt động'),(70,'máy in kim Epson LQ 310 được coi là giải pháp in ấn tiết kiệm và nhanh gọn bậc nhất hiện nay. Thiết bị được sử dụng rộng rãi như: Tại các văn phòng, cơ quan, xí nghiệp, nhà sách… ','1681804021914.jpg',1500000,'MÁY IN KIM EPSON LQ 310',265,4,'Đang hoạt động'),(71,'Máy in kim khổ A3 Epson FX-2175, dùng in hóa đơn, in giấy liên tục giấy 1 liên - giấy 5 liên, tốc độ in nhanh...','1681804089905.jpg',3000000,'MÁY IN KIM EPSON FX 2175',343,4,'Đang hoạt động'),(72,'Máy in Kim, dùng in hóa đơn, in giấy liên tục A4, A5, giấy 1 liên - giấy 4 liên, tốc độ in nhanh...','1681804175513.jpg',2200000,'MÁY IN KIM EPSON LQ 590',547,4,'Đang hoạt động'),(73,'Máy scan Canon P-215II thiết kế nhỏ gọn với trọng lượng máy chỉ 1Kg bạn có thể cầm tay mang theo bên mình cùng chiếc Latop để scan mọi lúc mọi nơi. ','1681804244675.jpg',3400000,'MÁY SCAN CANON P 215II',743,5,'Đang hoạt động'),(74,'Máy Scan Canon DR-M140 với thiết kế thông minh giúp xử lý tài liệu dễ dàng và linh hoạt, giúp bạn nâng cao hiệu quả công việc tốt nhất.','1681804341426.jpg',5500000,'MÁY SCAN CANON DR-M140',296,5,'Đang hoạt động'),(75,'Tiết kiệm thời gian: Chỉ cần 01 nút nhấn khi thao tác\r\nTiết kiệm không gian: thiết kế nhỏ gọn, tính cơ động cao','1681804394235.jpg',4000000,'MÁY SCAN KODAK I940',343,5,'Đang hoạt động'),(77,'Máy scan Kodak i1420 dễ sử dụng, tốc độ scan nhanh (60 trang/phút) và khả năng xử lý hầu hết các loại tài liệu cho dù ở bất kỳ kích cỡ và điều kiện nào. ','1681804463227.jpg',4500000,'MÁY SCAN A3 KODAK I1420',834,5,'Đang hoạt động'),(78,'Máy quét chuyên dụng trang bị CCD độ phân giải 3200dpi, đèn LED ba lớp, đèn quét cấp độ A3, thiết kế chống bụi và phần mềm thiết kế hình ảnh chuyên nghiệp được thiết kế đặc biệt để đạt độ chính xác cao.','1681804507315.jpg',2200000,'MÁY A3 SCANMAKER MICROTEK 1100XL',783,5,'Đang hoạt động'),(79,'Máy scan 2 mặt tự động tốc độ scan siêu nhanh, khổ giấy A3 A4 A5, bản scan rõ nét, giấy dày giấy mỏng đều rất ok','1681804613758.jpg',5500000,'MÁY SCAN A3 FUJITSU FI 6670',673,5,'Đang hoạt động'),(80,'Máy scan Plustek PS396 sẵn sàng tối ưu hóa quy trình làm việc với đặc tính quét tốc độ, quét duplex tối ưu thời gian. Hiệu suất hoạt động của máy rất cao.','1681804724115.jpg',4000000,'MÁY SCAN PLUSTEK SMARTOFFICE PS396',348,5,'Đang hoạt động'),(81,'Tốc độ quét:  Màu/Thang xám (150dpi) - Trắng đen (300dpi): 20 tờ/phút = 40 ảnh/phút','1681804795556.png',3800000,'MÁY SCAN FUJITSU S1500',934,5,'Đang hoạt động'),(82,'Dòng máy scan A3 tốc độ cao, dộ phân giải cao, máy rất bền, tốc độ scan cực nhanh.','1681804840087.jpg',7500000,'MÁY SCAN A3 EPSON GT20000',582,5,'Đang hoạt động'),(83,'Máy scan HP ScanJet Pro 3000 s4 (6FW07A) là máy scan dạng nạp giấy được trang bị kết nối USB 3.0 giúp truyền tải dữ liệu một cách nhanh chóng. Bạn sẽ tiết kiệm tối đa thời gian để hoàn thành công việc với máy scan HP này.','1681804925261.png',3500000,'MÁY SCAN HP PRO 3000',563,5,'Đang hoạt động'),(84,'BOARD NGUỒN MÁY IN HP2014 HÀNG THÁO MÁY','1681804984577.jpg',2200000,'BOARD NGUỒN HP2014',328,6,'Đang hoạt động'),(85,'BOARD FORMATER HP2035','1681805026974.jpg',2800000,'BOARD FORMATER HP2035',921,6,'Đang hoạt động'),(86,'Bộ bánh xe lấy giấy dùng cho máy Scan Canon DR C125/ DR C225 (Exchange Roller Kit)','1681805133047.jpg',1650000,'Bộ bánh xe lấy giấy',445,6,'Đang hoạt động'),(87,'Combo bộ cao su kéo giấy sử dụng cho các dòng máy in phun màu Epson L1110. L3110. L3150. L4150. L4160…','1681805288651.jpg',250000,'BỘ CAO SU KÉO GIẤY MÁY IN EPSON L1110/L3110/L3150',562,6,'Đang hoạt động'),(88,'Mã đầu phun QY-0086: Sản phẩm có thể dùng chung cho các mã máy: Máy in canon 6770/ MX721/722/727. IX6870, iP7250, MG5420, MG5450, MG6470 , MF7570, MG6670 , MG5670','1681805890627.jpg',2050000,'ĐẦU PHUN MÁY IN CANON IX6770',765,6,'Đang hoạt động'),(89,'Đầu phun sử dụng cho máy in Canon pixma IX6860','1681805941230.jpg',2050000,'ĐẦU PHUN MÁY IN CANON IX6860',452,6,'Đang hoạt động'),(90,'Đầu phun sử dụng cho máy in canon G1010 CA 91(màu đen), CA 92(gồm 3 màu đỏ, vàng, xanh) sản phẩm có thể dùng chung cho các mã máy: G1010,G200, G2010, G3000, G3010.','1681805977362.jpg',2800000,'ĐẦU PHUN MÁY IN CANON G1010',293,6,'Đang hoạt động'),(91,'Bánh răng cuốn giấy sử dụng cho các dòng máy in Epson: L1110, L3110, L3150… Chất liệu nhựa ','1681806015164.jpg',250000,'BÁNH RĂNG CUỐN GIẤY MÁY IN EPSON L1110 L3110',546,6,'Đang hoạt động'),(92,'Mô tơ sử dụng cho: Máy in Epson L805 / T50, T60…','1681806054747.jpg',350000,'MÔ TƠ MÁY IN EPSON L805',834,6,'Đang hoạt động'),(93,'Dung dịch ngâm đầu phun sử dụng cho các dòng máy in Epson, Canon, Hp, Brother… Dung tích 100ml','1681806108578.jpg',250000,'DUNG DỊCH NGÂM ĐẦU PHUN',453,6,'Đang hoạt động'),(94,'Chíp mực sử dụng cho máy in phun màu Canon IX6770 mã 75Y. Canon IX6860 mã 65Y. Nhận biết chíp lỗi cần thay thế bằng các cách sau: Chíp không sáng đỏ, đèn xanh đứng in đèn cam nháy 4 lần và 15 lần…','1681806140747.jpg',80000,'(Y) CHIP MỰC CANON IX6770/6860 VÀNG',456,6,'Đang hoạt động'),(95,'Mô tơ sử dụng cho máy in epson L1800\r\nTình trạng máy mới 100%. Xuất xứ chính hãng','1681806176797.jpg',450000,'MÔ TƠ MÁY IN EPSON L1800',738,6,'Đang hoạt động'),(96,'– Chíp mực 821NR sử dụng chomáy in Epson 6 màu\r\n– Sử dụng được cho các model: Máy in Epson T50, Máy in Epson R1430','1681806212043.jpg',250000,'CHIP MỰC MÁY IN EPSON T50/1430W',982,6,'Đang hoạt động'),(97,'Đầu phun Epson L1800 có thể sử dụng chung cho các dòng máy in phun màu khổ A3, 6 màu mực như: Epson R1400/ R1430, R1390/ R1500W…','1681806244873.jpg',2800000,'ĐẦU PHUN MÁY IN EPSON L1800',213,6,'Đang hoạt động'),(109,'Board Formatter HP 1320 in 2 mặt','1681826421920.jpg',1190000,'Board Formatter HP 1320 in 2 mặt',100,6,'Đang hoạt động'),(111,'test','1682024864921.png',100000,'Board Formater máy in Epson 1390',10,1,'Đang hoạt động');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'ROLE_ADMIN'),(3,'ROLE_USER');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `gender` bit(1) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `role_id` int DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `FKn82ha3ccdebhokx3a8fgdqeyy` (`role_id`),
  KEY `idx_user_password` (`password`(20)),
  CONSTRAINT `FKn82ha3ccdebhokx3a8fgdqeyy` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (95,'Hồ chí minh','khoa',_binary '',NULL,'$2a$10$UL1JRICKRWnR5Tv16BtP9.ZFqTe3QBKjpsqMEiFJJDzr8R3FT5Jne','0973645345',3,'1681806882310.png','amomo@gmail.com'),(96,'quang nam','linh',_binary '',NULL,'$2a$10$eiyMhrpYTZZtNjYinB45q.OXHutScW.CRZ8T0ZAQCBGtPYMBt60tu','0329852147',1,'1681806840527.png','linh@gmail.com'),(98,'127b đinh tiên hoàng p3','linh',_binary '\0',NULL,'$2a$10$zUcEBc.i53BthRza01uRmOjUnneSFI51eGZx4y1m3GU5qgxZpEYSO','0329852147',1,'1681806799280.png','linhdoan@gmail.com'),(101,NULL,NULL,_binary '\0',NULL,'$2a$10$0aJKugnlqe5hFkrhorb6m.L3jKbPD3xdP4k7ZqS0Q65h3CaAcsCrm',NULL,3,'1608484153089.png','foceya1301@gmail.com'),(102,'127b đinh tiên hoàng p3','tien',_binary '\0',NULL,'$2a$10$/4XWZgWrlbQnZdVI3EnNmOObjsA/BciBUcUJV47TyO7Ch243Gesa2','0329852147',3,'1608484153089.png','truongtien@gmail.com');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-24  9:56:08
