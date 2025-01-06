WITH vue AS (
    SELECT
        "Code INSEE région",
        "Région",
        "Date" ,
        -- Somme pour chaque type d'énergie, avec traitement des valeurs non numériques
        "consommation_MWh" *0.001 AS consommation_GWh,
        "pompage_MWh"*0.001 AS pompage_GWh,
        "Thermique_MWh"*0.001 AS Thermique_GWh,
        "Nucléaire_MWh"*0.001 AS Nucléaire_GWh,
        "Eolien_MWh"*0.001 AS Eolien_GWh ,
        "Solaire_MWh" *0.001 AS Solaire_GWh,
        "Hydraulique_MWh"*0.001 AS Hydraulique_GWh,
        "Bioénergies_MWh"*0.001 AS Bioénergies_GWh,
        "Production_Totale_MWh"*0.001 AS Production_Totale_GWh,
        "echanges_physiques_MWh" *0.001 AS echanges_physiques_GWh,

    FROM Energie_Mwh
)

SELECT * FROM vue