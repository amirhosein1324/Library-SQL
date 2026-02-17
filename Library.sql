DROP TABLE IF EXISTS books;
CREATE TABLE IF NOT EXISTS books (
id INTEGER PRIMARY KEY AUTOINCREMENT,
title VARCHAR(30),
product_code INTEGER,
age_group VARCHAR(30),
publisher_id INTEGER,
release_date VARCHAR(30),
price INTEGER
);

INSERT INTO books (`title`, `product_code`, `age_group`, `publisher_id`, `release_date`, `price`) VALUES
('Digital Transformation', 3001, 'Adult', 1, '2022-02-10', 35),
('Artificial Intelligence', 3002, 'Adult', 2, '2021-05-18', 42),
('Cybersecurity Essentials', 3003, 'Adult', 3, '2020-09-21', 38),
('Quantum Computing', 3004, 'Adult', 4, '2023-01-11', 45),
('Data Science Handbook', 3005, 'Young Adult', 1, '2022-07-15', 30),
('Blockchain Technology', 3006, 'Adult', 5, '2019-11-30', 33),
('Cloud Architecture', 3007, 'Adult', 2, '2020-04-25', 37),
('Green Energy Systems', 3008, 'Adult', 3, '2021-12-01', 29),
('Space Exploration', 3009, 'Young Adult', 4, '2018-06-19', 27),
('Internet of Things', 3010, 'Adult', 5, '2023-03-05', 40);


DROP TABLE IF EXISTS categories;
CREATE TABLE IF NOT EXISTS categories (
id INTEGER PRIMARY KEY AUTOINCREMENT,
name VARCHAR(100)
);

INSERT INTO categories (`name`) VALUES
('Technology'),
('Science'),
('Engineering'),
('Energy'),
('Innovation'),
('Security'),
('Space');



DROP TABLE IF EXISTS authors;
CREATE TABLE IF NOT EXISTS authors (
id INTEGER PRIMARY KEY AUTOINCREMENT,
name VARCHAR(200),
birthdate VARCHAR(30),
nationality VARCHAR(100)
);

INSERT INTO authors (`name`, `birthdate`, `nationality`) VALUES
('Andrew Ng', '1976-04-18', 'American'),
('Fei-Fei Li', '1976-07-03', 'American'),
('Yoshua Bengio', '1964-03-05', 'Canadian'),
('Geoffrey Hinton', '1947-12-06', 'British'),
('Sebastian Thrun', '1967-05-14', 'German'),
('Tim Berners-Lee', '1955-06-08', 'British'),
('Grace Hopper', '1906-12-09', 'American'),
('Margaret Hamilton', '1936-08-17', 'American'),
('Linus Torvalds', '1969-12-28', 'Finnish'),
('Satya Nadella', '1967-08-19', 'Indian'),
('Ada Lovelace', '1815-12-10', 'British'),
('James Gosling', '1955-05-19', 'Canadian');

DROP TABLE IF EXISTS publishers;
CREATE TABLE IF NOT EXISTS publishers (
id INTEGER PRIMARY KEY AUTOINCREMENT,
name VARCHAR(60),
address VARCHAR(300),
website VARCHAR(100)
);

INSERT INTO publishers (`name`, `address`, `website`) VALUES
('MIT Press', 'Cambridge, Massachusetts, USA', 'https://mitpress.mit.edu'),
('OReilly Media', 'Sebastopol, California, USA', 'https://oreilly.com'),
('Springer Nature', 'Berlin, Germany', 'https://springernature.com'),
('Oxford University Press', 'Oxford, UK', 'https://oup.com'),
('Cambridge University Press', 'Cambridge, UK', 'https://cambridge.org');


DROP TABLE IF EXISTS languages;
CREATE TABLE IF NOT EXISTS languages (
id INTEGER PRIMARY KEY AUTOINCREMENT,
name VARCHAR(30)
);

INSERT INTO languages (`name`) VALUES
('English'),
('Spanish'),
('German'),
('French'),
('Japanese'),
('Russian'),
('Italian'),
('Chinese');


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
('Anthea Bell', 'German'),
('Edith Grossman', 'Spanish'),
('Gregory Rabassa', 'Spanish'),
('Constance Garnett', 'Russian'),
('David Bellos', 'French'),
('Jennifer Croft', 'Polish'),
('Michael Hofmann', 'German'),
('Stephen Snyder', 'Japanese'),
('Sandra Smith', 'French'),
('John Minford', 'Chinese'),
('Maria Rossi', 'Italian'),
('Carlos Ferreira', 'Portuguese'),
('Anna Kowalski', 'Polish');


DROP TABLE IF EXISTS resources;
CREATE TABLE IF NOT EXISTS resources (
id INTEGER PRIMARY KEY AUTOINCREMENT,
name VARCHAR(300)
);

INSERT INTO resources (`name`) VALUES
('IEEE Xplore'),
('ACM Digital Library'),
('SpringerLink'),
('ScienceDirect'),
('JSTOR'),
('Google Scholar'),
('arXiv.org'),
('MIT OpenCourseWare'),
('Nature Publishing Group'),
('Oxford Academic');


DROP TABLE IF EXISTS resources_book;
CREATE TABLE IF NOT EXISTS resources_book (
book_id INTEGER,
resource_id INTEGER
);

INSERT INTO resources_book (`book_id`, `resource_id`) VALUES
(1,1),(1,6),
(2,2),
(4,4),(4,9),
(5,5),
(6,1),
(8,3),(8,10),
(9,4),
(10,6);


DROP TABLE IF EXISTS book_category;
CREATE TABLE IF NOT EXISTS book_category (
book_id INTEGER,
category_id INTEGER
);

INSERT INTO book_category VALUES
(1,1),(1,5),
(2,1),(2,2),
(3,6),
(4,2),
(5,1),
(6,1),
(7,3),
(8,4),
(9,7),
(10,1);


DROP TABLE IF EXISTS book_language;
CREATE TABLE IF NOT EXISTS book_language (
book_id INTEGER,
language_id INTEGER
);

INSERT INTO book_language (`book_id`, `language_id`) VALUES
(1,1),
(2,1),
(3,3),
(4,1),
(5,2),
(6,1),
(7,4),
(8,1),
(9,5),
(10,1);


DROP TABLE IF EXISTS book_author;
CREATE TABLE IF NOT EXISTS book_author (
book_id INTEGER,
author_id INTEGER
);

INSERT INTO book_author (`book_id`, `author_id`) VALUES
(1,1),(1,2),
(2,3),(2,4),
(3,5),
(4,6),
(9,4),
(5,7),
(7,9),
(9,1),
(10,2);


DROP TABLE IF EXISTS book_translator;
CREATE TABLE IF NOT EXISTS book_translator (
book_id INTEGER,
translator_id INTEGER
);

INSERT INTO book_translator (book_id, translator_id) VALUES
(1,1),(1,2),
(2,3),
(3,4),
(4,5),
(7,8),
(8,9);


DROP TABLE IF EXISTS book_designer;
CREATE TABLE IF NOT EXISTS book_designer (
book_id INTEGER,
designer_id INTEGER
);

INSERT INTO book_designer (`book_id`, `designer_id`) VALUES
(1,1),(2,2),(3,3),(4,4),(5,5),
(6,1),(7,2),(8,3),(9,4),(10,5);


DROP TABLE IF EXISTS book_publisher;
CREATE TABLE IF NOT EXISTS book_publisher (
book_id INTEGER,
publisher_id INTEGER
);

INSERT INTO book_publisher (book_id, publisher_id) VALUES
(1,1),(1,2),
(2,2),
(3,3),
(4,4),(4,1),
(5,1),
(6,5),
(7,2),
(8,3),
(9,4),
(10,5);