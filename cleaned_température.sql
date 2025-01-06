-- Créer une vue pour nettoyer et formater les données
WITH cleaned_temperature AS (
    SELECT
        CAST("Date" AS DATE) AS Date,
        "Code INSEE région",
        "Région",
        "TMin (°C)" AS temperature_min,
        "TMax (°C)" AS temperature_max,
        "TMoy (°C)" AS temperature_avg
    FROM températures
    WHERE "Date" IS NOT NULL AND "Région" IS NOT NULL
)
SELECT * FROM cleaned_temperature

