select
    count(*)
from
    varsaldo
    left join tuote t on t.numero = varsaldo.tuote
where
    t.verkkokauppa = 1
    and passiivinen = 0
    and varattu = 0
    and saldo >= 1