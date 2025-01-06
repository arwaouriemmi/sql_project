-- Créer une vue pour joindre les données de température avec les données de consommation, incluant la région
WITH temperature_consumption AS (
    SELECT
        t."Date",
        t."Code INSEE région" AS region_code,
        t."Région" ,
        t.temperature_min,
        t.temperature_max,
        t.temperature_avg,
        c.consommation_GWh,
        c.pompage_GWh,
        c.Thermique_GWh,
        c.Nucléaire_GWh,
        c.Eolien_GWh,
        c.Solaire_GWh,
        c.Hydraulique_GWh,
        c.Bioénergies_GWh,
        c.Production_Totale_GWh
    FROM cleaned_température t
    LEFT JOIN Energie_Gwh c
    ON t."Date" = c.Date
    AND t."Code INSEE région" = c."Code INSEE région" -- Jointure sur la région
    WHERE t."Date" BETWEEN '2016-01-01' AND '2022-12-31'
)
SELECT * FROM temperature_consumption

