---------------------------------------------------------------
-- Создание таблиц, PK, FK
---------------------------------------------------------------
CREATE TABLE Person
(
    Person_ID  INTEGER     NOT NULL,
    Last_Name  VARCHAR(20) NOT NULL,
    First_Name VARCHAR(20),
    Phone      VARCHAR(15) NOT NULL,
    Address    VARCHAR(50) NOT NULL,
    CONSTRAINT Person_PK PRIMARY KEY (Person_ID)
);


CREATE TABLE Candidate
(
    Candidate_ID INTEGER NOT NULL,
    Experience   VARCHAR(150),
    Education    VARCHAR(150),
    Person_ID    INTEGER NOT NULL,
    CONSTRAINT Candidate_PK PRIMARY KEY (Candidate_ID),
    CONSTRAINT FK_Candidate_Person
        FOREIGN KEY (Person_ID) REFERENCES Person (Person_ID)
);


CREATE TABLE Position
(
    Position_ID INTEGER NOT NULL,
    Name VARCHAR(50) NOT NULL,
    CONSTRAINT Position_PK PRIMARY KEY (Position_ID)
);


CREATE TABLE Employee
(
    Employee_ID INTEGER NOT NULL,
    Salary      INTEGER NOT NULL,
    Person_ID   INTEGER NOT NULL,
    Position_ID INTEGER NOT NULL,
    CONSTRAINT Employee_PK PRIMARY KEY (Employee_ID),
    CONSTRAINT FK_Employee_Person
        FOREIGN KEY (Person_ID) REFERENCES Person (Person_ID),
    CONSTRAINT FK_Employee_Position
        FOREIGN KEY (Position_ID) REFERENCES Position (Position_ID)
);


CREATE TABLE Organization
(
    Organization_ID INTEGER NOT NULL,
    Name            VARCHAR(50),
    CONSTRAINT Organization_PK PRIMARY KEY (Organization_ID)
);


CREATE TABLE Vacancy
(
    Vacancy_ID         INTEGER      NOT NULL,
    Name               VARCHAR(50)  NOT NULL,
    Requirements       VARCHAR(300) NOT NULL,
    Special_Conditions VARCHAR(300),
    Organization_ID    INTEGER      NOT NULL,
    CONSTRAINT Vacancy_PK PRIMARY KEY (Vacancy_ID),
    CONSTRAINT FK_Vacancy_Organization
        FOREIGN KEY (Organization_ID) REFERENCES Organization (Organization_ID)
);


CREATE TABLE Interview
(
    Interview_ID INTEGER NOT NULL,
    Vacancy_ID   INTEGER NOT NULL,
    Candidate_ID INTEGER NOT NULL,
    Date         TIMESTAMP DEFAULT current_date NOT NULL,
    Success      INTEGER NOT NULL,
    Origin       VARCHAR(150) NOT NULL,
    Employee_ID  INTEGER NOT NULL,
CONSTRAINT Interview_PK PRIMARY KEY (Interview_ID),
CONSTRAINT Interview_Success CHECK (Success in (0, 1)),
CONSTRAINT FK_Interview_Vacation
    FOREIGN KEY (Vacancy_ID) REFERENCES Vacancy (Vacancy_ID),
CONSTRAINT FK_Interview_Candidate
    FOREIGN KEY (Candidate_ID) REFERENCES Candidate (Candidate_ID),
CONSTRAINT FK_Interview_Employee
    FOREIGN KEY (Employee_ID) REFERENCES Employee (Employee_ID)
);

---------------------------------------------------------------
-- Заполнение таблиц тестовыми данными
---------------------------------------------------------------
INSERT INTO Person(Person_ID, Last_Name, First_Name, Phone, Address) VALUES (1, 'Bozhnyuk', 'Alexander', '+78005553535', 'Pushkina st. Kolotushkina'); -- cand
INSERT INTO Person(Person_ID, Last_Name, First_Name, Phone, Address) VALUES (2, 'Maksim', 'Sharafov', '+79234567890', 'Sadovaia ul, 17\2-23'); -- cand
INSERT INTO Person(Person_ID, Last_Name, First_Name, Phone, Address) VALUES (3, 'Martinov', 'Ivan', '+7345678901', 'Nevskii pr, 9-11'); -- cand
INSERT INTO Person(Person_ID, Last_Name, First_Name, Phone, Address) VALUES (4, 'David', 'Kopperfield', '+7456789012', '5 linia VO, 45-8'); --cand
INSERT INTO Person(Person_ID, Last_Name, First_Name, Phone, Address) VALUES (5, 'Miroshnikov', 'Vladislav', '+7567890123', 'Chicheriba, 35-26'); -- cand
INSERT INTO Person(Person_ID, Last_Name, First_Name, Phone, Address) VALUES (6, 'Serbin', 'Danil', '+7678901234', 'Srednii pr VO, 27-1'); -- emp
INSERT INTO Person(Person_ID, Last_Name, First_Name, Phone, Address) VALUES (7, 'Zhilinskiy', 'Artem', '123-45-67', 'Universitetskaia nab, 17'); -- emp
INSERT INTO Person(Person_ID, Last_Name, First_Name, Phone, Address) VALUES (8, 'Vitalya', 'Alcogolicov', '+7789012345', 'Vorkuta Pivnaya nab. 228'); -- cand only to Illuminates!!!
INSERT INTO Person(Person_ID, Last_Name, First_Name, Phone, Address) VALUES (9, 'Ermak', 'Polina', '234-56-78', ''); -- emp
INSERT INTO Person(Person_ID, Last_Name, First_Name, Phone, Address) VALUES (10, 'Parker', 'Peter', '111-56-22', 'Quins, NY City'); -- cand
INSERT INTO Person(Person_ID, Last_Name, First_Name, Phone, Address) VALUES (11, 'Miloserdova', 'Lubov', '111-56-22', 'Botanicheskaya str 66/4'); -- cand
INSERT INTO Person(Person_ID, Last_Name, First_Name, Phone, Address) VALUES (12, 'Grisha', 'Semenov', '123--323-535', 'JB Lab'); -- emp
INSERT INTO Person(Person_ID, Last_Name, First_Name, Phone, Address) VALUES (13, 'Kosar', 'Dmitriev', '1488-0000', 'JB Lab'); -- emp
INSERT INTO Person(Person_ID, Last_Name, First_Name, Phone, Address) VALUES (14, 'Sokol', 'Olegov', '111-56-22', 'Mojka river str 66/4'); -- emp

INSERT INTO Candidate(Candidate_ID, Experience, Education, Person_ID)
       VALUES (1, 'Java/C Programming 3 years', 'SPBU Mathematics and Mechanics Bachelor', 1);
INSERT INTO Candidate(Candidate_ID, Experience, Education, Person_ID)
       VALUES (2, 'Software Engineering 10 years', 'SPBU Mathematics and Mechanics Bachelor', 2);
INSERT INTO Candidate(Candidate_ID, Experience, Education, Person_ID)
       VALUES (3, 'C/ASM Programming 3 years', 'Baumana Bachelor', 3);
INSERT INTO Candidate(Candidate_ID, Experience, Education, Person_ID)
       VALUES (4, 'Honest and very kind', 'Read many books', 4);
INSERT INTO Candidate(Candidate_ID, Experience, Education, Person_ID)
       VALUES (5, 'Java/C Programming 3 years', 'SPBU Mathematics and Mechanics Bachelor', 5);
INSERT INTO Candidate(Candidate_ID, Experience, Education, Person_ID)
       VALUES (6, 'Professional drinking of Vodka "Telnyashka", 20 years', 'RenTV broadcasts in the field of aliens and other worlds', 8);
INSERT INTO Candidate(Candidate_ID, Experience, Education, Person_ID)
       VALUES (7, 'Chemistry, physics, biology, 10 years', 'Quins School', 10);
INSERT INTO Candidate(Candidate_ID, Experience, Education, Person_ID)
       VALUES (8, 'Java/C Programming 3 years', 'CSC, SPBU Mathematics and Mechanics Bachelor', 11);

INSERT INTO Organization(Organization_ID, Name) VALUES (1, 'JetBrains');
INSERT INTO Organization(Organization_ID, Name) VALUES (2, 'Yandex');
INSERT INTO Organization(Organization_ID, Name) VALUES (3, 'Illuminates');
INSERT INTO Organization(Organization_ID, Name) VALUES (4, 'Stark Industries');
INSERT INTO Organization(Organization_ID, Name) VALUES (5, 'Umbrella');

INSERT INTO Position(Position_ID, Name) VALUES (1, 'Cleaner');
INSERT INTO Position(Position_ID, Name) VALUES (2, 'Junior');
INSERT INTO Position(Position_ID, Name) VALUES (3, 'Middle');
INSERT INTO Position(Position_ID, Name) VALUES (4, 'Senior');
INSERT INTO Position(Position_ID, Name) VALUES (5, 'Head of Department');
INSERT INTO Position(Position_ID, Name) VALUES (6, 'Senior Secretary');
INSERT INTO Position(Position_ID, Name) VALUES (7, 'Director');

INSERT INTO Employee(Employee_ID, Salary, Person_ID, Position_ID) VALUES (1, 600, 6, 1);
INSERT INTO Employee(Employee_ID, Salary, Person_ID, Position_ID) VALUES (2, 6000, 7, 5);
INSERT INTO Employee(Employee_ID, Salary, Person_ID, Position_ID) VALUES (3, 30000, 9, 3);
INSERT INTO Employee(Employee_ID, Salary, Person_ID, Position_ID) VALUES (4, 1000000, 12, 6);
INSERT INTO Employee(Employee_ID, Salary, Person_ID, Position_ID) VALUES (5, 20000, 13, 2);
INSERT INTO Employee(Employee_ID, Salary, Person_ID, Position_ID) VALUES (6, 6000000, 14, 7);

INSERT INTO Vacancy(Vacancy_ID, Name, Requirements, Special_Conditions, Organization_ID) VALUES (1, 'PyCharm DataSpell Backend Developer', 'Be the best Man in this world.',
                                                                                                 'Cakes, MACs, coffee. Also money, of course.', 1);
INSERT INTO Vacancy(Vacancy_ID, Name, Requirements, Special_Conditions, Organization_ID) VALUES (2, 'Rider Backend Developer', 'Be almost the best in this world',
                                                                                                 'Cakes, MACs, coffee, more pain. Also money, of course.', 1);
INSERT INTO Vacancy(Vacancy_ID, Name, Requirements, Special_Conditions, Organization_ID) VALUES (3, 'IDEA Backend Developer', 'Be the best programmer in the world',
                                                                                                 'Cakes, MACs, coffee, good chair. Also money, of course.', 1);
INSERT INTO Vacancy(Vacancy_ID, Name, Requirements, Special_Conditions, Organization_ID) VALUES (4, 'Yandex Nirvana Backend Developer', '
Be able to program in Java, have straight hands and a kind heart.', 'Office in center of Saint Petersburg, coffee, good people. And money, of course.', 2);
INSERT INTO Vacancy(Vacancy_ID, Name, Requirements, Special_Conditions, Organization_ID) VALUES (5, 'Yandex Translator Backend Developer',
                                                                                                 'Be an Indian programmer, know all the languages of the world.',
                                                                                                 'The best basement in the center of St. Petersburg.', 2);
INSERT INTO Vacancy(Vacancy_ID, Name, Requirements, Special_Conditions, Organization_ID) VALUES (6, 'Honorary Member of the Community', 'Know nothing, but understand everything.',
                                                                                                 'Influence on the fate of the whole world', 3);
INSERT INTO Vacancy(Vacancy_ID, Name, Requirements, Special_Conditions, Organization_ID) VALUES (7, 'Secretary of Tony Stark', 'Be as sexy as Pepper Potts',
                                                                                                 'Adoration from the world''s greatest superhero.', 4);
INSERT INTO Vacancy(Vacancy_ID, Name, Requirements, Special_Conditions, Organization_ID) VALUES (8, 'Son of Tony Stark', 'Be a kid and be liked by Tony Stark',
                                                                                                 'Attractive armor. Possible death in battle, but on hands of Tony Stark', 4);
INSERT INTO Vacancy(Vacancy_ID, Name, Requirements, Special_Conditions, Organization_ID) VALUES (9, 'Umbrella science laboratory leader', 'The desire to make humanity great.',
                                                                                                 'The opportunity to touch the great revolution in the development of the human being as a unit of the universe.', 5);
INSERT INTO Vacancy(Vacancy_ID, Name, Requirements, Special_Conditions, Organization_ID) VALUES (10, 'Umbrella Guard', 'Courage in the face of the unknown.',
                                                                                                 'A dignified death in the arms of Mr. X is possible.', 5);



INSERT INTO Interview(Interview_ID, Vacancy_ID, Candidate_ID, Date, Success, Origin, Employee_ID) VALUES (1, 1, 1, '2021-04-14', 1, 'From friends', 3);
INSERT INTO Interview(Interview_ID, Vacancy_ID, Candidate_ID, Date, Success, Origin, Employee_ID) VALUES (2, 3, 2, '2001-03-21', 0, 'From Andrew Terekhov', 3);
INSERT INTO Interview(Interview_ID, Vacancy_ID, Candidate_ID, Date, Success, Origin, Employee_ID) VALUES (3, 1, 3, '2021-01-14', 0, 'From friends', 3);
INSERT INTO Interview(Interview_ID, Vacancy_ID, Candidate_ID, Date, Success, Origin, Employee_ID) VALUES (4, 2, 3, '2021-02-10', 0, 'From friends', 3);
INSERT INTO Interview(Interview_ID, Vacancy_ID, Candidate_ID, Date, Success, Origin, Employee_ID) VALUES (5, 3, 3, '2021-03-09', 0, 'From friends', 3);
INSERT INTO Interview(Interview_ID, Vacancy_ID, Candidate_ID, Date, Success, Origin, Employee_ID) VALUES (7, 8, 3, '2021-04-03', 0, 'From friends', 2);
INSERT INTO Interview(Interview_ID, Vacancy_ID, Candidate_ID, Date, Success, Origin, Employee_ID) VALUES (8, 9, 3, '2021-04-04', 1, 'From friends', 2);
INSERT INTO Interview(Interview_ID, Vacancy_ID, Candidate_ID, Date, Success, Origin, Employee_ID) VALUES (9, 7, 4, '2019-03-14', 0, 'From his mom', 4);
INSERT INTO Interview(Interview_ID, Vacancy_ID, Candidate_ID, Date, Success, Origin, Employee_ID) VALUES (10, 10, 4, '2021-04-14', 1, 'From his dad', 4);
INSERT INTO Interview(Interview_ID, Vacancy_ID, Candidate_ID, Date, Success, Origin, Employee_ID) VALUES (11, 2, 5, '2021-04-14', 1, 'From website', 3);
INSERT INTO Interview(Interview_ID, Vacancy_ID, Candidate_ID, Date, Success, Origin, Employee_ID) VALUES (12, 1, 6, '2011-06-10', 0, 'By the will of God', 1);
INSERT INTO Interview(Interview_ID, Vacancy_ID, Candidate_ID, Date, Success, Origin, Employee_ID) VALUES (13, 2, 6, '2012-04-01', 0, 'By the will of God', 1);
INSERT INTO Interview(Interview_ID, Vacancy_ID, Candidate_ID, Date, Success, Origin, Employee_ID) VALUES (14, 3, 6, '2013-06-02', 0, 'By the will of God', 1);
INSERT INTO Interview(Interview_ID, Vacancy_ID, Candidate_ID, Date, Success, Origin, Employee_ID) VALUES (15, 4, 6, '2014-04-14', 0, 'By the will of God', 1);
INSERT INTO Interview(Interview_ID, Vacancy_ID, Candidate_ID, Date, Success, Origin, Employee_ID) VALUES (16, 5, 6, '2015-05-05', 0, 'By the will of God', 1);
INSERT INTO Interview(Interview_ID, Vacancy_ID, Candidate_ID, Date, Success, Origin, Employee_ID) VALUES (17, 7, 6, '2016-04-19', 0, 'By the will of God', 1);
INSERT INTO Interview(Interview_ID, Vacancy_ID, Candidate_ID, Date, Success, Origin, Employee_ID) VALUES (18, 8, 6, '2017-04-10', 0, 'By the will of God', 1);
INSERT INTO Interview(Interview_ID, Vacancy_ID, Candidate_ID, Date, Success, Origin, Employee_ID) VALUES (19, 9, 6, '2018-03-16', 0, 'By the will of God', 1);
INSERT INTO Interview(Interview_ID, Vacancy_ID, Candidate_ID, Date, Success, Origin, Employee_ID) VALUES (20, 10, 6, '2019-04-17', 0, 'By the will of God', 1);
INSERT INTO Interview(Interview_ID, Vacancy_ID, Candidate_ID, Date, Success, Origin, Employee_ID) VALUES (21, 6, 6, '2020-01-18', 1, 'By the will of God', 1);
INSERT INTO Interview(Interview_ID, Vacancy_ID, Candidate_ID, Date, Success, Origin, Employee_ID) VALUES (22, 9, 7, '2019-03-10', 0, 'From family', 3);
INSERT INTO Interview(Interview_ID, Vacancy_ID, Candidate_ID, Date, Success, Origin, Employee_ID) VALUES (23,7, 7, '2020-04-12', 0, 'From family', 3);
INSERT INTO Interview(Interview_ID, Vacancy_ID, Candidate_ID, Date, Success, Origin, Employee_ID) VALUES (24, 8, 7, '2021-05-11', 1, 'From family', 3);
INSERT INTO Interview(Interview_ID, Vacancy_ID, Candidate_ID, Date, Success, Origin, Employee_ID) VALUES (25, 6, 8, '2020-09-10', 0, 'From homeless', 6);
INSERT INTO Interview(Interview_ID, Vacancy_ID, Candidate_ID, Date, Success, Origin, Employee_ID) VALUES (26, 5, 8, '2021-02-03', 0, 'From friends', 6);
INSERT INTO Interview(Interview_ID, Vacancy_ID, Candidate_ID, Date, Success, Origin, Employee_ID) VALUES (27, 4, 8, '2021-03-20', 1, 'From friends', 6);

---------------------------------------------------------------
-- Создание индексов
---------------------------------------------------------------
CREATE INDEX idx_organisation_name ON Organization(Name);
CREATE INDEX idx_interview_date ON Interview(Date);
CREATE UNIQUE INDEX idx_person_full_name
                              ON Person (First_name, Last_name);


---------------------------------------------------------------
-- Удаление таблиц
---------------------------------------------------------------


DROP TABLE IF EXISTS Interview;
DROP TABLE IF EXISTS Origin;
DROP TABLE IF EXISTS Vacancy;
DROP TABLE IF EXISTS Organization;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Position;
DROP TABLE IF EXISTS Candidate;
DROP TABLE IF EXISTS Person;



-----------------------------------------------------------------------------------------------------------------------------------------------------
-- Запрет на удаление человека
-----------------------------------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION rollback_delete() RETURNS TRIGGER AS
$rollback_delete$
BEGIN
    RETURN NULL;
END;
$rollback_delete$ LANGUAGE plpgsql;


CREATE TRIGGER TR_Rollback_Delete BEFORE DELETE ON Person
    FOR EACH ROW EXECUTE PROCEDURE rollback_delete();

-- Проверка
-- DELETE FROM Person WHERE Person_ID = 15;


-----------------------------------------------------------------------------------------------------------------------------------------------------
-- Контроль повторного добавления человека
-----------------------------------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION rollback_repeat_insert() RETURNS TRIGGER AS
$rollback_rep_insert$
BEGIN
    IF EXISTS(SELECT *
              FROM Person
              WHERE First_Name = NEW.First_Name
                AND Last_Name = NEW.Last_Name
                AND Address = NEW.Address)
    THEN
        RETURN NULL;
    END IF;
END;
$rollback_rep_insert$ LANGUAGE plpgsql;

CREATE TRIGGER TR_Rollback_Repeat_Insert BEFORE INSERT ON Person
    FOR EACH ROW EXECUTE PROCEDURE rollback_repeat_insert();

-- Проверка
-- INSERT INTO Person(Person_ID, Last_Name, First_Name, Phone, Address) VALUES (17, 'Bozhnyuk', 'Alexander', '+2323', 'Pushkina st. Kolotushkina'); -- cand

-----------------------------------------------------------------------------------------------------------------------------------------------------
-- Деактивация кандидата вместо удаления
-----------------------------------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION deactivate_candidate() RETURNS TRIGGER AS
$deactivate_candidate$
BEGIN
    UPDATE Candidate
    SET Experience = 'DEACTIVATED' || Candidate.Experience
    WHERE Candidate_ID = OLD.Candidate_ID;
    RETURN NULL;
END;
$deactivate_candidate$ LANGUAGE plpgsql;


CREATE TRIGGER TR_Deactivate_Candidate BEFORE DELETE ON Candidate
    FOR EACH ROW EXECUTE PROCEDURE deactivate_candidate();

-- Проверка
DELETE FROM Candidate WHERE Candidate_ID = 9;



-----------------------------------------------------------------------------------------------------------------------------------------------------
--  Добавление нового кандидата
-----------------------------------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE AddNewCandidate(
    LName VARCHAR,
    FName VARCHAR,
    NPhone VARCHAR,
    NAddress VARCHAR,
    NEducation VARCHAR,
    NExperience VARCHAR
)
LANGUAGE plpgsql
AS $$
DECLARE New_Person_ID INTEGER;
DECLARE New_Candidate_ID INTEGER;
BEGIN
    SELECT MAX(Person_ID) + 1 INTO New_Person_ID FROM Person;
    SELECT MAX(Candidate_ID) + 1 INTO New_Candidate_ID FROM Candidate;
    INSERT INTO Person(Person_ID, Last_Name, First_Name, Phone, Address) VALUES (New_Person_ID, LName, FName, NPhone, NAddress);
    INSERT INTO Candidate(Candidate_ID, Experience, Education, Person_ID) VALUES (New_Candidate_ID, NExperience, NEducation, New_Person_ID);
END;
$$;

-- Вызов
CALL AddNewCandidate('Ivanov', 'Ivan', '8111111111111', 'Pushkina ul, d. Kolotushkina', 'Baltiisckiy Universitet', 'Three Years of Programming');

-- DROP PROCEDURE IF EXISTS AddNewCandidate;

-----------------------------------------------------------------------------------------------------------------------------------------------------
-- История устройства кандидата на работу
-----------------------------------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION CandidateHistory(
    LName VARCHAR,
    FName VARCHAR
)
    RETURNS TABLE
            (
                Date    TIMESTAMP,
                Organization VARCHAR,
                Success INT
            )
    LANGUAGE plpgsql
AS
$$
BEGIN
    RETURN QUERY
        SELECT I.Date, O.Name, I.Success FROM Interview I JOIN Vacancy V ON I.Vacancy_ID = V.Vacancy_ID
        JOIN Organization O ON V.Organization_ID = O.Organization_ID
        JOIN Candidate C ON I.Candidate_ID = C.Candidate_ID
        JOIN Person P ON C.Person_ID = P.Person_ID
        WHERE P.First_Name = FName AND P.Last_Name = LName
        ORDER BY I.Date;
END;
$$;

--Вызов
SELECT * FROM CandidateHistory('Vitalya', 'Alcogolicov');

--DROP FUNCTION IF EXISTS CandidateHistory;

-----------------------------------------------------------------------------------------------------------------------------------------------------
-- Количество успешных собеседований у кандидата
-----------------------------------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION CandidateSuccessCount(
    LName VARCHAR,
    FName VARCHAR
) RETURNS INT
LANGUAGE plpgsql
AS
$$
DECLARE
    Result INT;
BEGIN
    SELECT SUM(Success) INTO Result FROM CandidateHistory(LName, FName) GROUP BY Result;
    RETURN Result;
END;
$$;

-- Вызов
SELECT CandidateSuccessCount('Vitalya', 'Alcogolicov');

-- DROP FUNCTION IF EXISTS CandidateSuccessCount

-----------------------------------------------------------------------------------------------------------------------------------------------------
-- Организации и количество успешных кандидатов
-----------------------------------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE VIEW V_Organization_Successful_Candidates_Count (Organization_Name, Successful_Candidates_Count)
AS
SELECT Name, COUNT(*)
FROM Organization
         JOIN
     (SELECT Organization_ID
      FROM Interview
               JOIN Vacancy V ON Interview.Vacancy_ID = V.Vacancy_ID
      WHERE Success = 1) AS OrganizationsWithSuccess
     ON Organization.Organization_ID = OrganizationsWithSuccess.Organization_ID
GROUP BY Organization.Organization_ID;

SELECT * FROM V_Organization_Successful_Candidates_Count;

DROP VIEW IF EXISTS V_Organization_Successful_Candidates_Count;

-----------------------------------------------------------------------------------------------------------------------------------------------------
-- Рейтинг сотрудников агентства
-----------------------------------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE VIEW V_Rating_Employee (Last_Name, First_Name, Position, Salary)
AS
SELECT P.Last_Name, P.First_Name, Pos.Name, E.Salary
FROM Employee E JOIN Position Pos on Pos.Position_ID = E.Position_ID
JOIN Person P on E.Person_ID = P.Person_ID
ORDER BY Pos.Position_ID;

SELECT * FROM V_Rating_Employee;

DROP VIEW IF EXISTS V_Rating_Employee;

-----------------------------------------------------------------------------------------------------------------------------------------------------
-- Новые сотрудники компании JetBrains
-----------------------------------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE VIEW V_JetBrains_Success_Candidates (Last_Name, First_Name, Phone, Address, Experience, Education)
AS
SELECT P.Last_Name, P.First_Name, P.Phone, P.Address, C.Experience, C.Education
FROM Interview I
         LEFT OUTER JOIN Candidate C on C.Candidate_ID = I.Candidate_ID
         LEFT OUTER JOIN Person P on P.Person_ID = C.Person_ID
         LEFT OUTER JOIN Vacancy V on I.Vacancy_ID = V.Vacancy_ID
         LEFT OUTER JOIN Organization O on V.Organization_ID = O.Organization_ID
WHERE O.Name = 'JetBrains'
  AND I.Success = 1;


SELECT * FROM V_JetBrains_Success_Candidates;

DROP VIEW IF EXISTS V_JetBrains_Success_Candidates;


-- (01) Организации и количество новых сотрудников, отсортированные в обратном порядке по количеству новых сотрудников
SELECT * FROM V_Organization_Successful_Candidates_Count ORDER BY 2 DESC;

-- (02) Кандидаты, которые не нашли работу
SELECT First_Name, Last_Name
FROM Person P INNER JOIN Candidate C on P.Person_ID = C.Person_ID
WHERE (CandidateSuccessCount(LName := P.Last_Name, FName := P.First_Name) = 0
   OR CandidateSuccessCount(LName := P.Last_Name, FName := P.First_Name) IS NULL);

-- (03) Кандидаты с именем на букву L, Фамилии, Имена, Телефоны
SELECT Last_Name, First_Name, Phone
FROM Person P INNER JOIN Candidate C on P.Person_ID = C.Person_ID
WHERE P.First_Name LIKE 'L%'
ORDER BY P.First_Name;

-- (04) Фамилии сотрудников агентства, которые помогли попасть на работу хотя бы 2-м людям
SELECT P.Last_Name
FROM Person P
         JOIN Employee E on P.Person_ID = E.Person_ID
         JOIN Interview I on E.Employee_ID = I.Employee_ID
WHERE I.Success = 1
GROUP BY P.Last_Name
HAVING SUM(I.Success) > 2;

-- (05) Количество сотрудников по каждой компании для каждой вакансии
SELECT O.Name, V.Name, COUNT(*) AS Agency_Employee_Count
FROM Interview I
         JOIN Vacancy V on I.Vacancy_ID = V.Vacancy_ID
         JOIN Employee E on I.Employee_ID = E.Employee_ID
         JOIN Organization O on V.Organization_ID = O.Organization_ID
GROUP BY O.Name, V.Name
ORDER BY O.Name;

-- (06) Интервью за период
SELECT Interview_ID, Date FROM Interview I
WHERE I.Date BETWEEN '2011-01-02' AND '2017-01-02'
ORDER BY Date;

-- (07) Кандидаты, которые узнали о вакансии от друзей
SELECT Last_Name, First_Name
FROM Person P
         JOIN Candidate C on P.Person_ID = C.Person_ID
WHERE C.Candidate_ID IN (
    SELECT Candidate_ID
    FROM Interview I
    WHERE I.Origin LIKE '%friends%');

-- (08) Процент успешных собеседований
SELECT COUNT(*) * 100 / (SELECT COUNT(*) FROM Interview)
FROM Interview
WHERE Success = 1;

-- (09) Названия компаний и имена людей
SELECT Name FROM Organization
UNION
SELECT First_Name FROM Person;

-- (10) Компания с наибольшим количеством приобретенных сотрудников
SELECT Organization_Name
FROM V_Organization_Successful_Candidates_Count
WHERE Successful_Candidates_Count =
      (SELECT MAX(Successful_Candidates_Count) FROM V_Organization_Successful_Candidates_Count);

-- (11) Фамилии сотрудников агентства и количество их успешных дел
SELECT P.Last_Name, SUM(Success)
FROM Interview I JOIN Employee E on I.Employee_ID = E.Employee_ID
JOIN Person P on E.Person_ID = P.Person_ID
GROUP BY P.Last_Name;

-- (12) Имена, фамилии кандидатов и количество их попыток по порядку возрастания
SELECT P.First_Name, P.Last_Name, COUNT(Success) AS Attempts_Count
FROM Interview I JOIN Candidate C on C.Candidate_ID = I.Candidate_ID
JOIN Person P on C.Person_ID = P.Person_ID
GROUP BY P.First_Name, P.Last_Name
ORDER BY Attempts_Count;









