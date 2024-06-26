-- Creating Database LibraryManagementSystem
create database LibraryManagementSystem;

-- Use the Database for further operation performed
use LibraryManagementSystem;

-- Create tables required for Library Management System

-- Create Authors table
CREATE TABLE Authors (
    AuthorID VARCHAR(50) PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    BirthDate DATE,
    Nationality VARCHAR(50)
);

-- Describe the Table
desc Authors;

-- Create Publishers table
CREATE TABLE Publishers (
    PublisherID VARCHAR(50) PRIMARY KEY,
    Name VARCHAR(100),
    Address VARCHAR(255),
    Phone VARCHAR(20),
    Email VARCHAR(100)
);

-- Describe the Table
desc Publishers;

-- Create Categories table
CREATE TABLE Categories (
    CategoryID VARCHAR(50) PRIMARY KEY,
    CategoryName VARCHAR(100),
    Description TEXT,
    ParentCategoryID VARCHAR(50),
    CreatedDate DATE,
    FOREIGN KEY (ParentCategoryID) REFERENCES Categories(CategoryID)
);

-- Describe the Table
desc Categories;

-- Create Books table
CREATE TABLE Books (
    BookID VARCHAR(50) PRIMARY KEY,
    Title VARCHAR(255),
    AuthorID VARCHAR(50),
    PublisherID VARCHAR(50),
    CategoryID VARCHAR(50),
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID),
    FOREIGN KEY (PublisherID) REFERENCES Publishers(PublisherID),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

-- Adding Column to the table
ALTER TABLE Books
ADD Price int;

-- Describe the Table
desc Books;

-- Create Members table
CREATE TABLE Members (
    MemberID VARCHAR(50) PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    MembershipDate DATE,
    Email VARCHAR(100),
    Phone VARCHAR(20)
);

-- Describe the Table
desc Members;

-- Create Loans table
CREATE TABLE Loans (
    LoanID VARCHAR(50) PRIMARY KEY,
    BookID VARCHAR(50),
    MemberID VARCHAR(50),
    LoanDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);


ALTER TABLE Loans
ADD DueDate DATE; 

-- Describe the Table
desc Loans;

-- Create Reviews table
CREATE TABLE Reviews (
    ReviewID VARCHAR(50) PRIMARY KEY,
    BookID VARCHAR(50),
    MemberID VARCHAR(50),
    Rating INT,
    ReviewText TEXT,
    ReviewDate DATE,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);

-- Altering the data type of the column from integer to float
ALTER TABLE Reviews
MODIFY COLUMN Rating FLOAT;


-- Describe the Table
desc Reviews;

-- Insert records into the Tables

-- Insert records into Author table
INSERT INTO Authors (AuthorID, FirstName, LastName, BirthDate, Nationality) VALUES
('A001', 'Chetan', 'Bhagat', '1974-04-22', 'India'),
('A002', 'Arundhati', 'Roy', '1961-11-24', 'India'),
('A003', 'Ruskin', 'Bond', '1934-05-19', 'India'),
('A004', 'R. K.', 'Narayan', '1906-10-10', 'India'),
('A005', 'Vikram', 'Seth', '1952-06-20', 'India'),
('A006', 'Salman', 'Rushdie', '1947-06-19', 'India'),
('A007', 'Jhumpa', 'Lahiri', '1967-07-11', 'India'),
('A008', 'Anita', 'Desai', '1937-06-24', 'India'),
('A009', 'Amish', 'Tripathi', '1974-10-18', 'India'),
('A010', 'Shashi', 'Tharoor', '1956-03-09', 'India'),
('A011', 'Kiran', 'Desai', '1971-09-03', 'India'),
('A012', 'Aravind', 'Adiga', '1974-10-23', 'India'),
('A013', 'Rohinton', 'Mistry', '1952-07-03', 'India'),
('A014', 'Ravinder', 'Singh', '1982-02-04', 'India'),
('A015', 'Ashwin', 'Sanghi', '1969-01-25', 'India'),
('A016', 'Preeti', 'Shenoy', '1971-12-21', 'India'),
('A017', 'Durjoy', 'Datta', '1987-02-07', 'India'),
('A018', 'Savi', 'Sharma', '1993-08-18', 'India'),
('A019', 'Devdutt', 'Pattanaik', '1970-12-11', 'India'),
('A020', 'Chitra', 'Divakaruni', '1956-07-29', 'India'),
('A021', 'George', 'Orwell', '1903-06-25', 'United Kingdom'),
('A022', 'Jane', 'Austen', '1775-12-16', 'United Kingdom'),
('A023', 'Mark', 'Twain', '1835-11-30', 'United States'),
('A024', 'Ernest', 'Hemingway', '1899-07-21', 'United States'),
('A025', 'J.K.', 'Rowling', '1965-07-31', 'United Kingdom'),
('A026', 'Leo', 'Tolstoy', '1828-09-09', 'Russia'),
('A027', 'Fyodor', 'Dostoevsky', '1821-11-11', 'Russia'),
('A028', 'Gabriel', 'Garcia Marquez', '1927-03-06', 'Colombia'),
('A029', 'Isabel', 'Allende', '1942-08-02', 'Chile'),
('A030', 'Haruki', 'Murakami', '1949-01-12', 'Japan'),
('A031', 'Kazuo', 'Ishiguro', '1954-11-08', 'Japan'),
('A032', 'Albert', 'Camus', '1913-11-07', 'France'),
('A033', 'Victor', 'Hugo', '1802-02-26', 'France'),
('A034', 'Hermann', 'Hesse', '1877-07-02', 'Germany'),
('A035', 'Franz', 'Kafka', '1883-07-03', 'Czech Republic'),
('A036', 'Umberto', 'Eco', '1932-01-05', 'Italy'),
('A037', 'Orhan', 'Pamuk', '1952-06-07', 'Turkey'),
('A038', 'Paulo', 'Coelho', '1947-08-24', 'Brazil'),
('A039', 'Jorge Luis', 'Borges', '1899-08-24', 'Argentina'),
('A040', 'Mario', 'Vargas Llosa', '1936-03-28', 'Peru'),
('A041', 'Chinua', 'Achebe', '1930-11-16', 'Nigeria'),
('A042', 'Ngugi wa', 'Thiong\'o', '1938-01-05', 'Kenya'),
('A043', 'Naguib', 'Mahfouz', '1911-12-11', 'Egypt'),
('A044', 'Toni', 'Morrison', '1931-02-18', 'United States'),
('A045', 'Alice', 'Munro', '1931-07-10', 'Canada'),
('A046', 'Margaret', 'Atwood', '1939-11-18', 'Canada'),
('A047', 'Khaled', 'Hosseini', '1965-03-04', 'Afghanistan'),
('A048', 'Elif', 'Shafak', '1971-10-25', 'Turkey'),
('A049', 'V.S.', 'Naipaul', '1932-08-17', 'Trinidad and Tobago'),
('A050', 'Chimamanda', 'Ngozi Adichie', '1977-09-15', 'Nigeria'),
('A051', 'Han', 'Kang', '1970-11-27', 'South Korea'),
('A052', 'Yann', 'Martel', '1963-06-25', 'Canada'),
('A053', 'Mohsin', 'Hamid', '1971-07-23', 'Pakistan'),
('A054', 'Eka', 'Kurniawan', '1975-11-28', 'Indonesia'),
('A055', 'Gao', 'Xingjian', '1940-01-04', 'China'),
('A056', 'Banana', 'Yoshimoto', '1964-07-24', 'Japan'),
('A057', 'Kenzaburo', 'Oe', '1935-01-31', 'Japan'),
('A058', 'Muriel', 'Spark', '1918-02-01', 'United Kingdom'),
('A059', 'William', 'Shakespeare', '1564-04-26', 'United Kingdom'),
('A060', 'Charles', 'Dickens', '1812-02-07', 'United Kingdom'),
('A061', 'Homer', NULL, '750-01-01', 'Greece'),
('A062', 'Sophocles', NULL, '497-01-01', 'Greece'),
('A063', 'Euripides', NULL, '480-01-01', 'Greece'),
('A064', 'Sappho', NULL, '630-01-01', 'Greece'),
('A065', 'Dante', 'Alighieri', '1265-05-21', 'Italy'),
('A066', 'Johann Wolfgang von', 'Goethe', '1749-08-28', 'Germany'),
('A067', 'Miguel de', 'Cervantes', '1547-09-29', 'Spain'),
('A068', 'Murasaki', 'Shikibu', '973-01-01', 'Japan'),
('A069', 'Jorge', 'Luis Borges', '1899-08-24', 'Argentina'),
('A070', 'Pablo', 'Neruda', '1904-07-12', 'Chile'),
('A071', 'Gabriel', 'Garcia Marquez', '1927-03-06', 'Colombia'),
('A072', 'Isabel', 'Allende', '1942-08-02', 'Chile'),
('A073', 'Mario', 'Vargas Llosa', '1936-03-28', 'Peru'),
('A074', 'Octavio', 'Paz', '1914-03-31', 'Mexico'),
('A075', 'Carlos', 'Fuentes', '1928-11-11', 'Mexico'),
('A076', 'Gabriel', 'Garcia Marquez', '1927-03-06', 'Colombia'),
('A077', 'Isabel', 'Allende', '1942-08-02', 'Chile'),
('A078', 'Mario', 'Vargas Llosa', '1936-03-28', 'Peru'),
('A079', 'Octavio', 'Paz', '1914-03-31', 'Mexico'),
('A080', 'Carlos', 'Fuentes', '1928-11-11', 'Mexico'),
('A081', 'Gabriel', 'Garcia Marquez', '1927-03-06', 'Colombia'),
('A082', 'Isabel', 'Allende', '1942-08-02', 'Chile'),
('A083', 'Mario', 'Vargas Llosa', '1936-03-28', 'Peru'),
('A084', 'Octavio', 'Paz', '1914-03-31', 'Mexico'),
('A085', 'Carlos', 'Fuentes', '1928-11-11', 'Mexico'),
('A086', 'Gabriel', 'Garcia Marquez', '1927-03-06', 'Colombia'),
('A087', 'Isabel', 'Allende', '1942-08-02', 'Chile'),
('A088', 'Mario', 'Vargas Llosa', '1936-03-28', 'Peru'),
('A089', 'Octavio', 'Paz', '1914-03-31', 'Mexico'),
('A090', 'Carlos', 'Fuentes', '1928-11-11', 'Mexico'),
('A091', 'Gabriel', 'Garcia Marquez', '1927-03-06', 'Colombia'),
('A092', 'Isabel', 'Allende', '1942-08-02', 'Chile'),
('A093', 'Mario', 'Vargas Llosa', '1936-03-28', 'Peru'),
('A094', 'Octavio', 'Paz', '1914-03-31', 'Mexico'),
('A095', 'Carlos', 'Fuentes', '1928-11-11', 'Mexico'),
('A096', 'Gabriel', 'Garcia Marquez', '1927-03-06', 'Colombia'),
('A097', 'Isabel', 'Allende', '1942-08-02', 'Chile'),
('A098', 'Mario', 'Vargas Llosa', '1936-03-28', 'Peru'),
('A099', 'Octavio', 'Paz', '1914-03-31', 'Mexico'),
('A100', 'Carlos', 'Fuentes', '1928-11-11', 'Mexico');

--  Retrieve all columns and rows from a table 
select * from Authors;

-- Insert records into Publishers table
INSERT INTO Publishers (PublisherID, Name, Address, Phone, Email) VALUES
('P001', 'HarperCollins India', 'Daryaganj, New Delhi', '+91-11-23456789', 'info@harpercollins.in'),
('P002', 'Penguin Random House India', 'Hauz Khas, New Delhi', '+91-11-12345678', 'contact@penguinrandomhouse.in'),
('P003', 'Rupa Publications', 'Connaught Place, New Delhi', '+91-11-87654321', 'info@rupapublications.com'),
('P004', 'Penguin Books India', 'Gurgaon, Haryana', '+91-124-2345678', 'support@penguin.co.in'),
('P005', 'Westland Publications', 'Kotturpuram, Chennai', '+91-44-23456789', 'contact@westlandbooks.in'),
('P006', 'Vintage Books', 'Mandir Marg, New Delhi', '+91-11-23412345', 'info@vintagebooks.com'),
('P007', 'HarperCollins India', 'Daryaganj, New Delhi', '+91-11-23456789', 'info@harpercollins.in'),
('P008', 'Penguin Random House India', 'Hauz Khas, New Delhi', '+91-11-12345678', 'contact@penguinrandomhouse.in'),
('P009', 'Rupa Publications', 'Connaught Place, New Delhi', '+91-11-87654321', 'info@rupapublications.com'),
('P010', 'Penguin Books India', 'Gurgaon, Haryana', '+91-124-2345678', 'support@penguin.co.in'),
('P011', 'Westland Publications', 'Kotturpuram, Chennai', '+91-44-23456789', 'contact@westlandbooks.in'),
('P012', 'Vintage Books', 'Mandir Marg, New Delhi', '+91-11-23412345', 'info@vintagebooks.com'),
('P013', 'HarperCollins India', 'Daryaganj, New Delhi', '+91-11-23456789', 'info@harpercollins.in'),
('P014', 'Penguin Random House India', 'Hauz Khas, New Delhi', '+91-11-12345678', 'contact@penguinrandomhouse.in'),
('P015', 'Rupa Publications', 'Connaught Place, New Delhi', '+91-11-87654321', 'info@rupapublications.com'),
('P016', 'Penguin Books India', 'Gurgaon, Haryana', '+91-124-2345678', 'support@penguin.co.in'),
('P017', 'Westland Publications', 'Kotturpuram, Chennai', '+91-44-23456789', 'contact@westlandbooks.in'),
('P018', 'Vintage Books', 'Mandir Marg, New Delhi', '+91-11-23412345', 'info@vintagebooks.com'),
('P019', 'HarperCollins India', 'Daryaganj, New Delhi', '+91-11-23456789', 'info@harpercollins.in'),
('P020', 'Penguin Random House India', 'Hauz Khas, New Delhi', '+91-11-12345678', 'contact@penguinrandomhouse.in'),
('P021', 'Secker & Warburg', 'London, United Kingdom', '+44-20-12345678', 'info@seckerwarburg.co.uk'),
('P022', 'Penguin Classics', 'London, United Kingdom', '+44-20-87654321', 'info@penguinclassics.co.uk'),
('P023', 'Harper & Brothers', 'New York, USA', '+1-212-1234567', 'contact@harperbrothers.com'),
('P024', 'Charles Scribner\'s Sons', 'New York, USA', '+1-212-2345678', 'info@scribners.com'),
('P025', 'Bloomsbury Publishing', 'London, United Kingdom', '+44-20-12341234', 'contact@bloomsbury.com'),
('P026', 'The Russian Messenger', 'Moscow, Russia', '+7-495-1234567', 'info@russianmessenger.ru'),
('P027', 'The Russian Messenger', 'Moscow, Russia', '+7-495-1234567', 'info@russianmessenger.ru'),
('P028', 'Editorial Sudamericana', 'Bogotá, Colombia', '+57-1-2345678', 'contact@sudamericana.com'),
('P029', 'Editorial Sudamericana', 'Santiago, Chile', '+56-2-1234567', 'info@sudamericana.cl'),
('P030', 'Shinchosha Publishing', 'Tokyo, Japan', '+81-3-12345678', 'info@shinchosha.co.jp'),
('P031', 'Faber and Faber', 'London, United Kingdom', '+44-20-12345678', 'info@faber.co.uk'),
('P032', 'Gallimard', 'Paris, France', '+33-1-23456789', 'contact@gallimard.fr'),
('P033', 'Hachette', 'Paris, France', '+33-1-12345678', 'info@hachette.fr'),
('P034', 'Suhrkamp Verlag', 'Berlin, Germany', '+49-30-1234567', 'info@suhrkamp.de'),
('P035', 'Kurt Wolff Verlag', 'Prague, Czech Republic', '+420-2-1234567', 'contact@kurtwolff.cz'),
('P036', 'Bompiani', 'Milan, Italy', '+39-02-1234567', 'info@bompiani.it'),
('P037', 'Iletisim Yayinlari', 'Istanbul, Turkey', '+90-212-1234567', 'contact@iletisim.com.tr'),
('P038', 'Companhia das Letras', 'São Paulo, Brazil', '+55-11-2345678', 'info@companhialetras.com.br'),
('P039', 'Emecé Editores', 'Buenos Aires, Argentina', '+54-11-1234567', 'info@emecé.com.ar'),
('P040', 'Alfaguara', 'Lima, Peru', '+51-1-2345678', 'contact@alfaguara.com.pe'),
('P041', 'Heinemann', 'Lagos, Nigeria', '+234-1-1234567', 'info@heinemann.ng'),
('P042', 'Heinemann', 'Nairobi, Kenya', '+254-20-1234567', 'info@heinemann.ke'),
('P043', 'Maktabat al-Khanji', 'Cairo, Egypt', '+20-2-12345678', 'info@khanji.com.eg'),
('P044', 'Random House', 'New York, USA', '+1-212-1234567', 'contact@randomhouse.com'),
('P045', 'Douglas Gibson Books', 'Toronto, Canada', '+1-416-1234567', 'info@douglasgibsonbooks.ca'),
('P046', 'McClelland & Stewart', 'Toronto, Canada', '+1-416-2345678', 'contact@mcclelland.com'),
('P047', 'Riverhead Books', 'New York, USA', '+1-212-2345678', 'info@riverheadbooks.com'),
('P048', 'Penguin Books', 'London, United Kingdom', '+44-20-12345678', 'info@penguin.co.uk'),
('P049', 'André Deutsch', 'London, United Kingdom', '+44-20-23456789', 'info@andredeutsch.co.uk'),
('P050', 'Farafina Books', 'Lagos, Nigeria', '+234-1-2345678', 'contact@farafinabooks.ng'),
('P051', 'Gimm-Young Publishers', 'Seoul, South Korea', '+82-2-1234567', 'info@gimm-young.co.kr'),
('P052', 'Knopf Canada', 'Toronto, Canada', '+1-416-1234567', 'info@knopfcanada.ca'),
('P053', 'Granta', 'London, United Kingdom', '+44-20-12345678', 'info@granta.co.uk'),
('P054', 'Gramedia', 'Jakarta, Indonesia', '+62-21-1234567', 'contact@gramedia.com'),
('P055', 'People\'s Literature Publishing House', 'Beijing, China', '+86-10-1234567', 'info@plph.cn'),
('P056', 'Kodansha', 'Tokyo, Japan', '+81-3-2345678', 'contact@kodansha.co.jp'),
('P057', 'Shinchosha', 'Tokyo, Japan', '+81-3-12345678', 'info@shinchosha.co.jp'),
('P058', 'Constable & Robinson', 'London, United Kingdom', '+44-20-12345678', 'info@constablerobinson.com'),
('P059', 'Faber and Faber', 'London, United Kingdom', '+44-20-23456789', 'info@faber.co.uk'),
('P060', 'Chapman & Hall', 'London, United Kingdom', '+44-20-3456789', 'info@chapmanhall.co.uk'),
('P061', 'Penguin Books', 'London, United Kingdom', '+44-20-12345678', 'info@penguin.co.uk'),
('P062', 'Penguin Books', 'London, United Kingdom', '+44-20-23456789', 'info@penguin.co.uk'),
('P063', 'Penguin Books', 'London, United Kingdom', '+44-20-3456789', 'info@penguin.co.uk'),
('P064', 'Penguin Books', 'London, United Kingdom', '+44-20-4567890', 'info@penguin.co.uk'),
('P065', 'Penguin Books', 'London, United Kingdom', '+44-20-5678901', 'info@penguin.co.uk'),
('P066', 'Mondadori', 'Milan, Italy', '+39-02-1234567', 'info@mondadori.it'),
('P067', 'C. H. Beck', 'Munich, Germany', '+49-89-1234567', 'info@beck.de'),
('P068', 'Alianza Editorial', 'Madrid, Spain', '+34-91-1234567', 'info@alianzaeditorial.es'),
('P069', 'Kodansha', 'Tokyo, Japan', '+81-3-2345678', 'contact@kodansha.co.jp'),
('P070', 'Editorial Sudamericana', 'Santiago, Chile', '+56-2-1234567', 'info@sudamericana.cl'),
('P071', 'Editorial Sudamericana', 'Bogotá, Colombia', '+57-1-2345678', 'contact@sudamericana.com'),
('P072', 'Editorial Sudamericana', 'Santiago, Chile', '+56-2-1234567', 'info@sudamericana.cl'),
('P073', 'Alfaguara', 'Lima, Peru', '+51-1-2345678', 'contact@alfaguara.com.pe'),
('P074', 'Seix Barral', 'Mexico City, Mexico', '+52-55-1234567', 'info@seixbarral.com.mx'),
('P075', 'Editorial Joaquín Mortiz', 'Mexico City, Mexico', '+52-55-2345678', 'contact@joaquinmortiz.mx'),
('P076', 'Editorial Sudamericana', 'Bogotá, Colombia', '+57-1-2345678', 'contact@sudamericana.com'),
('P077', 'Editorial Sudamericana', 'Santiago, Chile', '+56-2-1234567', 'info@sudamericana.cl'),
('P078', 'Alfaguara', 'Lima, Peru', '+51-1-2345678', 'contact@alfaguara.com.pe'),
('P079', 'Seix Barral', 'Mexico City, Mexico', '+52-55-1234567', 'info@seixbarral.com.mx'),
('P080', 'Editorial Joaquín Mortiz', 'Mexico City, Mexico', '+52-55-2345678', 'contact@joaquinmortiz.mx'),
('P081', 'Editorial Sudamericana', 'Bogotá, Colombia', '+57-1-2345678', 'contact@sudamericana.com'),
('P082', 'Editorial Sudamericana', 'Santiago, Chile', '+56-2-1234567', 'info@sudamericana.cl'),
('P083', 'Alfaguara', 'Lima, Peru', '+51-1-2345678', 'contact@alfaguara.com.pe'),
('P084', 'Seix Barral', 'Mexico City, Mexico', '+52-55-1234567', 'info@seixbarral.com.mx'),
('P085', 'Editorial Joaquín Mortiz', 'Mexico City, Mexico', '+52-55-2345678', 'contact@joaquinmortiz.mx'),
('P086', 'Editorial Sudamericana', 'Bogotá, Colombia', '+57-1-2345678', 'contact@sudamericana.com'),
('P087', 'Editorial Sudamericana', 'Santiago, Chile', '+56-2-1234567', 'info@sudamericana.cl'),
('P088', 'Alfaguara', 'Lima, Peru', '+51-1-2345678', 'contact@alfaguara.com.pe'),
('P089', 'Seix Barral', 'Mexico City, Mexico', '+52-55-1234567', 'info@seixbarral.com.mx'),
('P090', 'Editorial Joaquín Mortiz', 'Mexico City, Mexico', '+52-55-2345678', 'contact@joaquinmortiz.mx'),
('P091', 'Editorial Sudamericana', 'Bogotá, Colombia', '+57-1-2345678', 'contact@sudamericana.com'),
('P092', 'Editorial Sudamericana', 'Santiago, Chile', '+56-2-1234567', 'info@sudamericana.cl'),
('P093', 'Alfaguara', 'Lima, Peru', '+51-1-2345678', 'contact@alfaguara.com.pe'),
('P094', 'Seix Barral', 'Mexico City, Mexico', '+52-55-1234567', 'info@seixbarral.com.mx'),
('P095', 'Editorial Joaquín Mortiz', 'Mexico City, Mexico', '+52-55-2345678', 'contact@joaquinmortiz.mx'),
('P096', 'Editorial Sudamericana', 'Bogotá, Colombia', '+57-1-2345678', 'contact@sudamericana.com'),
('P097', 'Editorial Sudamericana', 'Santiago, Chile', '+56-2-1234567', 'info@sudamericana.cl'),
('P098', 'Alfaguara', 'Lima, Peru', '+51-1-2345678', 'contact@alfaguara.com.pe'),
('P099', 'Seix Barral', 'Mexico City, Mexico', '+52-55-1234567', 'info@seixbarral.com.mx'),
('P100', 'Editorial Joaquín Mortiz', 'Mexico City, Mexico', '+52-55-2345678', 'contact@joaquinmortiz.mx');

--  Retrieve all columns and rows from a table 
select * from Publishers;

-- Insert records into Categories table
INSERT INTO Categories (CategoryID, CategoryName, Description, ParentCategoryID, CreatedDate) VALUES
('C001', 'Fiction', 'Fictional literature', NULL, '2024-06-02'),
('C002', 'Non-Fiction', 'Non-fictional literature', NULL, '2024-06-02'),
('C003', 'Literature & Fiction', 'Literature and fiction combined', NULL, '2024-06-02'),
('C004', 'Mystery', 'Mystery genre', 'C001', '2024-06-02'),
('C005', 'Science Fiction', 'Science fiction genre', 'C001', '2024-06-02'),
('C006', 'Fantasy', 'Fantasy genre', 'C001', '2024-06-02'),
('C007', 'Romance', 'Romance genre', 'C001', '2024-06-02'),
('C008', 'Horror', 'Horror genre', 'C001', '2024-06-02'),
('C009', 'Thriller', 'Thriller genre', 'C001', '2024-06-02'),
('C010', 'Biography', 'Biographies of individuals', 'C002', '2024-06-02'),
('C011', 'Autobiography', 'Autobiographies of individuals', 'C002', '2024-06-02'),
('C012', 'History', 'Historical literature', 'C002', '2024-06-02'),
('C013', 'Travel', 'Travel guides and literature', 'C002', '2024-06-02'),
('C014', 'Science', 'Scientific literature', 'C002', '2024-06-02'),
('C015', 'Cooking', 'Cooking and culinary literature', 'C002', '2024-06-02'),
('C016', 'Children', 'Children literature', 'C002', '2024-06-02'),
('C017', 'Young Adult', 'Young adult literature', 'C002', '2024-06-02'),
('C018', 'Reference', 'Reference materials', 'C002', '2024-06-02'),
('C019', 'Drama', 'Drama literature', 'C003', '2024-06-02'),
('C020', 'Poetry', 'Poetic literature', 'C003', '2024-06-02'),
('C021', 'Classics', 'Classic literature', 'C003', '2024-06-02'),
('C022', 'Contemporary', 'Contemporary literature', 'C003', '2024-06-02'),
('C023', 'Indian Literature', 'Literature from India', 'C003', '2024-06-02'),
('C024', 'International Literature', 'Literature from around the world', 'C003', '2024-06-02'),
('C025', 'HarperCollins India', 'Books published by HarperCollins India', 'C023', '2024-06-02'),
('C026', 'Penguin Random House India', 'Books published by Penguin Random House India', 'C023', '2024-06-02'),
('C027', 'Rupa Publications', 'Books published by Rupa Publications', 'C023', '2024-06-02'),
('C028', 'Penguin Books India', 'Books published by Penguin Books India', 'C023', '2024-06-02'),
('C029', 'Westland Publications', 'Books published by Westland Publications', 'C023', '2024-06-02'),
('C030', 'Vintage Books', 'Books published by Vintage Books', 'C024', '2024-06-02'),
('C031', 'Secker & Warburg', 'Books published by Secker & Warburg', 'C024', '2024-06-02'),
('C032', 'Penguin Classics', 'Books published by Penguin Classics', 'C024', '2024-06-02'),
('C033', 'Harper & Brothers', 'Books published by Harper & Brothers', 'C024', '2024-06-02'),
('C034', 'Charles Scribner\'s Sons', 'Books published by Charles Scribner\'s Sons', 'C024', '2024-06-02'),
('C035', 'Bloomsbury Publishing', 'Books published by Bloomsbury Publishing', 'C024', '2024-06-02'),
('C036', 'The Russian Messenger', 'Books published by The Russian Messenger', 'C024', '2024-06-02'),
('C037', 'Editorial Sudamericana', 'Books published by Editorial Sudamericana', 'C024', '2024-06-02'),
('C038', 'Shinchosha Publishing', 'Books published by Shinchosha Publishing', 'C024', '2024-06-02'),
('C039', 'Faber and Faber', 'Books published by Faber and Faber', 'C024', '2024-06-02'),
('C040', 'Gallimard', 'Books published by Gallimard', 'C024', '2024-06-02'),
('C041', 'Hachette', 'Books published by Hachette', 'C024', '2024-06-02'),
('C042', 'Suhrkamp Verlag', 'Books published by Suhrkamp Verlag', 'C024', '2024-06-02'),
('C043', 'Kurt Wolff Verlag', 'Books published by Kurt Wolff Verlag', 'C024', '2024-06-02'),
('C044', 'Bompiani', 'Books published by Bompiani', 'C024', '2024-06-02'),
('C045', 'Iletisim Yayinlari', 'Books published by Iletisim Yayinlari', 'C024', '2024-06-02'),
('C046', 'Companhia das Letras', 'Books published by Companhia das Letras', 'C024', '2024-06-02'),
('C047', 'Emecé Editores', 'Books published by Emecé Editores', 'C024', '2024-06-02'),
('C048', 'Alfaguara', 'Books published by Alfaguara', 'C024', '2024-06-02'),
('C049', 'Heinemann', 'Books published by Heinemann', 'C024', '2024-06-02'),
('C050', 'Maktabat al-Khanji', 'Books published by Maktabat al-Khanji', 'C024', '2024-06-02'),
('C051', 'Random House', 'Books published by Random House', 'C024', '2024-06-02'),
('C052', 'Douglas Gibson Books', 'Books published by Douglas Gibson Books', 'C024', '2024-06-02'),
('C053', 'McClelland & Stewart', 'Books published by McClelland & Stewart', 'C024', '2024-06-02'),
('C054', 'Riverhead Books', 'Books published by Riverhead Books', 'C024', '2024-06-02'),
('C055', 'Penguin Books', 'Books published by Penguin Books', 'C024', '2024-06-02'),
('C056', 'André Deutsch', 'Books published by André Deutsch', 'C024', '2024-06-02'),
('C057', 'Farafina Books', 'Books published by Farafina Books', 'C024', '2024-06-02'),
('C058', 'Gimm-Young Publishers', 'Books published by Gimm-Young Publishers', 'C024', '2024-06-02'),
('C059', 'Knopf Canada', 'Books published by Knopf Canada', 'C024', '2024-06-02'),
('C060', 'Granta', 'Books published by Granta', 'C024', '2024-06-02'),
('C061', 'Gramedia', 'Books published by Gramedia', 'C024', '2024-06-02'),
('C062', 'People\'s Literature Publishing House', 'Books published by People\'s Literature Publishing House', 'C024', '2024-06-02'),
('C063', 'Kodansha', 'Books published by Kodansha', 'C024', '2024-06-02'),
('C064', 'Shinchosha', 'Books published by Shinchosha', 'C024', '2024-06-02'),
('C065', 'Constable & Robinson', 'Books published by Constable & Robinson', 'C024', '2024-06-02'),
('C066', 'Chapman & Hall', 'Books published by Chapman & Hall', 'C024', '2024-06-02'),
('C067', 'Alianza Editorial', 'Books published by Alianza Editorial', 'C024', '2024-06-02'),
('C068', 'Editorial Sudamericana', 'Books published by Editorial Sudamericana', 'C024', '2024-06-02'),
('C069', 'Editorial Joaquín Mortiz', 'Books published by Editorial Joaquín Mortiz', 'C024', '2024-06-02'),
('C070', 'Seix Barral', 'Books published by Seix Barral', 'C024', '2024-06-02'),
('C071', 'Editorial Sudamericana', 'Books published by Editorial Sudamericana', 'C024', '2024-06-02'),
('C072', 'Editorial Joaquín Mortiz', 'Books published by Editorial Joaquín Mortiz', 'C024', '2024-06-02'),
('C073', 'Seix Barral', 'Books published by Seix Barral', 'C024', '2024-06-02'),
('C074', 'Editorial Sudamericana', 'Books published by Editorial Sudamericana', 'C024', '2024-06-02'),
('C075', 'Editorial Joaquín Mortiz', 'Books published by Editorial Joaquín Mortiz', 'C024', '2024-06-02'),
('C076', 'Seix Barral', 'Books published by Seix Barral', 'C024', '2024-06-02'),
('C077', 'Editorial Sudamericana', 'Books published by Editorial Sudamericana', 'C024', '2024-06-02'),
('C078', 'Editorial Joaquín Mortiz', 'Books published by Editorial Joaquín Mortiz', 'C024', '2024-06-02'),
('C079', 'Seix Barral', 'Books published by Seix Barral', 'C024', '2024-06-02'),
('C080', 'Editorial Sudamericana', 'Books published by Editorial Sudamericana', 'C024', '2024-06-02'),
('C081', 'Editorial Joaquín Mortiz', 'Books published by Editorial Joaquín Mortiz', 'C024', '2024-06-02'),
('C082', 'Seix Barral', 'Books published by Seix Barral', 'C024', '2024-06-02'),
('C083', 'Editorial Sudamericana', 'Books published by Editorial Sudamericana', 'C024', '2024-06-02'),
('C084', 'Editorial Joaquín Mortiz', 'Books published by Editorial Joaquín Mortiz', 'C024', '2024-06-02'),
('C085', 'Seix Barral', 'Books published by Seix Barral', 'C024', '2024-06-02'),
('C086', 'Editorial Sudamericana', 'Books published by Editorial Sudamericana', 'C024', '2024-06-02'),
('C087', 'Editorial Joaquín Mortiz', 'Books published by Editorial Joaquín Mortiz', 'C024', '2024-06-02'),
('C088', 'Seix Barral', 'Books published by Seix Barral', 'C024', '2024-06-02'),
('C089', 'Editorial Sudamericana', 'Books published by Editorial Sudamericana', 'C024', '2024-06-02'),
('C090', 'Editorial Joaquín Mortiz', 'Books published by Editorial Joaquín Mortiz', 'C024', '2024-06-02'),
('C091', 'Seix Barral', 'Books published by Seix Barral', 'C024', '2024-06-02'),
('C092', 'Editorial Sudamericana', 'Books published by Editorial Sudamericana', 'C024', '2024-06-02'),
('C093', 'Editorial Joaquín Mortiz', 'Books published by Editorial Joaquín Mortiz', 'C024', '2024-06-02'),
('C094', 'Seix Barral', 'Books published by Seix Barral', 'C024', '2024-06-02'),
('C095', 'Editorial Sudamericana', 'Books published by Editorial Sudamericana', 'C024', '2024-06-02'),
('C096', 'Editorial Joaquín Mortiz', 'Books published by Editorial Joaquín Mortiz', 'C024', '2024-06-02'),
('C097', 'Seix Barral', 'Books published by Seix Barral', 'C024', '2024-06-02'),
('C098', 'Editorial Sudamericana', 'Books published by Editorial Sudamericana', 'C024', '2024-06-02'),
('C099', 'Editorial Joaquín Mortiz', 'Books published by Editorial Joaquín Mortiz', 'C024', '2024-06-02'),
('C100', 'Seix Barral', 'Books published by Seix Barral', 'C024', '2024-06-02');

 --  Retrieve all columns and rows from a table 
select * from Categories;

-- Insert records into Books table
INSERT INTO Books (BookID, Title, AuthorID, PublisherID, CategoryID, Price) VALUES
('B001', 'The Great Gatsby', 'A001', 'P001', 'C001', 500),
('B002', 'To Kill a Mockingbird', 'A002', 'P002', 'C001', 550),
('B003', '1984', 'A003', 'P003', 'C001', 480),
('B004', 'Pride and Prejudice', 'A004', 'P004', 'C001', 520),
('B005', 'The Catcher in the Rye', 'A005', 'P005', 'C001', 490),
('B006', 'The Hobbit', 'A006', 'P006', 'C002', 530),
('B007', 'Brave New World', 'A007', 'P007', 'C002', 520),
('B008', 'The Lord of the Rings', 'A008', 'P008', 'C002', 540),
('B009', 'Fahrenheit 451', 'A009', 'P009', 'C002', 510),
('B010', 'Dune', 'A010', 'P010', 'C002', 550),
('B011', 'The Da Vinci Code', 'A011', 'P011', 'C003', 500),
('B012', 'Angels & Demons', 'A012', 'P012', 'C003', 490),
('B013', 'The Lost Symbol', 'A013', 'P013', 'C003', 480),
('B014', 'Inferno', 'A014', 'P014', 'C003', 510),
('B015', 'Origin', 'A015', 'P015', 'C003', 520),
('B016', 'Harry Potter and the Philosopher\'s Stone', 'A016', 'P016', 'C004', 550),
('B017', 'Harry Potter and the Chamber of Secrets', 'A017', 'P017', 'C004', 540),
('B018', 'Harry Potter and the Prisoner of Azkaban', 'A018', 'P018', 'C004', 530),
('B019', 'Harry Potter and the Goblet of Fire', 'A019', 'P019', 'C004', 520),
('B020', 'Harry Potter and the Order of the Phoenix', 'A020', 'P020', 'C004', 510),
('B021', 'The Hunger Games', 'A021', 'P021', 'C005', 500),
('B022', 'Catching Fire', 'A022', 'P022', 'C005', 490),
('B023', 'Mockingjay', 'A023', 'P023', 'C005', 480),
('B024', 'The Ballad of Songbirds and Snakes', 'A024', 'P024', 'C005', 510),
('B025', 'The Maze Runner', 'A025', 'P025', 'C005', 520),
('B026', 'The Alchemist', 'A026', 'P026', 'C006', 500),
('B027', 'Veronika Decides to Die', 'A027', 'P027', 'C006', 490),
('B028', 'Brida', 'A028', 'P028', 'C006', 480),
('B029', 'By the River Piedra I Sat Down and Wept', 'A029', 'P029', 'C006', 510),
('B030', 'The Valkyries', 'A030', 'P030', 'C006', 520),
('B031', 'Sapiens: A Brief History of Humankind', 'A031', 'P031', 'C007', 500),
('B032', 'Homo Deus: A Brief History of Tomorrow', 'A032', 'P032', 'C007', 490),
('B033', '21 Lessons for the 21st Century', 'A033', 'P033', 'C007', 480),
('B034', 'Yuval Noah Harari Box Set', 'A034', 'P034', 'C007', 510),
('B035', 'The Richest Man in Babylon', 'A035', 'P035', 'C007', 520),
('B036', 'The Lean Startup', 'A036', 'P036', 'C008', 500),
('B037', 'Zero to One', 'A037', 'P037', 'C008', 490),
('B038', 'Hooked: How to Build Habit-Forming Products', 'A038', 'P038', 'C008', 480),
('B039', 'The Innovator\'s Dilemma', 'A039', 'P039', 'C008', 510),
('B040', 'Thinking, Fast and Slow', 'A040', 'P040', 'C008', 520),
('B041', 'The Girl on the Train', 'A041', 'P041', 'C009', 500),
('B042', 'Gone Girl', 'A042', 'P042', 'C009', 490),
('B043', 'The Woman in the Window', 'A043', 'P043', 'C009', 480),
('B044', 'The Silent Patient', 'A044', 'P044', 'C009', 510),
('B045', 'The Wife Between Us', 'A045', 'P045', 'C009', 520),
('B046', 'Educated', 'A046', 'P046', 'C010', 500),
('B047', 'Becoming', 'A047', 'P047', 'C010', 490),
('B048', 'The Glass Castle', 'A048', 'P048', 'C010', 480),
('B049', 'The Immortal Life of Henrietta Lacks', 'A049', 'P049', 'C010', 510),
('B050', 'The Monk of Mokha', 'A050', 'P050', 'C010', 520),
('B051', 'Harry Potter and the Half-Blood Prince', 'A051', 'P051', 'C004', 550),
('B052', 'Harry Potter and the Deathly Hallows', 'A052', 'P052', 'C004', 540),
('B053', 'The Casual Vacancy', 'A053', 'P053', 'C011', 530),
('B054', 'The Cuckoo\'s Calling', 'A054', 'P054', 'C011', 520),
('B055', 'The Silkworm', 'A055', 'P055', 'C011', 510),
('B056', 'Career of Evil', 'A056', 'P056', 'C011', 500),
('B057', 'Lethal White', 'A057', 'P057', 'C011', 490),
('B058', 'Troubled Blood', 'A058', 'P058', 'C011', 480),
('B059', 'Fantastic Beasts and Where to Find Them', 'A059', 'P059', 'C004', 510),
('B060', 'Quidditch Through the Ages', 'A060', 'P060', 'C004', 520),
('B061', 'The Tales of Beedle the Bard', 'A061', 'P061', 'C004', 500),
('B062', 'Fantastic Beasts: The Crimes of Grindelwald', 'A062', 'P062', 'C004', 490),
('B063', 'The Ickabog', 'A063', 'P063', 'C004', 480),
('B064', 'The Secret Commonwealth', 'A064', 'P064', 'C012', 510),
('B065', 'La Belle Sauvage', 'A065', 'P065', 'C012', 520),
('B066', 'The Ballad of Songbirds and Snakes', 'A066', 'P066', 'C012', 500),
('B067', 'The Hunger Games', 'A067', 'P067', 'C012', 490),
('B068', 'Catching Fire', 'A068', 'P068', 'C012', 480),
('B069', 'Mockingjay', 'A069', 'P069', 'C012', 510),
('B070', 'Midnight Sun', 'A070', 'P070', 'C013', 520),
('B071', 'Twilight', 'A071', 'P071', 'C013', 500),
('B072', 'New Moon', 'A072', 'P072', 'C013', 490),
('B073', 'Eclipse', 'A073', 'P073', 'C013', 480),
('B074', 'Breaking Dawn', 'A074', 'P074', 'C013', 510),
('B075', 'The Host', 'A075', 'P075', 'C013', 520),
('B076', 'The Return', 'A076', 'P076', 'C013', 500),
('B077', 'The Chemist', 'A077', 'P077', 'C013', 490),
('B078', 'Life and Death', 'A078', 'P078', 'C013', 480),
('B079', 'Midnight Sun', 'A079', 'P079', 'C013', 510),
('B080', 'Twilight Tenth Anniversary/Life and Death Dual Edition', 'A080', 'P080', 'C013', 520),
('B081', 'The Short Second Life of Bree Tanner', 'A081', 'P081', 'C013', 500),
('B082', 'The Twilight Saga: The Official Illustrated Guide', 'A082', 'P082', 'C013', 490),
('B083', 'Hollywood Dirt', 'A083', 'P083', 'C014', 480),
('B084', 'Sins of Sevin', 'A084', 'P084', 'C014', 510),
('B085', 'RoomHate', 'A085', 'P085', 'C014', 520),
('B086', 'My Skylar', 'A086', 'P086', 'C014', 500),
('B087', 'Jake Undone', 'A087', 'P087', 'C014', 490),
('B088', 'Jake Understood', 'A088', 'P088', 'C014', 480),
('B089', 'Neighbor Dearest', 'A089', 'P089', 'C014', 510),
('B090', 'Stuck-Up Suit', 'A090', 'P090', 'C014', 520),
('B091', 'Cocky Bastard', 'A091', 'P091', 'C014', 500),
('B092', 'Sincerely, Carter', 'A092', 'P092', 'C014', 490),
('B093', 'Misbehaved', 'A093', 'P093', 'C014', 480),
('B094', 'When August Ends', 'A094', 'P094', 'C014', 510),
('B095', 'Bossman', 'A095', 'P095', 'C014', 520),
('B096', 'Dear Bridget, I Want You', 'A096', 'P096', 'C014', 500),
('B097', 'Beautiful Mistake', 'A097', 'P097', 'C014', 490),
('B098', 'Beautiful Oblivion', 'A098', 'P098', 'C014', 480),
('B099', 'Beautiful Redemption', 'A099', 'P099', 'C014', 510),
('B100', 'Beautiful Sacrifice', 'A100', 'P100', 'C014', 520),
('B101', 'Beautiful Secret', 'A001', 'P001', 'C015', 500),
('B102', 'Beautiful Stranger', 'A002', 'P002', 'C015', 490),
('B103', 'Beautiful Surrender', 'A003', 'P003', 'C015', 480),
('B104', 'Beautiful', 'A004', 'P004', 'C015', 510),
('B105', 'Beautiful Beginning', 'A005', 'P005', 'C015', 520),
('B106', 'Beautiful Bombshell', 'A006', 'P006', 'C015', 500),
('B107', 'Beautiful Boss', 'A007', 'P007', 'C015', 490),
('B108', 'Beautiful Beloved', 'A008', 'P008', 'C015', 480),
('B109', 'Beautiful Bitch', 'A009', 'P009', 'C015', 510),
('B110', 'Beautiful Bastard', 'A010', 'P010', 'C015', 520),
('B111', 'The Great Gatsby', 'A011', 'P011', 'C016', 500),
('B112', 'To Kill a Mockingbird', 'A012', 'P012', 'C016', 490),
('B113', '1984', 'A013', 'P013', 'C016', 480),
('B114', 'Pride and Prejudice', 'A014', 'P014', 'C016', 510),
('B115', 'The Catcher in the Rye', 'A015', 'P015', 'C016', 520),
('B116', 'The Hobbit', 'A016', 'P016', 'C017', 500),
('B117', 'Brave New World', 'A017', 'P017', 'C017', 490),
('B118', 'The Lord of the Rings', 'A018', 'P018', 'C017', 480),
('B119', 'Fahrenheit 451', 'A019', 'P019', 'C017', 510),
('B120', 'Dune', 'A020', 'P020', 'C017', 520),
('B121', 'The Da Vinci Code', 'A021', 'P021', 'C018', 500),
('B122', 'Angels & Demons', 'A022', 'P022', 'C018', 490),
('B123', 'The Lost Symbol', 'A023', 'P023', 'C018', 480),
('B124', 'Inferno', 'A024', 'P024', 'C018', 510),
('B125', 'Origin', 'A025', 'P025', 'C018', 520),
('B126', 'Harry Potter and the Philosopher\'s Stone', 'A026', 'P026', 'C019', 500),
('B127', 'Harry Potter and the Chamber of Secrets', 'A027', 'P027', 'C019', 490),
('B128', 'Harry Potter and the Prisoner of Azkaban', 'A028', 'P028', 'C019', 480),
('B129', 'Harry Potter and the Goblet of Fire', 'A029', 'P029', 'C019', 510),
('B130', 'Harry Potter and the Order of the Phoenix', 'A030', 'P030', 'C019', 520),
('B131', 'The Hunger Games', 'A031', 'P031', 'C020', 500),
('B132', 'Catching Fire', 'A032', 'P032', 'C020', 490),
('B133', 'Mockingjay', 'A033', 'P033', 'C020', 480),
('B134', 'The Ballad of Songbirds and Snakes', 'A034', 'P034', 'C020', 510),
('B135', 'The Maze Runner', 'A035', 'P035', 'C020', 520),
('B136', 'The Alchemist', 'A036', 'P036', 'C021', 500),
('B137', 'Veronika Decides to Die', 'A037', 'P037', 'C021', 490),
('B138', 'Brida', 'A038', 'P038', 'C021', 480),
('B139', 'By the River Piedra I Sat Down and Wept', 'A039', 'P039', 'C021', 510),
('B140', 'The Valkyries', 'A040', 'P040', 'C021', 520),
('B141', 'Sapiens: A Brief History of Humankind', 'A041', 'P041', 'C022', 500),
('B142', 'Homo Deus: A Brief History of Tomorrow', 'A042', 'P042', 'C022', 490),
('B143', '21 Lessons for the 21st Century', 'A043', 'P043', 'C022', 480),
('B144', 'Yuval Noah Harari Box Set', 'A044', 'P044', 'C022', 510),
('B145', 'The Richest Man in Babylon', 'A045', 'P045', 'C022', 520),
('B146', 'The Lean Startup', 'A046', 'P046', 'C023', 500),
('B147', 'Zero to One', 'A047', 'P047', 'C023', 490),
('B148', 'Hooked: How to Build Habit-Forming Products', 'A048', 'P048', 'C023', 480),
('B149', 'The Innovator\'s Dilemma', 'A049', 'P049', 'C023', 510),
('B150', 'Thinking, Fast and Slow', 'A050', 'P050', 'C023', 520),
('B151', 'The Girl on the Train', 'A051', 'P051', 'C024', 500),
('B152', 'Gone Girl', 'A052', 'P052', 'C024', 490),
('B153', 'The Woman in the Window', 'A053', 'P053', 'C024', 480),
('B154', 'The Silent Patient', 'A054', 'P054', 'C024', 510),
('B155', 'The Wife Between Us', 'A055', 'P055', 'C024', 520),
('B156', 'Educated', 'A056', 'P056', 'C025', 500),
('B157', 'Becoming', 'A057', 'P057', 'C025', 490),
('B158', 'The Glass Castle', 'A058', 'P058', 'C025', 480),
('B159', 'The Immortal Life of Henrietta Lacks', 'A059', 'P059', 'C025', 510),
('B160', 'The Monk of Mokha', 'A060', 'P060', 'C025', 520),
('B161', 'Harry Potter and the Half-Blood Prince', 'A061', 'P061', 'C026', 550),
('B162', 'Harry Potter and the Deathly Hallows', 'A062', 'P062', 'C026', 540),
('B163', 'The Casual Vacancy', 'A063', 'P063', 'C026', 530),
('B164', 'The Cuckoo\'s Calling', 'A064', 'P064', 'C026', 520),
('B165', 'The Silkworm', 'A065', 'P065', 'C026', 510),
('B166', 'Career of Evil', 'A066', 'P066', 'C027', 500),
('B167', 'Lethal White', 'A067', 'P067', 'C027', 490),
('B168', 'Troubled Blood', 'A068', 'P068', 'C027', 480),
('B169', 'Fantastic Beasts and Where to Find Them', 'A069', 'P069', 'C027', 510),
('B170', 'Quidditch Through the Ages', 'A070', 'P070', 'C027', 520),
('B171', 'The Tales of Beedle the Bard', 'A071', 'P071', 'C027', 500),
('B172', 'Fantastic Beasts: The Crimes of Grindelwald', 'A072', 'P072', 'C027', 490),
('B173', 'The Ickabog', 'A073', 'P073', 'C027', 480),
('B174', 'The Secret Commonwealth', 'A074', 'P074', 'C028', 510),
('B175', 'La Belle Sauvage', 'A075', 'P075', 'C028', 520),
('B176', 'The Ballad of Songbirds and Snakes', 'A076', 'P076', 'C028', 500),
('B177', 'The Hunger Games', 'A077', 'P077', 'C028', 490),
('B178', 'Catching Fire', 'A078', 'P078', 'C028', 480),
('B179', 'Mockingjay', 'A079', 'P079', 'C028', 510),
('B180', 'Midnight Sun', 'A080', 'P080', 'C028', 520),
('B181', 'Twilight', 'A081', 'P081', 'C029', 500),
('B182', 'New Moon', 'A082', 'P082', 'C029', 490),
('B183', 'Eclipse', 'A083', 'P083', 'C029', 480),
('B184', 'Breaking Dawn', 'A084', 'P084', 'C029', 510),
('B185', 'The Host', 'A085', 'P085', 'C029', 520),
('B186', 'The Return', 'A086', 'P086', 'C029', 500),
('B187', 'The Chemist', 'A087', 'P087', 'C029', 490),
('B188', 'Life and Death', 'A088', 'P088', 'C029', 480),
('B189', 'Midnight Sun', 'A089', 'P089', 'C029', 510),
('B190', 'Twilight Tenth Anniversary/Life and Death Dual Edition', 'A090', 'P090', 'C029', 520),
('B191', 'The Short Second Life of Bree Tanner', 'A091', 'P091', 'C029', 500),
('B192', 'The Twilight Saga: The Official Illustrated Guide', 'A092', 'P092', 'C029', 490),
('B193', 'Hollywood Dirt', 'A093', 'P093', 'C030', 480),
('B194', 'Sins of Sevin', 'A094', 'P094', 'C030', 510),
('B195', 'RoomHate', 'A095', 'P095', 'C030', 520),
('B196', 'My Skylar', 'A096', 'P096', 'C030', 500),
('B197', 'Jake Undone', 'A097', 'P097', 'C030', 490),
('B198', 'Jake Understood', 'A098', 'P098', 'C030', 480),
('B199', 'Neighbor Dearest', 'A099', 'P099', 'C030', 510),
('B200', 'Stuck-Up Suit', 'A100', 'P100', 'C030', 520);
INSERT INTO Books (BookID, Title, AuthorID, PublisherID, CategoryID, Price) VALUES
('B201', 'The Wind-Up Bird Chronicle', 'A045', 'P041', 'C022', 600),
('B202', 'Norwegian Wood', 'A012', 'P042', 'C018', 450),
('B203', 'Kafka on the Shore', 'A015', 'P043', 'C025', 700),
('B204', '1Q84', 'A030', 'P044', 'C023', 800),
('B205', 'Men Without Women', 'A040', 'P045', 'C024', 500),
('B206', 'The Night Circus', 'A008', 'P046', 'C025', 550),
('B207', 'The Ocean at the End of the Lane', 'A029', 'P047', 'C018', 520),
('B208', 'American Gods', 'A031', 'P048', 'C022', 670),
('B209', 'Good Omens', 'A038', 'P049', 'C021', 620),
('B210', 'Neverwhere', 'A033', 'P050', 'C023', 480),
('B211', 'Coraline', 'A020', 'P051', 'C025', 470),
('B212', 'The Graveyard Book', 'A002', 'P052', 'C022', 490),
('B213', 'Stardust', 'A017', 'P053', 'C024', 530),
('B214', 'The Sandman', 'A028', 'P054', 'C021', 850),
('B215', 'Anansi Boys', 'A026', 'P055', 'C023', 750),
('B216', 'The Ocean at the End of the Lane', 'A037', 'P056', 'C025', 520),
('B217', 'The Song of Achilles', 'A046', 'P057', 'C018', 600),
('B218', 'Circe', 'A012', 'P058', 'C024', 650),
('B219', 'Middlesex', 'A015', 'P059', 'C023', 580),
('B220', 'The Virgin Suicides', 'A030', 'P060', 'C022', 500),
('B221', 'The Goldfinch', 'A040', 'P061', 'C025', 900),
('B222', 'The Secret History', 'A008', 'P062', 'C018', 850),
('B223', 'The Little Friend', 'A029', 'P063', 'C023', 720),
('B224', 'Where the Crawdads Sing', 'A031', 'P064', 'C021', 520),
('B225', 'The Water Dancer', 'A038', 'P065', 'C022', 630),
('B226', 'The Underground Railroad', 'A033', 'P066', 'C024', 680),
('B227', 'The Nickel Boys', 'A020', 'P067', 'C021', 590),
('B228', 'Station Eleven', 'A002', 'P068', 'C023', 610),
('B229', 'The Glass Hotel', 'A017', 'P069', 'C022', 620),
('B230', 'The Night Circus', 'A028', 'P070', 'C025', 640),
('B231', 'The Giver of Stars', 'A026', 'P071', 'C018', 560),
('B232', 'Me Before You', 'A037', 'P072', 'C024', 600),
('B233', 'The Book Thief', 'A046', 'P073', 'C023', 710),
('B234', 'The Kite Runner', 'A012', 'P074', 'C021', 780),
('B235', 'A Thousand Splendid Suns', 'A015', 'P075', 'C022', 650),
('B236', 'And the Mountains Echoed', 'A030', 'P076', 'C018', 700),
('B237', 'The Light We Lost', 'A040', 'P077', 'C023', 560),
('B238', 'Dear Edward', 'A008', 'P078', 'C025', 620),
('B239', 'An American Marriage', 'A029', 'P079', 'C021', 540),
('B240', 'The Mothers', 'A031', 'P080', 'C022', 580),
('B241', 'The Vanishing Half', 'A038', 'P081', 'C024', 670),
('B242', 'Such a Fun Age', 'A033', 'P082', 'C023', 750),
('B243', 'Red, White & Royal Blue', 'A020', 'P083', 'C018', 810),
('B244', 'One to Watch', 'A002', 'P084', 'C021', 730),
('B245', 'Beach Read', 'A017', 'P085', 'C025', 620),
('B246', 'Normal People', 'A028', 'P086', 'C018', 700),
('B247', 'Conversations with Friends', 'A026', 'P087', 'C023', 690),
('B248', 'Daisy Jones & The Six', 'A037', 'P088', 'C021', 800),
('B249', 'The Seven Husbands of Evelyn Hugo', 'A046', 'P089', 'C025', 650),
('B250', 'Malibu Rising', 'A012', 'P090', 'C022', 720);

--  Retrieve all columns and rows from a table 
select * from Books;

-- Insert records into Members table
INSERT INTO Members (MemberID, FirstName, LastName, MembershipDate, Email, Phone) VALUES
('M001', 'Ravi', 'Kumar', '2022-01-15', 'ravi.kumar@example.com', '9876543210'),
('M002', 'Anjali', 'Sharma', '2022-02-10', 'anjali.sharma@example.com', '9876543211'),
('M003', 'Sunita', 'Reddy', '2022-03-05', 'sunita.reddy@example.com', '9876543212'),
('M004', 'Amit', 'Patel', '2022-04-20', 'amit.patel@example.com', '9876543213'),
('M005', 'Priya', 'Singh', '2022-05-18', 'priya.singh@example.com', '9876543214'),
('M006', 'Vikram', 'Rao', '2022-06-25', 'vikram.rao@example.com', '9876543215'),
('M007', 'Deepa', 'Nair', '2022-07-30', 'deepa.nair@example.com', '9876543216'),
('M008', 'Rajesh', 'Mehta', '2022-08-12', 'rajesh.mehta@example.com', '9876543217'),
('M009', 'Sneha', 'Gupta', '2022-09-01', 'sneha.gupta@example.com', '9876543218'),
('M010', 'Suresh', 'Pillai', '2022-10-22', 'suresh.pillai@example.com', '9876543219'),
('M011', 'Manish', 'Kapoor', '2022-11-15', 'manish.kapoor@example.com', '9876543220'),
('M012', 'Kiran', 'Desai', '2022-12-05', 'kiran.desai@example.com', '9876543221'),
('M013', 'Ritu', 'Agarwal', '2023-01-12', 'ritu.agarwal@example.com', '9876543222'),
('M014', 'Nikhil', 'Joshi', '2023-02-28', 'nikhil.joshi@example.com', '9876543223'),
('M015', 'Lakshmi', 'Iyer', '2023-03-25', 'lakshmi.iyer@example.com', '9876543224'),
('M016', 'Ajay', 'Chopra', '2023-04-10', 'ajay.chopra@example.com', '9876543225'),
('M017', 'Neha', 'Pandey', '2023-05-18', 'neha.pandey@example.com', '9876543226'),
('M018', 'Gaurav', 'Shah', '2023-06-14', 'gaurav.shah@example.com', '9876543227'),
('M019', 'Meena', 'Varma', '2023-07-09', 'meena.varma@example.com', '9876543228'),
('M020', 'Arjun', 'Malhotra', '2023-08-22', 'arjun.malhotra@example.com', '9876543229'),
('M021', 'John', 'Doe', '2022-01-10', 'john.doe@example.com', '9876543230'),
('M022', 'Jane', 'Smith', '2022-02-11', 'jane.smith@example.com', '9876543231'),
('M023', 'Robert', 'Brown', '2022-03-15', 'robert.brown@example.com', '9876543232'),
('M024', 'Emily', 'Davis', '2022-04-18', 'emily.davis@example.com', '9876543233'),
('M025', 'Michael', 'Johnson', '2022-05-20', 'michael.johnson@example.com', '9876543234'),
('M026', 'Jessica', 'Martinez', '2022-06-10', 'jessica.martinez@example.com', '9876543235'),
('M027', 'Daniel', 'Garcia', '2022-07-15', 'daniel.garcia@example.com', '9876543236'),
('M028', 'Ashley', 'Rodriguez', '2022-08-22', 'ashley.rodriguez@example.com', '9876543237'),
('M029', 'David', 'Martinez', '2022-09-25', 'david.martinez@example.com', '9876543238'),
('M030', 'Sarah', 'Hernandez', '2022-10-30', 'sarah.hernandez@example.com', '9876543239'),
('M031', 'James', 'Moore', '2022-11-22', 'james.moore@example.com', '9876543240'),
('M032', 'Lisa', 'Taylor', '2022-12-30', 'lisa.taylor@example.com', '9876543241'),
('M033', 'Matthew', 'Anderson', '2023-01-10', 'matthew.anderson@example.com', '9876543242'),
('M034', 'Angela', 'Thomas', '2023-02-20', 'angela.thomas@example.com', '9876543243'),
('M035', 'Christopher', 'Jackson', '2023-03-15', 'christopher.jackson@example.com', '9876543244'),
('M036', 'Patricia', 'White', '2023-04-25', 'patricia.white@example.com', '9876543245'),
('M037', 'Joshua', 'Harris', '2023-05-30', 'joshua.harris@example.com', '9876543246'),
('M038', 'Amanda', 'Martin', '2023-06-22', 'amanda.martin@example.com', '9876543247'),
('M039', 'Andrew', 'Thompson', '2023-07-11', 'andrew.thompson@example.com', '9876543248'),
('M040', 'Stephanie', 'Martinez', '2023-08-10', 'stephanie.martinez@example.com', '9876543249'),
('M041', 'Mark', 'Martinez', '2022-01-12', 'mark.martinez@example.com', '9876543250'),
('M042', 'Laura', 'Lopez', '2022-02-15', 'laura.lopez@example.com', '9876543251'),
('M043', 'Steven', 'Gonzalez', '2022-03-18', 'steven.gonzalez@example.com', '9876543252'),
('M044', 'Mary', 'Wilson', '2022-04-20', 'mary.wilson@example.com', '9876543253'),
('M045', 'Joseph', 'Clark', '2022-05-25', 'joseph.clark@example.com', '9876543254'),
('M046', 'Michelle', 'Lewis', '2022-06-30', 'michelle.lewis@example.com', '9876543255'),
('M047', 'Charles', 'Robinson', '2022-07-18', 'charles.robinson@example.com', '9876543256'),
('M048', 'Kimberly', 'Walker', '2022-08-20', 'kimberly.walker@example.com', '9876543257'),
('M049', 'Paul', 'Perez', '2022-09-25', 'paul.perez@example.com', '9876543258'),
('M050', 'Linda', 'Hall', '2022-10-30', 'linda.hall@example.com', '9876543259'),
('M051', 'Kevin', 'Young', '2022-11-12', 'kevin.young@example.com', '9876543260'),
('M052', 'Barbara', 'Allen', '2022-12-10', 'barbara.allen@example.com', '9876543261'),
('M053', 'Brian', 'Sanchez', '2023-01-22', 'brian.sanchez@example.com', '9876543262'),
('M054', 'Sharon', 'Wright', '2023-02-18', 'sharon.wright@example.com', '9876543263'),
('M055', 'Edward', 'King', '2023-03-20', 'edward.king@example.com', '9876543264'),
('M056', 'Dorothy', 'Scott', '2023-04-22', 'dorothy.scott@example.com', '9876543265'),
('M057', 'Gary', 'Green', '2023-05-15', 'gary.green@example.com', '9876543266'),
('M058', 'Donna', 'Baker', '2023-06-12', 'donna.baker@example.com', '9876543267'),
('M059', 'George', 'Adams', '2023-07-20', 'george.adams@example.com', '9876543268'),
('M060', 'Betty', 'Nelson', '2023-08-15', 'betty.nelson@example.com', '9876543269'),
('M061', 'Ronald', 'Carter', '2022-01-11', 'ronald.carter@example.com', '9876543270'),
('M062', 'Karen', 'Mitchell', '2022-02-20', 'karen.mitchell@example.com', '9876543271'),
('M063', 'Jeffrey', 'Perez', '2022-03-15', 'jeffrey.perez@example.com', '9876543272'),
('M064', 'Helen', 'Roberts', '2022-04-22', 'helen.roberts@example.com', '9876543273'),
('M065', 'Ryan', 'Turner', '2022-05-18', 'ryan.turner@example.com', '9876543274'),
('M066', 'Alice', 'Phillips', '2022-06-25', 'alice.phillips@example.com', '9876543275'),
('M067', 'Larry', 'Campbell', '2022-07-12', 'larry.campbell@example.com', '9876543276'),
('M068', 'Samantha', 'Parker', '2022-08-10', 'samantha.parker@example.com', '9876543277'),
('M069', 'Raymond', 'Evans', '2022-09-22', 'raymond.evans@example.com', '9876543278'),
('M070', 'Sandra', 'Edwards', '2022-10-30', 'sandra.edwards@example.com', '9876543279'),
('M071', 'Jack', 'Collins', '2022-11-18', 'jack.collins@example.com', '9876543280'),
('M072', 'Janet', 'Stewart', '2022-12-20', 'janet.stewart@example.com', '9876543281'),
('M073', 'Dennis', 'Sanchez', '2023-01-15', 'dennis.sanchez@example.com', '9876543282'),
('M074', 'Pamela', 'Morris', '2023-02-25', 'pamela.morris@example.com', '9876543283'),
('M075', 'Patrick', 'Rogers', '2023-03-22', 'patrick.rogers@example.com', '9876543284'),
('M076', 'Carol', 'Reed', '2023-04-12', 'carol.reed@example.com', '9876543285'),
('M077', 'Joshua', 'Cook', '2023-05-30', 'joshua.cook@example.com', '9876543286'),
('M078', 'Deborah', 'Morgan', '2023-06-25', 'deborah.morgan@example.com', '9876543287'),
('M079', 'Jason', 'Bell', '2023-07-20', 'jason.bell@example.com', '9876543288'),
('M080', 'Kathleen', 'Murphy', '2023-08-18', 'kathleen.murphy@example.com', '9876543289'),
('M081', 'Keith', 'Bailey', '2022-01-20', 'keith.bailey@example.com', '9876543290'),
('M082', 'Margaret', 'Rivera', '2022-02-25', 'margaret.rivera@example.com', '9876543291'),
('M083', 'Peter', 'Cooper', '2022-03-30', 'peter.cooper@example.com', '9876543292'),
('M084', 'Frances', 'Richardson', '2022-04-22', 'frances.richardson@example.com', '9876543293'),
('M085', 'Wayne', 'Cox', '2022-05-15', 'wayne.cox@example.com', '9876543294'),
('M086', 'Julie', 'Howard', '2022-06-25', 'julie.howard@example.com', '9876543295'),
('M087', 'Eugene', 'Ward', '2022-07-18', 'eugene.ward@example.com', '9876543296'),
('M088', 'Heather', 'Torres', '2022-08-10', 'heather.torres@example.com', '9876543297'),
('M089', 'Timothy', 'Peterson', '2022-09-25', 'timothy.peterson@example.com', '9876543298'),
('M090', 'Diane', 'Gray', '2022-10-15', 'diane.gray@example.com', '9876543299'),
('M091', 'George', 'Ramirez', '2022-11-10', 'george.ramirez@example.com', '9876543300'),
('M092', 'Megan', 'James', '2022-12-05', 'megan.james@example.com', '9876543301'),
('M093', 'Bruce', 'Watson', '2023-01-25', 'bruce.watson@example.com', '9876543302'),
('M094', 'Ann', 'Brooks', '2023-02-28', 'ann.brooks@example.com', '9876543303'),
('M095', 'Lawrence', 'Kelly', '2023-03-22', 'lawrence.kelly@example.com', '9876543304'),
('M096', 'Rachel', 'Sanders', '2023-04-30', 'rachel.sanders@example.com', '9876543305'),
('M097', 'Carl', 'Price', '2023-05-15', 'carl.price@example.com', '9876543306'),
('M098', 'Carol', 'Bennett', '2023-06-20', 'carol.bennett@example.com', '9876543307'),
('M099', 'Frank', 'Wood', '2023-07-22', 'frank.wood@example.com', '9876543308'),
('M100', 'Judy', 'Barnes', '2023-08-30', 'judy.barnes@example.com', '9876543309');

--  Retrieve all columns and rows from a table 
select * from Members;

-- Insert records into Loans table
INSERT INTO Loans (LoanID, BookID, MemberID, LoanDate, DueDate, ReturnDate) VALUES
('L001', 'B001', 'M001', '2022-01-10', '2022-01-20', '2022-01-18'),
('L002', 'B002', 'M002', '2022-02-12', '2022-02-22', '2022-02-20'),
('L003', 'B003', 'M003', '2022-03-15', '2022-03-25', '2022-03-23'),
('L004', 'B004', 'M004', '2022-04-18', '2022-04-28', '2022-04-26'),
('L005', 'B005', 'M005', '2022-05-20', '2022-05-30', '2022-05-28'),
('L006', 'B006', 'M006', '2022-06-25', '2022-07-05', '2022-07-03'),
('L007', 'B007', 'M007', '2022-07-30', '2022-08-09', '2022-08-07'),
('L008', 'B008', 'M008', '2022-08-12', '2022-08-22', '2022-08-20'),
('L009', 'B009', 'M009', '2022-09-01', '2022-09-11', '2022-09-09'),
('L010', 'B010', 'M010', '2022-10-22', '2022-11-01', '2022-10-30'),
('L011', 'B011', 'M011', '2022-11-15', '2022-11-25', '2022-11-23'),
('L012', 'B012', 'M012', '2022-12-05', '2022-12-15', '2022-12-13'),
('L013', 'B013', 'M013', '2023-01-12', '2023-01-22', '2023-01-20'),
('L014', 'B014', 'M014', '2023-02-28', '2023-03-10', '2023-03-08'),
('L015', 'B015', 'M015', '2023-03-25', '2023-04-04', '2023-04-02'),
('L016', 'B016', 'M016', '2023-04-10', '2023-04-20', '2023-04-18'),
('L017', 'B017', 'M017', '2023-05-18', '2023-05-28', '2023-05-26'),
('L018', 'B018', 'M018', '2023-06-14', '2023-06-24', '2023-06-22'),
('L019', 'B019', 'M019', '2023-07-09', '2023-07-19', '2023-07-17'),
('L020', 'B020', 'M020', '2023-08-22', '2023-09-01', '2023-08-30'),
('L021', 'B021', 'M021', '2022-01-10', '2022-01-20', '2022-01-18'),
('L022', 'B022', 'M022', '2022-02-11', '2022-02-21', '2022-02-19'),
('L023', 'B023', 'M023', '2022-03-15', '2022-03-25', '2022-03-23'),
('L024', 'B024', 'M024', '2022-04-18', '2022-04-28', '2022-04-26'),
('L025', 'B025', 'M025', '2022-05-20', '2022-05-30', '2022-05-28'),
('L026', 'B026', 'M026', '2022-06-10', '2022-06-20', '2022-06-18'),
('L027', 'B027', 'M027', '2022-07-15', '2022-07-25', '2022-07-23'),
('L028', 'B028', 'M028', '2022-08-22', '2022-09-01', '2022-08-30'),
('L029', 'B029', 'M029', '2022-09-25', '2022-10-05', '2022-10-03'),
('L030', 'B030', 'M030', '2022-10-30', '2022-11-09', '2022-11-07'),
('L031', 'B031', 'M031', '2022-11-22', '2022-12-02', '2022-11-30'),
('L032', 'B032', 'M032', '2022-12-30', '2023-01-09', '2023-01-07'),
('L033', 'B033', 'M033', '2023-01-10', '2023-01-20', '2023-01-18'),
('L034', 'B034', 'M034', '2023-02-20', '2023-03-02', '2023-02-28'),
('L035', 'B035', 'M035', '2023-03-15', '2023-03-25', '2023-03-23'),
('L036', 'B036', 'M036', '2023-04-25', '2023-05-05', '2023-05-03'),
('L037', 'B037', 'M037', '2023-05-30', '2023-06-09', '2023-06-07'),
('L038', 'B038', 'M038', '2023-06-22', '2023-07-02', '2023-06-30'),
('L039', 'B039', 'M039', '2023-07-11', '2023-07-21', '2023-07-19'),
('L040', 'B040', 'M040', '2023-08-10', '2023-08-20', '2023-08-18'),
('L041', 'B041', 'M041', '2022-01-12', '2022-01-22', '2022-01-20'),
('L042', 'B042', 'M042', '2022-02-15', '2022-02-25', '2022-02-23'),
('L043', 'B043', 'M043', '2022-03-18', '2022-03-28', '2022-03-26'),
('L044', 'B044', 'M044', '2022-04-20', '2022-04-30', '2022-04-28'),
('L045', 'B045', 'M045', '2022-05-25', '2022-06-04', '2022-06-02'),
('L046', 'B046', 'M046', '2022-06-30', '2022-07-10', '2022-07-08'),
('L047', 'B047', 'M047', '2022-07-18', '2022-07-28', '2022-07-26'),
('L048', 'B048', 'M048', '2022-08-20', '2022-08-30', '2022-08-28'),
('L049', 'B049', 'M049', '2022-09-25', '2022-10-05', '2022-10-03'),
('L050', 'B050', 'M050', '2022-10-30', '2022-11-09', '2022-11-07'),
('L051', 'B051', 'M051', '2022-11-12', '2022-11-22', '2022-11-20'),
('L052', 'B052', 'M052', '2022-12-10', '2022-12-20', '2022-12-18'),
('L053', 'B053', 'M053', '2023-01-22', '2023-02-01', '2023-01-30'),
('L054', 'B054', 'M054', '2023-02-18', '2023-02-28', '2023-02-26'),
('L055', 'B055', 'M055', '2023-03-20', '2023-03-30', '2023-03-28'),
('L056', 'B056', 'M056', '2023-04-22', '2023-05-02', '2023-04-30'),
('L057', 'B057', 'M057', '2023-05-15', '2023-05-25', '2023-05-23'),
('L058', 'B058', 'M058', '2023-06-12', '2023-06-22', '2023-06-20'),
('L059', 'B059', 'M059', '2023-07-20', '2023-07-30', '2023-07-28'),
('L060', 'B060', 'M060', '2023-08-15', '2023-08-25', '2023-08-23'),
('L061', 'B061', 'M061', '2022-01-11', '2022-01-21', '2022-01-19'),
('L062', 'B062', 'M062', '2022-02-20', '2022-03-02', '2022-02-28'),
('L063', 'B063', 'M063', '2022-03-15', '2022-03-25', '2022-03-23'),
('L064', 'B064', 'M064', '2022-04-22', '2022-05-02', '2022-04-30'),
('L065', 'B065', 'M065', '2022-05-18', '2022-05-28', '2022-05-26'),
('L066', 'B066', 'M066', '2022-06-25', '2022-07-05', '2022-07-03'),
('L067', 'B067', 'M067', '2022-07-12', '2022-07-22', '2022-07-20'),
('L068', 'B068', 'M068', '2022-08-10', '2022-08-20', '2022-08-18'),
('L069', 'B069', 'M069', '2022-09-22', '2022-10-02', '2022-09-30'),
('L070', 'B070', 'M070', '2022-10-30', '2022-11-09', '2022-11-07'),
('L071', 'B071', 'M071', '2022-11-18', '2022-11-28', '2022-11-26'),
('L072', 'B072', 'M072', '2022-12-20', '2022-12-30', '2022-12-28'),
('L073', 'B073', 'M073', '2023-01-15', '2023-01-25', '2023-01-23'),
('L074', 'B074', 'M074', '2023-02-25', '2023-03-07', '2023-03-05'),
('L075', 'B075', 'M075', '2023-03-22', '2023-04-01', '2023-03-30'),
('L076', 'B076', 'M076', '2023-04-12', '2023-04-22', '2023-04-20'),
('L077', 'B077', 'M077', '2023-05-30', '2023-06-09', '2023-06-07'),
('L078', 'B078', 'M078', '2023-06-25', '2023-07-05', '2023-07-03'),
('L079', 'B079', 'M079', '2023-07-20', '2023-07-30', '2023-07-28'),
('L080', 'B080', 'M080', '2023-08-18', '2023-08-28', '2023-08-26'),
('L081', 'B081', 'M081', '2022-01-20', '2022-01-30', '2022-01-28'),
('L082', 'B082', 'M082', '2022-02-25', '2022-03-07', '2022-03-05'),
('L083', 'B083', 'M083', '2022-03-30', '2022-04-09', '2022-04-07'),
('L084', 'B084', 'M084', '2022-04-22', '2022-05-02', '2022-04-30'),
('L085', 'B085', 'M085', '2022-05-15', '2022-05-25', '2022-05-23'),
('L086', 'B086', 'M086', '2022-06-25', '2022-07-05', '2022-07-03'),
('L087', 'B087', 'M087', '2022-07-18', '2022-07-28', '2022-07-26'),
('L088', 'B088', 'M088', '2022-08-10', '2022-08-20', '2022-08-18'),
('L089', 'B089', 'M089', '2022-09-25', '2022-10-05', '2022-10-03'),
('L090', 'B090', 'M090', '2022-10-30', '2022-11-09', '2022-11-07'),
('L091', 'B091', 'M091', '2022-11-10', '2022-11-20', '2022-11-18'),
('L092', 'B092', 'M092', '2022-12-05', '2022-12-15', '2022-12-13'),
('L093', 'B093', 'M093', '2023-01-25', '2023-02-04', '2023-02-02'),
('L094', 'B094', 'M094', '2023-02-28', '2023-03-10', '2023-03-08'),
('L095', 'B095', 'M095', '2023-03-22', '2023-04-01', '2023-03-30'),
('L096', 'B096', 'M096', '2023-04-30', '2023-05-10', '2023-05-08'),
('L097', 'B097', 'M097', '2023-05-15', '2023-05-25', '2023-05-23'),
('L098', 'B098', 'M098', '2023-06-20', '2023-06-30', '2023-06-28'),
('L099', 'B099', 'M099', '2023-07-22', '2023-08-01', '2023-07-30'),
('L100', 'B100', 'M100', '2023-08-30', '2023-09-09', '2023-09-07'),
('L101', 'B051', 'M001', '2022-01-10', '2022-01-20', '2022-01-18'),
('L102', 'B052', 'M002', '2022-02-12', '2022-02-22', '2022-02-20'),
('L103', 'B053', 'M003', '2022-03-15', '2022-03-25', '2022-03-23'),
('L104', 'B054', 'M004', '2022-04-18', '2022-04-28', '2022-04-26'),
('L105', 'B055', 'M005', '2022-05-20', '2022-05-30', '2022-05-28'),
('L106', 'B056', 'M006', '2022-06-25', '2022-07-05', '2022-07-03'),
('L107', 'B057', 'M007', '2022-07-30', '2022-08-09', '2022-08-07'),
('L108', 'B058', 'M008', '2022-08-12', '2022-08-22', '2022-08-20'),
('L109', 'B059', 'M009', '2022-09-01', '2022-09-11', '2022-09-09'),
('L110', 'B060', 'M010', '2022-10-22', '2022-11-01', '2022-10-30'),
('L111', 'B061', 'M011', '2022-11-15', '2022-11-25', '2022-11-23'),
('L112', 'B062', 'M012', '2022-12-05', '2022-12-15', '2022-12-13'),
('L113', 'B063', 'M013', '2023-01-12', '2023-01-22', '2023-01-20'),
('L114', 'B064', 'M014', '2023-02-28', '2023-03-10', '2023-03-08'),
('L115', 'B065', 'M015', '2023-03-25', '2023-04-04', '2023-04-02'),
('L116', 'B066', 'M016', '2023-04-10', '2023-04-20', '2023-04-18'),
('L117', 'B067', 'M017', '2023-05-18', '2023-05-28', '2023-05-26'),
('L118', 'B068', 'M018', '2023-06-14', '2023-06-24', '2023-06-22'),
('L119', 'B069', 'M019', '2023-07-09', '2023-07-19', '2023-07-17'),
('L120', 'B070', 'M020', '2023-08-22', '2023-09-01', '2023-08-30'),
('L121', 'B071', 'M021', '2022-01-10', '2022-01-20', '2022-01-18'),
('L122', 'B072', 'M022', '2022-02-11', '2022-02-21', '2022-02-19'),
('L123', 'B073', 'M023', '2022-03-15', '2022-03-25', '2022-03-23'),
('L124', 'B074', 'M024', '2022-04-18', '2022-04-28', '2022-04-26'),
('L125', 'B075', 'M025', '2022-05-20', '2022-05-30', '2022-05-28'),
('L126', 'B076', 'M026', '2022-06-10', '2022-06-20', '2022-06-18'),
('L127', 'B077', 'M027', '2022-07-15', '2022-07-25', '2022-07-23'),
('L128', 'B078', 'M028', '2022-08-22', '2022-09-01', '2022-08-30'),
('L129', 'B079', 'M029', '2022-09-25', '2022-10-05', '2022-10-03'),
('L130', 'B080', 'M030', '2022-10-30', '2022-11-09', '2022-11-07'),
('L131', 'B081', 'M031', '2022-11-22', '2022-12-02', '2022-11-30'),
('L132', 'B082', 'M032', '2022-12-30', '2023-01-09', '2023-01-07'),
('L133', 'B083', 'M033', '2023-01-10', '2023-01-20', '2023-01-18'),
('L134', 'B084', 'M034', '2023-02-20', '2023-03-02', '2023-02-28'),
('L135', 'B085', 'M035', '2023-03-15', '2023-03-25', '2023-03-23'),
('L136', 'B086', 'M036', '2023-04-25', '2023-05-05', '2023-05-03'),
('L137', 'B087', 'M037', '2023-05-30', '2023-06-09', '2023-06-07'),
('L138', 'B088', 'M038', '2023-06-22', '2023-07-02', '2023-06-30'),
('L139', 'B089', 'M039', '2023-07-11', '2023-07-21', '2023-07-19'),
('L140', 'B090', 'M040', '2023-08-10', '2023-08-20', '2023-08-18'),
('L141', 'B091', 'M041', '2022-01-12', '2022-01-22', '2022-01-20'),
('L142', 'B092', 'M042', '2022-02-15', '2022-02-23', '2022-02-22'),
('L143', 'B093', 'M043', '2022-03-18', '2022-03-28', '2022-03-26'),
('L144', 'B094', 'M044', '2022-04-20', '2022-04-30', '2022-04-28'),
('L145', 'B095', 'M045', '2022-05-25', '2022-06-04', '2022-06-02'),
('L146', 'B096', 'M046', '2022-06-30', '2022-07-10', '2022-07-08'),
('L147', 'B097', 'M047', '2022-07-18', '2022-07-28', '2022-07-26'),
('L148', 'B098', 'M048', '2022-08-20', '2022-08-30', '2022-08-28'),
('L149', 'B099', 'M049', '2022-09-25', '2022-10-05', '2022-10-03'),
('L150', 'B100', 'M050', '2022-10-30', '2022-11-09', '2022-11-07'),
('L151', 'B051', 'M051', '2022-01-10', '2022-01-20', '2022-01-25'),
('L152', 'B052', 'M052', '2022-02-12', '2022-02-22', '2022-02-28'),
('L153', 'B053', 'M053', '2022-03-15', '2022-03-25', '2022-03-30'),
('L154', 'B054', 'M054', '2022-04-18', '2022-04-28', '2022-05-03'),
('L155', 'B055', 'M055', '2022-05-20', '2022-05-30', '2022-06-04'),
('L156', 'B056', 'M056', '2022-06-25', '2022-07-05', '2022-07-10'),
('L157', 'B057', 'M057', '2022-07-30', '2022-08-09', '2022-08-15'),
('L158', 'B058', 'M058', '2022-08-12', '2022-08-22', '2022-08-28'),
('L159', 'B059', 'M059', '2022-09-01', '2022-09-11', '2022-09-17'),
('L160', 'B060', 'M060', '2022-10-22', '2022-11-01', '2022-11-07'),
('L161', 'B061', 'M061', '2022-11-15', '2022-11-25', '2022-12-01'),
('L162', 'B062', 'M062', '2022-12-05', '2022-12-15', '2022-12-21'),
('L163', 'B063', 'M063', '2023-01-12', '2023-01-22', '2023-01-27'),
('L164', 'B064', 'M064', '2023-02-28', '2023-03-10', '2023-03-15'),
('L165', 'B065', 'M065', '2023-03-25', '2023-04-04', '2023-04-10'),
('L166', 'B066', 'M066', '2023-04-10', '2023-04-20', '2023-04-25'),
('L167', 'B067', 'M067', '2023-05-18', '2023-05-28', '2023-06-02'),
('L168', 'B068', 'M068', '2023-06-14', '2023-06-24', '2023-06-29'),
('L169', 'B069', 'M069', '2023-07-09', '2023-07-19', '2023-07-24'),
('L170', 'B070', 'M070', '2023-08-22', '2023-09-01', '2023-09-06'),
('L171', 'B071', 'M071', '2024-01-05', '2024-01-15', '2024-01-15'),
('L172', 'B072', 'M072', '2024-01-10', '2024-01-20', '2024-01-20'),
('L173', 'B073', 'M073', '2024-02-12', '2024-02-22', '2024-02-22'),
('L174', 'B074', 'M074', '2024-02-15', '2024-02-25', '2024-02-25'),
('L175', 'B075', 'M075', '2024-03-18', '2024-03-28', '2024-03-28'),
('L176', 'B076', 'M076', '2024-03-22', '2024-04-01', '2024-04-01'),
('L177', 'B077', 'M077', '2024-04-05', '2024-04-15', '2024-04-15'),
('L178', 'B078', 'M078', '2024-04-10', '2024-04-20', '2024-04-20'),
('L179', 'B079', 'M079', '2024-05-12', '2024-05-22', '2024-05-22'),
('L180', 'B080', 'M080', '2024-05-15', '2024-05-25', '2024-05-25'),
('L181', 'B081', 'M081', '2024-01-20', '2024-01-30', '2024-01-30'),
('L182', 'B082', 'M082', '2024-02-25', '2024-03-06', '2024-03-06'),
('L183', 'B083', 'M083', '2024-03-30', '2024-04-09', '2024-04-09'),
('L184', 'B084', 'M084', '2024-04-22', '2024-05-02', '2024-05-02'),
('L185', 'B085', 'M085', '2024-05-15', '2024-05-25', '2024-05-25'),
('L186', 'B086', 'M086', '2024-01-25', '2024-02-04', '2024-02-04'),
('L187', 'B087', 'M087', '2024-02-28', '2024-03-09', '2024-03-09'),
('L188', 'B088', 'M088', '2024-03-15', '2024-03-25', '2024-03-25'),
('L189', 'B089', 'M089', '2024-04-20', '2024-04-30', '2024-04-30'),
('L190', 'B090', 'M090', '2024-05-25', '2024-06-04', '2024-06-04'),
('L191', 'B091', 'M091', '2024-01-12', '2024-01-22', '2024-01-22'),
('L192', 'B092', 'M092', '2024-02-15', '2024-02-25', '2024-02-25'),
('L193', 'B093', 'M093', '2024-03-18', '2024-03-28', '2024-03-28'),
('L194', 'B094', 'M094', '2024-04-10', '2024-04-20', '2024-04-20'),
('L195', 'B095', 'M095', '2024-05-18', '2024-05-28', '2024-05-28'),
('L196', 'B096', 'M096', '2024-01-20', '2024-01-30', '2024-01-30'),
('L197', 'B097', 'M097', '2024-02-22', '2024-03-03', '2024-03-03'),
('L198', 'B098', 'M098', '2024-03-30', '2024-04-09', '2024-04-09'),
('L199', 'B099', 'M099', '2024-04-22', '2024-05-02', '2024-05-02'),
('L200', 'B100', 'M100', '2024-05-25', '2024-06-04', '2024-06-04');

--  Retrieve all columns and rows from a table 
select * from Loans;

-- Insert records into Reviews table
INSERT INTO Reviews (ReviewID, BookID, MemberID, Rating, ReviewText, ReviewDate) VALUES
('R001', 'B001', 'M001', 4, 'Great book, highly recommended!', '2022-01-10'),
('R002', 'B002', 'M002', 5, 'Fantastic read, couldnot put it down!', '2022-02-12'),
('R003', 'B003', 'M003', 3, 'Interesting plot, but pacing was slow.', '2022-03-15'),
('R004', 'B004', 'M004', 4, 'Well-written and engaging.', '2022-04-18'),
('R005', 'B005', 'M005', 5, 'One of the best books I have read!', '2022-05-20'),
('R006', 'B006', 'M006', 3, 'Average book, nothing special.', '2022-06-25'),
('R007', 'B007', 'M007', 4, 'Enjoyed it overall, but ending was predictable.', '2022-07-30'),
('R008', 'B008', 'M008', 5, 'A masterpiece!', '2022-08-12'),
('R009', 'B009', 'M009', 4, 'Highly recommend for fans of the genre.', '2022-09-01'),
('R010', 'B010', 'M010', 3, 'Decent read, but not memorable.', '2022-10-22'),
('R011', 'B011', 'M011', 4, 'Captivating storyline, kept me hooked until the end.', '2022-11-15'),
('R012', 'B012', 'M012', 5, 'Brilliantly written, couldnot ask for more.', '2022-12-05'),
('R013', 'B013', 'M013', 4, 'Thoroughly enjoyed it!', '2023-01-12'),
('R014', 'B014', 'M014', 5, 'Must-read for everyone!', '2023-02-28'),
('R015', 'B015', 'M015', 3, 'Mixed feelings about this one.', '2023-03-25'),
('R016', 'B016', 'M016', 4, 'Entertaining and thought-provoking.', '2023-04-10'),
('R017', 'B017', 'M017', 5, 'Changed my perspective on life.', '2023-05-18'),
('R018', 'B018', 'M018', 4, 'Solid book, would recommend to friends.', '2023-06-14'),
('R019', 'B019', 'M019', 5, 'Couldnot stop reading until the end!', '2023-07-09'),
('R020', 'B020', 'M020', 3, 'Started strong but lost momentum.', '2023-08-22'),
('R021', 'B021', 'M021', 4, 'Well-developed characters and intriguing plot.', '2023-09-11'),
('R022', 'B022', 'M022', 5, 'Outstanding storytelling!', '2023-10-30'),
('R023', 'B023', 'M023', 4, 'Kept me guessing until the last page.', '2023-11-22'),
('R024', 'B024', 'M024', 5, 'An emotional rollercoaster.', '2023-12-30'),
('R025', 'B025', 'M025', 4, 'Well worth the read.', '2024-01-12'),
('R026', 'B026', 'M026', 5, 'Couldnot have asked for a better book!', '2024-02-15'),
('R027', 'B027', 'M027', 3, 'Interesting concept but execution fell short.', '2024-03-18'),
('R028', 'B028', 'M028', 4, 'Engrossing plot and well-developed characters.', '2024-04-10'),
('R029', 'B029', 'M029', 5, 'Absolutely breathtaking!', '2024-05-18'),
('R030', 'B030', 'M030', 4, 'Kept me on the edge of my seat!', '2024-06-22'),
('R031', 'B031', 'M031', 5, 'A literary gem.', '2024-07-15'),
('R032', 'B032', 'M032', 3, 'Didnot live up to the hype.', '2024-08-22'),
('R033', 'B033', 'M033', 4, 'Good read, but a bit too long.', '2024-09-10'),
('R034', 'B034', 'M034', 5, 'Amazing book, highly recommend!', '2024-10-05'),
('R035', 'B035', 'M035', 3, 'Not bad, but not great either.', '2024-11-15'),
('R036', 'B036', 'M036', 4, 'Well-written, kept me engaged.', '2024-12-01'),
('R037', 'B037', 'M037', 5, 'One of my favorite books!', '2024-01-18'),
('R038', 'B038', 'M038', 3, 'Interesting, but had some flaws.', '2024-02-12'),
('R039', 'B039', 'M039', 4, 'Great book with a unique story.', '2024-03-05'),
('R040', 'B040', 'M040', 5, 'A must-read for everyone.', '2024-04-20'),
('R041', 'B041', 'M041', 4, 'Really enjoyed this book.', '2024-05-10'),
('R042', 'B042', 'M042', 3, 'Average, not very memorable.', '2024-06-15'),
('R043', 'B043', 'M043', 5, 'Absolutely loved it!', '2024-07-22'),
('R044', 'B044', 'M044', 4, 'Very good, would recommend.', '2024-08-10'),
('R045', 'B045', 'M045', 3, 'It was okay, not great.', '2024-09-05'),
('R046', 'B046', 'M046', 5, 'Fantastic book, very engaging.', '2024-10-12'),
('R047', 'B047', 'M047', 4, 'Enjoyed it, well worth the read.', '2024-11-18'),
('R048', 'B048', 'M048', 3, 'Good book, but could be better.', '2024-12-10'),
('R049', 'B049', 'M049', 5, 'Exceptional book, highly recommend!', '2024-01-22'),
('R050', 'B050', 'M050', 4, 'Really good, kept me interested.', '2024-02-15'),
('R051', 'B051', 'M051', 3, 'Not bad, but had some issues.', '2024-03-20'),
('R052', 'B052', 'M052', 5, 'Loved every page of it.', '2024-04-18'),
('R053', 'B053', 'M053', 4, 'Well-written and interesting.', '2024-05-22'),
('R054', 'B054', 'M054', 3, 'It was okay, nothing special.', '2024-06-25'),
('R055', 'B055', 'M055', 5, 'One of the best books I have read.', '2024-07-10'),
('R056', 'B056', 'M056', 4, 'Good read, kept me engaged.', '2024-08-12'),
('R057', 'B057', 'M057', 3, 'Interesting, but not great.', '2024-09-15'),
('R058', 'B058', 'M058', 5, 'Fantastic, would read again.', '2024-10-18'),
('R059', 'B059', 'M059', 4, 'Very enjoyable book.', '2024-11-12'),
('R060', 'B060', 'M060', 3, 'Not bad, but not great.', '2024-12-20'),
('R061', 'B061', 'M061', 5, 'An absolute masterpiece.', '2024-01-18'),
('R062', 'B062', 'M062', 4, 'Enjoyed it a lot.', '2024-02-20'),
('R063', 'B063', 'M063', 3, 'It was decent, but not great.', '2024-03-12'),
('R064', 'B064', 'M064', 5, 'Outstanding book.', '2024-04-15'),
('R065', 'B065', 'M065', 4, 'Really liked it.', '2024-05-10'),
('R066', 'B066', 'M066', 3, 'It was okay, nothing special.', '2024-06-20'),
('R067', 'B067', 'M067', 5, 'Loved this book.', '2024-07-22'),
('R068', 'B068', 'M068', 4, 'Great read.', '2024-08-12'),
('R069', 'B069', 'M069', 3, 'Not bad, but not great.', '2024-09-20'),
('R070', 'B070', 'M070', 5, 'One of the best books I have read.', '2024-10-25'),
('R071', 'B071', 'M071', 4, 'Well-written and engaging.', '2024-11-10'),
('R072', 'B072', 'M072', 3, 'Interesting, but had some flaws.', '2024-12-15'),
('R073', 'B073', 'M073', 5, 'Amazing book.', '2024-01-25'),
('R074', 'B074', 'M074', 4, 'Good read, kept me interested.', '2024-02-20'),
('R075', 'B075', 'M075', 3, 'It was okay, nothing special.', '2024-03-12'),
('R076', 'B076', 'M076', 5, 'Fantastic read.', '2024-04-18'),
('R077', 'B077', 'M077', 4, 'Enjoyed it.', '2024-05-20'),
('R078', 'B078', 'M078', 3, 'Decent, but not great.', '2024-06-22'),
('R079', 'B079', 'M079', 5, 'Loved it.', '2024-07-10'),
('R080', 'B080', 'M080', 4, 'Very good book.', '2024-08-12'),
('R081', 'B081', 'M081', 3, 'Not bad, but not great.', '2024-09-18'),
('R082', 'B082', 'M082', 5, 'Outstanding.', '2024-10-25'),
('R083', 'B083', 'M083', 4, 'Well-written.', '2024-11-10'),
('R084', 'B084', 'M084', 3, 'Interesting, but not great.', '2024-12-20'),
('R085', 'B085', 'M085', 5, 'Amazing.', '2024-01-10'),
('R086', 'B086', 'M086', 4, 'Enjoyed it a lot.', '2024-02-22'),
('R087', 'B087', 'M087', 3, 'It was okay.', '2024-03-18'),
('R088', 'B088', 'M088', 5, 'Fantastic.', '2024-04-10'),
('R089', 'B089', 'M089', 4, 'Good read.', '2024-05-20'),
('R090', 'B090', 'M090', 3, 'Not bad.', '2024-06-18'),
('R091', 'B091', 'M091', 5, 'Loved this book.', '2024-07-12'),
('R092', 'B092', 'M092', 4, 'Great read.', '2024-08-22'),
('R093', 'B093', 'M093', 3, 'It was decent.', '2024-09-18'),
('R094', 'B094', 'M094', 5, 'Amazing.', '2024-10-15'),
('R095', 'B095', 'M095', 4, 'Enjoyed it.', '2024-11-10'),
('R096', 'B096', 'M096', 3, 'It was okay.', '2024-12-10'),
('R097', 'B097', 'M097', 5, 'Fantastic book.', '2024-01-20'),
('R098', 'B098', 'M098', 4, 'Very good.', '2024-02-10'),
('R099', 'B099', 'M099', 3, 'Not bad.', '2024-03-18'),
('R100', 'B100', 'M100', 5, 'Loved it.', '2024-04-10'),
('R101', 'B050', 'M001', 4, 'A gripping tale!', '2023-01-05'),
('R102', 'B015', 'M008', 5, 'Absolutely fantastic!', '2023-02-14'),
('R103', 'B025', 'M015', 3, 'Could have been better.', '2023-03-25'),
('R104', 'B045', 'M030', 4, 'Engaging and well-paced.', '2023-04-15'),
('R105', 'B020', 'M023', 5, 'A must-read!', '2023-05-30'),
('R106', 'B060', 'M050', 3, 'Not quite what I expected.', '2023-06-10'),
('R107', 'B035', 'M012', 4, 'Really enjoyed this one.', '2023-07-18'),
('R108', 'B010', 'M045', 5, 'Simply brilliant.', '2023-08-25'),
('R109', 'B070', 'M022', 4, 'A compelling story.', '2023-09-15'),
('R110', 'B080', 'M035', 3, 'It was okay.', '2023-10-10'),
('R111', 'B040', 'M040', 5, 'An exceptional book!', '2023-11-22'),
('R112', 'B055', 'M020', 4, 'Quite enjoyable.', '2023-12-18'),
('R113', 'B090', 'M008', 3, 'Not too memorable.', '2024-01-10'),
('R114', 'B100', 'M060', 5, 'Loved every bit of it!', '2024-02-15'),
('R115', 'B085', 'M055', 4, 'Really good.', '2024-03-20'),
('R116', 'B075', 'M038', 3, 'Just average.', '2024-04-18'),
('R117', 'B065', 'M027', 5, 'An unforgettable read.', '2024-05-12'),
('R118', 'B050', 'M010', 4, 'A solid book.', '2024-06-14'),
('R119', 'B025', 'M003', 3, 'Not bad, not great.', '2024-07-22'),
('R120', 'B015', 'M065', 5, 'Fantastic storytelling.', '2024-08-05'),
('R121', 'B005', 'M018', 4, 'Very engaging.', '2024-09-10'),
('R122', 'B030', 'M023', 3, 'Just okay.', '2024-10-12'),
('R123', 'B020', 'M045', 5, 'Absolutely loved it.', '2024-11-20'),
('R124', 'B045', 'M033', 4, 'Quite good.', '2024-12-01'),
('R125', 'B080', 'M040', 3, 'Decent but not great.', '2024-01-10'),
('R126', 'B055', 'M050', 5, 'Exceptional writing.', '2024-02-12'),
('R127', 'B010', 'M022', 4, 'Enjoyable read.', '2024-03-15'),
('R128', 'B065', 'M012', 3, 'Could be better.', '2024-04-20'),
('R129', 'B100', 'M030', 5, 'Best book ever.', '2024-05-30'),
('R130', 'B090', 'M008', 4, 'Well worth reading.', '2024-06-18'),
('R131', 'B085', 'M038', 3, 'Not my cup of tea.', '2024-07-10'),
('R132', 'B035', 'M050', 5, 'Outstanding!', '2024-08-12'),
('R133', 'B040', 'M015', 4, 'Pretty good.', '2024-09-20'),
('R134', 'B025', 'M018', 3, 'Average read.', '2024-10-25'),
('R135', 'B045', 'M003', 5, 'A must-read for all.', '2024-11-10'),
('R136', 'B030', 'M027', 4, 'Very interesting.', '2024-12-05'),
('R137', 'B005', 'M055', 3, 'Not very engaging.', '2025-01-20'),
('R138', 'B075', 'M060', 5, 'Fantastic book.', '2025-02-15'),
('R139', 'B065', 'M045', 4, 'Enjoyed it thoroughly.', '2025-03-18'),
('R140', 'B020', 'M010', 3, 'Just average.', '2025-04-12'),
('R141', 'B010', 'M033', 5, 'Absolutely loved it.', '2025-05-20'),
('R142', 'B015', 'M040', 4, 'A good read.', '2025-06-18'),
('R143', 'B085', 'M027', 3, 'Not bad, not great.', '2025-07-10'),
('R144', 'B090', 'M022', 5, 'Brilliant book.', '2025-08-15'),
('R145', 'B050', 'M008', 4, 'Quite enjoyable.', '2025-09-10'),
('R146', 'B005', 'M018', 3, 'Average.', '2025-10-12'),
('R147', 'B075', 'M012', 5, 'Loved it!', '2025-11-20'),
('R148', 'B055', 'M030', 4, 'Very engaging.', '2025-12-01'),
('R149', 'B100', 'M050', 3, 'Decent read.', '2026-01-10'),
('R150', 'B045', 'M038', 5, 'Outstanding book.', '2026-02-15');

-- Update the Rating column
UPDATE Reviews SET rating = 4.4 WHERE ReviewID='R148';
UPDATE Reviews SET rating = 4.6 WHERE ReviewID='R145';
UPDATE Reviews SET rating = 4.3 WHERE ReviewID='R115';
UPDATE Reviews SET rating = 4.4 WHERE ReviewID='R148';
UPDATE Reviews SET rating = 4.5 WHERE ReviewID='R103';
UPDATE Reviews SET rating = 4.8 WHERE ReviewID='R48';
UPDATE Reviews SET rating = 4.1 WHERE ReviewID='R001';
UPDATE Reviews SET rating = 4.9 WHERE ReviewID='R002';
UPDATE Reviews SET rating = 4.2 WHERE ReviewID='R003';
UPDATE Reviews SET rating = 4.7 WHERE ReviewID='R004';
UPDATE Reviews SET rating = 4.0 WHERE ReviewID='R005';
UPDATE Reviews SET rating = 4.8 WHERE ReviewID='R006';
UPDATE Reviews SET rating = 3.4 WHERE ReviewID='R007';
UPDATE Reviews SET rating = 3.6 WHERE ReviewID='R008';
UPDATE Reviews SET rating = 3.3 WHERE ReviewID='R009';
UPDATE Reviews SET rating = 3.4 WHERE ReviewID='R010';
UPDATE Reviews SET rating = 3.5 WHERE ReviewID='R011';
UPDATE Reviews SET rating = 3.8 WHERE ReviewID='R012';
UPDATE Reviews SET rating = 3.1 WHERE ReviewID='R013';
UPDATE Reviews SET rating = 3.9 WHERE ReviewID='R014';
UPDATE Reviews SET rating = 3.2 WHERE ReviewID='R015';
UPDATE Reviews SET rating = 3.7 WHERE ReviewID='R016';
UPDATE Reviews SET rating = 3.3 WHERE ReviewID='R017';
UPDATE Reviews SET rating = 3.8 WHERE ReviewID='R018';
UPDATE Reviews SET rating = 4.4 WHERE ReviewID='R019';
UPDATE Reviews SET rating = 4.6 WHERE ReviewID='R020';
UPDATE Reviews SET rating = 4.3 WHERE ReviewID='R021';
UPDATE Reviews SET rating = 4.4 WHERE ReviewID='R022';
UPDATE Reviews SET rating = 4.5 WHERE ReviewID='R023';
UPDATE Reviews SET rating = 4.8 WHERE ReviewID='R024';
UPDATE Reviews SET rating = 4.1 WHERE ReviewID='R025';
UPDATE Reviews SET rating = 4.9 WHERE ReviewID='R026';
UPDATE Reviews SET rating = 4.2 WHERE ReviewID='R027';
UPDATE Reviews SET rating = 4.7 WHERE ReviewID='R028';
UPDATE Reviews SET rating = 4.0 WHERE ReviewID='R029';
UPDATE Reviews SET rating = 4.8 WHERE ReviewID='R030';
UPDATE Reviews SET rating = 3.4 WHERE ReviewID='R301';
UPDATE Reviews SET rating = 3.6 WHERE ReviewID='R032';
UPDATE Reviews SET rating = 3.3 WHERE ReviewID='R033';
UPDATE Reviews SET rating = 3.4 WHERE ReviewID='R034';
UPDATE Reviews SET rating = 3.5 WHERE ReviewID='R035';
UPDATE Reviews SET rating = 3.8 WHERE ReviewID='R036';
UPDATE Reviews SET rating = 3.1 WHERE ReviewID='R037';
UPDATE Reviews SET rating = 3.9 WHERE ReviewID='R038';
UPDATE Reviews SET rating = 3.2 WHERE ReviewID='R039';
UPDATE Reviews SET rating = 3.7 WHERE ReviewID='R040';
UPDATE Reviews SET rating = 3.3 WHERE ReviewID='R041';
UPDATE Reviews SET rating = 3.8 WHERE ReviewID='R042';
UPDATE Reviews SET rating = 4.4 WHERE ReviewID='R043';
UPDATE Reviews SET rating = 4.6 WHERE ReviewID='R044';
UPDATE Reviews SET rating = 4.3 WHERE ReviewID='R045';
UPDATE Reviews SET rating = 4.4 WHERE ReviewID='R046';
UPDATE Reviews SET rating = 4.5 WHERE ReviewID='R047';
UPDATE Reviews SET rating = 4.8 WHERE ReviewID='R048';
UPDATE Reviews SET rating = 4.1 WHERE ReviewID='R049';
UPDATE Reviews SET rating = 4.9 WHERE ReviewID='R050';
UPDATE Reviews SET rating = 4.2 WHERE ReviewID='R051';
UPDATE Reviews SET rating = 4.7 WHERE ReviewID='R052';
UPDATE Reviews SET rating = 4.0 WHERE ReviewID='R053';
UPDATE Reviews SET rating = 5.0 WHERE ReviewID='R054';
UPDATE Reviews SET rating = 3.4 WHERE ReviewID='R055';
UPDATE Reviews SET rating = 3.6 WHERE ReviewID='R056';
UPDATE Reviews SET rating = 3.3 WHERE ReviewID='R057';
UPDATE Reviews SET rating = 3.4 WHERE ReviewID='R058';
UPDATE Reviews SET rating = 3.5 WHERE ReviewID='R059';
UPDATE Reviews SET rating = 3.8 WHERE ReviewID='R060';
UPDATE Reviews SET rating = 3.1 WHERE ReviewID='R061';
UPDATE Reviews SET rating = 3.9 WHERE ReviewID='R062';
UPDATE Reviews SET rating = 3.2 WHERE ReviewID='R063';
UPDATE Reviews SET rating = 3.7 WHERE ReviewID='R064';
UPDATE Reviews SET rating = 3.2 WHERE ReviewID='R065';
UPDATE Reviews SET rating = 5.0 WHERE ReviewID='R066';
UPDATE Reviews SET rating = 4.4 WHERE ReviewID='R067';
UPDATE Reviews SET rating = 4.6 WHERE ReviewID='R068';
UPDATE Reviews SET rating = 4.3 WHERE ReviewID='R069';
UPDATE Reviews SET rating = 4.4 WHERE ReviewID='R070';
UPDATE Reviews SET rating = 4.5 WHERE ReviewID='R071';
UPDATE Reviews SET rating = 4.8 WHERE ReviewID='R072';
UPDATE Reviews SET rating = 4.1 WHERE ReviewID='R073';
UPDATE Reviews SET rating = 4.9 WHERE ReviewID='R074';
UPDATE Reviews SET rating = 4.2 WHERE ReviewID='R075';
UPDATE Reviews SET rating = 4.7 WHERE ReviewID='R076';
UPDATE Reviews SET rating = 4.0 WHERE ReviewID='R077';
UPDATE Reviews SET rating = 5.0 WHERE ReviewID='R078';
UPDATE Reviews SET rating = 3.4 WHERE ReviewID='R079';
UPDATE Reviews SET rating = 3.6 WHERE ReviewID='R080';
UPDATE Reviews SET rating = 3.3 WHERE ReviewID='R081';
UPDATE Reviews SET rating = 3.4 WHERE ReviewID='R082';
UPDATE Reviews SET rating = 3.5 WHERE ReviewID='R083';
UPDATE Reviews SET rating = 5.0 WHERE ReviewID='R084';
UPDATE Reviews SET rating = 3.1 WHERE ReviewID='R085';
UPDATE Reviews SET rating = 3.9 WHERE ReviewID='R086';
UPDATE Reviews SET rating = 3.2 WHERE ReviewID='R087';
UPDATE Reviews SET rating = 3.7 WHERE ReviewID='R088';
UPDATE Reviews SET rating = 3.0 WHERE ReviewID='R089';
UPDATE Reviews SET rating = 5.0 WHERE ReviewID='R090';
UPDATE Reviews SET rating = 4.1 WHERE ReviewID='R091';
UPDATE Reviews SET rating = 4.9 WHERE ReviewID='R092';
UPDATE Reviews SET rating = 4.2 WHERE ReviewID='R093';
UPDATE Reviews SET rating = 4.7 WHERE ReviewID='R094';
UPDATE Reviews SET rating = 4.0 WHERE ReviewID='R095';
UPDATE Reviews SET rating = 4.8 WHERE ReviewID='R096';
UPDATE Reviews SET rating = 3.4 WHERE ReviewID='R097';
UPDATE Reviews SET rating = 3.6 WHERE ReviewID='R098';
UPDATE Reviews SET rating = 3.3 WHERE ReviewID='R099';
UPDATE Reviews SET rating = 3.4 WHERE ReviewID='R100';
UPDATE Reviews SET rating = 4.1 WHERE ReviewID='R101';
UPDATE Reviews SET rating = 4.9 WHERE ReviewID='R102';
UPDATE Reviews SET rating = 4.2 WHERE ReviewID='R103';
UPDATE Reviews SET rating = 4.7 WHERE ReviewID='R104';
UPDATE Reviews SET rating = 4.0 WHERE ReviewID='R105';
UPDATE Reviews SET rating = 4.8 WHERE ReviewID='R106';
UPDATE Reviews SET rating = 3.4 WHERE ReviewID='R107';
UPDATE Reviews SET rating = 3.6 WHERE ReviewID='R108';
UPDATE Reviews SET rating = 3.3 WHERE ReviewID='R109';
UPDATE Reviews SET rating = 3.4 WHERE ReviewID='R110';
UPDATE Reviews SET rating = 3.5 WHERE ReviewID='R111';
UPDATE Reviews SET rating = 3.8 WHERE ReviewID='R112';
UPDATE Reviews SET rating = 3.1 WHERE ReviewID='R113';
UPDATE Reviews SET rating = 3.9 WHERE ReviewID='R114';
UPDATE Reviews SET rating = 3.2 WHERE ReviewID='R115';
UPDATE Reviews SET rating = 3.7 WHERE ReviewID='R116';
UPDATE Reviews SET rating = 3.0 WHERE ReviewID='R117';
UPDATE Reviews SET rating = 3.8 WHERE ReviewID='R118';
UPDATE Reviews SET rating = 4.4 WHERE ReviewID='R119';
UPDATE Reviews SET rating = 4.6 WHERE ReviewID='R120';
UPDATE Reviews SET rating = 4.3 WHERE ReviewID='R121';
UPDATE Reviews SET rating = 4.4 WHERE ReviewID='R122';
UPDATE Reviews SET rating = 4.5 WHERE ReviewID='R123';
UPDATE Reviews SET rating = 4.8 WHERE ReviewID='R124';
UPDATE Reviews SET rating = 4.1 WHERE ReviewID='R125';
UPDATE Reviews SET rating = 4.9 WHERE ReviewID='R126';
UPDATE Reviews SET rating = 4.2 WHERE ReviewID='R127';
UPDATE Reviews SET rating = 4.7 WHERE ReviewID='R128';
UPDATE Reviews SET rating = 4.0 WHERE ReviewID='R129';
UPDATE Reviews SET rating = 4.8 WHERE ReviewID='R130';
UPDATE Reviews SET rating = 3.4 WHERE ReviewID='R131';
UPDATE Reviews SET rating = 3.6 WHERE ReviewID='R132';
UPDATE Reviews SET rating = 3.3 WHERE ReviewID='R133';
UPDATE Reviews SET rating = 3.4 WHERE ReviewID='R134';
UPDATE Reviews SET rating = 3.5 WHERE ReviewID='R135';
UPDATE Reviews SET rating = 3.8 WHERE ReviewID='R136';
UPDATE Reviews SET rating = 3.1 WHERE ReviewID='R137';
UPDATE Reviews SET rating = 3.9 WHERE ReviewID='R138';
UPDATE Reviews SET rating = 3.2 WHERE ReviewID='R139';
UPDATE Reviews SET rating = 3.7 WHERE ReviewID='R140';
UPDATE Reviews SET rating = 3.0 WHERE ReviewID='R141';
UPDATE Reviews SET rating = 3.8 WHERE ReviewID='R142';
UPDATE Reviews SET rating = 4.4 WHERE ReviewID='R143';
UPDATE Reviews SET rating = 4.6 WHERE ReviewID='R144';
UPDATE Reviews SET rating = 4.3 WHERE ReviewID='R145';
UPDATE Reviews SET rating = 4.4 WHERE ReviewID='R146';
UPDATE Reviews SET rating = 4.5 WHERE ReviewID='R147';
UPDATE Reviews SET rating = 4.8 WHERE ReviewID='R148';
UPDATE Reviews SET rating = 4.1 WHERE ReviewID='R149';
UPDATE Reviews SET rating = 4.9 WHERE ReviewID='R150';

--  Retrieve all columns and rows from a table 
select * from Reviews;













