

CREATE TABLE Student (
    UserID INT PRIMARY KEY,
    Name VARCHAR(100),
    MatricNo VARCHAR(50),
    Phone VARCHAR(15),
    Email VARCHAR(100),
    Password VARCHAR(255)
);

describe student;

CREATE TABLE Book (
    ISBN VARCHAR(20) PRIMARY KEY,
    Title VARCHAR(255) UNIQUE,
    CoverImage VARCHAR(255),
    StockAmount INT
);

describe book;

CREATE TABLE BookTags (
    Title VARCHAR(255),
    Tag VARCHAR(100),
    PRIMARY KEY (Title, Tag),
    FOREIGN KEY (Title) REFERENCES Book(Title)
);

describe booktags;

CREATE TABLE BorrowedBook (
    BorrowID INT PRIMARY KEY,
    UserID INT,
    ISBN VARCHAR(20),
    BorrowDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (UserID) REFERENCES Student(UserID),
    FOREIGN KEY (ISBN) REFERENCES Book(ISBN)
);

describe borrowedbook;

CREATE TABLE Fine (
    BorrowID INT PRIMARY KEY,
    FineAmount DECIMAL(10, 2),
    FOREIGN KEY (BorrowID) REFERENCES BorrowedBook(BorrowID)
);

describe fine;

CREATE TABLE Admin (
    UserID INT PRIMARY KEY,
    Name VARCHAR(100),
    Phone VARCHAR(15),
    Email VARCHAR(100),
    Password VARCHAR(255)
);

describe admin;

CREATE TABLE Staff (
    UserID INT PRIMARY KEY,
    Phone VARCHAR(15),
    Email VARCHAR(100),
    Password VARCHAR(255)
);

describe staff; 

CREATE TABLE Application (
    ApplicationID INT PRIMARY KEY,
    UserID INT,
    ISBN VARCHAR(20),
    Status VARCHAR(50),
    FOREIGN KEY (UserID) REFERENCES Student(UserID),
    FOREIGN KEY (ISBN) REFERENCES Book(ISBN)
);

describe application;

CREATE TABLE ErrorReport (
    ReportID INT PRIMARY KEY,
    UserID INT,
    ReportDate DATE,
    Description TEXT,
    Status VARCHAR(50),
    FOREIGN KEY (UserID) REFERENCES Student(UserID)
);

describe errorreport;

INSERT INTO Student VALUES
     (1, 'Winston Smith', 'M101', '1234567890', 'winston.smith@airstripone.com', 'doublethink'),
     (2, 'Guy Montag', 'M102', '2345678901', 'guy.montag@fahrenheit451.com', 'bookburner'),
     (3, 'Holden Caulfield', 'M103', '3456789012', 'holden.caulfield@catcher.com', 'phonyhunter'),
     (4, 'Elizabeth Bennet', 'M104', '4567890123', 'liz.bennet@prideprejudice.com', 'darcylover'),
     (5, 'Atticus Finch', 'M105', '5678901234', 'atticus.finch@mockingbird.com', 'justiceforall'),
     (6, 'Ishmael', 'M106', '6789012345', 'ishmael@whale.com', 'callme'),
     (7, 'Jane Eyre', 'M107', '7890123456', 'jane.eyre@thornfield.com', 'rochester'),
     (8, 'Heathcliff', 'M108', '8901234567', 'heathcliff@wutheringheights.com', 'stormylove'),
     (9, 'Bernard Marx', 'M109', '9012345678', 'bernard.marx@bravenewworld.com', 'soma'),
     (10, 'Nick Carraway', 'M110', '0123456789', 'nick.carraway@gatsby.com', 'greenlight'),
     (11, 'Tom Joad', 'M111', '1111222233', 'tom.joad@grapeswrath.com', 'justicejourney'),
     (12, 'Daisy Buchanan', 'M112', '2223334444', 'daisy.buchanan@gatsby.com', 'tragiclove'),
     (13, 'Jean Valjean', 'M113', '3334445555', 'jean.valjean@lesmis.com', '24601'),
     (14, 'Anna Karenina', 'M114', '4445556666', 'anna.karenina@train.com', 'romantictragedy'),
     (15, 'Sherlock Holmes', 'M115', '5556667777', 'sherlock.holmes@bakerstreet.com', 'elementary'),
     (16, 'Watson', 'M116', '6667778888', 'watson@bakerstreet.com', 'faithful'),
     (17, 'Jay Gatsby', 'M117', '7778889999', 'jay.gatsby@westegg.com', 'dreamer'),
     (18, 'Hester Prynne', 'M118', '8889990000', 'hester.prynne@scarletletter.com', 'redemption'),
     (19, 'Scout Finch', 'M119', '9990001111', 'scout.finch@mockingbird.com', 'childperspective'),
     (20, 'Clarisse McClellan', 'M120', '0001112222', 'clarisse.mcclellan@fahrenheit451.com', 'curiosity');


select *
 from student;

 INSERT INTO Book VALUES
     ('978-0-452-28423-4', '1984', '1984_cover.jpg', 20),
     ('978-0-7432-7356-6', 'Fahrenheit 451', 'fahrenheit_cover.jpg', 15),
     ('978-0-452-28424-1', 'The Catcher in the Rye', 'catcher_cover.jpg', 18),
     ('978-0-375-70611-4', 'Pride and Prejudice', 'pride_cover.jpg', 12),
     ('978-0-06-112008-4', 'Brave New World', 'brave_cover.jpg', 14),
     ('978-0-7432-7356-5', 'To Kill a Mockingbird', 'mockingbird_cover.jpg', 10),
     ('978-0-312-42708-4', 'Moby-Dick', 'mobydick_cover.jpg', 8),
     ('978-0-452-28425-8', 'Jane Eyre', 'janeeyre_cover.jpg', 13),
     ('978-0-141-03613-4', 'Wuthering Heights', 'wuthering_cover.jpg', 9),
     ('978-0-452-28426-5', 'The Great Gatsby', 'gatsby_cover.jpg', 16),
     ('978-0-14-143951-8', 'Animal Farm', 'animalfarm_cover.jpg', 11),
     ('978-0-452-28427-2', 'Crime and Punishment', 'crimepunishment_cover.jpg', 7),
     ('978-0-452-28428-9', 'War and Peace', 'warpeace_cover.jpg', 6),
     ('978-0-14-044926-6', 'Les Misérables', 'lesmis_cover.jpg', 5),
     ('978-0-06-093546-7', 'The Road', 'road_cover.jpg', 4),
     ('978-1-5011-2637-0', 'The Alchemist', 'alchemist_cover.jpg', 3),
     ('978-0-452-28429-6', 'A Tale of Two Cities', 'taleoftwocities_cover.jpg', 8),
     ('978-0-452-28430-2', 'The Odyssey', 'odyssey_cover.jpg', 10),
     ('978-0-452-28431-9', 'Meditations', 'meditations_cover.jpg', 9),
     ('978-0-452-28432-6', 'The Divine Comedy', 'divinecomedy_cover.jpg', 6);

select *
 from Book;

 INSERT INTO BookTags VALUES
     ('1984', 'Dystopian'),
     ('Fahrenheit 451', 'Dystopian'),
     ('The Catcher in the Rye', 'Classic'),
     ('Pride and Prejudice', 'Romance'),
     ('Brave New World', 'Science Fiction'),
     ('To Kill a Mockingbird', 'Drama'),
     ('Moby-Dick', 'Adventure'),
     ('Jane Eyre', 'Classic'),
     ('Wuthering Heights', 'Romance'),
     ('The Great Gatsby', 'Classic'),
     ('Animal Farm', 'Satire'),
     ('Crime and Punishment', 'Drama'),
     ('War and Peace', 'Historical'),
     ('Les Misérables', 'Tragedy'),
     ('The Road', 'Post-Apocalyptic'),
     ('The Alchemist', 'Philosophy'),
     ('A Tale of Two Cities', 'Historical'),
     ('The Odyssey', 'Epic'),
     ('Meditations', 'Philosophy'),
     ('The Divine Comedy', 'Epic');

 select *
     from BookTags;


INSERT INTO BorrowedBook VALUES
     (1, 1, '978-0-452-28423-4', '2025-01-01', '2025-01-10'),
     (2, 2, '978-0-7432-7356-6', '2025-01-02', '2025-01-11'),
     (3, 3, '978-0-452-28424-1', '2025-01-03', '2025-01-12'),
     (4, 4, '978-0-375-70611-4', '2025-01-04', '2025-01-13'),
     (5, 5, '978-0-06-112008-4', '2025-01-05', '2025-01-14'),
     (6, 6, '978-0-7432-7356-5', '2025-01-06', '2025-01-15'),
     (7, 7, '978-0-312-42708-4', '2025-01-07', '2025-01-16'),
     (8, 8, '978-0-452-28425-8', '2025-01-08', '2025-01-17'),
     (9, 9, '978-0-141-03613-4', '2025-01-09', '2025-01-18'),
     (10, 10, '978-0-452-28426-5', '2025-01-10', '2025-01-19'),
     (11, 11, '978-0-14-143951-8', '2025-01-11', '2025-01-20'),
     (12, 12, '978-0-452-28427-2', '2025-01-12', '2025-01-21'),
     (13, 13, '978-0-452-28428-9', '2025-01-13', '2025-01-22'),
     (14, 14, '978-0-14-044926-6', '2025-01-14', '2025-01-23'),
     (15, 15, '978-0-06-093546-7', '2025-01-15', '2025-01-24'),
     (16, 16, '978-1-5011-2637-0', '2025-01-16', '2025-01-25'),
     (17, 17, '978-0-452-28429-6', '2025-01-17', '2025-01-26'),
     (18, 18, '978-0-452-28430-2', '2025-01-18', '2025-01-27'),
     (19, 19, '978-0-452-28431-9', '2025-01-19', '2025-01-28'),
     (20, 20, '978-0-452-28432-6', '2025-01-20', '2025-01-29');


 select *
     from BorrowedBook;

 INSERT INTO Fine VALUES
     (1, 5.00),
     (2, 3.50),
     (3, 0.00),
     (4, 7.25),
     (5, 4.50),
     (6, 2.00),
     (7, 1.75),
     (8, 0.00),
     (9, 3.00),
     (10, 2.25),
     (11, 0.00),
     (12, 6.75),
     (13, 0.00),
     (14, 5.00),
     (15, 2.50),
     (16, 3.25),
     (17, 0.00),
     (18, 4.00),
     (19, 1.50),
    (20, 0.00);

 select *
   from fine;


 INSERT INTO Admin VALUES
     (1, 'Big Brother', '1234567890', 'admin@1984.com', 'surveillance'),
     (2, 'Fire Chief', '2345678901', 'chief@fahrenheit.com', 'burnbooks'),
     (3, 'Darcy Admin', '3456789012', 'admin@pride.com', 'loveletters'),
     (4, 'Mockingbird Admin', '4567890123', 'admin@mockingbird.com', 'justice'),
     (5, 'Adventure Captain', '5678901234', 'admin@whale.com', 'ahab'),
     (6, 'Epic Admin', '6789012345', 'admin@odyssey.com', 'homer'),
     (7, 'Divine Admin', '7890123456', 'admin@divinecomedy.com', 'dante'),
     (8, 'Historical Admin', '8901234567', 'admin@warpeace.com', 'tolstoy'),
     (9, 'Satirical Admin', '9012345678', 'admin@animalfarm.com', 'orwell'),
     (10, 'Philosophy Admin', '0123456789', 'admin@meditations.com', 'marcus'),
     (11, 'Post-Apocalyptic Admin', '1111222233', 'admin@theroad.com', 'cormac'),
     (12, 'Drama Admin', '2223334444', 'admin@mockingbird.com', 'justice2'),
     (13, 'Tragedy Admin', '3334445555', 'admin@lesmis.com', 'hero'),
     (14, 'Classic Admin', '4445556666', 'admin@pride.com', 'loveagain'),
     (15, 'Romance Admin', '5556667777', 'admin@janeeyre.com', 'rochesterlove');

select *
     from admin;


 INSERT INTO Staff VALUES
     (1, '9876543210', 'staff1@1984.com', 'proleworker'),
     (2, '8765432109', 'staff2@fahrenheit.com', 'bookkeeper'),
     (3, '7654321098', 'staff3@pride.com', 'romancekeeper'),
     (4, '6543210987', 'staff4@mockingbird.com', 'legaldefense'),
     (5, '5432109876', 'staff5@whale.com', 'firstmate'),
     (6, '4321098765', 'staff6@animalfarm.com', 'revolutionary'),
     (7, '3210987654', 'staff7@odyssey.com', 'adventurer'),
     (8, '2109876543', 'staff8@divinecomedy.com', 'guide'),
     (9, '1098765432', 'staff9@theroad.com', 'survivor'),
     (10, '0987654321', 'staff10@meditations.com', 'thinker'),
     (11, '1234567899', 'staff11@lesmis.com', 'herohelper'),
     (12, '2345678900', 'staff12@warpeace.com', 'strategist'),
     (13, '3456789011', 'staff13@bravenewworld.com', 'visionary'),
     (14, '4567890122', 'staff14@catcher.com', 'youthsupport'),
     (15, '5678901233', 'staff15@taleoftwocities.com', 'revolutionary');


 select *
     from staff;


INSERT INTO Application VALUES
     (1, 1, '978-0-452-28423-4', 'Approved'),
     (2, 2, '978-0-7432-7356-6', 'Pending'),
     (3, 3, '978-0-452-28424-1', 'Rejected'),
     (4, 4, '978-0-375-70611-4', 'Approved'),
     (5, 5, '978-0-06-112008-4', 'Pending'),
     (6, 6, '978-0-7432-7356-5', 'Approved'),
     (7, 7, '978-0-312-42708-4', 'Rejected'),
     (8, 8, '978-0-452-28425-8', 'Pending'),
     (9, 9, '978-0-141-03613-4', 'Approved'),
     (10, 10, '978-0-452-28426-5', 'Rejected'),
     (11, 11, '978-0-14-143951-8', 'Pending'),
     (12, 12, '978-0-452-28427-2', 'Approved'),
     (13, 13, '978-0-452-28428-9', 'Rejected'),
     (14, 14, '978-0-14-044926-6', 'Pending'),
     (15, 15, '978-0-452-28429-6', 'Approved');

 select *
    from application;

 INSERT INTO ErrorReport VALUES
     (1, 1, '2025-01-01', 'Issue with borrowing 1984.', 'Resolved'),
     (2, 2, '2025-01-02', 'Login error.', 'Pending'),
     (3, 3, '2025-01-03', 'Fine miscalculation.', 'Resolved'),
     (4, 4, '2025-01-04', 'Application stuck.', 'Pending'),
     (5, 5, '2025-01-05', 'Unable to renew book.', 'In Progress'),
     (6, 6, '2025-01-06', 'Lost book reported.', 'Resolved'),
     (7, 7, '2025-01-07', 'Account locked.', 'Pending'),
     (8, 8, '2025-01-08', 'Error in fine calculation.', 'Resolved'),
     (9, 9, '2025-01-09', 'Unable to borrow book.', 'In Progress'),
     (10, 10, '2025-01-10', 'Delay in application processing.', 'Pending'),
     (11, 11, '2025-01-11', 'Website downtime.', 'Resolved'),
     (12, 12, '2025-01-12', 'Notification not received.', 'Pending'),
     (13, 13, '2025-01-13', 'Incorrect book details.', 'Resolved'),
     (14, 14, '2025-01-14', 'Wrong user fine applied.', 'Pending'),
     (15, 15, '2025-01-15', 'Duplicate account created.', 'In Progress');























-- 1.1: Order books by StockAmount in descending order
SELECT * FROM book
ORDER BY StockAmount DESC;

-- 1.2: Order books by Title in ascending order
SELECT * FROM book
ORDER BY Title ASC;

-- 2.1: Count the total number of books in the inventory
SELECT COUNT(*) AS TotalBooks FROM book;

-- 2.2: Calculate the average StockAmount of all books
SELECT AVG(StockAmount) AS AverageStock FROM book;

-- 3.1: Group books by StockAmount and count how many books have that stock
SELECT StockAmount, COUNT(*) AS NumberOfBooks
FROM book
GROUP BY StockAmount;

-- 3.2: Get the titles of books that have more than 10 copies in stock
SELECT Title, StockAmount
FROM book
HAVING StockAmount > 10;



-- 1.1: Join books with their tags
SELECT b.Title, bt.Tag
FROM book b
JOIN booktags bt ON b.Title = bt.Title;

-- 1.2: Join books with tags and filter by a specific tag
SELECT b.Title, bt.Tag
FROM book b
JOIN booktags bt ON b.Title = bt.Title
WHERE bt.Tag = 'Dystopian';

-- 1.3: Count the number of books for each tag
SELECT bt.Tag, COUNT(b.Title) AS NumberOfBooks
FROM book b
JOIN booktags bt ON b.Title = bt.Title
GROUP BY bt.Tag;

-- 2.1: Get all books and their tags, including books without tags
SELECT b.Title, bt.Tag
FROM book b
LEFT JOIN booktags bt ON b.Title = bt.Title;

-- 3.1: Get all tags and their associated books, including tags without associated books
SELECT bt.Tag, b.Title
FROM booktags bt
RIGHT JOIN book b ON bt.Title = b.Title;

-- 4.1: Get all books and tags, including books without tags and tags without books
SELECT b.Title, bt.Tag
FROM book b
LEFT JOIN booktags bt ON b.Title = bt.Title

UNION

SELECT b.Title, bt.Tag
FROM book b
RIGHT JOIN booktags bt ON b.Title = bt.Title;






























-- Lab Exercise DML2

-- 1. Two Statements Using ORDER BY
SELECT UserID, Name, Phone, Email
FROM Admin
ORDER BY Name ASC;

SELECT ReportID, UserID, ReportDate, Status
FROM ErrorReport
ORDER BY ReportDate DESC;

-- 2. Two Statements Using Aggregate Functions
SELECT COUNT(*) AS TotalReports
FROM ErrorReport;

SELECT MIN(ReportDate) AS EarliestReportDate
FROM ErrorReport;

-- 3. Two Statements Using GROUP BY and HAVING
SELECT Status, COUNT(*) AS ReportCount
FROM ErrorReport
GROUP BY Status;

SELECT Status, COUNT(*) AS ReportCount
FROM ErrorReport
GROUP BY Status
HAVING COUNT(*) > 2;

-- Lab Exercise DML3

-- 1. Three Statements Using Equi-Join
SELECT e.ReportID, e.Description, e.Status, a.Name, a.Email
FROM ErrorReport e
JOIN Admin a ON e.UserID = a.UserID;

SELECT e.ReportID, e.Description, a.Name, a.Email
FROM ErrorReport e
JOIN Admin a ON e.UserID = a.UserID
WHERE e.Status = 'Pending';

SELECT e.ReportID, e.Description, a.Name, a.Email
FROM ErrorReport e
JOIN Admin a ON e.UserID = a.UserID
WHERE e.Status = 'Resolved';

-- 2. One Statement Using LEFT OUTER JOIN
SELECT a.UserID, a.Name, e.ReportID, e.Description
FROM Admin a
LEFT OUTER JOIN ErrorReport e ON a.UserID = e.UserID;

-- 3. One Statement Using RIGHT OUTER JOIN
SELECT e.ReportID, e.Description, a.UserID, a.Name
FROM ErrorReport e
RIGHT OUTER JOIN Admin a ON e.UserID = a.UserID;

-- 4. One Statement Using FULL OUTER JOIN (Simulated in MySQL)
SELECT a.UserID, a.Name, e.ReportID, e.Description
FROM Admin a
LEFT JOIN ErrorReport e ON a.UserID = e.UserID
UNION
SELECT a.UserID, a.Name, e.ReportID, e.Description
FROM Admin a
RIGHT JOIN ErrorReport e ON a.UserID = e.UserID;








-- Lab Exercise DML2

-- 1. Two Statements Using ORDER BY
SELECT UserID, Name, Phone, Email
FROM Admin
ORDER BY Name ASC;

SELECT ReportID, UserID, ReportDate, Status
FROM ErrorReport
ORDER BY ReportDate DESC;

-- 2. Two Statements Using Aggregate Functions
SELECT COUNT(*) AS TotalReports
FROM ErrorReport;

SELECT MIN(ReportDate) AS EarliestReportDate
FROM ErrorReport;

-- 3. Two Statements Using GROUP BY and HAVING
SELECT Status, COUNT(*) AS ReportCount
FROM ErrorReport
GROUP BY Status;

SELECT Status, COUNT(*) AS ReportCount
FROM ErrorReport
GROUP BY Status
HAVING COUNT(*) > 2;

-- Lab Exercise DML3

-- 1. Three Statements Using Equi-Join
SELECT e.ReportID, e.Description, e.Status, a.Name, a.Email
FROM ErrorReport e
JOIN Admin a ON e.UserID = a.UserID;

SELECT e.ReportID, e.Description, a.Name, a.Email
FROM ErrorReport e
JOIN Admin a ON e.UserID = a.UserID
WHERE e.Status = 'Pending';

SELECT e.ReportID, e.Description, a.Name, a.Email
FROM ErrorReport e
JOIN Admin a ON e.UserID = a.UserID
WHERE e.Status = 'Resolved';

-- 2. One Statement Using LEFT OUTER JOIN
SELECT a.UserID, a.Name, e.ReportID, e.Description
FROM Admin a
LEFT OUTER JOIN ErrorReport e ON a.UserID = e.UserID;

-- 3. One Statement Using RIGHT OUTER JOIN
SELECT e.ReportID, e.Description, a.UserID, a.Name
FROM ErrorReport e
RIGHT OUTER JOIN Admin a ON e.UserID = a.UserID;

-- 4. One Statement Using FULL OUTER JOIN (Simulated in MySQL)
SELECT a.UserID, a.Name, e.ReportID, e.Description
FROM Admin a
LEFT JOIN ErrorReport e ON a.UserID = e.UserID
UNION
SELECT a.UserID, a.Name, e.ReportID, e.Description
FROM Admin a
RIGHT JOIN ErrorReport e ON a.UserID = e.UserID;

















-- 1.1: Order borrowed books by BorrowDate in descending order
SELECT * FROM BorrowedBook
ORDER BY BorrowDate DESC;

-- 1.2: Order students by Name in ascending order
SELECT * FROM Student
ORDER BY Name ASC;


-- 2.1: Count the total number of students
SELECT COUNT(*) AS TotalStudents FROM Student;

-- 2.2: Calculate the average number of days books are borrowed (ReturnDate - BorrowDate)
SELECT AVG(DATEDIFF(ReturnDate, BorrowDate)) AS AverageBorrowDays
FROM BorrowedBook;


-- 3.1: Group borrowed books by UserID and count how many books each student borrowed
SELECT UserID, COUNT(*) AS NumberOfBooksBorrowed
FROM BorrowedBook
GROUP BY UserID;

-- 3.2: Get the UserID of students who borrowed more than 2 books
SELECT UserID, COUNT(*) AS NumberOfBooksBorrowed
FROM BorrowedBook
GROUP BY UserID
HAVING COUNT(*) > 0;












-- 1.1: Join students with their borrowed books
SELECT s.Name, bb.ISBN, bb.BorrowDate, bb.ReturnDate
FROM Student s
JOIN BorrowedBook bb ON s.UserID = bb.UserID;

-- 1.2: Join students with borrowed books and filter by a specific ISBN
SELECT s.Name, bb.ISBN, bb.BorrowDate, bb.ReturnDate
FROM Student s
JOIN BorrowedBook bb ON s.UserID = bb.UserID
WHERE bb.ISBN = '978-0-452-28423-4';

-- 1.3: Count the number of books borrowed by each student
SELECT s.Name, COUNT(bb.ISBN) AS NumberOfBooksBorrowed
FROM Student s
JOIN BorrowedBook bb ON s.UserID = bb.UserID
GROUP BY s.Name;



-- 2.1: Get all students and their borrowed books, including students who have not borrowed any books
SELECT s.Name, bb.ISBN, bb.BorrowDate, bb.ReturnDate
FROM Student s
LEFT JOIN BorrowedBook bb ON s.UserID = bb.UserID;


-- 3.1: Get all borrowed books and their associated students, including books not associated with any student
SELECT bb.ISBN, s.Name, bb.BorrowDate, bb.ReturnDate
FROM BorrowedBook bb
RIGHT JOIN Student s ON bb.UserID = s.UserID;


-- 4.1: Get all students and their borrowed books, including unmatched students and borrowed books
SELECT s.Name, bb.ISBN, bb.BorrowDate, bb.ReturnDate
FROM Student s
LEFT JOIN BorrowedBook bb ON s.UserID = bb.UserID

UNION

SELECT s.Name, bb.ISBN, bb.BorrowDate, bb.ReturnDate
FROM Student s
RIGHT JOIN BorrowedBook bb ON s.UserID = bb.UserID;






   select *
     from fine
     order by fineamount desc;


   select BorrowId, FineAmount
     from fine
     order by BorrowId ASC;







 select count(*) AS "numbers"
     from fine
     where borrowid = 10;


 select avg(fineamount),min(fineamount),max(fineamount),sum(fineamount)
     from fine
     where borrowid = 15;



   select avg(fineamount)
     from fine
     where borrowid = 10;






select borrowid,count(fineamount)
    from fine
    group by borrowid;


  select borrowid,fineamount,count(fineamount)
     from fine
     group by borrowid,fineamount;


     select borrowid,fineamount,count(fineamount)
     from fine
     group by borrowid,fineamount
     having avg(borrowid) > 5;








     SELECT f.BorrowID, f.FineAmount, bb.ISBN, bb.BorrowDate, bb.ReturnDate
     FROM Fine f
     JOIN BorrowedBook bb ON f.BorrowID = bb.BorrowID;



 SELECT f.BorrowID, f.FineAmount, s.UserID, s.Name, s.Email
     FROM Fine f
     JOIN BorrowedBook bb ON f.BorrowID = bb.BorrowID
     JOIN Student s ON bb.UserID = s.UserID;


 SELECT f.BorrowID, f.FineAmount, b.ISBN, b.Title
     FROM Fine f
     JOIN BorrowedBook bb ON f.BorrowID = bb.BorrowID
      JOIN Book b ON bb.ISBN = b.ISBN;


    SELECT s.UserID, s.Name, bb.ISBN, bb.BorrowDate, bb.ReturnDate
     FROM Student s
     LEFT OUTER JOIN BorrowedBook bb ON s.UserID = bb.UserID;






 SELECT bb.BorrowID, bb.ISBN, s.UserID, s.Name
     FROM BorrowedBook bb
    RIGHT OUTER JOIN Student s ON bb.UserID = s.UserID;





 SELECT s.UserID, s.Name, bb.ISBN, bb.BorrowDate, bb.ReturnDate
     FROM Student s
     LEFT JOIN BorrowedBook bb ON s.UserID = bb.UserID
    
     UNION
    
     SELECT s.UserID, s.Name, bb.ISBN, bb.BorrowDate, bb.ReturnDate
     FROM Student s
     RIGHT JOIN BorrowedBook bb ON s.UserID = bb.UserID;










