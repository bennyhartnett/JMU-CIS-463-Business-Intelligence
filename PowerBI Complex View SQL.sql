CREATE VIEW JohnHartnett AS

SELECT top 2000
	DimProduct.[ModelName]
      ,DimCustomer.[FirstName]
	  ,DimCustomer.[LastName]
      ,DimGeography.PostalCode
      ,DimSalesTerritory.SalesTerritoryCountry
      ,[SalesOrderNumber]
      ,[TotalProductCost]
      ,[SalesAmount]
      ,[TaxAmt]
      ,[Freight]
      ,[OrderDate]
      ,[DueDate]
      ,[ShipDate]
  FROM [AdventureWorksDW2016].[dbo].[FactInternetSales] inner join DimProduct on DimProduct.ProductKey = FactInternetSales.ProductKey 
  inner join dimdate on DimDate.DateKey = FactInternetSales.OrderDateKey
  inner join DimCustomer on DimCustomer.CustomerKey = FactInternetSales.CustomerKey
  inner join DimGeography on DimGeography.GeographyKey = DimCustomer.GeographyKey
  inner join DimSalesTerritory on DimSalesTerritory.SalesTerritoryKey = FactInternetSales.SalesTerritoryKey 
  where DimGeography.CountryRegionCode='US' 

  order by OrderDateKey desc