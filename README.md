# Turizem v Sloveniji

Analiza podatkov s programom R, 2018/19

* [![Shiny](http://mybinder.org/badge.svg)](http://beta.mybinder.org/v2/gh/jaanos/APPR-2018-19/master?urlpath=shiny/APPR-2018-19/projekt.Rmd) Shiny
* [![RStudio](http://mybinder.org/badge.svg)](http://beta.mybinder.org/v2/gh/jaanos/APPR-2018-19/master?urlpath=rstudio) RStudio

## Tematika

V prvem delu bom analizirala prihode in prenočitve tujih turistov v Sloveniji ter njihovo zadovoljstvo s turistično ponudbo. V drugem delu bom analizirala potovanja prebivalcev Slovenije glede na destinacijo, spol in starost. Podatke bom pridobivala preko Sursa. 
Cilj naloge je ugotoviti kateri tip občin v Sloveniji je najbolj obiskan (zdraviliške občine, gorske občine, obmorske občine, meste občine in druge občine) ter katera starostna skupina prebivalcev Slovenije največ potuje ter koliko denarja porabi za nočitev.

## Podatki

Tabele bom pridobivala iz Sursa v obliki CSV ali HTML. Pridobljene podatke nameravam prikazati v obliki tabel. V zaključku bom najbolj turistične občine v Sloveniji tudi označila na zemljevidu. Podatki bodo predstavljeni za vsak tip občine posebej v različnih letih. Ker je na Sursu možno dobiti samo podatek za leto 2015 o zadovoljstvu tujih turistov v Sloveniji bom za to naredila drugo tabelo. Za potovanja slovenskih turistov bom dve tabli združila v eno, po tipu potovanj.

Tabela 1 je prenesena iz Sursa in vključuje prihode in prenočitve turistov po vrstah občin, po vrstah nastanitvenih objektov in po državah ter je sestavljena na naslednji način:

- stolpec 1: leto
- stolpec 2: vrste občin
- stolpec 3: vrste nastanitvenih objektov
- stolpec 4: države
- stolpec 5: prihodi turistov
- stolpec 6: prenočitve turistov

Tabela 2 je prenesena iz Sursa in vključuje Tuje turisti po sezoni anketiranja, vrsti občine, elementu turistične ponudbe in oceni zadovoljstva ter je sestavljena na naslednji način:

- stolpec 1: sezona
- stolpec 2: vrsta občine
- stolpec 3: element turistične ponudbe
- stolpec 4: ocena zadovoljstva

Tabela 3 pa se nanaša na turistična potovanja domačega prebivalstva in je sestavljena tako:

- stolpec 1: leto
- stolpec 2: vrsta turističnega potovanja
- stolpec 3: drstinacija (Slovenija, tujina)
- stolpec 4: starost 
- stolpec 5: število potovanj (v 1000)
- stolpec 6: izdatki na turista na prenočitev (EUR)

## Spletne povezave do tabel

https://pxweb.stat.si/pxweb/Dialog/varval.asp?ma=2164505S&ti=&path=../Database/Ekonomsko/21_gostinstvo_turizem/01_nastanitev/02_21645_nastanitev_letno/&lang=2

https://pxweb.stat.si/pxweb/Dialog/varval.asp?ma=2176606S&ti=&path=../Database/Ekonomsko/21_gostinstvo_turizem/10_tuji_turisti/15_21766_tuji_izdatki_vtis_zad/&lang=2

https://pxweb.stat.si/pxweb/Dialog/varval.asp?ma=2170201S&ti=&path=../Database/Ekonomsko/21_gostinstvo_turizem/06_potovanja/30_21702_znacilnosti_letno/&lang=2

https://pxweb.stat.si/pxweb/Dialog/varval.asp?ma=2170202S&ti=&path=../Database/Ekonomsko/21_gostinstvo_turizem/06_potovanja/30_21702_znacilnosti_letno/&lang=2


## Analiza

Pri analizi podatkov si nameravam ogledati, kako se spreminjajo količine skozi čas v različnih vrstah občin ter kako se spreminja statistika potovanj slovenskega prebivalstva.

## Program

Glavni program in poročilo se nahajata v datoteki `projekt.Rmd`.
Ko ga prevedemo, se izvedejo programi, ki ustrezajo drugi, tretji in četrti fazi projekta:

* obdelava, uvoz in čiščenje podatkov: `uvoz/uvoz.r`
* analiza in vizualizacija podatkov: `vizualizacija/vizualizacija.r`
* napredna analiza podatkov: `analiza/analiza.r`

Vnaprej pripravljene funkcije se nahajajo v datotekah v mapi `lib/`.
Podatkovni viri so v mapi `podatki/`.
Zemljevidi v obliki SHP, ki jih program pobere,
se shranijo v mapo `../zemljevidi/` (torej izven mape projekta).

## Potrebni paketi za R

Za zagon tega vzorca je potrebno namestiti sledeče pakete za R:

* `knitr` - za izdelovanje poročila
* `rmarkdown` - za prevajanje poročila v obliki RMarkdown
* `shiny` - za prikaz spletnega vmesnika
* `DT` - za prikaz interaktivne tabele
* `rgdal` - za uvoz zemljevidov
* `digest` - za zgoščevalne funkcije (uporabljajo se za shranjevanje zemljevidov)
* `readr` - za branje podatkov
* `rvest` - za pobiranje spletnih strani
* `reshape2` - za preoblikovanje podatkov v obliko *tidy data*
* `dplyr` - za delo s podatki
* `gsubfn` - za delo z nizi (čiščenje podatkov)
* `ggplot2` - za izrisovanje grafov
* `mosaic` - za pretvorbo zemljevidov v obliko za risanje z `ggplot2`
* `maptools` - za delo z zemljevidi
* `extrafont` - za pravilen prikaz šumnikov (neobvezno)

## Binder

Zgornje [povezave](#analiza-podatkov-s-programom-r-201819)
omogočajo poganjanje projekta na spletu z orodjem [Binder](https://mybinder.org/).
V ta namen je bila pripravljena slika za [Docker](https://www.docker.com/),
ki vsebuje večino paketov, ki jih boste potrebovali za svoj projekt.

Če se izkaže, da katerega od paketov, ki ji potrebujete, ni v sliki,
lahko za sprotno namestitev poskrbite tako,
da jih v datoteki [`install.R`](install.R) namestite z ukazom `install.packages`.
Te datoteke (ali ukaza `install.packages`) **ne vključujte** v svoj program -
gre samo za navodilo za Binder, katere pakete naj namesti pred poganjanjem vašega projekta.

Tako nameščanje paketov se bo izvedlo pred vsakim poganjanjem v Binderju.
Če se izkaže, da je to preveč zamudno,
lahko pripravite [lastno sliko](https://github.com/jaanos/APPR-docker) z želenimi paketi.

Če želite v Binderju delati z git,
v datoteki `gitconfig` nastavite svoje ime in priimek ter e-poštni naslov
(odkomentirajte vzorec in zamenjajte s svojimi podatki) -
ob naslednjem.zagonu bo mogoče delati commite.
Te podatke lahko nastavite tudi z `git config --global` v konzoli
(vendar bodo veljale le v trenutni seji).
