
-- Use the `ref` function to select from other models


WITH vue AS (
    -- Utilisation des données traitées de m2.sql
    SELECT
    "Code INSEE région",
    "Région",
    "Date",
    "Heure",
    "Consommation (MW)",
    "Thermique (MW)",
    "Nucléaire (MW)",
    "Eolien (MW)",
    "Solaire (MW)",
    "Hydraulique (MW)",
    "Pompage (MW)",
    "Bioénergies (MW)",
    "Ech. physiques (MW)",
    "Production Totale (MW)"

    FROM production_totale
)

SELECT  * FROM vue
