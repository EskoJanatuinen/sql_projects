SELECT
    CASE
        paaryhma
        WHEN '11' THEN 'Vaatteet'
        WHEN '12' THEN 'Asusteet'
        WHEN '13' THEN 'Kodintekstiilit'
        WHEN '14' THEN 'Kengät'
        WHEN '15' THEN 'Laukut'
        WHEN '16' THEN 'Kirjat'
        WHEN '17' THEN 'Urheilu'
        WHEN '18' THEN 'Arvotavara'
        WHEN '19' THEN 'Pientavara'
        WHEN '20' THEN 'Keittiö'
        WHEN '21' THEN 'Huonekalut'
        WHEN '22' THEN 'Rakennustarvike'
        WHEN '23' THEN 'Elektroniikka'
        WHEN '24' THEN 'Tietotekniikka'
        WHEN '25' THEN 'Kodinkoneet'
        WHEN '26' THEN 'Polkupyörät'
        WHEN '27' THEN 'Plan B'
        WHEN '28' THEN 'Näprä'
        ELSE 'Muut ryhmät'
    END AS Pääryhmä,
    COUNT(*) as Lkm,
    CAST(AVG(BruttoPaino) AS DECIMAL(10, 2)) AS Keskipaino
FROM
    tuote t
    LEFT JOIN varsaldo v ON v.tuote = t.numero
    AND t.perustettupvm >= 20210101
    AND t.perustettupvm <= 20211130
WHERE
    t.verkkokauppa = 1
    AND t.passiivinen = 0
    AND v.varasto = 10
GROUP BY
    paaryhma