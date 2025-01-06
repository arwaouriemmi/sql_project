{% set regions = [
    'Hauts-de-France',
    'Pays de la Loire',
    'Bretagne',
    'Auvergne-Rhône-Alpes',
    'Nouvelle-Aquitaine',
    'Occitanie',
    'Provence-Alpes-Côte d''Azur',
    'Centre-Val de Loire',
    'Bourgogne-Franche-Comté',
    'Île-de-France',
    'Normandie',
    'Grand Est'
] %}

WITH consommation AS (
    SELECT
        "Date",
        "Région",
        "Consommation_GWh"
    FROM Energie_Gwh
)
SELECT
    "Date",
    {% for region in regions %}
        SUM(CASE WHEN "Région" = '{{ region }}' THEN "Consommation_GWh" ELSE 0 END) AS "{{ region }}"{% if not loop.last %},{% endif %}
    {% endfor %}
FROM consommation
GROUP BY "Date"
ORDER BY "Date"
