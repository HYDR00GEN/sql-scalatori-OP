/** 1 - Calcolare	l'insieme	(non	il	multi-insieme)	delle	coppie	(A,B)	
tali	che	A	è	uno	scalatore	e	B	è	un	continente	in	cui	A	ha	
effettuato	una	scalata **/

select scalata.scalatore, count(distinct nazione.continente)
from scalata
    join nazione on scalata.nazione = nazione.nome
group by scalata.scalatore


/**  2 - Per	ogni	scalatore	nato	prima	del	1980,	calcolare	
tutti	i	continenti	in	cui	ha	effettuato	una	scalata,	
ordinando	il	risultato	per	codice	fiscale	e,	a	parità	di	
codice	fiscale,	per	il	nome	del	continente  **/

select scalata.scalatore, count(nazione.continente), scalatore.annonascita
from scalata
    join nazione on scalata.nazione = nazione.nome
    join scalatore on scalatore.cf = scalata.scalatore
where scalatore.annonascita < 1980
group by scalata.scalatore, scalatore.annonascita
order by scalata.scalatore

/**  3 - Calcolare	le	nazioni	(mostrando,	per	ciascuna,	anche	il	
continente)	nelle	quali	è	stata	effettuata	almeno	una	scalata	
da	uno	scalatore	minorenne **/




/** **/