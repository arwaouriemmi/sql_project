WITH consommation_par_quart_jour AS (
    SELECT
        -- Quart (basé sur la région)
        CASE
            WHEN "Région" IN ('Hauts-de-France', 'Île-de-France', 'Provence-Alpes-Côte d''Azur') THEN 'Quart 1'
            WHEN "Région" IN ('Bretagne', 'Normandie', 'Pays de la Loire') THEN 'Quart 2'
            WHEN "Région" IN ('Auvergne-Rhône-Alpes', 'Occitanie', 'Grand Est') THEN 'Quart 3'
            ELSE 'Quart 4'
        END AS quart,

        -- Date pour regrouper par jour
        "Date",

        -- Sommes des consommations par type
        SUM(consommation_GWh) AS consommation_total_GWh,
        SUM(pompage_GWh) AS pompage_GWh,
        SUM(Thermique_GWh) AS Thermique_GWh,
        SUM(Nucléaire_GWh) AS Nucléaire_GWh,
        SUM(Eolien_GWh) AS Eolien_GWh,
        SUM(Solaire_GWh) AS Solaire_GWh,
        SUM(Hydraulique_GWh) AS Hydraulique_GWh,
        SUM(Bioénergies_GWh) AS Bioénergies_GWh,
        SUM(Production_Totale_GWh) AS Production_Totale_GWh
    FROM temperature_consumption
    GROUP BY
        quart,
        "Date"
)
SELECT * FROM consommation_par_quart_jour

