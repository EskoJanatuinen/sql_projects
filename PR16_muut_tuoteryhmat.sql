SELECT
    t1.paaryhma AS PR,
    t2.paaryhma AS Muu_PR,
    COUNT(DISTINCT t2.tuote) AS Lkm
FROM
    tuotemyy t1
    INNER JOIN tuotemyy t2 ON t1.tosite = t2.tosite
    AND t1.kassa = t2.kassa -- tarvitaan, sillä sama tositenumero voi olla usealla kassalla
WHERE
    t1.myymala = 10
    AND t2.myymala = 10
    AND t1.pvm = 20211101
    AND t2.pvm = 20211101
    AND PR = 16 -- 16=kirjat -> vaihda PR tarvittaessa
    AND Muu_PR != 32 -- 32=toimitukset -> suodatetaan pois
    AND PR != Muu_PR
GROUP BY
    PR,
    Muu_PR
ORDER BY
    Lkm DESC,
    Muu_PR ASC;