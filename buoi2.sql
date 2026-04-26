create database book_worm;
use book_worm;

create table authors (
    id int primary key auto_increment,
    full_name varchar(100) not null,
    birth_year int,
    nationality varchar(50)
);

create table books (
    id int primary key auto_increment,
    book_name varchar(150) not null,
    category varchar(100),
    author_id int,
    price decimal(10,2) not null default 0,
    publish_year int,
    
    check (price >= 0),
    foreign key (author_id) 
    references authors(id)
    on delete set null
    on update cascade
);

create table customers (
    id int primary key auto_increment,
    full_name varchar(100) not null,
    email varchar(100) not null unique,
    phone varchar(15) not null unique,
    registration_date datetime default current_timestamp
);

insert into authors (full_name, birth_year, nationality)
values
('nguyen nhat anh', 1955, 'viet nam'),
('agatha christie', 1890, 'anh'),
('dale carnegie', 1888, 'my');

insert into books (book_name, category, author_id, price, publish_year)
values
('mat biec', 'van hoc', 1, 50000, 1990),
('toi thay hoa vang tren co xanh', 'van hoc', 1, 60000, 2010),
('murder on the orient express', 'trinh tham', 2, 120000, 1934),
('and then there were none', 'trinh tham', 2, 110000, 1939),
('dac nhan tam', 'ky nang', 3, 90000, 1936),
('quang ganh lo di va vui song', 'ky nang', 3, 85000, 1948),
('chiec la cuoi cung', 'van hoc', 1, 40000, 1907),
('the abc murders', 'trinh tham', 2, 95000, 1936);

insert into customers (full_name, email, phone) 
values
('tran van a', 'a@gmail.com', '0900000001'),
('le thi b', 'b@gmail.com', '0900000002'),
('pham van c', 'c@gmail.com', '0900000003'),
('hoang thi d', 'd@gmail.com', '0900000004'),
('nguyen van e', 'e@gmail.com', '0900000005');

-- dong vai nhan vien lo dang
insert into customers (full_name, email, phone) values
('test trung email', 'a@gmail.com', '0900000099');

-- câu lệnh trên sẽ bị lỗi vì:
-- cột email trong bảng customers được thiết lập unique
-- nên không cho phép 2 bản ghi có cùng email

-- mysql sẽ báo lỗi dạng:
-- duplicate entry 'a@gmail.com' for key 'customers.email'

-- điều này chứng minh ràng buộc unique đã hoạt động đúng