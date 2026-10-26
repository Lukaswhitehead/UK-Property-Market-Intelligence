WITH PropertySummary AS (
    SELECT
        YEAR(TransferDate) AS Year,
        PropertyType,
        COUNT(*) AS TransactionsCount,
        AVG(Price) AS AveragePrice
    FROM PropertySales_Clean
    GROUP BY YEAR(TransferDate), PropertyType
),
MedianSummary AS (
    SELECT DISTINCT
        YEAR(TransferDate) AS Year,
        PropertyType,
        PERCENTILE_CONT(0.5)
            WITHIN GROUP (ORDER BY Price)
            OVER (
                PARTITION BY YEAR(TransferDate), PropertyType
            ) AS MedianPrice
    FROM PropertySales_Clean
)
SELECT
    p.Year,
    p.PropertyType,
    p.TransactionsCount,
    p.AveragePrice,
    m.MedianPrice
FROM PropertySummary p
JOIN MedianSummary m
    ON p.Year = m.Year
    AND p.PropertyType = m.PropertyType
ORDER BY p.Year, p.PropertyType;