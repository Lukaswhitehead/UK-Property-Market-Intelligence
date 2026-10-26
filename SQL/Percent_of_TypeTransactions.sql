WITH 
ByYear AS (
SELECT
	YEAR(TransferDate) AS Year,
	COUNT(*) AS YearlyTransactions
FROM PropertySales_Clean
GROUP BY YEAR(TransferDate)
),
ByType AS (
SELECT
	YEAR(TransferDate) AS Year,
	PropertyType,
	COUNT(*) AS YearlyTypeTransactions,
	AVG(Price) AS AveragePrice
FROM PropertySales_Clean
GROUP BY 
	YEAR(TransferDate),
	PropertyType
)
SELECT
	ByType.Year,
	ByType.PropertyType,
	ByType.AveragePrice,
	ByType.YearlyTypeTransactions,
	ByYear.YearlyTransactions,
	ROUND(CAST(ByType.YearlyTypeTransactions AS DECIMAL(12,4)) / ByYear.YearlyTransactions * 100,2) AS Percentage
FROM ByType
	LEFT JOIN ByYear 
	ON ByType.Year = ByYear.Year
ORDER BY 
	ByType.Year ASC,
	ByType.PropertyType ASC;