WITH vue AS (
    SELECT
        "Date",
        consommation_totale_par_date,
        consommation_totale_par_date 
        - LAG(consommation_totale_par_date) OVER (ORDER BY "Date") AS variation_consommation_GWh
    FROM consommation_mois_ecoule

),

top_variations AS (
    -- Identifier les 20 plus grandes variations absolues
    SELECT
        "Date",
        consommation_totale_par_date,
        variation_consommation_GWh,
        ABS(variation_consommation_GWh) AS variation_absolue
    FROM vue
    ORDER BY variation_absolue DESC
    LIMIT 20
)

SELECT * 
FROM top_variations
ORDER BY variation_absolue DESC


