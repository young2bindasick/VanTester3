use master
drop database ASMFN_JAVA5
create database ASM_JAVA5
use ASM_JAVA5
create table Categories(
	Category_Id varchar(5) not null,
	Name nvarchar(30) not null,
	primary key (Category_Id)
)

create table Products(
	Product_Id int identity(1,1) not null,
	Name nvarchar(60) not null,
	Image1 varchar(65),
	Image2 varchar(65),
	Image3 varchar(65),
	Image4 varchar(65),
	Color nvarchar(20),
	Price decimal(12,2) not null,
	Quantity int not null,
	Manufactor nvarchar(40),
	Description nvarchar(2000),
	Discount int not null,
	Category_Id varchar(5) not null,
	primary key (Product_Id),
	constraint fk_products_category_id
	foreign key (Category_Id) references Categories(Category_Id)
)

create table Accounts(
	Username varchar(30) not null,
	Password varchar(30) not null,
	Fullname nvarchar(40),
	Phonenumber varchar(10),
	Email varchar(30) not null,
	Photo varchar(30),
	Admin bit,
	Activated bit,
	primary key (Username)
)

create table Orders(
	Order_Id int identity(1,1),
	Username varchar(30) not null,
	Create_Date date not null,
	Address nvarchar(200) not null,
	Phonenumber varchar(10),
	Order_Note nvarchar(100),
	Order_Status int,
	Price decimal(12,2),
	primary key (Order_Id),
	constraint fk_orders_username
	foreign key (Username) references Accounts(Username)
)

create table Orders_Detail(
	Orders_Detail_Id int identity(1,1),
	Order_Id int,
	Product_Id int,
	Quantity int,
	primary key (Orders_Detail_Id),
	constraint fk_orders_detail_order_id
	foreign key (Order_Id) references Orders (Order_Id),
	constraint fk_orders_detail_product_id
	foreign key (Product_Id) references Products (Product_Id)
)

create table Verify_Accounts(
	Username varchar(30) unique,
	Verify_Code varchar(30),
	primary key (Username),
	constraint fk_Verify_Accounts_Accounts
	foreign key (Username) references Accounts (Username)
)

insert into Categories
values('LAP','Laptop'),
	  ('PC',N'Máy tính để bàn'),
	  ('PHONE','Smartphone'),
	  ('GEAR',N'Linh kiện máy tính'),
	  ('MOUSE',N'Chuột + lót chuột'),
	  ('KEYB',N'Bàn phím'),
	  ('HP','Tai nghe'),
	  ('SPKER','Loa'),
	  ('CHGER',N'Bộ sạc'),
	  ('OTHER',N'Phụ kiện khác')

insert into Accounts
values('quytv22871','123456',N'Trương Văn Quý','0797157720','quytvps22871@fpt.edu.vn','avatar1.png',1,1),
	  ('dongnt12312','123456',N'Ngô Trường Đông','0123456789','dongntps22616@fpt.edu.vn','avatar2.png',1,1),
	  ('vanpl22889','123456',N'Phùng Long Vân','0321574889','vanplps22889@fpt.edu.vn','avatar3.png',1,1)
	 

insert into Products(name,image1,image2,image3,image4,color,price,quantity,manufactor,description,discount,category_id)
values
	  ('Samsung Galaxy S22 Ultra 5G 128GB','samsung-galaxy-s22-ultra.jpg','samsung-galaxy-s22-ultra.jpg','samsung-galaxy-s22-ultra.jpg','samsung-galaxy-s22-ultra.jpg',N'Đen',30990000,10,N'NSX X',N'Sở hữu một diện mạo đầy nổi bật',0,'PHONE'),
	  ('iPhone 11 64GB','iphone-11.jpg','iphone-11.jpg','iphone-11.jpg','iphone-11.jpg',N'Đen',14990000,20,N'NSX X',N'Nâng cấp mạnh mẽ về camera',0,'PHONE'),
	  ('OPPO Reno7 Z 5G','oppo-reno7.jpg','oppo-reno7.jpg','oppo-reno7.jpg','oppo-reno7.jpg',N'Đen',10490000,25,N'NSX X',N'Dễ dàng nổi bật giữa đám đông',0,'PHONE'),
	  ('Xiaomi Redmi Note 11 Pro','xiaomi-redmi-note-11-pro-4g.jpg','xiaomi-redmi-note-11-pro-4g.jpg','xiaomi-redmi-note-11-pro-4g.jpg','xiaomi-redmi-note-11-pro-4g.jpg',N'Đen',7190000,14,N'NSX X',N'Thiết kế cứng cáp, cầm nắm rất đầm tay',0,'PHONE'),
	  ('iPhone 13 Pro Max 128GB','iphone-13-pro-max-xanh.jpg','iphone-13-pro-max-xanh.jpg','iphone-13-pro-max-xanh.jpg','iphone-13-pro-max-xanh.jpg',N'Đen',30990000,15,N'NSX X',N'Thiết kế đẳng cấp hàng đầu',7,'PHONE'),
	  ('Samsung Galaxy A52s 5G 128GB','samsung-galaxy-a52s-5g.jpg','samsung-galaxy-a52s-5g.jpg','samsung-galaxy-a52s-5g.jpg','samsung-galaxy-a52s-5g.jpg',N'Đen',8990000,25,N'NSX X',N'Thiết kế đặc trưng Galaxy A',0,'PHONE'),
	  (N'Bộ sạc IPhone kèm cáp Lighning Genshai','new-project.jpg','new-project.jpg','new-project.jpg','new-project.jpg',N'Đen',150000,89,N'NSX X',N'Bộ sạc cho Iphone',5,'CHGER'),
	  (N'Bộ sạc nhanh cho Iphone kèm cáp','new-iphone.jpg','new-iphone.jpg','new-iphone.jpg','new-iphone.jpg',N'Đen',450000,58,N'NSX X',N'Bộ sạc nhanh cho Iphone',8,'CHGER'),
	  (N'iPhone 8 Plus 128GB','iphone-8-plus-gold.jpg','iphone-8-plus-gold.jpg','iphone-8-plus-gold.jpg','iphone-8-plus-gold.jpg',N'Vàng',3190000,58,N'NSX X',N'Thiết Kế Hoàn Thiện',8,'PHONE')
	



go
create procedure CreateOrder(
@Username varchar(30),
@Create_Date date, 
@Address nvarchar(200),
@Phonenumber varchar(10), 
@Order_Note nvarchar(100), 
@Order_Status int, 
@Price decimal(12,2),
@Output int output)
as
begin
declare @OutputOrderId Table(id int)
insert into Orders(Username,Create_Date,Address, Phonenumber, Order_Note, Order_Status,Price)
output inserted.Order_Id into @OutputOrderId(id)
values(@Username,@Create_Date,@Address,@Phonenumber,@Order_Note,@Order_Status,@Price)
set @Output = (select id from @OutputOrderId)
return @Output
end


declare @o int
exec @o= CreateOrder'quytvps22871','06-13-2023',N'TPHCM','0123456789','None',1,1000000,null
select @o
