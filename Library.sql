DROP TABLE IF EXISTS books;
CREATE TABLE IF NOT EXISTS books (
id INTEGER PRIMARY KEY AUTOINCREMENT,
title VARCHAR(30),
product_code INTEGER,
category VARCHAR(30),
age_group VARCHAR(30),
author_id INTEGER,
publisher_id INTEGER,
release_date VARCHAR(30),
price INTEGER,
language VARCHAR(20),
cover_designer_id INTEGER,
translator_id INTEGER,
resources VARCHAR(60)
);

INSERT INTO books (`title`, `product_code`, `category`, `age_group`, `author_id`, `publisher_id`, `release_date`, `price`, `language`, `cover_designer_id`, `translator_id`, `resources`) VALUES
('The Whispering Code', 1001, 'Technology', 'Adult', 1, 1, '2021-01-15', 25, 'English', 1, 1, 'ISBN Registry'),
('Shadows of Eternity', 1002, 'Fantasy', 'Adult', 2, 2, '2019-06-12', 30, 'English', 2, 2, 'WorldCat Catalog'),
('Beyond the Horizon', 1003, 'Fiction', 'Young Adult', 3, 1, '2020-09-20', 22, 'Spanish', 3, 3, 'Google Books API'),
('The Last Algorithm', 1004, 'Technology', 'Adult', 4, 3, '2022-03-10', 28, 'English', 4, 4, 'Open Library'),
('Silent Oceans', 1005, 'Science', 'Adult', 5, 2, '2018-11-08', 26, 'Japanese', 5, 5, 'Project Gutenberg'),
('Memory of Fireflies', 1006, 'Fiction', 'Adult', 6, 4, '2021-07-05', 27, 'Italian', 1, 6, 'JSTOR'),
('Broken Compass', 1007, 'Adventure', 'Adult', 7, 5, '2017-04-14', 24, 'Arabic', 2, 2, 'PubMed Central'),
('The Crystal Path', 1008, 'Fantasy', 'Young Adult', 8, 1, '2023-02-01', 29, 'English', 3, 3, 'CrossRef'),
('Echoes of Tomorrow', 1009, 'Sci-Fi', 'Adult', 9, 3, '2020-10-10', 31, 'English', 4, 4, 'DOAB'),
('River of Forgotten Dreams', 1010, 'Fiction', 'Adult', 10, 2, '2016-08-22', 23, 'Russian', 5, 7, 'Internet Archive'),
('A Thousand Lanterns', 1011, 'Fantasy', 'Young Adult', 1, 1, '2021-09-30', 26, 'English', 1, NULL, 'Library of Congress'),
('The Iron Labyrinth', 1012, 'Fantasy', 'Adult', 2, 2, '2019-12-17', 27, 'German', 2, NULL, 'British Library Catalog'),
('Digital Mirage', 1013, 'Technology', 'Adult', 3, 3, '2022-04-28', 32, 'Spanish', 3, NULL, 'SpringerLink'),
('Ashes and Rain', 1014, 'Fiction', 'Adult', 4, 4, '2018-05-19', 21, 'English', 4, NULL, 'Wiley Online Library'),
('Clockwork Garden', 1015, 'Fantasy', 'Young Adult', 5, 5, '2017-02-25', 28, 'Japanese', 5, NULL, 'Elsevier ScienceDirect'),
('Threads of Infinity', 1016, 'Sci-Fi', 'Adult', 6, 1, '2021-06-11', 29, 'English', 1, 6, 'Taylor & Francis Online'),
('The Hidden Atlas', 1017, 'Adventure', 'Adult', 7, 2, '2019-09-07', 27, 'Arabic', 2, 2, 'SAGE Journals'),
('Stormsong', 1018, 'Fantasy', 'Young Adult', 8, 3, '2020-01-20', 30, 'English', 3, 3, 'MIT Press Open'),
('Luminous Fragments', 1019, 'Poetry', 'Adult', 9, 4, '2022-11-15', 19, 'English', 4, 4, 'Oxford Academic'),
('The Glass Orchard', 1020, 'Fiction', 'Adult', 10, 5, '2018-07-13', 26, 'Russian', 5, 7, 'Cambridge Core');


DROP TABLE IF EXISTS categories;
CREATE TABLE IF NOT EXISTS categories (
id INTEGER PRIMARY KEY AUTOINCREMENT,
name VARCHAR(100)
);

INSERT INTO categories (`name`) VALUES
('Fiction'),
('Science'),
('Sci-Fi'),
('Fantasy'),
('Technology'),
('History');


DROP TABLE IF EXISTS authors;
CREATE TABLE IF NOT EXISTS authors (
id INTEGER PRIMARY KEY AUTOINCREMENT,
name VARCHAR(200),
birthdate VARCHAR(30),
nationality VARCHAR(100)
);

INSERT INTO authors (`name`, `birthdate`, `nationality`) VALUES
('Aria Collins', '1985-03-12', 'British'),
('Daniel Hartwell', '1979-07-22', 'American'),
('Sofia Marquez', '1990-02-10', 'Spanish'),
('Elias Thompson', '1982-11-15', 'Irish'),
('Hana Kobayashi', '1988-06-08', 'Japanese'),
('Marco DeLuca', '1975-09-30', 'Italian'),
('Amina Farouk', '1991-01-14', 'Egyptian'),
('Oliver Grant', '1983-12-03', 'Canadian'),
('Layla Nasser', '1987-05-25', 'Lebanese'),
('Victor Ivanov', '1970-08-19', 'Russian'),
('Isabella Romano', '1992-04-18', 'Italian'),
('Thomas Bergmann', '1984-10-02', 'German');


DROP TABLE IF EXISTS publishers;
CREATE TABLE IF NOT EXISTS publishers (
id INTEGER PRIMARY KEY AUTOINCREMENT,
name VARCHAR(60),
address VARCHAR(300),
website VARCHAR(100)
);

INSERT INTO publishers (`name`, `address`, `website`) VALUES
('Aurora Press', '123 Aurora St, London, UK', 'https://aurorapress.com'),
('Horizon House', '56 Maple Ave, New York, USA', 'https://horizonhouse.com'),
('Silver Leaf Publishing', '78 Oak Rd, Toronto, Canada', 'https://silverleaf.com'),
('Crescent Moon Books', '9 Crescent Blvd, Sydney, Australia', 'https://crescentmoon.com'),
('Redwood Editions', '45 Redwood St, San Francisco, USA', 'https://redwoodeditions.com');

DROP TABLE IF EXISTS book_publisher;
CREATE TABLE IF NOT EXISTS book_publisher (
book_id INTEGER,
publisher_id INTEGER
);

INSERT INTO book_publisher (`book_id`, `publisher_id`) VALUES
(1,1),(2,2),(3,1),(3,2),(4,3),(5,2),(6,4),(7,5),(8,1),(8,4),
(9,3),(10,2),(11,1),(12,2),(13,3),(14,4),(15,5),(15,1),
(16,1),(17,2),(18,3),(19,4),(20,5);

DROP TABLE IF EXISTS languages;
CREATE TABLE IF NOT EXISTS languages (
id INTEGER PRIMARY KEY AUTOINCREMENT,
name VARCHAR(30)
);

INSERT INTO languages (`name`) VALUES
('English'),
('Russian'),
('Japanese'),
('Italian'),
('Spanish'),
('French'),
('German'),
('Arabic');


DROP TABLE IF EXISTS cover_designers;
CREATE TABLE IF NOT EXISTS cover_designers (
id INTEGER PRIMARY KEY AUTOINCREMENT,
name VARCHAR(200),
birthdate VARCHAR(30),
nationality VARCHAR(100)
);

INSERT INTO cover_designers (`name`, `birthdate`, `nationality`) VALUES
('Clara Jensen', '1986-09-12', 'Danish'),
('Miguel Alvarez', '1977-04-18', 'Spanish'),
('Priya Deshmukh', '1990-07-09', 'Indian'),
('Jonas Richter', '1981-02-28', 'German'),
('Fatima El-Sayed', '1993-11-05', 'Moroccan');


DROP TABLE IF EXISTS translators;
CREATE TABLE IF NOT EXISTS translators (
id INTEGER PRIMARY KEY AUTOINCREMENT,
name VARCHAR(300),
language VARCHAR(20)
);

INSERT INTO translators (`name`, `language`) VALUES
('Laura Bennett', 'French'),
('Ahmed Mansour', 'Arabic'),
('Sophie Dubois', 'Spanish'),
('Lukas Weber', 'German'),
('Yumi Tanaka', 'Japanese'),
('Pedro Silva', 'Portuguese'),
('Elena Petrova', 'Russian'),
('Farid Rahman', 'Urdu'),
('Maria Rossi', 'Italian'),
('Chen Wei', 'Chinese'),
('Claire Moreau', 'French'),
('Hiroshi Sato', 'Japanese'),
('Omar Khalid', 'Arabic');


DROP TABLE IF EXISTS resources;
CREATE TABLE IF NOT EXISTS resources (
id INTEGER PRIMARY KEY AUTOINCREMENT,
name VARCHAR(300)
);

INSERT INTO resources (`name`) VALUES
('ISBN Registry'),
('WorldCat Catalog'),
('Google Books API'),
('Open Library'),
('Project Gutenberg'),
('JSTOR'),
('PubMed Central'),
('CrossRef'),
('DOAB'),
('Internet Archive'),
('Library of Congress'),
('British Library Catalog'),
('SpringerLink'),
('Wiley Online Library'),
('Elsevier ScienceDirect'),
('Taylor & Francis Online'),
('SAGE Journals'),
('MIT Press Open'),
('Oxford Academic'),
('Cambridge Core'),
('ACM Digital Library'),
('IEEE Xplore'),
('Scopus'),
('ERIC'),
('arXiv.org'),
('Zenodo'),
('ResearchGate'),
('Semantic Scholar'),
('Europeana Collections'),
('CORE'),
('National Library of Australia'),
('Smithsonian Digital Library'),
('HathiTrust'),
('ScienceOpen'),
('OAPEN'),
('Bookboon'),
('Directory of Open Access Journals'),
('HighWire Press'),
('EBSCOhost'),
('ProQuest'),
('CNKI Scholar'),
('Karger Journals'),
('Brill Online'),
('De Gruyter Online'),
('Maney Online'),
('Nature Publishing Group'),
('Royal Society Publishing'),
('American Chemical Society'),
('American Physical Society'),
('Annual Reviews');


DROP TABLE IF EXISTS customers;
CREATE TABLE IF NOT EXISTS customers (
id INTEGER PRIMARY KEY AUTOINCREMENT,
name VARCHAR(300),
email VARCHAR(300),
phone VARCHAR(20),
address VARCHAR(300)
);


DROP TABLE IF EXISTS book_category;
CREATE TABLE IF NOT EXISTS book_category (
book_id INTEGER,
category_id INTEGER
);


DROP TABLE IF EXISTS book_language;
CREATE TABLE IF NOT EXISTS book_language (
book_id INTEGER,
language_id INTEGER
);

INSERT INTO book_language (`book_id`, `language_id`) VALUES
(1,1),(2,1),(3,5),(4,1),(5,3),(6,4),(7,8),(8,1),(9,1),(10,2),
(11,1),(12,7),(13,5),(14,1),(15,3),(16,1),(17,8),(18,1),(19,1),(20,2);

DROP TABLE IF EXISTS book_author;
CREATE TABLE IF NOT EXISTS book_author (
book_id INTEGER,
author_id INTEGER
);

INSERT INTO book_author (`book_id`, `author_id`) VALUES
-- Normal single-author books
(1, 1),   -- The Whispering Code → Aria Collins
(2, 2),   -- Shadows of Eternity → Daniel Hartwell
(3, 3),   -- Beyond the Horizon → Sofia Marquez
(4, 4),   -- The Last Algorithm → Elias Thompson
(5, 5),   -- Silent Oceans → Hana Kobayashi
(6, 6),   -- Memory of Fireflies → Marco DeLuca
(7, 7),   -- Broken Compass → Amina Farouk
(8, 8),   -- The Crystal Path → Oliver Grant
(9, 9),   -- Echoes of Tomorrow → Layla Nasser
(10, 10),  -- River of Forgotten Dreams → Victor Ivanov

-- 5 books with NO writer (NULL)
(11, NULL), -- A Thousand Lanterns
(12, NULL), -- The Iron Labyrinth
(13, NULL), -- Digital Mirage
(14, NULL), -- Ashes and Rain
(15, NULL), -- Clockwork Garden

-- Remaining books with at least one writer
(16, 6),   -- Threads of Infinity → Marco DeLuca
(17, 7),   -- The Hidden Atlas → Amina Farouk
(18, 8),   -- Stormsong → Oliver Grant
(19, 9),   -- Luminous Fragments → Layla Nasser
(20, 10),  -- The Glass Orchard → Victor Ivanov

-- Extra co-authors (to reach 30 rows total)
(1, 2),   -- add Daniel Hartwell to The Whispering Code
(3, 4),   -- add Elias Thompson to Beyond the Horizon
(5, 6),   -- add Marco DeLuca to Silent Oceans
(7, 8),   -- add Oliver Grant to Broken Compass
(9, 10),  -- add Victor Ivanov to Echoes of Tomorrow
(16, 1),   -- add Aria Collins to Threads of Infinity
(17, 3),   -- add Sofia Marquez to The Hidden Atlas
(18, 5),   -- add Hana Kobayashi to Stormsong
(19, 7),   -- add Amina Farouk to Luminous Fragments
(20, 9);   -- add Layla Nasser to The Glass Orchard


DROP TABLE IF EXISTS book_translator;
CREATE TABLE IF NOT EXISTS book_translator (
book_id INTEGER,
translator_id INTEGER
);

INSERT INTO book_translator (book_id, translator_id) VALUES
(1, 1),
(2, 4),
(3, 3),
(3, 1),
(4, 10),
(5, 5),
(5, 10),
(6, 9),
(7, 2),
(8, 6),
(9, 7),
(9, 3),
(10, 1);


DROP TABLE IF EXISTS book_designer;
CREATE TABLE IF NOT EXISTS book_designer (
book_id INTEGER,
designer_id INTEGER
);

INSERT INTO book_designer (`book_id`, `designer_id`) VALUES
(1, 1),  -- The Whispering Code → Clara Jensen
(2, 2),  -- Shadows of Eternity → Miguel Alvarez
(3, 3),  -- Beyond the Horizon → Priya Deshmukh
(4, 4),  -- The Last Algorithm → Jonas Richter
(5, 5),  -- Silent Oceans → Fatima El-Sayed
(6, 1),  -- Memory of Fireflies → Clara Jensen
(7, 2),  -- Broken Compass → Miguel Alvarez
(8, 3),  -- The Crystal Path → Priya Deshmukh
(9, 4),  -- Echoes of Tomorrow → Jonas Richter
(10, 5),  -- River of Forgotten Dreams → Fatima El-Sayed
(11, 1),  -- A Thousand Lanterns → Clara Jensen
(12, 2),  -- The Iron Labyrinth → Miguel Alvarez
(13, 3),  -- Digital Mirage → Priya Deshmukh
(14, 4),  -- Ashes and Rain → Jonas Richter
(15, 5),  -- Clockwork Garden → Fatima El-Sayed
(16, 1),  -- Threads of Infinity → Clara Jensen
(17, 2),  -- The Hidden Atlas → Miguel Alvarez
(18, 3),  -- Stormsong → Priya Deshmukh
(19, 4),  -- Luminous Fragments → Jonas Richter
(20, 5);  -- The Glass Orchard → Fatima El-Sayed


DROP TABLE IF EXISTS book_customer;
CREATE TABLE IF NOT EXISTS book_customer (
id INTEGER PRIMARY KEY AUTOINCREMENT,
user_id INTEGER,
book_id INTEGER,
rental_date VARCHAR(30),
return_date VARCHAR(30),
status VARCHAR(20)
);


DROP TABLE IF EXISTS resources_book;
CREATE TABLE IF NOT EXISTS resources_book (
book_id INTEGER,
resource_id INTEGER
);

INSERT INTO resources_book (`book_id`, `resource_id`) VALUES
(1, 3),   -- The Whispering Code → Google Books API
(2, 4),   -- Shadows of Eternity → Open Library
(3, 5),   -- Beyond the Horizon → Project Gutenberg
(4, 13),  -- The Last Algorithm → SpringerLink
(5, 10),  -- Silent Oceans → Internet Archive
(6, 2),   -- Memory of Fireflies → WorldCat Catalog
(7, 8),   -- Broken Compass → CrossRef
(8, 18),  -- The Crystal Path → MIT Press Open
(9, 22),  -- Echoes of Tomorrow → IEEE Xplore
(10, 27),  -- River of Forgotten Dreams → ResearchGate
(11, 9),   -- A Thousand Lanterns → DOAB
(12, 19),  -- The Iron Labyrinth → Oxford Academic
(13, 21),  -- Digital Mirage → ACM Digital Library
(14, 30),  -- Ashes and Rain → CORE
(15, 20),  -- Clockwork Garden → Cambridge Core
(16, 25),  -- Threads of Infinity → arXiv.org
(17, 26),  -- The Hidden Atlas → Zenodo
(18, 7),   -- Stormsong → PubMed Central
(19, 17),  -- Luminous Fragments → SAGE Journals
(20, 16);