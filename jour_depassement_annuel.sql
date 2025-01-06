WITH cte1 AS (
    SELECT 
        datetrunc('day', "Date") AS date,
        SUM("Consommation (MW)") AS consommation,
        SUM("Production Totale (MW)")  AS prodRenouvelable
    FROM production_totale
    GROUP BY datetrunc('day', "Date")
),
cte2 AS (
    SELECT 
        date,
        SUM(consommation) OVER (PARTITION BY year(date) ORDER BY date) AS consommationCumulee,
        SUM(prodRenouvelable) OVER (PARTITION BY year(date) ORDER BY date) AS prodRenouvelableCumulee
    FROM cte1
)
SELECT 
    year(date) AS annee,
    MIN(date) AS "Jour de dépassement"
FROM cte2
WHERE consommationCumulee > prodRenouvelableCumulee
GROUP BY year(date)
ORDER BY annee


