library(usethis)
use_git_config(user.name = "anna02vieira",
               user.email ="annav@id.uff.br")
usethis::create_github_token()
gitcreds::gitcreds_set()

# carregando pacotes 
library(readxl)
library(tidyverse)
library(dplyr)
# lendo a base de dados
base = read_xlsx("Base_trabalho.xlsx")
base$escolaridade = factor(base$escolaridade,
                           levels = c(1,2,3),
                           labels = c("Fundamental","Médio","Superior"))
base$sexo = factor(base$sexo,
                   levels = c(1,0),
                   labels = c("Masculino", "Feminino"))

base$filhos = factor(base$filhos,
                     levels = c(1,0),
                     labels = c("Sim","Não"))

base$casado = factor(base$casado,
                     levels = c(1,0),
                     labels = c("Sim","Não"))



# quantos NA tem por váriavel
colSums(is.na(base))
# observamos que não há NA na base.

# histograma da variavel idade
histograma = base|>
  ggplot(mapping = aes(x = idade)) +
  geom_histogram(fill = "lightgreen",
                 color = "white")

# boxplot da variável tempo_preso.
boxplot_tempreso = base |>
  ggplot(mapping = aes(y = tempo_preso)) +
  geom_boxplot(fill = "lightgreen") +
  labs( y = "Tempo preso em meses")+
  theme_classic()

# boxplot da variável score_periculosidade por escolaridade.
boxplot_esc = base |>
  ggplot(mapping = aes( x = escolaridade, y = score_periculosidade))+
  geom_boxplot( fill = "lightgreen")+
  labs(x = " Escolaridade", y = "Score_periculosidade")

# gráfico de barras para a variável reincidente
# nao entendi

# figuras
dir.create("figuras")
ggsave("hist_idade.png", histograma, width = 6, height = 4, dpi = 300)
ggsave("boxplot_tempreso.png", boxplot_tempreso, width = 6, height = 4, dpi = 300)
ggsave("boxplot_esc.png", boxplot_esc, width = 6, height = 4, dpi = 300)



