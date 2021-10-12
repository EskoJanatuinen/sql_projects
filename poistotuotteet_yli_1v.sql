select
    tuote,
    nimi,
    hyllypaikka
from
    varsaldo
    left join tuote t on t.numero = varsaldo.tuote
where
    t.verkkokauppa = 1
    and t.paaryhma = '11'
    and perustettupvm > 20201012
    and passiivinen = 0
    and saldo > 0
    and varattu = 0
order by
    hyllypaikka asc