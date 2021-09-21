SELECT
    DISTINCT luontipaiva AS Pvm,
    extraId AS Tilausnumero,
    KA_nimi AS Asiakas,
    toimitustapa AS Toimitustapa,
    numero AS Viite
FROM
    mt
    LEFT JOIN mtrivi ON mtrivi.tilausNro = mt.numero
WHERE
    toimitustapa > 20 -- myymälänoutoja
    AND NOT toimitustapa = 80 -- Kierken kotiinkuljetus
    AND mtrivi.varastopaikka > 200
    AND mtrivi.varastopaikka < 203
    AND luontipaiva >= '2021-08-01'
    AND luontipaiva <= '2021-08-31'
ORDER BY
    toimitustapa,
    extraId