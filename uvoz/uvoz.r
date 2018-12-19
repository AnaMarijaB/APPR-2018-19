sl <- locale("sl", decimal_mark=",", grouping_mark=".")

# Funkcija, ki uvozi prvo tabelo: prenočitvene zmogljivosti v Sloveniji
uvozi.tabela1 <- function() {
  data <- read_csv2("podatki/tabela 1.csv",
                    col_names = c("VRSTA_OBCINE", "VRSTA_OBJEKTA", "LETO", "ST_OBJEKTOV", "ST_SOB", "LEZISCA_SKUPAJ", "STALNA LEZISCA"),
                    locale = locale(encoding = "Windows-1250"), skip = 170, n_max = 1166, na = c("...","-", " "))
  return(data)
}
tabela1 <- uvozi.tabela1()

# Funkcija, ki uvozi drugo tabelo: Zadovoljstvo s turistično ponudbo
uvozi.tabela2 <- function() {
  data <- read_csv2("podatki/tabela 2.csv",
                    col_names = c("SEZONA", "VRSTA_OBCINE", "ELEMENT_TURISTICNE_PONUDBE", "OCENA_SKUPAJ", "ZELO_ZADOVOLJEN", "ZADOVOLJEN", "SREDNJE_ZADOVOLJEN", "Nisem zadovoljen", "Sploh nisem zadovoljen", "Ne morem oceniti"),
                    locale = locale(encoding = "Windows-1250"), skip = 32, n_max = 656, na = c("...","-", " "))
  return(data)
}
tabela2 <- uvozi.tabela2()

# Funkcija, ki uvozi tretjo tabelo: prihodi in prenočitve turistov
uvozi.tabela3 <- function() {
  data <- read_csv2("podatki/tabela 3.csv",
                    col_names = c("VRSTA_OBCINE", "TIP_OBJEKTA", "DRZAVA", "LETO", "PRIHODI", "PRENOCITVE"),
                    locale = locale(encoding = "Windows-1250"), skip = 4, n_max = 43522, na = c("...","-", " "))
  return(data)
}
tabela3 <- uvozi.tabela3()

# Funkcija, ki uvozi četrto tabelo: potovanja Slovencev
uvozi.tabela41 <- function() {
  data <- read_csv2("podatki/tabela 4.1..csv",
                    col_names = c("VRSTA_POTOVANJA", "DESTINACIJA", "SPOL", "LETO", "Potovanja (v 1000)", "Prenočitve (v 1000)", "Povprečni izdatki na turista na prenočitev (EUR)"),
                    locale = locale(encoding = "Windows-1250"), skip = 4, n_max = 66, na = c("...","-", " "))
  return(data)
}

tabela41 <- uvozi.tabela41()

uvozi.tabela42 <- function() {
  data <- read_csv2("podatki/tabela 4.2..csv",
                    col_names = c("VRSTA_POTOVANJA", "DESTINACIJA", "STAROST", "LETO", "Potovanja (v 1000)", "Prenočitve (v 1000)", "Povprečni izdatki na turista na prenočitev (EUR)"),
                    locale = locale(encoding = "Windows-1250"), skip = 4, n_max = 66, na = c("...","-", " "))
  return(data)
}

tabela42 <- uvozi.tabela42()

tabela4 <- inner_join(tabela41, tabela42, by= "VRSTA_POTOVANJA")  #to ni prava funkcija, kaj morem uporabit da dodam samo en stolpec po letih ?

#manjka mi še funkcija fill 
