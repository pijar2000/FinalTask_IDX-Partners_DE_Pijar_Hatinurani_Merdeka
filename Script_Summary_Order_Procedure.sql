create or replace function summary_order_status(
    StatusID INT
)
returns table (
    OrderId INT,
    CustomerName VARCHAR(60),
    Quantity INT,
    StatusOrder VARCHAR(60),
    ProductName VARCHAR(60)
)
as
begin
    return QUERY
    select
        f."OrderId",
        c."CustomerName",
        f."Quantity",
        s."StatusOrder",
        p."ProductName"
    from
        "FactSalesOrder" f
    inner join
        "DimCustomer" c ON f."CustomerId" = c."CustomerId"
    inner join
        "DimProduct" p ON f."ProductId" = p."ProductId"
    inner join
        "DimStatusOrder" s ON f."StatusId" = s."StatusId"
    where
        s."StatusId" = StatusID;
end;


call summary_order_status(4);
