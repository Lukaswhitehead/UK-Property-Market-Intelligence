WITH DistrictSummary AS (
    SELECT
        YEAR(TransferDate) AS Year,
        District,
        COUNT(*) AS TransactionCount,
        AVG(Price) AS AveragePrice
    FROM PropertySales_Clean
    GROUP BY
        YEAR(TransferDate),
        District
),
DistrictMedian AS (
    SELECT DISTINCT
        YEAR(TransferDate) AS Year,
        District,
        PERCENTILE_CONT(0.5)
            WITHIN GROUP (ORDER BY Price)
            OVER (
                PARTITION BY YEAR(TransferDate), District
            ) AS MedianPrice
    FROM PropertySales_Clean
)
SELECT
    s.Year,
    s.District,
    s.TransactionCount,
    s.AveragePrice,
    m.MedianPrice
FROM DistrictSummary AS s
JOIN DistrictMedian AS m
    ON s.Year = m.Year
    AND s.District = m.District
ORDER BY
    s.Year ASC,
    s.District ASC;