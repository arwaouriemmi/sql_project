WITH vue AS (
SELECT 
    pc."Code INSEE région",
    pc."Région",
    pc.Mois,
    -- Statistiques instantanées (en MW)
    pc.Production_Min_MW,
    pc.Production_Max_MW,
    pc.Production_Moy_MW,
    pc.Consommation_Min_MW,
    pc.Consommation_Max_MW,
    pc.Consommation_Moy_MW,
    -- Données mensuelles (en GWh)
    ed.Consommation_GWhM,
    ed.Pompage_GWhM,
    ed.Thermique_GWhM,
    ed.Nucléaire_GWhM,
    ed.Eolien_GWhM,
    ed.Solaire_GWhM,
    ed.Hydraulique_GWhM,
    ed.Bioénergies_GWhM,
    ed.Production_Totale_GWhM,
    ed.Echanges_Physiques_GWhM
FROM 
    aggregation_prod_cons pc
LEFT JOIN 
    Energie_Gwhm ed
ON 
    pc."Code INSEE région" = ed."Code INSEE région" 
    AND pc."Région" = ed."Région" 
    AND pc.Mois = ed.Mois
ORDER BY 
    pc.Mois, 
    pc."Code INSEE région"
)

SELECT * FROM vue

