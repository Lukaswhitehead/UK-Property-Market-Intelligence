SELECT
	YEAR(TransferDate) AS Year,
	PropertyType,
	COUNT(*) AS TransactionsCount,
	AVG(Price) AS AveragePrice
FROM PropertySales_Clean
GROUP BY 
	YEAR(TransferDate),
	PropertyType
ORDER BY 
	Year ASC,
	PropertyType ASC;