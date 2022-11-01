-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: mariadb105.wobor.nazwa.pl:3306
-- Generation Time: Oct 11, 2021 at 09:17 PM
-- Server version: 10.5.12-MariaDB-log
-- PHP Version: 7.2.24-0ubuntu0.18.04.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wobor_wp1`
--

-- --------------------------------------------------------

--
-- Table structure for table `answers_dogs`
--

CREATE TABLE `answers_dogs` (
  `answer_id` int(10) NOT NULL,
  `question_id` int(10) NOT NULL,
  `dog_id` int(10) NOT NULL,
  `dog_answer` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `answers_dogs`
--

INSERT INTO `answers_dogs` (`answer_id`, `question_id`, `dog_id`, `dog_answer`) VALUES
(135, 6, 1, 1),
(145, 5, 3, -1),
(146, 6, 3, -1),
(178, 3, 1, 1),
(179, 5, 1, 1),
(190, 6, 2, -1),
(193, 5, 2, -1),
(204, 3, 2, -1),
(205, 4, 2, -1),
(207, 4, 3, -1),
(214, 1, 31, -1),
(215, 2, 31, -1),
(216, 3, 31, -1),
(217, 4, 31, -1),
(218, 5, 31, -1),
(219, 6, 31, -1),
(220, 1, 32, -1),
(221, 2, 32, -1),
(222, 3, 32, -1),
(223, 4, 32, -1),
(224, 5, 32, -1),
(225, 6, 32, -1),
(232, 5, 33, 1),
(238, 5, 34, -1),
(240, 1, 58, 1),
(242, 3, 58, -1),
(244, 5, 58, 1),
(245, 6, 58, 1),
(255, 1, 3, 1),
(256, 2, 3, 1),
(257, 3, 3, 1),
(261, 4, 34, -1),
(263, 3, 34, -1),
(264, 6, 34, -1),
(266, 2, 2, -1),
(268, 7, 2, -1),
(269, 7, 33, 1),
(270, 9, 33, 1),
(271, 11, 33, 1),
(272, 8, 33, 1),
(273, 10, 33, 1),
(274, 12, 33, 1),
(275, 6, 33, 1),
(276, 4, 33, 1),
(277, 2, 33, 1),
(283, 3, 33, 1),
(284, 2, 1, 1),
(288, 2, 58, 1),
(289, 4, 58, 1),
(290, 7, 58, -1),
(291, 9, 58, 1),
(292, 11, 58, -1),
(293, 8, 58, -1),
(294, 10, 58, 1),
(295, 12, 58, -1),
(297, 9, 1, 1),
(298, 11, 1, 1),
(299, 8, 1, 1),
(300, 10, 1, 1),
(301, 12, 1, 1),
(302, 8, 3, 1),
(303, 7, 3, 1),
(304, 9, 3, -1),
(305, 11, 3, 1),
(306, 12, 3, -1),
(307, 10, 3, 1),
(308, 7, 34, 1),
(309, 9, 34, -1),
(310, 11, 34, -1),
(311, 10, 34, 1),
(312, 8, 34, -1),
(313, 12, 34, 1),
(315, 11, 2, -1),
(317, 10, 2, -1),
(319, 9, 2, -1),
(320, 8, 2, -1),
(321, 12, 2, -1),
(327, 1, 59, 1),
(328, 4, 59, -1),
(329, 7, 59, 1),
(330, 10, 59, -1),
(331, 2, 59, -1),
(332, 5, 59, 1),
(333, 8, 59, -1),
(334, 11, 59, 1),
(335, 3, 59, 1),
(336, 6, 59, -1),
(337, 9, 59, 1),
(338, 12, 59, -1),
(339, 1, 60, 1),
(341, 7, 60, 1),
(342, 4, 60, 1),
(343, 10, 60, 1),
(345, 5, 60, -1),
(346, 8, 60, -1),
(347, 11, 60, -1),
(348, 3, 60, 1),
(349, 6, 60, 1),
(350, 9, 60, 1),
(351, 12, 60, 1),
(352, 1, 61, 1),
(353, 4, 61, 1),
(354, 7, 61, 1),
(355, 10, 61, 1),
(356, 2, 61, 1),
(357, 5, 61, 1),
(358, 8, 61, 1),
(359, 11, 61, 1),
(360, 3, 61, 1),
(361, 6, 61, 1),
(362, 9, 61, -1),
(363, 12, 61, -1),
(367, 4, 62, -1),
(368, 7, 62, -1),
(369, 10, 62, -1),
(371, 5, 62, -1),
(372, 8, 62, 1),
(373, 11, 62, 1),
(374, 3, 62, 1),
(376, 9, 62, -1),
(377, 12, 62, -1),
(378, 1, 63, 1),
(379, 4, 63, -1),
(380, 7, 63, 1),
(381, 10, 63, -1),
(382, 2, 63, 1),
(383, 5, 63, 1),
(384, 8, 63, -1),
(385, 11, 63, -1),
(386, 3, 63, 1),
(387, 6, 63, 1),
(388, 9, 63, 1),
(389, 12, 63, -1),
(391, 4, 64, 1),
(392, 7, 64, 1),
(393, 10, 64, -1),
(394, 2, 64, 1),
(395, 5, 64, 1),
(396, 8, 64, 1),
(397, 11, 64, -1),
(398, 3, 64, 1),
(399, 6, 64, 1),
(400, 9, 64, 1),
(401, 12, 64, -1),
(402, 1, 33, -1),
(408, 1, 65, 1),
(409, 4, 65, -1),
(410, 7, 65, 1),
(411, 10, 65, -1),
(412, 2, 65, -1),
(413, 5, 65, 1),
(414, 8, 65, -1),
(415, 11, 65, 1),
(416, 3, 65, 1),
(417, 6, 65, -1),
(418, 9, 65, 1),
(419, 12, 65, -1),
(423, 2, 60, -1),
(425, 1, 64, 1),
(427, 1, 2, 1),
(429, 2, 62, -1),
(438, 2, 34, -1),
(442, 1, 34, -1),
(443, 1, 66, 1),
(444, 4, 66, -1),
(445, 7, 66, -1),
(446, 10, 66, -1),
(447, 2, 66, -1),
(448, 5, 66, 1),
(449, 8, 66, 1),
(450, 11, 66, 1),
(451, 3, 66, 1),
(452, 6, 66, -1),
(453, 9, 66, -1),
(454, 12, 66, -1),
(455, 1, 67, -1),
(456, 4, 67, 1),
(457, 1, 68, -1),
(458, 4, 68, 1),
(459, 5, 68, -1),
(460, 10, 68, 1),
(461, 1, 69, -1),
(462, 3, 69, -1),
(463, 1, 73, 1),
(464, 3, 73, -1),
(465, 6, 73, 1),
(466, 7, 73, -1),
(467, 10, 73, 1),
(468, 11, 73, -1),
(470, 3, 74, 1),
(471, 5, 74, -1),
(472, 7, 74, -1),
(473, 9, 74, 1),
(474, 11, 74, -1),
(475, 2, 74, 1),
(476, 4, 74, 1),
(477, 6, 74, 1),
(478, 8, 74, 1),
(479, 10, 74, -1),
(480, 12, 74, 1),
(481, 1, 75, 1),
(482, 2, 75, -1),
(483, 3, 75, 1),
(484, 1, 74, -1),
(487, 7, 76, 1),
(489, 2, 76, 1),
(490, 5, 76, 1),
(492, 11, 76, 1),
(494, 6, 76, 1),
(495, 9, 76, 1),
(496, 12, 76, 1),
(497, 1, 76, -1),
(498, 4, 76, -1),
(499, 8, 76, -1),
(500, 3, 76, -1),
(501, 10, 76, -1),
(503, 1, 62, -1),
(505, 6, 62, 1),
(506, 1, 78, 1),
(507, 5, 78, -1),
(508, 4, 78, -1),
(509, 2, 78, -1),
(510, 3, 78, 1),
(511, 6, 78, 1),
(512, 9, 78, 1),
(513, 8, 78, -1),
(514, 7, 78, -1),
(515, 10, 78, 1),
(516, 11, 78, -1),
(517, 12, 78, 1),
(520, 1, 1, -1),
(521, 4, 1, -1),
(522, 7, 1, -1);

-- --------------------------------------------------------

--
-- Table structure for table `answers_users`
--

CREATE TABLE `answers_users` (
  `answer_id` int(10) NOT NULL,
  `question_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `user_answer` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `answers_users`
--

INSERT INTO `answers_users` (`answer_id`, `question_id`, `user_id`, `user_answer`) VALUES
(459, 1, 1, -1),
(497, 1, 2, 1),
(395, 1, 60, 1),
(423, 1, 61, 1),
(471, 1, 62, 1),
(483, 1, 63, 1),
(510, 1, 64, 1),
(511, 1, 95, 1),
(523, 1, 106, 1),
(644, 1, 107, -1),
(547, 1, 122, 1),
(559, 1, 133, -1),
(571, 1, 134, 1),
(583, 1, 145, 1),
(596, 1, 146, 1),
(609, 1, 147, -1),
(620, 1, 148, 1),
(632, 1, 151, -1),
(674, 1, 152, -1),
(679, 1, 153, 1),
(463, 2, 1, -1),
(501, 2, 2, 1),
(397, 2, 60, 1),
(416, 2, 61, 1),
(475, 2, 62, -1),
(484, 2, 63, -1),
(515, 2, 95, 1),
(527, 2, 106, 1),
(595, 2, 107, 1),
(551, 2, 122, 1),
(560, 2, 133, -1),
(575, 2, 134, 1),
(589, 2, 145, 1),
(600, 2, 146, 1),
(608, 2, 147, 1),
(621, 2, 148, 1),
(636, 2, 151, -1),
(665, 2, 152, 1),
(680, 2, 153, 1),
(467, 3, 1, -1),
(505, 3, 2, 1),
(393, 3, 60, -1),
(424, 3, 61, 1),
(479, 3, 62, 1),
(485, 3, 63, 1),
(519, 3, 95, 1),
(531, 3, 106, 1),
(543, 3, 107, 1),
(555, 3, 122, 1),
(561, 3, 133, 1),
(579, 3, 134, 1),
(584, 3, 145, 1),
(604, 3, 146, 1),
(616, 3, 147, 1),
(622, 3, 148, -1),
(640, 3, 151, 1),
(692, 3, 152, -1),
(681, 3, 153, -1),
(460, 4, 1, -1),
(498, 4, 2, 1),
(396, 4, 60, 1),
(428, 4, 61, 1),
(472, 4, 62, 1),
(486, 4, 63, -1),
(509, 4, 64, -1),
(512, 4, 95, -1),
(524, 4, 106, 1),
(645, 4, 107, -1),
(548, 4, 122, -1),
(562, 4, 133, 1),
(572, 4, 134, -1),
(590, 4, 145, 1),
(597, 4, 146, 1),
(610, 4, 147, 1),
(623, 4, 148, 1),
(633, 4, 151, -1),
(667, 4, 152, 1),
(682, 4, 153, -1),
(464, 5, 1, -1),
(502, 5, 2, 1),
(392, 5, 60, -1),
(432, 5, 61, -1),
(476, 5, 62, -1),
(487, 5, 63, 1),
(516, 5, 95, -1),
(528, 5, 106, 1),
(540, 5, 107, -1),
(552, 5, 122, -1),
(563, 5, 133, -1),
(576, 5, 134, 1),
(585, 5, 145, 1),
(602, 5, 146, 1),
(614, 5, 147, -1),
(624, 5, 148, 1),
(637, 5, 151, 1),
(676, 5, 152, -1),
(683, 5, 153, -1),
(468, 6, 1, -1),
(506, 6, 2, 1),
(394, 6, 60, -1),
(433, 6, 61, -1),
(480, 6, 62, 1),
(488, 6, 63, -1),
(520, 6, 95, 1),
(532, 6, 106, 1),
(649, 6, 107, -1),
(556, 6, 122, -1),
(564, 6, 133, 1),
(580, 6, 134, 1),
(591, 6, 145, 1),
(605, 6, 146, -1),
(617, 6, 147, 1),
(625, 6, 148, 1),
(641, 6, 151, -1),
(672, 6, 152, 1),
(684, 6, 153, -1),
(461, 7, 1, -1),
(499, 7, 2, 1),
(473, 7, 62, 1),
(489, 7, 63, 1),
(513, 7, 95, 1),
(525, 7, 106, 1),
(646, 7, 107, -1),
(549, 7, 122, 1),
(565, 7, 133, 1),
(573, 7, 134, 1),
(586, 7, 145, 1),
(598, 7, 146, 1),
(612, 7, 147, -1),
(626, 7, 148, -1),
(634, 7, 151, 1),
(675, 7, 152, -1),
(685, 7, 153, 1),
(465, 8, 1, -1),
(503, 8, 2, 1),
(477, 8, 62, -1),
(490, 8, 63, -1),
(517, 8, 95, 1),
(529, 8, 106, 1),
(648, 8, 107, 1),
(553, 8, 122, 1),
(566, 8, 133, -1),
(577, 8, 134, 1),
(592, 8, 145, 1),
(601, 8, 146, 1),
(613, 8, 147, 1),
(627, 8, 148, 1),
(638, 8, 151, -1),
(670, 8, 152, 1),
(686, 8, 153, 1),
(469, 9, 1, -1),
(507, 9, 2, 1),
(481, 9, 62, 1),
(491, 9, 63, 1),
(521, 9, 95, -1),
(533, 9, 106, 1),
(545, 9, 107, 1),
(557, 9, 122, 1),
(567, 9, 133, 1),
(581, 9, 134, 1),
(587, 9, 145, 1),
(606, 9, 146, 1),
(618, 9, 147, -1),
(628, 9, 148, 1),
(642, 9, 151, -1),
(678, 9, 152, -1),
(687, 9, 153, -1),
(462, 10, 1, -1),
(500, 10, 2, 1),
(474, 10, 62, 1),
(492, 10, 63, -1),
(514, 10, 95, 1),
(526, 10, 106, 1),
(647, 10, 107, -1),
(550, 10, 122, -1),
(568, 10, 133, 1),
(574, 10, 134, -1),
(593, 10, 145, 1),
(599, 10, 146, -1),
(611, 10, 147, -1),
(629, 10, 148, 1),
(635, 10, 151, 1),
(669, 10, 152, 1),
(688, 10, 153, 1),
(466, 11, 1, -1),
(504, 11, 2, 1),
(478, 11, 62, -1),
(493, 11, 63, 1),
(518, 11, 95, -1),
(530, 11, 106, 1),
(542, 11, 107, -1),
(554, 11, 122, -1),
(569, 11, 133, 1),
(578, 11, 134, 1),
(588, 11, 145, 1),
(603, 11, 146, -1),
(615, 11, 147, 1),
(630, 11, 148, 1),
(639, 11, 151, 1),
(658, 11, 152, 1),
(689, 11, 153, 1),
(470, 12, 1, -1),
(508, 12, 2, 1),
(482, 12, 62, 1),
(494, 12, 63, -1),
(522, 12, 95, 1),
(534, 12, 106, 1),
(650, 12, 107, -1),
(558, 12, 122, -1),
(570, 12, 133, -1),
(582, 12, 134, 1),
(594, 12, 145, 1),
(607, 12, 146, 1),
(619, 12, 147, 1),
(631, 12, 148, -1),
(643, 12, 151, -1),
(662, 12, 152, 1),
(690, 12, 153, -1);

-- --------------------------------------------------------

--
-- Table structure for table `dogs`
--

CREATE TABLE `dogs` (
  `dog_id` int(10) NOT NULL,
  `dog_name` varchar(50) NOT NULL,
  `description` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dogs`
--

INSERT INTO `dogs` (`dog_id`, `dog_name`, `description`) VALUES
(1, 'Bobby', 'loves children, loves other pets,  has trouble walking, is very relaxed, loves to sleep, is in good health, roughly 5 years old'),
(2, 'Toby', 'dislikes children, gets stressed around other pets, has no issues walking, likes open spaces where he can run around, barks a lot'),
(3, 'Halo', 'this dog likes to run chase, run and play with other pets, but not with kids, unless they give him food, and it\'s gotta have cheese in it'),
(33, 'Roy', 'Loves to chase cars, but without cars he\'s totally lazy. Hates fireworks but has no problem with noise otherwise. Will chase a cat through any terrain except up a tree. Friendly to all people, including kids. '),
(34, 'Frodo', 'He loves to dig holes and will try to do so even while he\'s inside. Gets along very well with other pets including cats and small rodents. Not a fan of kids but won\'t bite.'),
(58, 'Lego', 'Very lazy dog, hates exercise, loves to cuddle in front of a TV. Might try to sleep on your face like a cat. Great with babies.'),
(59, 'Bacon', 'Bacon ipsum dolor amet short ribs brisket venison rump drumstick pig sausage prosciutto chicken spare ribs salami picanha doner. Kevin capicola sausage, buffalo bresaola venison turkey shoulder picanha ham pork tri-tip meatball meatloaf ribeye. Doner spare ribs andouille bacon sausage. Ground round jerky brisket pastrami shank.'),
(60, 'Cupcake', 'Cupcake ipsum dolor. Sit amet marshmallow topping cheesecake muffin. Halvah croissant candy canes bonbon candy. Apple pie jelly beans topping carrot cake danish tart cake cheesecake. Muffin danish chocolate soufflé pastry icing bonbon oat cake. Powder cake jujubes oat cake. Lemon drops tootsie roll marshmallow halvah carrot cake.'),
(61, 'Veggie', 'Nori grape silver beet broccoli kombu beet greens fava bean potato quandong celery. Bunya nuts black-eyed pea prairie turnip leek lentil turnip greens parsnip. Sea lettuce lettuce water chestnut eggplant winter purslane fennel azuki bean earthnut pea sierra leone bologi leek soko chicory celtuce parsley jícama salsify.\r\n'),
(62, 'Cheese', 'Cheese on toast airedale the big cheese. Danish fontina cheesy grin airedale danish fontina taleggio the big cheese macaroni cheese port-salut. Edam fromage lancashire feta caerphilly everyone loves chalk and cheese brie. Red leicester parmesan cheese and biscuits cheesy feet blue castello cheesecake fromage frais smelly cheese.\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `dogs_images`
--

CREATE TABLE `dogs_images` (
  `dog_image_id` int(10) NOT NULL,
  `dog_id` int(10) NOT NULL,
  `image_url` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dogs_images`
--

INSERT INTO `dogs_images` (`dog_image_id`, `dog_id`, `image_url`) VALUES
(1, 1, 'assets/images/dogs/1.jpg'),
(2, 2, 'assets/images/dogs/2.jpg'),
(3, 3, 'assets/images/dogs/3.jpg'),
(11, 30, '/assets/images/dogs/upload-test-img.jpg'),
(12, 31, 'assets/images/dogs/upload-test-img.jpg'),
(13, 32, 'assets/images/dogs/upload-test-img.jpg'),
(14, 33, 'assets/images/dogs/most-loyal-dog-breeds-german-shepherd-1571185700.jpg'),
(15, 34, 'assets/images/dogs/d29fb21f-61e1-46e6-89f8-a65b280163cc-smallScale_g (1).jpg'),
(16, 35, 'assets/images/dogs/d29fb21f-61e1-46e6-89f8-a65b280163cc-smallScale_g (1).jpg'),
(17, 36, 'assets/images/dogs/d29fb21f-61e1-46e6-89f8-a65b280163cc-smallScale_g.jpg'),
(18, 37, 'assets/images/dogs/coconut-rice-bear.jpg'),
(19, 39, 'assets/images/dogs/d29fb21f-61e1-46e6-89f8-a65b280163cc-smallScale_g.jpg'),
(20, 40, 'assets/images/dogs/d29fb21f-61e1-46e6-89f8-a65b280163cc-smallScale_g (1).jpg'),
(21, 41, 'assets/images/dogs/18-puppy-dog-eyes.w700.h700.jpg'),
(22, 46, 'assets/images/dogs/most-loyal-dog-breeds-german-shepherd-1571185700.jpg'),
(23, 48, 'assets/images/dogs/photo-1554263022-02df49e88f7d.jpeg'),
(24, 49, 'assets/images/dogs/most-loyal-dog-breeds-german-shepherd-1571185700.jpg'),
(25, 50, 'assets/images/dogs/tractive-gps-3g-dogtracker-dalmatian-dog.jpg'),
(26, 51, 'assets/images/dogs/18-puppy-dog-eyes.w700.h700.jpg'),
(27, 52, 'assets/images/dogs/boo.jpg'),
(28, 53, 'assets/images/dogs/tractive-gps-3g-dogtracker-dalmatian-dog.jpg'),
(29, 54, 'assets/images/dogs/tractive-gps-3g-dogtracker-dalmatian-dog.jpg'),
(30, 55, 'assets/images/dogs/18-puppy-dog-eyes.w700.h700.jpg'),
(31, 56, 'assets/images/dogs/coconut-rice-bear.jpg'),
(32, 57, 'assets/images/dogs/boo.jpg'),
(33, 58, 'assets/images/dogs/boo.jpg'),
(34, 59, 'assets/images/dogs/tractive-gps-3g-dogtracker-dalmatian-dog.jpg'),
(35, 60, 'assets/images/dogs/photo-1554263022-02df49e88f7d.jpeg'),
(36, 61, 'assets/images/dogs/coconut-rice-bear.jpg'),
(37, 62, 'assets/images/dogs/18-puppy-dog-eyes.w700.h700.jpg'),
(38, 63, 'assets/images/dogs/290716_bulldog_P.jpg'),
(39, 64, 'assets/images/dogs/bandanas-for-dogs-printed.jpg'),
(40, 65, 'assets/images/dogs/boo.jpg'),
(41, 65, 'assets/images/dogs/18-puppy-dog-eyes.w700.h700.jpg'),
(42, 66, 'assets/images/dogs/d29fb21f-61e1-46e6-89f8-a65b280163cc-smallScale_g (1).jpg'),
(43, 67, 'assets/images/dogs/boo.jpg'),
(44, 68, 'assets/images/dogs/photo-1554263022-02df49e88f7d.jpeg'),
(45, 69, 'assets/images/dogs/coconut-rice-bear.jpg'),
(46, 70, 'assets/images/dogs/d29fb21f-61e1-46e6-89f8-a65b280163cc-smallScale_g.jpg'),
(47, 71, 'assets/images/dogs/bandanas-for-dogs-printed.jpg'),
(48, 72, 'assets/images/dogs/d29fb21f-61e1-46e6-89f8-a65b280163cc-smallScale_g.jpg'),
(49, 73, 'assets/images/dogs/most-loyal-dog-breeds-german-shepherd-1571185700.jpg'),
(50, 74, 'assets/images/dogs/290716_bulldog_P.jpg'),
(51, 75, 'assets/images/dogs/d29fb21f-61e1-46e6-89f8-a65b280163cc-smallScale_g (1).jpg'),
(52, 75, 'assets/images/dogs/liz.jpg'),
(53, 76, 'assets/images/dogs/liz.jpg'),
(54, 75, 'assets/images/dogs/czarnuch2.jpg'),
(55, 76, 'assets/images/dogs/czarnuch.jpg'),
(56, 77, 'assets/images/dogs/czarnuch2.jpg'),
(57, 78, 'assets/images/dogs/czarnuch2.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `question_id` int(10) NOT NULL,
  `question_content_human` varchar(200) NOT NULL,
  `question_content_dog` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`question_id`, `question_content_human`, `question_content_dog`) VALUES
(1, 'Will your dog live with children?', 'Is the dog friendly with children?'),
(2, 'Do you have other pets?', 'Is the dog happy to meet other pets?'),
(3, 'Is your home easy to access?', 'Does the dog find it hard to walk?'),
(4, 'Do you like to be active?', 'Does the dog like to be active?'),
(5, 'Do you live in a noisy area?', 'Is the dog okay with noise?'),
(6, 'Will you often meet other people with the dog?', 'Is the dog okay with being exposed to new humans?'),
(7, 'Is your place of residence above-average in size?', 'Does the dog need a lot of extra space?'),
(8, 'Would this be your first-ever dog?', 'Is this a good dog for a first-time owner?'),
(9, 'Will you travel a lot with the dog?', 'Is the dog comfortable with being transported?'),
(10, 'Are you prepared to invest in the dog\'s health?', 'Does the dog\'s health require special attention?'),
(11, 'Are you able to get help from a dog behaviorist?', 'Does the dog need to work with a dog behaviorist?'),
(12, 'Do you have another dog?', 'Is the dog friendly towards other dogs?');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(20) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_level` int(10) NOT NULL,
  `full_name` varchar(200) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `user_level`, `full_name`, `phone_number`, `email`) VALUES
(98, 'hashman', '$2y$10$4QQlxs.UYmhH7srxWUwQlenV83wECCznj8Mv4KPfqjkUfxcQW25qO', 2, '', '', ''),
(107, 'admin', '$2y$10$nUgMgI6IugDcyM4Yf9e.5euJKunyb9DAP1yhO.nPcTTiC6be9yqim', 2, 'Adam Boro', '+4552225882', 'adborowski@gmail.com'),
(108, 'zibby', '$2y$10$b2SVYOk8sv56uXytOnHj2Oql3BMtPtXws6aAWD0055DtndvkBCUhm', 1, '', '', ''),
(109, 'karatito', '$2y$10$T6I5A2eYO89AbHDThqfSmeGeJ1vYogxsMge/iyRBjeWvk58Vzx7ze', 1, '', '', ''),
(110, 'kikibongo', '$2y$10$fy4ggg8yEPp2fiCWYsbcS.N8Ie44Dh5t7ppvfhFdYhBaQ3DOxl26C', 1, '', '', ''),
(111, 'kobobo', '$2y$10$yV5ZKAq5BI0LWHnjH/SujuxDcN.xPj/Ao6uB3EU/QJ.ZaayddBuHe', 1, '', '', ''),
(112, 'kokodo', '$2y$10$ifRYxhlpH9dRGXOuQowwRuodPHHMy4BZEg4ig0R4kffOb4pJC72Iq', 1, '', '', ''),
(113, 'kombom', '$2y$10$JVBHukbON3czUZmJgj0OJOk5XiD61rDfJRo0Xshzl/4sMJcgeXfMW', 1, '', '', ''),
(114, 'kogogo', '$2y$10$LNuHu3kQB2B.5CG4Mo54CezjcFEQm9B0jdv5xdkvnb2AkDoILBvQC', 1, '', '', ''),
(115, 'kokomo', '$2y$10$iu7f5RoZFrxwOMN2T2EdZu9S8C20AX/xWE60.KT21dPCVRpMoxXcW', 1, '', '', ''),
(116, 'kokok', '$2y$10$aU5olIuOC7XOIzj/SZXPyueo3arK0HQpsLwtlOphOWdS/jv7dK60C', 1, '', '', ''),
(117, 'ko', '$2y$10$5WEVtd2tDCrhBpBD4t7LouDcx2w.FlwQOmRa6YENNesFJjq/AFzi.', 1, '', '', ''),
(118, 'p9i', '$2y$10$k5YcrGm..q6z08nEOCDw9.Sv7NWILvixTx7B82WX3FQwljd0yQAee', 1, '', '', ''),
(120, 'retoroto', '$2y$10$ucmMUYog8LCluNM6.7s9DOgp0lbx7s6iLyhKqw2ZSHDXWE3i6PWKK', 1, '', '', ''),
(121, 'retorotoasd', '$2y$10$Vvhu8gT7lkGgA9TDRKoNA.AVgwuW.wkqTy0jtJzl0EgxVfqqHhhGK', 1, '', '', ''),
(122, 'rotaract', '$2y$10$y5HEnaaWisFw8Ch/ymq6KORjDNs.AbwYTFd4MusmGql7NeItV/waO', 1, '', '', ''),
(123, 'newly', '$2y$10$nWrPpGfWbexb0PvaW15EIepNGGZ6RcNyzrx6bJbq/U4l7oT.6G/ey', 1, '', '', ''),
(124, 'typeczek', '$2y$10$O6zeugoRLc5tjXOxge5AUO/MVJxUwWNNaS4PTfM2F1N4cArp6XlMK', 1, '', '', ''),
(125, 'oijoijoijoijoij', '$2y$10$EL/xlyhR48PLpq2m5v4yROGSyJHh/UAVe8VV5IrNcAdMbNnDoNGR6', 1, NULL, NULL, NULL),
(128, '', '$2y$10$hdjpKSgFqGtLIM2aIdwzfeDZUaQx8ckhZ62guj1LP3qoyCYuzP4hC', 1, NULL, NULL, NULL),
(129, 'everything', '$2y$10$4vJXzANtG8faMa7YfdVfYe5P3EPyQmhYLWHV1TZM6dcWsXUxJEFkO', 1, NULL, NULL, NULL),
(131, 'everythingo', '$2y$10$dyLEREDiJv/ZaNKz5Uh0hObofRWQ571BkvAp/30V0hN97jGmrzN5W', 1, NULL, NULL, NULL),
(132, 'kakarot', '$2y$10$/VDzuvPgKaN3.gaRUno/SeKNv0gi4Sofhncev91t8g6T3R9V5uFaS', 1, 'kakarotto', '+66 666 666 666', 'kaka@gogo.com'),
(133, 'monia', '$2y$10$l9s7HXzjbMcvqw.b5Xo2V.jdHZOBsgdQ4d8FmyKxQO/tUmpInHDfy', 1, 'monika borowska', '602821591', 'borowskamoni@gmail.com'),
(134, 'adam', '$2y$10$H8omZ9EcAhOuT7f3f8kPvOJyVr3pDoKzcBSTZ.4JbGTGSqd9U8TBC', 1, NULL, NULL, NULL),
(135, 'ewelina', '$2y$10$nFZvsllg7/OPAEo6KdWAVuRjZNmkH/7oZyXysgHwAWPrzkZ0yXEiG', 1, NULL, NULL, NULL),
(137, 'a', '$2y$10$bIUEYTh9BiPLbQWG1voEmeI.ZFp6.IYyKGdhog4Xi/zxBzsQoVKaW', 1, NULL, NULL, NULL),
(145, 'kadarka', '$2y$10$wUtJ88J3/9HBWTXehodZVO3WR0Dgv2qe4GpaiWOQ2QgMtsGuzsrCa', 1, NULL, NULL, NULL),
(146, 'mads', '$2y$10$Hc3kshWO5m9.pu/xSXwvFeZ.7g9YvqIj9IS5uYMh5czZMiV56DzdK', 1, NULL, NULL, NULL),
(147, 'mathias', '$2y$10$W2wH9Zh2dWLhz313ebBgdeZboenyQgcIj.wEMGs3/VWP82zEcycca', 1, '', '', ''),
(148, 'frodingo', '$2y$10$sdgf8o.vLRJdO4XgBHe2DuyHroB.39MruhF4TfR4QqhrNuJr9wk/m', 1, 'Frodingo Bibbo ', '+45 5222 5883', 'Bibobo@wodo.pl'),
(149, 'toms5617', '$2y$10$JCc.Coc5lQsZ7sZVryk5U.4JA3yUvy8LsV9TijS9wS9zvtF8/Fufm', 1, NULL, NULL, NULL),
(150, 'fundacja', '$2y$10$mVwA/R.p4h4rOIZoeKz.Xe2gdq7Dtg8X3LWs9w5.6udHceDli0eFa', 2, NULL, NULL, NULL),
(151, 'Wobor', '$2y$10$0HWogAxsG4oXzJN/5fntl.ek29rQZZymTz1bdvzpqc42tipHpvTg6', 1, 'Wojciech Borowski', '502185070', 'borowskiwoj@gmail.com'),
(152, 'guest', '$2y$10$ZGnEA6SJL11B5.2cVd51Q.BtF.wzpJ1OwnQgM2l/qpgFpC2.fUqX.', 1, 'Adam', '52225882', 'adborowski@gmail.com'),
(153, 'adboro', '$2y$10$iSduCL8OiDWb8U/MOCtnLue7b1Cu5jMExZukItRfqSBYHFSo8/HN2', 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users_favorites`
--

CREATE TABLE `users_favorites` (
  `favorite_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `dog_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users_favorites`
--

INSERT INTO `users_favorites` (`favorite_id`, `user_id`, `dog_id`) VALUES
(219, 1, 1),
(220, 1, 33),
(240, 1, 34),
(216, 1, 58),
(218, 1, 60),
(241, 1, 62),
(221, 1, 65),
(185, 60, 1),
(184, 60, 2),
(189, 61, 30),
(208, 61, 34),
(236, 62, 1),
(223, 62, 65),
(242, 95, 3),
(243, 95, 61),
(265, 107, 1),
(263, 107, 59),
(258, 107, 60),
(245, 107, 63),
(253, 145, 1),
(252, 145, 33),
(260, 147, 33),
(261, 147, 62),
(259, 147, 64),
(262, 148, 61),
(264, 149, 33),
(279, 152, 1),
(269, 152, 59),
(280, 152, 60);

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

CREATE TABLE `videos` (
  `video_id` int(10) NOT NULL,
  `video_title` varchar(200) NOT NULL,
  `video_description` varchar(500) NOT NULL,
  `video_url` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `videos`
--

INSERT INTO `videos` (`video_id`, `video_title`, `video_description`, `video_url`) VALUES
(1, 'What comes with adopting a dog?', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ', 'https://www.youtube.com/embed/RW9MTIkaUfc'),
(2, 'How to love a dog that bites', 'We talk to Martyna about her experience of adopting a dog - how to prepare, what mistakes to avoid. We also discuss the importance of giving your dog space, respecting its signals, not judging, and how it\'s crucial to ALWAYS ask a vet if the aggression is caused by a health issue.', 'https://www.youtube.com/embed/atI8IlB2QwQ'),
(3, 'Dogs and Children', '\"What does the dog say?\" and the FOUR PAW DIALOGUES - conversations about dogs and issues that their owners tackle every day. In this episode we have Alicja Milewska and Irek Czerniejewski - two top dog behaviour experts from Wroclaw discussing the construction of a relationship between a dog and a human child.', 'https://www.youtube.com/embed/Qr9BhTKuoSA'),
(4, 'What to know before adopting', '\"What does the dog say?\" and the FOUR PAW DIALOGUES - conversations about dogs and issues that their owners tackle every day. In this episode we have Alicja Milewska and Irek Czerniejewski - two top dog behaviour experts from Wroclaw discussing the process of preparing for dog adoption.', 'https://www.youtube.com/embed/M6RNh_a1EhA'),
(5, 'What to look for in a dog expert?', 'W obecnych czasach wiele osób ma duże zdolności i wiedze marketingową. W tym odcinku mówię, na co zwracać uwagę, by nie dać się nabrać na ładne słowa.', 'https://www.youtube.com/embed/9cTCmFKIje0');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answers_dogs`
--
ALTER TABLE `answers_dogs`
  ADD PRIMARY KEY (`answer_id`),
  ADD UNIQUE KEY `question_id` (`question_id`,`dog_id`) USING BTREE;

--
-- Indexes for table `answers_users`
--
ALTER TABLE `answers_users`
  ADD PRIMARY KEY (`answer_id`),
  ADD UNIQUE KEY `question_id` (`question_id`,`user_id`,`user_answer`),
  ADD UNIQUE KEY `question_id_2` (`question_id`,`user_id`);

--
-- Indexes for table `dogs`
--
ALTER TABLE `dogs`
  ADD PRIMARY KEY (`dog_id`);

--
-- Indexes for table `dogs_images`
--
ALTER TABLE `dogs_images`
  ADD PRIMARY KEY (`dog_image_id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`question_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `users_favorites`
--
ALTER TABLE `users_favorites`
  ADD PRIMARY KEY (`favorite_id`),
  ADD UNIQUE KEY `user_id` (`user_id`,`dog_id`);

--
-- Indexes for table `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`video_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `answers_dogs`
--
ALTER TABLE `answers_dogs`
  MODIFY `answer_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=523;

--
-- AUTO_INCREMENT for table `answers_users`
--
ALTER TABLE `answers_users`
  MODIFY `answer_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=693;

--
-- AUTO_INCREMENT for table `dogs`
--
ALTER TABLE `dogs`
  MODIFY `dog_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `dogs_images`
--
ALTER TABLE `dogs_images`
  MODIFY `dog_image_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `question_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=154;

--
-- AUTO_INCREMENT for table `users_favorites`
--
ALTER TABLE `users_favorites`
  MODIFY `favorite_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=281;

--
-- AUTO_INCREMENT for table `videos`
--
ALTER TABLE `videos`
  MODIFY `video_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
