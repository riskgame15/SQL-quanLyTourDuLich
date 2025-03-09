CREATE DATABASE QuanLyTourDuLich;

USE QuanLyTourDuLich;

CREATE TABLE City (
                      id INT PRIMARY KEY AUTO_INCREMENT,
                      name VARCHAR(20)
);

INSERT INTO City (name)
VALUES
    ('Ha Noi'),
    ('Ho Chi Minh'),
    ('Da Nang'),
    ('Hai Phong'),
    ('Can Tho');



CREATE TABLE Destination (
                             id INT PRIMARY KEY AUTO_INCREMENT,
                             name VARCHAR(50) NOT NULL,
                             description TEXT,
                             price INT,
                             city_id INT,
                             FOREIGN KEY (city_id) REFERENCES City (id)
);

INSERT INTO Destination (name, description, price, city_id)
VALUES
    ('Ho Guom', 'Dia diem noi tieng o Ha Noi, noi co cau The Huc va den Ngoc Son.', 20000, 1),
    ('Nha Tho Duc Ba', 'Kien truc noi bat tai trung tam Thanh pho Ho Chi Minh.', 0, 2),
    ('Ba Na Hills', 'Khu du lich noi tieng voi cau Vang va phong canh tuyet dep.', 700000, 3),
    ('Do Son', 'Bai bien noi tieng o Hai Phong, noi thu hut du khach quanh nam.', 50000, 4),
    ('Cho Noi Cai Rang', 'Diem du lich van hoa noi tieng o Can Tho.', 0, 5);



CREATE TABLE Tourist (
                         id INT PRIMARY KEY AUTO_INCREMENT,
                         name VARCHAR(20) NOT NULL,
                         passport VARCHAR(20) NOT NULL,
                         birth_year INT,
                         city_id INT,
                         FOREIGN KEY (city_id) REFERENCES City (id)
);

INSERT INTO Tourist (name, passport, birth_year, city_id)
VALUES
    ('Nguyen Van A', 'P12345678', 1990, 1),
    ('Tran Thi B', 'P23456789', 1985, 2),
    ('Le Van C', 'P34567890', 1992, 3),
    ('Pham Thi D', 'P45678901', 1988, 4),
    ('Hoang Van E', 'P56789012', 1995, 5),
    ('Nguyen Thi F', 'P67890123', 1980, 1),
    ('Vu Van G', 'P78901234', 1983, 2),
    ('Dang Thi H', 'P89012345', 1996, 3),
    ('Phan Van I', 'P90123456', 1991, 4),
    ('Bui Thi J', 'P01234567', 1987, 5);



CREATE TABLE TourKind (
                          id INT PRIMARY KEY AUTO_INCREMENT,
                          code VARCHAR(20) NOT NULL,
                          name VARCHAR(20)
);

INSERT INTO TourKind (code, name)
VALUES
    ('DLTN', 'Du lich tu nhien'),
    ('DLVH', 'Du lich van hoa');



CREATE TABLE Tour (
                      id INT PRIMARY KEY AUTO_INCREMENT,
                      tourKind_id INT,
                      price INT,
                      destination_id INT,
                      start_date DATE,
                      end_date DATE,
                      FOREIGN KEY (tourKind_id) REFERENCES TourKind (id),
                      FOREIGN KEY (destination_id) REFERENCES Destination (id)
);

INSERT INTO Tour (tourKind_id, price, destination_id, start_date, end_date)
VALUES
    (1, 1000000, 1, '2020-01-10', '2020-01-10'),
    (2, 2000000, 2, '2020-02-15', '2020-02-20'),
    (1, 1500000, 3, '2020-03-01', '2020-03-30'),
    (2, 2500000, 4, '2020-03-20', '2020-04-10'),
    (1, 1200000, 5, '2020-04-05', '2020-04-05'),
    (2, 3000000, 1, '2020-05-01', '2020-05-20'),
    (1, 1800000, 2, '2020-06-10', '2020-06-15'),
    (2, 2200000, 3, '2020-07-15', '2020-07-30'),
    (1, 1700000, 4, '2020-08-20', '2020-08-22'),
    (2, 2500000, 5, '2020-09-05', '2020-10-05'),
    (1, 2000000, 1, '2020-10-10', '2020-10-20'),
    (2, 2700000, 2, '2020-11-15', '2020-11-20'),
    (1, 1600000, 3, '2020-12-01', '2020-12-01'),
    (2, 2400000, 4, '2021-01-20', '2021-01-25'),
    (1, 1900000, 5, '2021-02-10', '2021-02-15');



CREATE TABLE Bill (
                      id INT PRIMARY KEY AUTO_INCREMENT,
                      tour_id INT,
                      tourist_id INT,
                      status BIT,
                      FOREIGN KEY (tour_id) REFERENCES Tour (id),
                      FOREIGN KEY (tourist_id) REFERENCES Tourist (id)
);

INSERT INTO Bill (tour_id, tourist_id, status)
VALUES
    (1, 1, 1),
    (2, 2, 0),
    (3, 3, 1),
    (4, 4, 1),
    (5, 5, 0),
    (6, 6, 1),
    (7, 7, 1),
    (8, 8, 0),
    (9, 9, 1),
    (10, 10, 0);