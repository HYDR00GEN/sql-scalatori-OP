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

select scalatore.cf, count(distinct scalata.nazione)
from scalatore join scalata on scalatore.cf = scalata.scalatore
    join nazione on scalata.nazione = nazione.nome
where scalatore.annonascita < 1980
group by scalatore.cf, nazione.continente

/**  3 - Calcolare	le	nazioni	(mostrando,	per	ciascuna,	anche	il	
continente)	nelle	quali	è	stata	effettuata	almeno	una	scalata	
da	uno	scalatore	minorenne **/


select count(nazione.nome) as scalatoriMaggiorenni, nazione.continente
from scalatore
    join scalata on scalata.scalatore = scalatore.cf
    join nazione on scalata.nazione = nazione.nome
where (scalata.anno - scalatore.annonascita) <= 18
group by nazione.nome

/** 4 - Per	ogni	nazione,	calcolare	il	numero	di	scalate	effettuate	da	
scalatori	nati	in	quella	nazione **/

select scalata.nazione, count(scalata.scalatore) as ScalatoriNellaPropiaNazione
from scalatore
    join scalata on scalata.scalatore = scalatore.cf
    join nazione on scalata.nazione = nazione.nome
where scalatore.nazionenascita = scalata.nazione
group by scalata.nazione

/** 5 -  Per	ogni	continente,	calcolare	il	numero	di	scalate	effettuate	
da	scalatori	nati	in	una	nazione	di	quel	continente**/

select nazione.continente, count( distinct scalatore.cf) as ScalatoriInStessoContinente
from scalatore 
    join nazione on scalatore.nazionenascita = nazione.nome
    join scalata on scalata.scalatore = scalatore.cf
    join nazione n2 on scalata.nazione = n2.nome
where nazione.continente = n2.continente
group by nazione.continente

/** 6 - Calcolare	codice	fiscale,	nazione	di	nascita,	continente	di	
nascita	di	ogni	scalatore	nato	in	un	continente	diverso	
dall’America,	e,	solo	se	egli	ha	effettuato	almeno	una	scalata,	
affiancare	queste	informazioni	alle	nazioni	in	cui	ha	effettuato	
scalate **/

select scalatore.cf, scalatore.nazionenascita, nazione.continente , scalata.nazione as NazioneScalta
from scalatore 
    left join scalata on scalata.scalatore = scalatore.cf
    join nazione on scalatore.nazionenascita = nazione.nome
where nazione.continente != 'America' and scalata.nazione is not null
order  by scalatore.cf

/** 7 -  **/

