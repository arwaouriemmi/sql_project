WITH consommation_par_quart_mois_temperature AS (
    SELECT
        qpm.quart,
        qpm.mois,
        qpt.temperature_intervalle,
        
        -- Sommes des consommations par type
        qpm.consommation_total_GWh,
        qpm.pompage_GWh,
        qpm.Thermique_GWh,
        qpm.Nucléaire_GWh,
        qpm.Eolien_GWh,
        qpm.Solaire_GWh,
        qpm.Hydraulique_GWh,
        qpm.Bioénergies_GWh,
        qpm.Production_Totale_GWh,
        
        qpt.temperature_min_moyenne,
        qpt.temperature_max_moyenne,
        qpt.temperature_avg_moyenne
    FROM quart_mois_data qpm
    JOIN quart_température_data qpt
    ON qpm.quart = qpt.quart
)
SELECT * FROM consommation_par_quart_mois_temperature

