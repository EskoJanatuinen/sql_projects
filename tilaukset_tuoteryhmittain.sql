SELECT
    tosite AS Tosite,
    paaryhma AS Pääryhmä,
    COUNT(*) AS Lkm
FROM
    tuotemyy
WHERE
    myymala = 10
    AND pvm BETWEEN 20210111
    AND 20211130
GROUP BY
    tosite,
    paaryhma
ORDER BY
    tosite,
    paaryhma;