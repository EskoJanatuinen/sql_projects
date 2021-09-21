select
    count(*)
from
    varsaldo
    left join tuote t on t.numero = varsaldo.tuote
where
    t.perustettupvm <= 20200501
    and t.paaryhma >= '11'
    and t.paaryhma <= '12'
    and t.verkkokauppa = 1
    and saldo = 1
    and varattu = 0
    and passiivinen = 0