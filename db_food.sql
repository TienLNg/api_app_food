

CREATE TABLE user( 
	user_id int primary key auto_increment,
	full_name VARCHAR (50) not NULL,
	email varchar(30) not NULL,
	PASSWORD varchar (50) not NULL
)

INSERT INTO user(full_name, email, password)
VALUES
    ('Minh Hân', 'minhhan@example.com', 'password123'),
    ('Bảo Ngọc', 'baongoc@example.com', 'securepassword'),
    ('Nam Anh', 'nam.anh@example.com', 'letmein'),
    ('Nam Minh', 'minhnam@example.com', 'mein123'),
    ('Hoai Anh', 'hoaianhle@example.com', 'letin3243'),
    ('Anh Hân', 'anhhanle@example.com', 'letm56456'),
    ('Hoàng Hà', 'hanguyen@example.com', 'emen2345');


CREATE TABLE restaurant( 
	res_id int primary key auto_increment,
	res_name varchar (30) not null,
	image varchar(250) not null,
	description varchar(250) not null
)


INSERT INTO restaurant (res_name, image, description)
VALUES
    ('Restaurant A', 'http://example.com/restaurantA.jpg', 'A cozy restaurant with a variety of cuisines.'),
    ('Restaurant B', 'http://example.com/restaurantB.jpg', 'An elegant dining experience with a focus on seafood.'),
    ('Restaurant C', 'http://example.com/restaurantC.jpg', 'A family-friendly place known for its pizza and pasta.'),
     ('Restaurant D', 'http://example.com/restaurantA.jpg', 'A cozy restaurant with a variety of cuisines.'),
    ('Restaurant E', 'http://example.com/restaurantB.jpg', 'An elegant dining experience with a focus on seafood.');



CREATE TABLE food(
	food_id int primary key auto_increment,
    food_name varchar(250) not null,
    image varchar(250) not null,
    price float not null,
    desc_food varchar(250) not null,
    type_id int ,
    foreign key (type_id) references food_type(type_id)
)

INSERT INTO food(food_name,image,price,desc_food,type_id)
VALUES
('food 1','food 1 img',1100,'good',1),
('food 2','food 2 img',1150,'good',3),
('food 2','food 2 img',1200,'nice',2),
('food 3','food 3 img',1350,'great',2),
('food 3','food 3 img',1300,'good',3);



CREATE TABLE sub_food(
	sub_id int primary key auto_increment,
    sub_name varchar(255) not null,
    sub_price float,
    food_id int,
    foreign key (food_id) references food(food_id)
)

INSERT INTO sub_food(sub_name ,sub_price ,food_id )
VALUES
('sub 1',1000,1),
('sub 1',1150,3),
('sub 2',1200,2),
('sub 2',1300,4),
('sub 3',930,1),
('sub 3',740,2),
('sub 3',1300,3),
('sub 3',1350,4);


    
    
CREATE TABLE like_res(
	like_res_id INT PRIMARY KEY auto_increment,
	user_id INT,
	FOREIGN KEY(user_id) REFERENCES user(user_id),
	res_id INT,
	FOREIGN KEY(res_id) REFERENCES restaurant(res_id),
	date_like datetime
)

INSERT INTO like_res(user_id,res_id,date_like)
VALUES
(1,1,'2012-11-10'),
(1,3,'2011-09-09'),
(2,2,'2013-10-01'),
(2,4,'2020-11-02'),
(3,1,'2019-02-03'),
(3,2,'2020-07-07'),
(3,4,'2021-07-17'),
(3,4,'2022-08-12'),
(4,4,'2022-10-10');



CREATE TABLE rate_res(
	like_res_id INT PRIMARY KEY auto_increment,
	user_id INT,
	FOREIGN KEY(user_id) REFERENCES user(user_id),
	res_id INT,
	FOREIGN KEY(res_id) REFERENCES restaurant(res_id),
	amount INT,
	date_rate datetime
)

INSERT INTO rate_res(user_id,res_id,amount,date_rate)
VALUES
(1,1,5,'2022-11-02'),
(1,2,3,'2021-07-05'),
(1,3,5,'2022-02-12'),
(2,3,4,'2022-09-12'),
(3,1,3,'2019-09-08'),
(4,2,5,'2023-12-12');




CREATE TABLE orders(
	order_id int primary key auto_increment,
	user_id INT,	
	FOREIGN KEY(user_id) REFERENCES user(user_id),
	food_id INT,
	FOREIGN KEY(food_id) REFERENCES food(food_id),
	amount INT,
	code VARCHAR(250),
	arr_sub_id VARCHAR(250)
)

insert INTO orders(user_id,food_id,amount,code,arr_sub_id)
VALUES
(1,1,10,'discout 10%','arr_sub_id 1'),
(1,2,12,'discout 5%','arr_sub_id 2'),
(2,2,15,'discout 12%','arr_sub_id 2'),
(2,3,3,'discout 2%','arr_sub_id 3'),
(3,1,10,'discout 20%','arr_sub_id 1'),
(3,2,7,'discout 7%','arr_sub_id 4'),
(3,3,18,'discout 3%','arr_sub_id 5');


CREATE TABLE food_type(
	type_id INT PRIMARY KEY auto_increment,
	type_name VARCHAR(250)
)

INSERT INTO food_type(type_name)
VALUES
('loại 1'),
('loại 2'),
('loại 3'),
('loại 4'),
('loại 5');
	


