--dimcustomer
create table DimCustomer (
    CustomerId int primary key,
    FirstName varchar(60),
    LastName varchar(60),
    Age int,
    Gender varchar(10),
    City varchar(60),
    PhoneNumber varchar(20)
);

--dimproduct
create table DimProduct (
    ProductId int primary key,
    ProductName varchar(60),
    ProductCategory varchar(60),
    ProductUnitPrice int
);


--dimstatusorder
create table DimStatusOrder (
    StatusId int primary key,
    StatusOrder varchar(60),
    StatusOrderDesc varchar(60)
);

--factsalesorder
create table FactSalesOrder (
    OrderId int primary key,
    CustomerId int,
    ProductId int,
    Quantity int,
    Amount int,
    StatusId int,
    OrderDate date,
    foreign key (CustomerId) references DimCustomer(CustomerID),
    foreign key (ProductId) references DimProduct(ProductID),
    foreign key (StatusId) references DimStatusOrder(StatusID)
);
