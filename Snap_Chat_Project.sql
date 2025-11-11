create database snap_chat_db;
use snap_chat_db;

-- USERS
CREATE TABLE users (
    user_id VARCHAR(10) PRIMARY KEY,
    username VARCHAR(50) UNIQUE,
    email VARCHAR(100),
    phone VARCHAR(20),
    date_joined DATE,
    last_login DATETIME
);
INSERT INTO users VALUES
('U001','Vinay','vinaynarla1432@gmail.com','8247800463','2023-01-01','2025-10-14 10:00:00'),
('U002','Rohit','rohit12@gmail.com','9876543210','2023-02-10','2025-10-14 11:00:00'),
('U003','Priya','priya24@gmail.com','9123456780','2023-03-05','2025-10-14 09:30:00'),
('U004','Ananya','ananya11@gmail.com','9988776655','2023-04-15','2025-10-13 08:15:00'),
('U005','Amit','amit99@gmail.com','9012345678','2023-05-20','2025-10-12 20:45:00'),
('U006','Sneha','sneha@gmail.com','9456123780','2023-06-18','2025-10-12 21:30:00'),
('U007','Rakesh','rakesh@gmail.com','9321456780','2023-07-01','2025-10-14 13:00:00'),
('U008','Pooja','pooja@gmail.com','9876123450','2023-07-15','2025-10-14 14:00:00'),
('U009','Karan','karan@gmail.com','9123987456','2023-08-01','2025-10-14 15:00:00'),
('U010','Isha','isha@gmail.com','9988771122','2023-08-05','2025-10-14 16:00:00'),
('U011','Sahil','sahil@gmail.com','9876541230','2023-08-20','2025-10-14 17:00:00'),
('U012','Neha','neha@gmail.com','9123459876','2023-09-01','2025-10-14 18:00:00'),
('U013','Aditya','aditya@gmail.com','9012347890','2023-09-10','2025-10-14 19:00:00'),
('U014','Tanya','tanya@gmail.com','9988773344','2023-09-15','2025-10-14 20:00:00'),
('U015','Manish','manish@gmail.com','9876548901','2023-09-20','2025-10-14 21:00:00'),
('U016','Riya','riya@gmail.com','9123454321','2023-09-25','2025-10-14 22:00:00'),
('U017','Dev','dev@gmail.com','9012345671','2023-09-30','2025-10-14 23:00:00'),
('U018','Simran','simran@gmail.com','9988775566','2023-10-01','2025-10-15 00:00:00'),
('U019','Shivam','shivam@gmail.com','9876123490','2023-10-05','2025-10-15 01:00:00'),
('U020','Ankit','ankit@gmail.com','9123456789','2023-10-10','2025-10-15 02:00:00');

select * from users;