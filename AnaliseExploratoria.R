# carregando pacotes
library(readxl)
library(tidyverse)
library(dplyr)
# lendo a base de dados
base = read_xlsx("Base_trabalho.xlsx")
base$escolaridade = as.factor(base$escolaridade)
base$idade = as.factor(base$idade)
base$filhos = as.factor(base$filhos)
