-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 21, 2020 at 09:24 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_elgrande`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `comment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `news_id` int(11) NOT NULL,
  `text_komentara` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`comment_id`, `user_id`, `news_id`, `text_komentara`) VALUES
(19, 12, 33, 'Glupost!'),
(20, 12, 35, 'Sram ga bilo!'),
(21, 12, 34, 'hahahahahaha');

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `news_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `text` text NOT NULL,
  `date` date NOT NULL,
  `pic_path` varchar(100) NOT NULL DEFAULT 'news_pic.jpeg'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`news_id`, `title`, `text`, `date`, `pic_path`) VALUES
(33, 'Ruski astrolog ima loše vesti za 2 horoskopska znaka: \"U martu vas očekuju ozbiljni nemiri i brige\"', 'Dva horoskopska znaka moraće da sakupe svu energiju i emotivnu snagu kako bi prebrodili sve poteškoće koje će im se dogoditi na početku proleća. Mart 2020. godine za neke horoskopske znakove donosi mnogo iskušenja, kao i psihičkih i mentalnih izazova.\r\nRuski astrolog Pavel Globa imenovao je dva horoskopska znaka koja će se na početku proleća suočiti sa ozbiljnim izazovima koje im sprema univerzum.\r\n\r\nU pitanju su Rak i Jarac.\r\n\r\nRakovi će morati da sakupe svu emocionalnu i psihološku snagu kako bi pobedili izazove koje im priprema mart 2020. godine. Ruski astrolog Pavel kaže kako će se Rakovi vrteti kao veverice u kavezu kako bi ispunili sve svoje planove, ali i zahteve koje ima njihova druga polovina.\r\n\r\nLjubavne veze u martu biće na udaru, mnogi će se suočiti sa raskidima kako bi napravili mesta za nove ljude u životu.\r\n\r\nU martu 2020. godine Jarčeve očekuju nemiri, brige i rešavanje vrlo kompleksnih problema. Odjednom ćete postati potrebni svima- porodici, prijateljima, kolegama, udaljenim rođacima.\r\n\r\nPomislite samo na Jarca i njegove prijatelje koji se osećaju tužno bez njega. Na kraju ta gomila aktivnosti slomiće Jarca koji će tada želeti samo mir i privatnost.\r\n\r\nVoljena osoba će vas obradovati jednim nezaboravnim poklonom.\r\n\r\nRuski astrolog Pavel savetuje da obratite pažnju na zdravlje, ali ćete na kraju možda ipak morati da posetite lekara ako poverujete u ova predvidjanja.', '2020-02-20', 'newsPhoto1582281475257.jpg'),
(34, 'Mladi navijač MU zamolio Klopa da prestane da pobeđuje', 'Mladi navijač Mančester Junajteda Darah Karli zamolio je Jigrena Klopa da Liverpul prestane da pobeđuje. Nemac mu je vrlo brzo odgovorio.\r\nKako prenose engleski mediji, 10-godišnji dečak uputio je pismo menadžeru Redsa u sklopu školskog zadatka.\r\n\r\n\"Liverpul ostvaruje previše pobeda. Ako trijumfujete u još devet mečeva imaćete najdužu seriju nepobedivosti u enegleskom fudbalu. S obzirom na to da sam navijač Junajteda, to me čini tužnim. Molim vas izgubite sledeći meč. Samo treba da dozvolite vašem protivniku da da gol. Nadam se da sam vas ubedio da ne osvojite ligu ili makar da ne pobeđujete više\", poručio je mladi Darah.\r\nNa iznenađenje njegovih roditelja, odgovor sa Enfilda je stigao vrlo brzo.\r\n\r\n\"Nažalost, ne mogu da ispunim tvoju želju. Ma koliko ti želeo da Liverpul izgubi, moj posao je da uradim sve kako bi klub pobedio pošto milioni ljudi širom sveta žele da se dogodi upravo to. Ne želim njih da izneverim\", napisao je Klop.\r\n\"Na tvoju sreću, gubili smo utakmice u prošlosti i siguran sam da će se to dešavati i u budućnosti. Problem kada imaš 10 godina je što misliš da će stvari uvek biti kao što su sada. Ja sa 52 godine mogu da ti kažem da ti nije tako. Nadam se da ćemo ostvariti još pobeda i da ćemo osvojiti neki trofej, a da to neće tebe razočarati. Iako su naši klubovi rivali, postoji veliko poštovanje među nama. To je ono što je najvažnije u fudbalu\".\r\n\r\nLiverpul je trenutno prvi u Premijer ligi sa 76 bodova, čak 22 više od Mančester Sitija. Ekipa sa Enfilda ne zna za poraz u domaćem takmičenju, a u 26 kola ima samo jedan remi.', '2020-02-21', 'newsPhoto1582281749345.jpg'),
(35, 'PIJANI SRBIN SKINUT S LETA ZA BEOGRAD: Pravio džumbus, posada pozvala bečku policiju pa ga izveli iz', 'BEČ - Jedan pijani muškarac pravio je probleme u avionu austrijske aviokompanije AUA na bečkom aerodromu Švehat, zbog čega je kasnio let za Beograd.\r\n\r\nLet OS 735 iz Beča za Beograd odleteo je, u sredu posle podne, sa bečkog aerodroma sa zakašnjenjem od 50 minuta. Kao razlog naveden je pijani putnik koji se protivio da sluša instrukcije posade.\r\n\r\nAvion se nalazio na putu sa parking pozicije ka pisti za poletanje, kada se srpski državljanin, kako je saopšteno, ponašao veoma agresivno u avionu, pa je posada bila prinuđena da alarmira policiju, koja je putnika izvela iz aviona i privela u stanicu.\r\n\r\n\"Očigledno pijani putnik se protivio da sledi uputsva posade. Pošto se nije smirio posada je pozvala policiju. Drugi putnici i naša posada nisu povređeni, saopšteno je iz AUA.\r\n\r\nProtiv srpskog državljanina podneta je prijava zbog pružanja otpora policiji.', '2020-02-21', 'newsPhoto1582281934634.jpg'),
(36, 'RAK SE BAŠ RASPISAO! Snimak zapalio društvene mreže: Barata brojkama kao PROFESIONALAC!', 'Društvenim mrežama brzinom svetlosti proširio se neobičan snimak krabe koja laganim pokretima ispisuje brojke, od jedinice do šestice. Kako izgleda da sama drži hemijsku olovku, nikome na prvo gledanje nije bilo jasno kako to radi, pa se komentari gomilaju gde god da ovaj snimak osvane. \r\n\r\nU komentarima pojavila se čak i jedna buba koja takođe vlada olovkom, samo u boji. Niko ne može čudu da se načudi!\r\nLink: https://twitter.com/Pluton45873221/status/1230618077953495042?s=20', '2020-02-20', 'newsPhoto1582282200602.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `admin` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `name`, `username`, `password`, `admin`) VALUES
(12, 'Danijal', 'admin', 'admin', 1),
(13, 'Neko', 'neko', 'neko', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`news_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `news_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
