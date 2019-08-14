-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 10, 2019 at 02:53 PM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tronfundme`
--

-- --------------------------------------------------------

--
-- Table structure for table `campaignmodel`
--

CREATE TABLE `campaignmodel` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `followersCount` int(11) NOT NULL,
  `fundCollected` int(11) NOT NULL,
  `description` varchar(500) NOT NULL,
  `deployed` tinyint(1) NOT NULL DEFAULT '0',
  `deployableFund` int(11) NOT NULL,
  `imgLink` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `campaignmodel`
--

INSERT INTO `campaignmodel` (`id`, `name`, `followersCount`, `fundCollected`, `description`, `deployed`, `deployableFund`, `imgLink`) VALUES
(2, 'Invest your part in cancer research', 1, 500100, 'Ever heard of someone suffering from cancer? Of course you have. Not a doubt. How about we make a small contributionon our part to make this less commn of an occurence? Come lets join hands in investing our part in cancer research and making this world more of a beautiful place to live in', 0, 1000, '/img/campaign2.jpg'),
(3, 'Killed an animal for your comfort. Doesnt sound good, does it?', 0, 0, 'Many animals nowadays are increasingly been poached for their fur. People have been selfish enough to not consider animals as beings for their personal comfort. How cruel does this sound to you? So let us try to come together and do what we can to end this.', 0, 1000, '/img/campaign1.jpg'),
(4, 'Autism is not a disability. It is just a difference from the rest.', 0, 0, 'Autism is a relativel common condition, esp. in the US where 1 in 59 children are autistic. It is not a disability, they just have different ways of doing things, thinking, acting and behaving. Come let us join hands in abolishing the misconceptions prevalent against autism and spreading awareness.', 0, 1000, '/img/campaign3.jpg'),
(5, 'Education: the biggest investment for ever human being right.', 0, 0, 'Education is as important a fundamental right of every human being as are food, shelter, clothing and housing. Every girl and boy child have equal right to education. There are still many places where children do not get this golden opportunity. We can make our contribution in helping these children receive as good an education as we have. Make your contribution; bring education', 0, 1000, '/img/campaign4.jpg'),
(6, 'Love our skin? Well, animals love theirs too.', 0, 0, 'Mink poaching has lately been on the rise, mostly for their precious fur. Why would you entetain killing animals for flauting your temporary, shallow fashion status? Image being kiled by someone for your skin. Let us try to understand their sentiments and take a step forward in helping to bring this practice to an end.', 0, 1000, '/img/campaign5.jpg'),
(7, 'Downs syndrome: Not disabled, just differentlly abled', 0, 0, 'Pretty sure you all have heard of Downs syndrome at some point in your life. This is not common, but is not uncommon as well. They have different abilities but these do not make them any less of a human than you or me. Lets make sure this awareness reaches everywhere and among everyone', 0, 1000, '/img/campaign6.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `usermodel`
--

CREATE TABLE `usermodel` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `donatedTRX` int(11) NOT NULL DEFAULT '0',
  `donatedGST` int(11) NOT NULL DEFAULT '0',
  `campaignsFollowed` int(11) NOT NULL DEFAULT '0',
  `country` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usermodel`
--

INSERT INTO `usermodel` (`id`, `username`, `address`, `donatedTRX`, `donatedGST`, `campaignsFollowed`, `country`) VALUES
(1, 'avimshra', 'TDZ1aKDVwScDbwoKL7HieRFdfmexEZ8KBk', 100, 0, 0, 'Malaysia'),
(2, 'secondUser', 'TUZADA1232', 0, 0, 0, 'China'),
(3, 'secondUser', 'TUZADA1232', 0, 0, 0, 'China'),
(4, 'user2', 'abcd', 0, 0, 0, 'nepal'),
(5, 'abc', 'TLiLoVGHjM281aK3kpdWvqAuNce466GYgw', 0, 0, 0, 'abc'),
(6, 'usernew', 'TDZ1aKDVwScDbwoKL7HieRFdfmexEZ8KBk', 0, 0, 0, 'Argentina');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `campaignmodel`
--
ALTER TABLE `campaignmodel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usermodel`
--
ALTER TABLE `usermodel`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `campaignmodel`
--
ALTER TABLE `campaignmodel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `usermodel`
--
ALTER TABLE `usermodel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
