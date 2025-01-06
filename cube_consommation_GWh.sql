WITH consumption_data AS (
    SELECT
        "Date",
        strftime('%Y-%m', "Date") AS mois,
        EXTRACT(YEAR FROM "Date") AS annee,
        "Région",
        CASE 
            WHEN "Région" IN ('Normandie','Pays de la Loire','Bretagne', 'Centre-Val de Loire') THEN 'NO'
            WHEN "Région" IN ('Grand Est', 'Bourgogne-Franche-Comté','Hauts-de-France') THEN 'NE'
            WHEN "Région" IN ('Auvergne-Rhône-Alpes', 'Provence-Alpes-Côte d''Azur') THEN 'SE'
            WHEN "Région" IN ('Occitanie', 'Nouvelle-Aquitaine') THEN 'SO'
            ELSE 'IdF'  -- Pour les régions spécifiques à chaque zone géographique
        END AS zone,
        -- Utilisation de la colonne déjà existante consommation_GWh
        COALESCE(TRY_CAST("consommation_GWh" AS DOUBLE), 0) AS consommation_en_GWh,
    FROM 
        {{ ref('Energie_Gwh') }}  
    WHERE 
        "Région" IS NOT NULL
        AND "Date" IS NOT NULL
        AND "Région" != 'Corse'  -- Exclusion de la Corse
)
SELECT
    "Date",
    mois,
    annee,
    "Région",
    zone,
    SUM(consommation_en_GWh) AS consommation_en_GWh,
FROM consumption_data
GROUP BY CUBE(
    "Date", 
    mois, 
    annee, 
    "Région", 
    zone
)
HAVING
    "Région" IS NOT NULL AND zone IS NOT NULL
ORDER BY 
    "Date", mois, annee, "Région", zone

