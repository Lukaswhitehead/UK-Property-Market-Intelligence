SELECT
	YEAR(TransferDate) AS Year,
	COUNT(*) AS Total_Transactions,
	AVG(Price) AS Avg_Price
FROM PropertySales_Clean
GROUP BY YEAR(TransferDate)
ORDER BY Year ASC;