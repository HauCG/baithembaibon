create database QuanLyMuaVe;
use QuanLyMuaVe;
create table City(
CityId int auto_increment primary key ,
CityName varchar(300) not null
);
create table Location(
LocationId int auto_increment primary key ,
LocationName varchar(300) not null,
LocationDescribe varchar(300) not null,
LocationAveragePrice double not null,
CityId int,
foreign key (CityId) references City(CityId)
);
create table Customer(
CustomerId int auto_increment primary key,
CustomerName varchar(300) not null,
CustomerSCC varchar(13) unique not null, 
CustomerBirthYear int check (CustomerBirthYear < 2025 and CustomerBirthYear > 1900) not null,
CityId int,
foreign key (CityId) references City(CityId)
);
create table TypeOfTours(
TypeOfTourId int auto_increment primary key ,
TypeOfTourCode varchar(300) not null,
TypeOfTourName varchar(300) not null
);
create table Tours(
TourID int auto_increment primary key ,
TypeOfTourId int ,
TourPrice double not null,
TourStartDate datetime not null,
TourEndDate datetime not null, check(TourEndDate > TourStartDate),
foreign key (TypeOfTourId) references TypeOfTours(TypeOfTourId)
);
create table bookingInvoices(
bookingInvoiceId  int auto_increment primary key ,
TourID int ,
CustomerId int, 
Status  ENUM('Đã đặt', 'Đã hoàn thành', 'Đã hủy') DEFAULT 'Đã đặt',
foreign key (TourID) references Tours(TourID),
foreign key (CustomerId) references Customer(CustomerId)
);
INSERT INTO City (CityName) VALUES 
('Thành phố Hà Nội'),
('Thành phố Hồ Chí Minh'),
('Thành phố Đà Nẵng'),
('Thành phố Huế'),
('Thành phố Nha Trang');

INSERT INTO Location (LocationName, LocationDescribe, LocationAveragePrice, CityId) VALUES 
('Phố Cổ Hà Nội', 'Khu vực phố cổ nổi tiếng tại Hà Nội với kiến trúc cổ và ẩm thực đường phố phong phú', 100.0, 1),
('Nhà Thờ Đức Bà', 'Địa điểm nổi bật với kiến trúc Pháp tại trung tâm Thành phố Hồ Chí Minh', 120.0, 2),
('Bãi Biển Mỹ Khê', 'Bãi biển đẹp tại Đà Nẵng, nổi tiếng với bờ cát trắng và nước biển trong xanh', 150.0, 3),
('Kinh Thành Huế', 'Di tích lịch sử nổi tiếng tại Huế, nơi bảo tồn nhiều công trình kiến trúc cổ', 200.0, 4),
('Vinpearl Land Nha Trang', 'Khu vui chơi giải trí lớn tại Nha Trang, bao gồm công viên nước và nhiều hoạt động thú vị', 300.0, 5);

INSERT INTO Customer (CustomerName, CustomerSCC, CustomerBirthYear, CityId) VALUES 
('Nguyen Van A', '1234567890123', 1990, 1),
('Le Thi B', '2345678901234', 1985, 2),
('Tran Van C', '3456789012345', 1995, 3),
('Hoang Thi D', '4567890123456', 1980, 4),
('Pham Van E', '5678901234567', 2000, 5),
('Do Thi F', '6789012345678', 1992, 1),
('Bui Van G', '7890123456789', 1988, 2),
('Nguyen Thi H', '8901234567890', 1994, 3),
('Le Van I', '9012345678901', 1983, 4),
('Tran Thi J', '0123456789012', 1991, 5);

INSERT INTO TypeOfTours (TypeOfTourCode, TypeOfTourName) VALUES 
('TT01', 'Du lịch khám phá'),
('TT02', 'Du lịch nghỉ dưỡng');

INSERT INTO Tours (TypeOfTourId, TourPrice, TourStartDate, TourEndDate) VALUES 
(1, 500.0, '2024-11-01 09:00:00', '2024-11-05 18:00:00'),
(1, 450.0, '2024-11-10 09:00:00', '2024-11-15 18:00:00'),
(2, 300.0, '2024-11-20 09:00:00', '2024-11-25 18:00:00'),
(2, 350.0, '2024-12-01 09:00:00', '2024-12-05 18:00:00'),
(1, 600.0, '2024-12-10 09:00:00', '2024-12-15 18:00:00'),
(2, 400.0, '2024-12-20 09:00:00', '2024-12-25 18:00:00'),
(1, 550.0, '2025-01-01 09:00:00', '2025-01-05 18:00:00'),
(2, 350.0, '2025-01-10 09:00:00', '2025-01-15 18:00:00'),
(1, 500.0, '2025-01-20 09:00:00', '2025-01-25 18:00:00'),
(2, 300.0, '2025-02-01 09:00:00', '2025-02-05 18:00:00'),
(1, 450.0, '2025-02-10 09:00:00', '2025-02-15 18:00:00'),
(2, 400.0, '2025-02-20 09:00:00', '2025-02-25 18:00:00'),
(1, 550.0, '2025-03-01 09:00:00', '2025-03-05 18:00:00'),
(2, 600.0, '2025-03-10 09:00:00', '2025-03-15 18:00:00'),
(1, 650.0, '2025-03-20 09:00:00', '2025-03-25 18:00:00');

INSERT INTO bookingInvoices (TourID, CustomerId, Status) VALUES 
(1, 1, 'Đã đặt'),
(2, 2, 'Đã hoàn thành'),
(3, 3, 'Đã đặt'),
(4, 4, 'Đã hoàn thành'),
(5, 5, 'Đã đặt'),
(6, 6, 'Đã hoàn thành'),
(7, 7, 'Đã hủy'),
(8, 8, 'Đã hoàn thành'),
(9, 9, 'Đã đặt'),
(10, 10, 'Đã hoàn thành');


