-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: mysql_db
-- Generation Time: Dec 22, 2020 at 11:23 AM
-- Server version: 5.7.32
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `idm`
--

-- --------------------------------------------------------

--
-- Table structure for table `authzforce`
--

CREATE TABLE `authzforce` (
  `az_domain` varchar(255) NOT NULL,
  `policy` char(36) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `oauth_client_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_token`
--

CREATE TABLE `auth_token` (
  `access_token` varchar(255) NOT NULL,
  `expires` datetime DEFAULT NULL,
  `valid` tinyint(1) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `pep_proxy_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `eidas_credentials`
--

CREATE TABLE `eidas_credentials` (
  `id` varchar(36) NOT NULL,
  `support_contact_person_name` varchar(255) DEFAULT NULL,
  `support_contact_person_surname` varchar(255) DEFAULT NULL,
  `support_contact_person_email` varchar(255) DEFAULT NULL,
  `support_contact_person_telephone_number` varchar(255) DEFAULT NULL,
  `support_contact_person_company` varchar(255) DEFAULT NULL,
  `technical_contact_person_name` varchar(255) DEFAULT NULL,
  `technical_contact_person_surname` varchar(255) DEFAULT NULL,
  `technical_contact_person_email` varchar(255) DEFAULT NULL,
  `technical_contact_person_telephone_number` varchar(255) DEFAULT NULL,
  `technical_contact_person_company` varchar(255) DEFAULT NULL,
  `organization_name` varchar(255) DEFAULT NULL,
  `organization_url` varchar(255) DEFAULT NULL,
  `oauth_client_id` varchar(36) DEFAULT NULL,
  `organization_nif` varchar(255) DEFAULT NULL,
  `sp_type` varchar(255) DEFAULT 'private',
  `attributes_list` json DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `iot`
--

CREATE TABLE `iot` (
  `id` varchar(255) NOT NULL,
  `password` varchar(40) DEFAULT NULL,
  `oauth_client_id` varchar(36) DEFAULT NULL,
  `salt` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_token`
--

CREATE TABLE `oauth_access_token` (
  `access_token` varchar(255) NOT NULL,
  `expires` datetime DEFAULT NULL,
  `scope` varchar(2000) DEFAULT NULL,
  `refresh_token` varchar(255) DEFAULT NULL,
  `valid` tinyint(1) DEFAULT NULL,
  `extra` json DEFAULT NULL,
  `oauth_client_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `iot_id` varchar(255) DEFAULT NULL,
  `authorization_code` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `oauth_access_token`
--

INSERT INTO `oauth_access_token` (`access_token`, `expires`, `scope`, `refresh_token`, `valid`, `extra`, `oauth_client_id`, `user_id`, `iot_id`, `authorization_code`) VALUES
('03f5647d5a8cdceef1e668ce0732fbe87b61ebe8', '2020-11-29 17:15:59', 'bearer', 'e12463ccbea14f72b6377b82b8d767c5e3d41cd6', 1, NULL, '5c7612ab-6d86-4658-8c4d-bc21a6b4a631', '4904a34c-dd97-4c96-96b6-d45bc181461a', NULL, NULL),
('0c93ff405a2e02da788b8fa4489d434b3d56ac66', '2020-12-04 12:15:08', 'bearer', '32ae997480e424aff27c7970f6cb9678ae4740ed', 1, NULL, '5c7612ab-6d86-4658-8c4d-bc21a6b4a631', '4904a34c-dd97-4c96-96b6-d45bc181461a', NULL, NULL),
('0e204287e54ce9dd2d55ac3e67b7067c62f23b1d', '2020-12-17 14:09:06', 'bearer', '88463eb3fec56b1bde192994407204a14c0459e2', 1, NULL, '5c7612ab-6d86-4658-8c4d-bc21a6b4a631', 'a38ecd3e-a30d-450e-a5dd-a775170570d1', NULL, NULL),
('0fec879249abeb8531586a9c9a862f83c8244971', '2020-11-29 23:51:40', 'bearer', 'b81d76f6790c94e3fe3ec4f881b0ef69eb8d7706', 1, NULL, '5c7612ab-6d86-4658-8c4d-bc21a6b4a631', '4904a34c-dd97-4c96-96b6-d45bc181461a', NULL, NULL),
('10e6ea5fa66fa193c10335f8c277144ee028e01c', '2020-12-05 01:44:38', 'bearer', '9c2cc98e0f6f38206ffed663b27a80dd4419269c', 1, NULL, '5c7612ab-6d86-4658-8c4d-bc21a6b4a631', 'a38ecd3e-a30d-450e-a5dd-a775170570d1', NULL, NULL),
('15087d3667f89a3154def4a0434a86fb021beffc', '2020-11-29 16:19:33', 'bearer', 'ce3cc4e2056f4f9b5a4b3d1082402314d940e903', 1, NULL, '5c7612ab-6d86-4658-8c4d-bc21a6b4a631', '4904a34c-dd97-4c96-96b6-d45bc181461a', NULL, NULL),
('151d3b6d3b4121f59fc774db9ce0614cc7ebe13b', '2020-11-29 23:48:01', 'bearer', '9989e4c9a3f96f5725df5cb076bfaa8f6d714244', 1, NULL, '5c7612ab-6d86-4658-8c4d-bc21a6b4a631', '4904a34c-dd97-4c96-96b6-d45bc181461a', NULL, NULL),
('28e2e5141c0b643bc6336e11dd47e91bd3b3d32c', '2020-12-05 20:50:58', 'bearer', '901b84b52b6d2dfdf46a3b76824e2445991ffebd', 1, NULL, '5c7612ab-6d86-4658-8c4d-bc21a6b4a631', 'a38ecd3e-a30d-450e-a5dd-a775170570d1', NULL, NULL),
('2d5b41c2ef0813a04889d2b3ec53838f45b371e8', '2020-12-22 12:05:12', 'bearer', '5bbb64ffbb478dfe8daa7a01947f77efadd35b33', 1, NULL, '5c7612ab-6d86-4658-8c4d-bc21a6b4a631', 'a38ecd3e-a30d-450e-a5dd-a775170570d1', NULL, NULL),
('3363c8eddd5c21b92723896fd34f25149fe7a4d0', '2020-12-16 23:45:58', 'bearer', '24eccb248f910dc5a50feaa359b1c914ae8765d1', 1, NULL, '5c7612ab-6d86-4658-8c4d-bc21a6b4a631', 'a38ecd3e-a30d-450e-a5dd-a775170570d1', NULL, NULL),
('468c70e757aa51a74242dee60343d65467491021', '2020-12-05 12:38:22', 'bearer', 'a76adc8fac4c9bc27581cb39f5c7ebcc3554d9a7', 1, NULL, '5c7612ab-6d86-4658-8c4d-bc21a6b4a631', 'a38ecd3e-a30d-450e-a5dd-a775170570d1', NULL, NULL),
('4bf25505d8ae3ebabb87baa6916a43a8c756ebad', '2020-12-22 12:07:53', 'bearer', '95b16bd1d77085a538eefcf21de8c20c41bb023e', 1, NULL, '5c7612ab-6d86-4658-8c4d-bc21a6b4a631', '4904a34c-dd97-4c96-96b6-d45bc181461a', NULL, NULL),
('59d90764383f8f60d9caf1833222a0f20ce2906f', '2020-12-16 00:22:52', 'bearer', '984f1a22a9631634dfd83052e0e972b11ba68679', 1, NULL, '5c7612ab-6d86-4658-8c4d-bc21a6b4a631', 'a38ecd3e-a30d-450e-a5dd-a775170570d1', NULL, NULL),
('5d73dfe03f215325f59d7401065749a74d538458', '2020-12-17 12:11:41', 'bearer', '95179a83206b6e4dd2d038eb8eb75bf6145c6aad', 1, NULL, '5c7612ab-6d86-4658-8c4d-bc21a6b4a631', '4904a34c-dd97-4c96-96b6-d45bc181461a', NULL, NULL),
('635f31d3af9af28214a6e09f351d4dcadc7a4836', '2020-12-19 16:06:25', 'bearer', '51ce95927b006b368e5ef8afe41d118b6c3759a4', 1, NULL, '5c7612ab-6d86-4658-8c4d-bc21a6b4a631', 'a38ecd3e-a30d-450e-a5dd-a775170570d1', NULL, NULL),
('64fd3a5722289b4001e36a250cbc552d387be681', '2020-12-03 13:19:12', 'bearer', 'ecdaafd3632c09923ce10ce49105eccb5d095397', 1, NULL, '5c7612ab-6d86-4658-8c4d-bc21a6b4a631', '4904a34c-dd97-4c96-96b6-d45bc181461a', NULL, NULL),
('6c064d0a8c134d88eaa080210fe62454e31e2f74', '2020-11-29 16:15:19', 'bearer', '9b8b022109bc90a3ae123242b3d915f9b85f06bc', 1, NULL, '5c7612ab-6d86-4658-8c4d-bc21a6b4a631', 'admin', NULL, NULL),
('6e430da535cea7730ac622f67561d197c33b1e7e', '2020-12-22 11:36:16', 'bearer', 'd3440eb7fdf03a309b2a4eed58b7dc7d93270e59', 1, NULL, '5c7612ab-6d86-4658-8c4d-bc21a6b4a631', '4904a34c-dd97-4c96-96b6-d45bc181461a', NULL, NULL),
('9419f5b8da6743299e3e3656a470925e27071437', '2020-11-29 16:20:56', 'bearer', '7ef815484926d5d3f17002272d59a4b592d68c34', 1, NULL, '5c7612ab-6d86-4658-8c4d-bc21a6b4a631', '4904a34c-dd97-4c96-96b6-d45bc181461a', NULL, NULL),
('98f71f88862be9ceb91eb93fe9860fbb95289085', '2020-11-29 23:39:28', 'bearer', '947cdec636a3e728709bcc5eda07c7183b0c6fde', 1, NULL, '5c7612ab-6d86-4658-8c4d-bc21a6b4a631', '4904a34c-dd97-4c96-96b6-d45bc181461a', NULL, NULL),
('9a42948d4a7c9cabdd2a8d8708b2aaf4bef6b9f2', '2020-12-04 21:06:47', 'bearer', '2ea8a82cdb824e2e90882e9fbf792c525ea85c53', 1, NULL, '5c7612ab-6d86-4658-8c4d-bc21a6b4a631', '4904a34c-dd97-4c96-96b6-d45bc181461a', NULL, NULL),
('9ae7af9327d49412912e3aaea03ea728b1724b54', '2020-11-29 23:54:11', 'bearer', 'aa97916b887b15d093bc1e6419b04dbac8f715aa', 1, NULL, '5c7612ab-6d86-4658-8c4d-bc21a6b4a631', '4904a34c-dd97-4c96-96b6-d45bc181461a', NULL, NULL),
('a3f7c1a734e66ea5df4b2d0f22ddaa2af7b26bfa', '2020-12-06 12:33:34', 'bearer', '60a64c0471777f24f967102a3bbb11a19d102538', 1, NULL, '5c7612ab-6d86-4658-8c4d-bc21a6b4a631', 'a38ecd3e-a30d-450e-a5dd-a775170570d1', NULL, NULL),
('a4377628a696baf31b30817f7886febba08b370b', '2020-11-29 17:16:40', 'bearer', '7586fd824c45fc47a1fab3866bdf483266b0d785', 1, NULL, '5c7612ab-6d86-4658-8c4d-bc21a6b4a631', '4904a34c-dd97-4c96-96b6-d45bc181461a', NULL, NULL),
('a8c512ccd0fd53dfd8af349e760683564caab1cb', '2020-11-29 16:56:08', 'bearer', '902a807e3c7d4297a70707614d79d95747425823', 1, NULL, '5c7612ab-6d86-4658-8c4d-bc21a6b4a631', '4904a34c-dd97-4c96-96b6-d45bc181461a', NULL, NULL),
('a8d7789b28bd38d80162374e40bd18f9e26f376b', '2020-12-22 12:04:36', 'bearer', '0397c89589da592e0b4a3cb99f5488084fa937b7', 1, NULL, '5c7612ab-6d86-4658-8c4d-bc21a6b4a631', '4904a34c-dd97-4c96-96b6-d45bc181461a', NULL, NULL),
('ad505e0059d9772f18cc2e800facf4d77716acc4', '2020-12-05 01:31:52', 'bearer', '152db9f5b6046edafd2e286aabc37f2e06701fd2', 1, NULL, '5c7612ab-6d86-4658-8c4d-bc21a6b4a631', '4904a34c-dd97-4c96-96b6-d45bc181461a', NULL, NULL),
('b68bfb4da6eb0f61ada94271b6ba35e2d5a4f153', '2020-12-20 01:21:25', 'bearer', '2a48c867d04993fbf32dd9067544baa219aa965f', 1, NULL, '5c7612ab-6d86-4658-8c4d-bc21a6b4a631', 'a38ecd3e-a30d-450e-a5dd-a775170570d1', NULL, NULL),
('b6f092d4ecad279e3a6b09dff91550474328d5b0', '2020-12-18 23:26:59', 'bearer', 'a78eac88715a08f73576fa236d9c6f2e0c395621', 1, NULL, '5c7612ab-6d86-4658-8c4d-bc21a6b4a631', 'a38ecd3e-a30d-450e-a5dd-a775170570d1', NULL, NULL),
('c008855b0211aa4eb59921d6933cb4810a37b43e', '2020-11-29 16:57:28', 'bearer', 'f27792ac468262a8c99831e0f0a370b6ad1a44cd', 1, NULL, '5c7612ab-6d86-4658-8c4d-bc21a6b4a631', '4904a34c-dd97-4c96-96b6-d45bc181461a', NULL, NULL),
('c1ee27a2dd92e68418ed836ee146d35a8ac49130', '2020-12-19 16:08:36', 'bearer', 'acefcbdf24dd648cb59d90ca2142c3167f4739c7', 1, NULL, '5c7612ab-6d86-4658-8c4d-bc21a6b4a631', '4904a34c-dd97-4c96-96b6-d45bc181461a', NULL, NULL),
('d276fb409c9d16c4471d82ef6a2c670862efaaf9', '2020-12-22 11:35:56', 'bearer', 'f07dbbdb6c2d13d5156a179d71905aab0fc91431', 1, NULL, '5c7612ab-6d86-4658-8c4d-bc21a6b4a631', 'a38ecd3e-a30d-450e-a5dd-a775170570d1', NULL, NULL),
('dc62d0085e4e024e4559d44625d3959179654ebf', '2020-12-20 01:28:21', 'bearer', 'bfd0380f3f7929b92eb2ef61c74966238c60b096', 1, NULL, '5c7612ab-6d86-4658-8c4d-bc21a6b4a631', '4904a34c-dd97-4c96-96b6-d45bc181461a', NULL, NULL),
('dd3f64c6267947aff2b5a9d1ad2afd2a286fe603', '2020-12-16 11:26:38', 'bearer', '7d1a688e42ecd73f525f93ba83bab2b8e9de27d1', 1, NULL, '5c7612ab-6d86-4658-8c4d-bc21a6b4a631', 'a38ecd3e-a30d-450e-a5dd-a775170570d1', NULL, NULL),
('df757b1e364a8008dc78c98d1b24ae8d807a391d', '2020-11-29 23:54:57', 'bearer', 'c2e5608ee2ed7fd6b0345ac20f07d5e753eb5d2c', 1, NULL, '5c7612ab-6d86-4658-8c4d-bc21a6b4a631', '4904a34c-dd97-4c96-96b6-d45bc181461a', NULL, NULL),
('e6d47659d4375eb8653b87ebc197bd197d2ad4a6', '2020-12-01 00:30:57', 'bearer', '1f5fcc2845c948d4223c25c81759a51c76df0181', 1, NULL, '5c7612ab-6d86-4658-8c4d-bc21a6b4a631', 'a38ecd3e-a30d-450e-a5dd-a775170570d1', NULL, NULL),
('e87429eb673b51b9b5dcd86142fc08e30b51fe7c', '2020-12-02 10:52:43', 'bearer', 'a362008e46289af82a5ad340b919cf5ea761c59e', 1, NULL, '5c7612ab-6d86-4658-8c4d-bc21a6b4a631', '4904a34c-dd97-4c96-96b6-d45bc181461a', NULL, NULL),
('eba30aaeda37d8cac2f6489b5d0055a758ad7fc5', '2020-12-22 11:29:17', 'bearer', 'a7e3396376cf3a29391c06c9df7558f2ba68ce89', 1, NULL, '5c7612ab-6d86-4658-8c4d-bc21a6b4a631', '4904a34c-dd97-4c96-96b6-d45bc181461a', NULL, NULL),
('ede286bd3d8bd0b387d1c4a3dfe6f306e3f3f229', '2020-12-06 20:02:24', 'bearer', '9021f2a30d57cd62111f2c0c556286608b7ec2fb', 1, NULL, '5c7612ab-6d86-4658-8c4d-bc21a6b4a631', 'a38ecd3e-a30d-450e-a5dd-a775170570d1', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_authorization_code`
--

CREATE TABLE `oauth_authorization_code` (
  `authorization_code` varchar(256) NOT NULL,
  `expires` datetime DEFAULT NULL,
  `redirect_uri` varchar(2000) DEFAULT NULL,
  `scope` varchar(2000) DEFAULT NULL,
  `valid` tinyint(1) DEFAULT NULL,
  `extra` json DEFAULT NULL,
  `oauth_client_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_client`
--

CREATE TABLE `oauth_client` (
  `id` varchar(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `secret` char(36) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `url` varchar(2000) DEFAULT NULL,
  `redirect_uri` varchar(2000) DEFAULT NULL,
  `image` varchar(255) DEFAULT 'default',
  `grant_type` varchar(255) DEFAULT NULL,
  `response_type` varchar(255) DEFAULT NULL,
  `client_type` varchar(15) DEFAULT NULL,
  `scope` varchar(2000) DEFAULT NULL,
  `extra` json DEFAULT NULL,
  `token_types` varchar(2000) DEFAULT NULL,
  `jwt_secret` varchar(255) DEFAULT NULL,
  `redirect_sign_out_uri` varchar(2000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `oauth_client`
--

INSERT INTO `oauth_client` (`id`, `name`, `description`, `secret`, `url`, `redirect_uri`, `image`, `grant_type`, `response_type`, `client_type`, `scope`, `extra`, `token_types`, `jwt_secret`, `redirect_sign_out_uri`) VALUES
('5c7612ab-6d86-4658-8c4d-bc21a6b4a631', 'Cinema APP', 'cinema app', '0ef1c30f-51d2-478c-8c4e-ec54606326da', 'http://localhost:3000/Application_Logic/index.php', 'http://localhost:3000/Application_Logic/index.php', 'default', 'authorization_code,implicit,password,client_credentials,refresh_token,hybrid', 'code,token,id_token', NULL, 'openid', NULL, NULL, NULL, 'http://localhost:3000/Application_Logic/index.php'),
('idm_admin_app', 'idm', 'idm', NULL, '', '', 'default', '', '', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_token`
--

CREATE TABLE `oauth_refresh_token` (
  `refresh_token` varchar(256) NOT NULL,
  `expires` datetime DEFAULT NULL,
  `scope` varchar(2000) DEFAULT NULL,
  `oauth_client_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `iot_id` varchar(255) DEFAULT NULL,
  `authorization_code` varchar(255) DEFAULT NULL,
  `valid` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `oauth_refresh_token`
--

INSERT INTO `oauth_refresh_token` (`refresh_token`, `expires`, `scope`, `oauth_client_id`, `user_id`, `iot_id`, `authorization_code`, `valid`) VALUES
('0397c89589da592e0b4a3cb99f5488084fa937b7', '2021-01-05 11:04:36', 'bearer', '5c7612ab-6d86-4658-8c4d-bc21a6b4a631', '4904a34c-dd97-4c96-96b6-d45bc181461a', NULL, NULL, 1),
('152db9f5b6046edafd2e286aabc37f2e06701fd2', '2020-12-19 00:31:52', 'bearer', '5c7612ab-6d86-4658-8c4d-bc21a6b4a631', '4904a34c-dd97-4c96-96b6-d45bc181461a', NULL, NULL, 1),
('1f5fcc2845c948d4223c25c81759a51c76df0181', '2020-12-14 23:30:57', 'bearer', '5c7612ab-6d86-4658-8c4d-bc21a6b4a631', 'a38ecd3e-a30d-450e-a5dd-a775170570d1', NULL, NULL, 1),
('24eccb248f910dc5a50feaa359b1c914ae8765d1', '2020-12-30 22:45:58', 'bearer', '5c7612ab-6d86-4658-8c4d-bc21a6b4a631', 'a38ecd3e-a30d-450e-a5dd-a775170570d1', NULL, NULL, 1),
('2a48c867d04993fbf32dd9067544baa219aa965f', '2021-01-03 00:21:25', 'bearer', '5c7612ab-6d86-4658-8c4d-bc21a6b4a631', 'a38ecd3e-a30d-450e-a5dd-a775170570d1', NULL, NULL, 1),
('2ea8a82cdb824e2e90882e9fbf792c525ea85c53', '2020-12-18 20:06:47', 'bearer', '5c7612ab-6d86-4658-8c4d-bc21a6b4a631', '4904a34c-dd97-4c96-96b6-d45bc181461a', NULL, NULL, 1),
('32ae997480e424aff27c7970f6cb9678ae4740ed', '2020-12-18 11:15:08', 'bearer', '5c7612ab-6d86-4658-8c4d-bc21a6b4a631', '4904a34c-dd97-4c96-96b6-d45bc181461a', NULL, NULL, 1),
('51ce95927b006b368e5ef8afe41d118b6c3759a4', '2021-01-02 15:06:25', 'bearer', '5c7612ab-6d86-4658-8c4d-bc21a6b4a631', 'a38ecd3e-a30d-450e-a5dd-a775170570d1', NULL, NULL, 1),
('5bbb64ffbb478dfe8daa7a01947f77efadd35b33', '2021-01-05 11:05:12', 'bearer', '5c7612ab-6d86-4658-8c4d-bc21a6b4a631', 'a38ecd3e-a30d-450e-a5dd-a775170570d1', NULL, NULL, 1),
('60a64c0471777f24f967102a3bbb11a19d102538', '2020-12-20 11:33:34', 'bearer', '5c7612ab-6d86-4658-8c4d-bc21a6b4a631', 'a38ecd3e-a30d-450e-a5dd-a775170570d1', NULL, NULL, 1),
('7586fd824c45fc47a1fab3866bdf483266b0d785', '2020-12-13 16:16:40', 'bearer', '5c7612ab-6d86-4658-8c4d-bc21a6b4a631', '4904a34c-dd97-4c96-96b6-d45bc181461a', NULL, NULL, 1),
('7d1a688e42ecd73f525f93ba83bab2b8e9de27d1', '2020-12-30 10:26:38', 'bearer', '5c7612ab-6d86-4658-8c4d-bc21a6b4a631', 'a38ecd3e-a30d-450e-a5dd-a775170570d1', NULL, NULL, 1),
('7ef815484926d5d3f17002272d59a4b592d68c34', '2020-12-13 15:20:56', 'bearer', '5c7612ab-6d86-4658-8c4d-bc21a6b4a631', '4904a34c-dd97-4c96-96b6-d45bc181461a', NULL, NULL, 1),
('88463eb3fec56b1bde192994407204a14c0459e2', '2020-12-31 13:09:06', 'bearer', '5c7612ab-6d86-4658-8c4d-bc21a6b4a631', 'a38ecd3e-a30d-450e-a5dd-a775170570d1', NULL, NULL, 1),
('901b84b52b6d2dfdf46a3b76824e2445991ffebd', '2020-12-19 19:50:58', 'bearer', '5c7612ab-6d86-4658-8c4d-bc21a6b4a631', 'a38ecd3e-a30d-450e-a5dd-a775170570d1', NULL, NULL, 1),
('9021f2a30d57cd62111f2c0c556286608b7ec2fb', '2020-12-20 19:02:24', 'bearer', '5c7612ab-6d86-4658-8c4d-bc21a6b4a631', 'a38ecd3e-a30d-450e-a5dd-a775170570d1', NULL, NULL, 1),
('902a807e3c7d4297a70707614d79d95747425823', '2020-12-13 15:56:08', 'bearer', '5c7612ab-6d86-4658-8c4d-bc21a6b4a631', '4904a34c-dd97-4c96-96b6-d45bc181461a', NULL, NULL, 1),
('947cdec636a3e728709bcc5eda07c7183b0c6fde', '2020-12-13 22:39:28', 'bearer', '5c7612ab-6d86-4658-8c4d-bc21a6b4a631', '4904a34c-dd97-4c96-96b6-d45bc181461a', NULL, NULL, 1),
('95179a83206b6e4dd2d038eb8eb75bf6145c6aad', '2020-12-31 11:11:41', 'bearer', '5c7612ab-6d86-4658-8c4d-bc21a6b4a631', '4904a34c-dd97-4c96-96b6-d45bc181461a', NULL, NULL, 1),
('95b16bd1d77085a538eefcf21de8c20c41bb023e', '2021-01-05 11:07:53', 'bearer', '5c7612ab-6d86-4658-8c4d-bc21a6b4a631', '4904a34c-dd97-4c96-96b6-d45bc181461a', NULL, NULL, 1),
('984f1a22a9631634dfd83052e0e972b11ba68679', '2020-12-29 23:22:52', 'bearer', '5c7612ab-6d86-4658-8c4d-bc21a6b4a631', 'a38ecd3e-a30d-450e-a5dd-a775170570d1', NULL, NULL, 1),
('9989e4c9a3f96f5725df5cb076bfaa8f6d714244', '2020-12-13 22:48:01', 'bearer', '5c7612ab-6d86-4658-8c4d-bc21a6b4a631', '4904a34c-dd97-4c96-96b6-d45bc181461a', NULL, NULL, 1),
('9b8b022109bc90a3ae123242b3d915f9b85f06bc', '2020-12-13 15:15:19', 'bearer', '5c7612ab-6d86-4658-8c4d-bc21a6b4a631', 'admin', NULL, NULL, 1),
('9c2cc98e0f6f38206ffed663b27a80dd4419269c', '2020-12-19 00:44:38', 'bearer', '5c7612ab-6d86-4658-8c4d-bc21a6b4a631', 'a38ecd3e-a30d-450e-a5dd-a775170570d1', NULL, NULL, 1),
('a362008e46289af82a5ad340b919cf5ea761c59e', '2020-12-16 09:52:43', 'bearer', '5c7612ab-6d86-4658-8c4d-bc21a6b4a631', '4904a34c-dd97-4c96-96b6-d45bc181461a', NULL, NULL, 1),
('a76adc8fac4c9bc27581cb39f5c7ebcc3554d9a7', '2020-12-19 11:38:22', 'bearer', '5c7612ab-6d86-4658-8c4d-bc21a6b4a631', 'a38ecd3e-a30d-450e-a5dd-a775170570d1', NULL, NULL, 1),
('a78eac88715a08f73576fa236d9c6f2e0c395621', '2021-01-01 22:26:59', 'bearer', '5c7612ab-6d86-4658-8c4d-bc21a6b4a631', 'a38ecd3e-a30d-450e-a5dd-a775170570d1', NULL, NULL, 1),
('a7e3396376cf3a29391c06c9df7558f2ba68ce89', '2021-01-05 10:29:17', 'bearer', '5c7612ab-6d86-4658-8c4d-bc21a6b4a631', '4904a34c-dd97-4c96-96b6-d45bc181461a', NULL, NULL, 1),
('aa97916b887b15d093bc1e6419b04dbac8f715aa', '2020-12-13 22:54:11', 'bearer', '5c7612ab-6d86-4658-8c4d-bc21a6b4a631', '4904a34c-dd97-4c96-96b6-d45bc181461a', NULL, NULL, 1),
('acefcbdf24dd648cb59d90ca2142c3167f4739c7', '2021-01-02 15:08:36', 'bearer', '5c7612ab-6d86-4658-8c4d-bc21a6b4a631', '4904a34c-dd97-4c96-96b6-d45bc181461a', NULL, NULL, 1),
('b81d76f6790c94e3fe3ec4f881b0ef69eb8d7706', '2020-12-13 22:51:40', 'bearer', '5c7612ab-6d86-4658-8c4d-bc21a6b4a631', '4904a34c-dd97-4c96-96b6-d45bc181461a', NULL, NULL, 1),
('bfd0380f3f7929b92eb2ef61c74966238c60b096', '2021-01-03 00:28:21', 'bearer', '5c7612ab-6d86-4658-8c4d-bc21a6b4a631', '4904a34c-dd97-4c96-96b6-d45bc181461a', NULL, NULL, 1),
('c2e5608ee2ed7fd6b0345ac20f07d5e753eb5d2c', '2020-12-13 22:54:57', 'bearer', '5c7612ab-6d86-4658-8c4d-bc21a6b4a631', '4904a34c-dd97-4c96-96b6-d45bc181461a', NULL, NULL, 1),
('ce3cc4e2056f4f9b5a4b3d1082402314d940e903', '2020-12-13 15:19:33', 'bearer', '5c7612ab-6d86-4658-8c4d-bc21a6b4a631', '4904a34c-dd97-4c96-96b6-d45bc181461a', NULL, NULL, 1),
('d3440eb7fdf03a309b2a4eed58b7dc7d93270e59', '2021-01-05 10:36:16', 'bearer', '5c7612ab-6d86-4658-8c4d-bc21a6b4a631', '4904a34c-dd97-4c96-96b6-d45bc181461a', NULL, NULL, 1),
('e12463ccbea14f72b6377b82b8d767c5e3d41cd6', '2020-12-13 16:15:59', 'bearer', '5c7612ab-6d86-4658-8c4d-bc21a6b4a631', '4904a34c-dd97-4c96-96b6-d45bc181461a', NULL, NULL, 1),
('ecdaafd3632c09923ce10ce49105eccb5d095397', '2020-12-17 12:19:12', 'bearer', '5c7612ab-6d86-4658-8c4d-bc21a6b4a631', '4904a34c-dd97-4c96-96b6-d45bc181461a', NULL, NULL, 1),
('f07dbbdb6c2d13d5156a179d71905aab0fc91431', '2021-01-05 10:35:56', 'bearer', '5c7612ab-6d86-4658-8c4d-bc21a6b4a631', 'a38ecd3e-a30d-450e-a5dd-a775170570d1', NULL, NULL, 1),
('f27792ac468262a8c99831e0f0a370b6ad1a44cd', '2020-12-13 15:57:28', 'bearer', '5c7612ab-6d86-4658-8c4d-bc21a6b4a631', '4904a34c-dd97-4c96-96b6-d45bc181461a', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_scope`
--

CREATE TABLE `oauth_scope` (
  `id` int(11) NOT NULL,
  `scope` varchar(255) DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `organization`
--

CREATE TABLE `organization` (
  `id` varchar(36) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `description` text,
  `website` varchar(2000) DEFAULT NULL,
  `image` varchar(255) DEFAULT 'default'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pep_proxy`
--

CREATE TABLE `pep_proxy` (
  `id` varchar(255) NOT NULL,
  `password` varchar(40) DEFAULT NULL,
  `oauth_client_id` varchar(36) DEFAULT NULL,
  `salt` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pep_proxy`
--

INSERT INTO `pep_proxy` (`id`, `password`, `oauth_client_id`, `salt`) VALUES
('pep_proxy_c18c0337-2ca3-46ff-a6c3-829d12a56a9b', '58099c441fa0cc858e8dedf778734e5a736d3d6c', '5c7612ab-6d86-4658-8c4d-bc21a6b4a631', 'c5a386817f7f22dc');

-- --------------------------------------------------------

--
-- Table structure for table `permission`
--

CREATE TABLE `permission` (
  `id` varchar(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `is_internal` tinyint(1) DEFAULT '0',
  `action` varchar(255) DEFAULT NULL,
  `resource` varchar(255) DEFAULT NULL,
  `xml` text,
  `oauth_client_id` varchar(36) DEFAULT NULL,
  `is_regex` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `permission`
--

INSERT INTO `permission` (`id`, `name`, `description`, `is_internal`, `action`, `resource`, `xml`, `oauth_client_id`, `is_regex`) VALUES
('1', 'Get and assign all internal application roles', NULL, 1, NULL, NULL, NULL, 'idm_admin_app', 0),
('2', 'Manage the application', NULL, 1, NULL, NULL, NULL, 'idm_admin_app', 0),
('3', 'Manage roles', NULL, 1, NULL, NULL, NULL, 'idm_admin_app', 0),
('4', 'Manage authorizations', NULL, 1, NULL, NULL, NULL, 'idm_admin_app', 0),
('5', 'Get and assign all public application roles', NULL, 1, NULL, NULL, NULL, 'idm_admin_app', 0),
('6', 'Get and assign only public owned roles', NULL, 1, NULL, NULL, NULL, 'idm_admin_app', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ptp`
--

CREATE TABLE `ptp` (
  `id` int(11) NOT NULL,
  `previous_job_id` varchar(255) NOT NULL,
  `oauth_client_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` varchar(36) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `is_internal` tinyint(1) DEFAULT '0',
  `oauth_client_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`, `is_internal`, `oauth_client_id`) VALUES
('fa9ae581-2541-448e-b581-af5421311501', 'CINEMAOWNER', 0, '5c7612ab-6d86-4658-8c4d-bc21a6b4a631'),
('fe1bee5f-1dcf-4b34-ac9f-cf7aa3e10c73', 'USER', 0, '5c7612ab-6d86-4658-8c4d-bc21a6b4a631'),
('provider', 'Provider', 1, 'idm_admin_app'),
('purchaser', 'Purchaser', 1, 'idm_admin_app');

-- --------------------------------------------------------

--
-- Table structure for table `role_assignment`
--

CREATE TABLE `role_assignment` (
  `id` int(11) NOT NULL,
  `role_organization` varchar(255) DEFAULT NULL,
  `oauth_client_id` varchar(36) DEFAULT NULL,
  `role_id` varchar(36) DEFAULT NULL,
  `organization_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role_assignment`
--

INSERT INTO `role_assignment` (`id`, `role_organization`, `oauth_client_id`, `role_id`, `organization_id`, `user_id`) VALUES
(8, NULL, '5c7612ab-6d86-4658-8c4d-bc21a6b4a631', 'fe1bee5f-1dcf-4b34-ac9f-cf7aa3e10c73', NULL, '4904a34c-dd97-4c96-96b6-d45bc181461a'),
(9, NULL, '5c7612ab-6d86-4658-8c4d-bc21a6b4a631', 'provider', NULL, 'admin'),
(10, NULL, '5c7612ab-6d86-4658-8c4d-bc21a6b4a631', 'fe1bee5f-1dcf-4b34-ac9f-cf7aa3e10c73', NULL, 'f3a05aa7-0352-442e-b04b-dcf5df7f6898'),
(11, NULL, '5c7612ab-6d86-4658-8c4d-bc21a6b4a631', 'fa9ae581-2541-448e-b581-af5421311501', NULL, 'a38ecd3e-a30d-450e-a5dd-a775170570d1');

-- --------------------------------------------------------

--
-- Table structure for table `role_permission`
--

CREATE TABLE `role_permission` (
  `id` int(11) NOT NULL,
  `role_id` varchar(36) DEFAULT NULL,
  `permission_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role_permission`
--

INSERT INTO `role_permission` (`id`, `role_id`, `permission_id`) VALUES
(1, 'provider', '1'),
(2, 'provider', '2'),
(3, 'provider', '3'),
(4, 'provider', '4'),
(5, 'provider', '5'),
(6, 'provider', '6'),
(7, 'purchaser', '5');

-- --------------------------------------------------------

--
-- Table structure for table `role_usage_policy`
--

CREATE TABLE `role_usage_policy` (
  `id` int(11) NOT NULL,
  `role_id` varchar(36) DEFAULT NULL,
  `usage_policy_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `SequelizeMeta`
--

CREATE TABLE `SequelizeMeta` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `SequelizeMeta`
--

INSERT INTO `SequelizeMeta` (`name`) VALUES
('201802190000-CreateUserTable.js'),
('201802190003-CreateUserRegistrationProfileTable.js'),
('201802190005-CreateOrganizationTable.js'),
('201802190008-CreateOAuthClientTable.js'),
('201802190009-CreateUserAuthorizedApplicationTable.js'),
('201802190010-CreateRoleTable.js'),
('201802190015-CreatePermissionTable.js'),
('201802190020-CreateRoleAssignmentTable.js'),
('201802190025-CreateRolePermissionTable.js'),
('201802190030-CreateUserOrganizationTable.js'),
('201802190035-CreateIotTable.js'),
('201802190040-CreatePepProxyTable.js'),
('201802190045-CreateAuthZForceTable.js'),
('201802190050-CreateAuthTokenTable.js'),
('201802190060-CreateOAuthAuthorizationCodeTable.js'),
('201802190065-CreateOAuthAccessTokenTable.js'),
('201802190070-CreateOAuthRefreshTokenTable.js'),
('201802190075-CreateOAuthScopeTable.js'),
('20180405125424-CreateUserTourAttribute.js'),
('20180612134640-CreateEidasTable.js'),
('20180727101745-CreateUserEidasIdAttribute.js'),
('20180730094347-CreateTrustedApplicationsTable.js'),
('20180828133454-CreatePasswordSalt.js'),
('20180921104653-CreateEidasNifColumn.js'),
('20180922140934-CreateOauthTokenType.js'),
('20181022103002-CreateEidasTypeAndAttributes.js'),
('20181108144720-RevokeToken.js'),
('20181113121450-FixExtraAndScopeAttribute.js'),
('20181203120316-FixTokenTypesLength.js'),
('20190116101526-CreateSignOutUrl.js'),
('20190316203230-CreatePermissionIsRegex.js'),
('20190429164755-CreateUsagePolicyTable.js'),
('20190507112246-CreateRoleUsagePolicyTable.js'),
('20190507112259-CreatePtpTable.js'),
('20191019153205-UpdateUserAuthorizedApplicationTable.js'),
('20200928134556-AddDisable2faKey.js');

-- --------------------------------------------------------

--
-- Table structure for table `trusted_application`
--

CREATE TABLE `trusted_application` (
  `id` int(11) NOT NULL,
  `oauth_client_id` varchar(36) DEFAULT NULL,
  `trusted_oauth_client_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `usage_policy`
--

CREATE TABLE `usage_policy` (
  `id` varchar(36) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `type` enum('COUNT_POLICY','AGGREGATION_POLICY','CUSTOM_POLICY') DEFAULT NULL,
  `parameters` json DEFAULT NULL,
  `punishment` enum('KILL_JOB','UNSUBSCRIBE','MONETIZE') DEFAULT NULL,
  `from` time DEFAULT NULL,
  `to` time DEFAULT NULL,
  `odrl` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `oauth_client_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` varchar(36) NOT NULL,
  `username` varchar(64) DEFAULT NULL,
  `description` text,
  `website` varchar(2000) DEFAULT NULL,
  `image` varchar(255) DEFAULT 'default',
  `gravatar` tinyint(1) DEFAULT '0',
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(40) DEFAULT NULL,
  `date_password` datetime DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT '0',
  `admin` tinyint(1) DEFAULT '0',
  `extra` json DEFAULT NULL,
  `scope` varchar(2000) DEFAULT NULL,
  `starters_tour_ended` tinyint(1) DEFAULT '0',
  `eidas_id` varchar(255) DEFAULT NULL,
  `salt` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `description`, `website`, `image`, `gravatar`, `email`, `password`, `date_password`, `enabled`, `admin`, `extra`, `scope`, `starters_tour_ended`, `eidas_id`, `salt`) VALUES
('4904a34c-dd97-4c96-96b6-d45bc181461a', 'tpateritsas', '', '', 'default', 0, 'tpate@test.com', '4096504989a1614db61a222e5e9ddda2662656ff', '2020-11-29 15:18:37', 1, 0, '{\"visible_attributes\": [\"username\", \"description\", \"website\", \"identity_attributes\", \"image\", \"gravatar\"]}', NULL, 0, NULL, '8bcef126a3c3cee1'),
('a38ecd3e-a30d-450e-a5dd-a775170570d1', 'vanagnostou', '', '', 'default', 0, 'vanagno@test.com', 'c951744778a18ec0439a27361ef02d90a07c2f49', '2020-11-30 14:28:18', 1, 0, '{\"visible_attributes\": [\"username\", \"description\", \"website\", \"identity_attributes\", \"image\", \"gravatar\"]}', NULL, 0, NULL, '80289ddb9e0a69a7'),
('admin', 'apate', NULL, NULL, 'default', 0, 'apate@test.com', '3e81669b1e6b35db836b9d041a136aa063906133', '2020-11-28 13:08:50', 1, 1, '{\"visible_attributes\": [\"username\", \"description\"]}', NULL, 0, NULL, '41aea9053950447b'),
('f3a05aa7-0352-442e-b04b-dcf5df7f6898', 'tasospateritsas', '', '', 'default', 0, 'anastassis.pateritsas@gmail.com', '12b8d433eab8af5f572a94ea9eeb0fb6e6973a84', '2020-11-28 14:42:46', 1, 0, '{\"visible_attributes\": [\"username\", \"description\", \"website\", \"identity_attributes\", \"image\", \"gravatar\"]}', NULL, 0, NULL, 'd1edb855bba53332');

-- --------------------------------------------------------

--
-- Table structure for table `user_authorized_application`
--

CREATE TABLE `user_authorized_application` (
  `id` int(11) NOT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `oauth_client_id` varchar(36) DEFAULT NULL,
  `shared_attributes` varchar(255) DEFAULT NULL,
  `login_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_authorized_application`
--

INSERT INTO `user_authorized_application` (`id`, `user_id`, `oauth_client_id`, `shared_attributes`, `login_date`) VALUES
(1, 'admin', '5c7612ab-6d86-4658-8c4d-bc21a6b4a631', 'username,email', '2020-11-29 15:15:19'),
(2, '4904a34c-dd97-4c96-96b6-d45bc181461a', '5c7612ab-6d86-4658-8c4d-bc21a6b4a631', 'username,email', '2020-11-29 15:19:33'),
(3, 'a38ecd3e-a30d-450e-a5dd-a775170570d1', '5c7612ab-6d86-4658-8c4d-bc21a6b4a631', 'username,email', '2020-11-30 23:30:57');

-- --------------------------------------------------------

--
-- Table structure for table `user_organization`
--

CREATE TABLE `user_organization` (
  `id` int(11) NOT NULL,
  `role` varchar(10) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `organization_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_registration_profile`
--

CREATE TABLE `user_registration_profile` (
  `id` int(11) NOT NULL,
  `activation_key` varchar(255) DEFAULT NULL,
  `activation_expires` datetime DEFAULT NULL,
  `reset_key` varchar(255) DEFAULT NULL,
  `reset_expires` datetime DEFAULT NULL,
  `verification_key` varchar(255) DEFAULT NULL,
  `verification_expires` datetime DEFAULT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  `disable_2fa_key` varchar(255) DEFAULT NULL,
  `disable_2fa_expires` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authzforce`
--
ALTER TABLE `authzforce`
  ADD PRIMARY KEY (`az_domain`),
  ADD KEY `oauth_client_id` (`oauth_client_id`);

--
-- Indexes for table `auth_token`
--
ALTER TABLE `auth_token`
  ADD PRIMARY KEY (`access_token`),
  ADD UNIQUE KEY `access_token` (`access_token`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `pep_proxy_id` (`pep_proxy_id`);

--
-- Indexes for table `eidas_credentials`
--
ALTER TABLE `eidas_credentials`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `oauth_client_id` (`oauth_client_id`);

--
-- Indexes for table `iot`
--
ALTER TABLE `iot`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_client_id` (`oauth_client_id`);

--
-- Indexes for table `oauth_access_token`
--
ALTER TABLE `oauth_access_token`
  ADD PRIMARY KEY (`access_token`),
  ADD UNIQUE KEY `access_token` (`access_token`),
  ADD KEY `oauth_client_id` (`oauth_client_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `iot_id` (`iot_id`),
  ADD KEY `refresh_token` (`refresh_token`),
  ADD KEY `authorization_code_at` (`authorization_code`);

--
-- Indexes for table `oauth_authorization_code`
--
ALTER TABLE `oauth_authorization_code`
  ADD PRIMARY KEY (`authorization_code`),
  ADD UNIQUE KEY `authorization_code` (`authorization_code`),
  ADD KEY `oauth_client_id` (`oauth_client_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `oauth_client`
--
ALTER TABLE `oauth_client`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `oauth_refresh_token`
--
ALTER TABLE `oauth_refresh_token`
  ADD PRIMARY KEY (`refresh_token`),
  ADD UNIQUE KEY `refresh_token` (`refresh_token`),
  ADD KEY `oauth_client_id` (`oauth_client_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `iot_id` (`iot_id`),
  ADD KEY `authorization_code_rt` (`authorization_code`);

--
-- Indexes for table `oauth_scope`
--
ALTER TABLE `oauth_scope`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `organization`
--
ALTER TABLE `organization`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `pep_proxy`
--
ALTER TABLE `pep_proxy`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_client_id` (`oauth_client_id`);

--
-- Indexes for table `permission`
--
ALTER TABLE `permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `oauth_client_id` (`oauth_client_id`);

--
-- Indexes for table `ptp`
--
ALTER TABLE `ptp`
  ADD PRIMARY KEY (`id`,`previous_job_id`),
  ADD KEY `oauth_client_id` (`oauth_client_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `oauth_client_id` (`oauth_client_id`);

--
-- Indexes for table `role_assignment`
--
ALTER TABLE `role_assignment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_client_id` (`oauth_client_id`),
  ADD KEY `role_id` (`role_id`),
  ADD KEY `organization_id` (`organization_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `role_permission`
--
ALTER TABLE `role_permission`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`),
  ADD KEY `permission_id` (`permission_id`);

--
-- Indexes for table `role_usage_policy`
--
ALTER TABLE `role_usage_policy`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`),
  ADD KEY `usage_policy_id` (`usage_policy_id`);

--
-- Indexes for table `SequelizeMeta`
--
ALTER TABLE `SequelizeMeta`
  ADD PRIMARY KEY (`name`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `trusted_application`
--
ALTER TABLE `trusted_application`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_client_id` (`oauth_client_id`),
  ADD KEY `trusted_oauth_client_id` (`trusted_oauth_client_id`);

--
-- Indexes for table `usage_policy`
--
ALTER TABLE `usage_policy`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_client_id` (`oauth_client_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `user_authorized_application`
--
ALTER TABLE `user_authorized_application`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `oauth_client_id` (`oauth_client_id`);

--
-- Indexes for table `user_organization`
--
ALTER TABLE `user_organization`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `organization_id` (`organization_id`);

--
-- Indexes for table `user_registration_profile`
--
ALTER TABLE `user_registration_profile`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_email` (`user_email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `oauth_scope`
--
ALTER TABLE `oauth_scope`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ptp`
--
ALTER TABLE `ptp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `role_assignment`
--
ALTER TABLE `role_assignment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `role_permission`
--
ALTER TABLE `role_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `role_usage_policy`
--
ALTER TABLE `role_usage_policy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trusted_application`
--
ALTER TABLE `trusted_application`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_authorized_application`
--
ALTER TABLE `user_authorized_application`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_organization`
--
ALTER TABLE `user_organization`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_registration_profile`
--
ALTER TABLE `user_registration_profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `authzforce`
--
ALTER TABLE `authzforce`
  ADD CONSTRAINT `authzforce_ibfk_1` FOREIGN KEY (`oauth_client_id`) REFERENCES `oauth_client` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `auth_token`
--
ALTER TABLE `auth_token`
  ADD CONSTRAINT `auth_token_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `auth_token_ibfk_2` FOREIGN KEY (`pep_proxy_id`) REFERENCES `pep_proxy` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `eidas_credentials`
--
ALTER TABLE `eidas_credentials`
  ADD CONSTRAINT `eidas_credentials_ibfk_1` FOREIGN KEY (`oauth_client_id`) REFERENCES `oauth_client` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `iot`
--
ALTER TABLE `iot`
  ADD CONSTRAINT `iot_ibfk_1` FOREIGN KEY (`oauth_client_id`) REFERENCES `oauth_client` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `oauth_access_token`
--
ALTER TABLE `oauth_access_token`
  ADD CONSTRAINT `authorization_code_at` FOREIGN KEY (`authorization_code`) REFERENCES `oauth_authorization_code` (`authorization_code`) ON DELETE CASCADE,
  ADD CONSTRAINT `oauth_access_token_ibfk_1` FOREIGN KEY (`oauth_client_id`) REFERENCES `oauth_client` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `oauth_access_token_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `oauth_access_token_ibfk_3` FOREIGN KEY (`iot_id`) REFERENCES `iot` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `refresh_token` FOREIGN KEY (`refresh_token`) REFERENCES `oauth_refresh_token` (`refresh_token`) ON DELETE CASCADE;

--
-- Constraints for table `oauth_authorization_code`
--
ALTER TABLE `oauth_authorization_code`
  ADD CONSTRAINT `oauth_authorization_code_ibfk_1` FOREIGN KEY (`oauth_client_id`) REFERENCES `oauth_client` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `oauth_authorization_code_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `oauth_refresh_token`
--
ALTER TABLE `oauth_refresh_token`
  ADD CONSTRAINT `authorization_code_rt` FOREIGN KEY (`authorization_code`) REFERENCES `oauth_authorization_code` (`authorization_code`) ON DELETE CASCADE,
  ADD CONSTRAINT `oauth_refresh_token_ibfk_1` FOREIGN KEY (`oauth_client_id`) REFERENCES `oauth_client` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `oauth_refresh_token_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `oauth_refresh_token_ibfk_3` FOREIGN KEY (`iot_id`) REFERENCES `iot` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pep_proxy`
--
ALTER TABLE `pep_proxy`
  ADD CONSTRAINT `pep_proxy_ibfk_1` FOREIGN KEY (`oauth_client_id`) REFERENCES `oauth_client` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permission`
--
ALTER TABLE `permission`
  ADD CONSTRAINT `permission_ibfk_1` FOREIGN KEY (`oauth_client_id`) REFERENCES `oauth_client` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ptp`
--
ALTER TABLE `ptp`
  ADD CONSTRAINT `ptp_ibfk_1` FOREIGN KEY (`oauth_client_id`) REFERENCES `oauth_client` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role`
--
ALTER TABLE `role`
  ADD CONSTRAINT `role_ibfk_1` FOREIGN KEY (`oauth_client_id`) REFERENCES `oauth_client` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_assignment`
--
ALTER TABLE `role_assignment`
  ADD CONSTRAINT `role_assignment_ibfk_1` FOREIGN KEY (`oauth_client_id`) REFERENCES `oauth_client` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_assignment_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_assignment_ibfk_3` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_assignment_ibfk_4` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_permission`
--
ALTER TABLE `role_permission`
  ADD CONSTRAINT `role_permission_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_permission_ibfk_2` FOREIGN KEY (`permission_id`) REFERENCES `permission` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_usage_policy`
--
ALTER TABLE `role_usage_policy`
  ADD CONSTRAINT `role_usage_policy_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_usage_policy_ibfk_2` FOREIGN KEY (`usage_policy_id`) REFERENCES `usage_policy` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `trusted_application`
--
ALTER TABLE `trusted_application`
  ADD CONSTRAINT `trusted_application_ibfk_1` FOREIGN KEY (`oauth_client_id`) REFERENCES `oauth_client` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `trusted_application_ibfk_2` FOREIGN KEY (`trusted_oauth_client_id`) REFERENCES `oauth_client` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `usage_policy`
--
ALTER TABLE `usage_policy`
  ADD CONSTRAINT `usage_policy_ibfk_1` FOREIGN KEY (`oauth_client_id`) REFERENCES `oauth_client` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_authorized_application`
--
ALTER TABLE `user_authorized_application`
  ADD CONSTRAINT `user_authorized_application_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_authorized_application_ibfk_2` FOREIGN KEY (`oauth_client_id`) REFERENCES `oauth_client` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_organization`
--
ALTER TABLE `user_organization`
  ADD CONSTRAINT `user_organization_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_organization_ibfk_2` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_registration_profile`
--
ALTER TABLE `user_registration_profile`
  ADD CONSTRAINT `user_registration_profile_ibfk_1` FOREIGN KEY (`user_email`) REFERENCES `user` (`email`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
