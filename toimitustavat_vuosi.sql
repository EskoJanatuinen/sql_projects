SELECT
    CASE
        toimitustapa
        WHEN '5' THEN 'Nouto myymälästä, Turku'
        WHEN '11' THEN 'Nouto myymälästä, Kierke'
        WHEN '20' THEN 'Virhe tilauksessa'
        WHEN '30' THEN 'Matkahuolto nouto'
        WHEN '31' THEN 'Matkahuolto automaatti'
        WHEN '32' THEN 'Matkahuollon kotiinkuljetus'
        WHEN '80' THEN 'Kierrätyskeskus kotiinkuljetus'
        WHEN '90' THEN 'Nouto Postista'
        WHEN '91' THEN 'Nouto Postin automaatista'
        WHEN '92' THEN 'Postin kotiinkuljetus'
        WHEN '94' THEN 'Posti - Pikkupaketti'
    END AS Toimitustavat,
    COUNT(*) as Määrä
FROM
    mt
WHERE
    year(luontipaiva) = 2021
    AND NOT toimitustapa = 20 -- Virhe tilauksessa
    AND NOT toimitustapa = 1 -- Testitilaus
GROUP BY
    toimitustapa