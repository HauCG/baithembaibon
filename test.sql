-- Thống kê số lượng tour của các thành phố
USE QuanLyMuaVe;
SELECT City.CityId, City.CityName, COUNT(Tours.TourID) AS TourCounts
FROM City
JOIN Location ON City.CityId = Location.CityId
JOIN Tours ON Location.LocationId = Tours.TypeOfTourId
GROUP BY City.CityId, City.CityName;

-- Tính số tour có ngày bắt đầu trong tháng 3 năm 2020 ( dùng count) -- 
USE QuanLyMuaVe;
SELECT Count(*) AS TourCounts
FROM Tours
WHERE TourStartDate BETWEEN '2024-11-01 00:00:00' AND '2024-11-30 23:59:59';


-- Tính số tour có ngày kết thúc trong tháng 4 năm 2020
USE QuanLyMuaVe;
SELECT Count(*) AS TourCounts
FROM Tours
WHERE TourEndDate BETWEEN '2025-3-01 00:00:00' AND '2025-3-31 23:59:59'
