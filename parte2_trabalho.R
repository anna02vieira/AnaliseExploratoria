library(usethis)
use_git_config(user.name = "anna02vieira",user.email ="annav@idd.uff.br")
usethis::create_github_token()
gitcreds::gitcreds_set()
# Crie um novo script para realizar análises exploratórias.
# a. Importe a base e transforme as variáveis qualita$vas em fatores.
library(ggplot2)
library(tidyverse)
library(readxl)

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


# b. Obtenha média, 1o quar$l, mediana e 3o quar$l para as variáveis score_periculosidade, 
# idade e tempo_preso.
idade_media = mean(base$idade)
idade_primeiro_quartil =quantile(base$idade, 0.25)
idade_mediana =median(base$idade)
idade_terceiro_quartil = quantile(base$idade, 0.75)

score_media = mean(base$score_periculosidade)
score_primeiro_quartil =quantile(base$score_periculosidade, 0.25)
score_mediana =median(base$score_periculosidade)
score_terceiro_quartil = quantile(base$score_periculosidade, 0.75)

tempo_media = mean(base$tempo_preso)
tempo_primeiro_quartil =quantile(base$tempo_preso, 0.25)
tempo_mediana =median(base$tempo_preso)
tempo_terceiro_quartil = quantile(base$tempo_preso, 0.75)


# c. Faça um gráfico de dispersão entre tempo_preso e score_periculosidade.
# Gráfico de dispersão
ggplot(base, aes(x = tempo_preso, y = score_periculosidade)) +
  geom_point(color = "darkgreen", size = 3) +
  geom_smooth(method = "lm", se = FALSE, color = "red") +
  labs(title = "Gráfico de dispersão",
       x = "Tempo de prisão (em meses)",
       y = "Score de periculosidade")

# d. Calcule a correlação entre as duas variáveis usando a função cor().
cov(base$tempo_preso, base$score_periculosidade)

# e. Obtenha variância, desvio padrão e amplitude para as variáveis
# score_periculosidade, idade e tempo_preso.
# Variância
var_score = var(base$score_periculosidade)
var_idade = var(base$idade)
var_tempo = var(base$tempo_preso)

# Desvio padrão
sd_score = sd(base$score_periculosidade)
sd_idade = sd(base$idade)
sd_tempo = sd(base$tempo_preso)

# Amplitude (máximo - mínimo)
max_min_socre = range(base$score_periculosidade)           
amplitude_score = diff(range(base$score_periculosidade))     

max_min_idade = range(base$idade)
amplitude = diff(range(base$idade))

max_min_tempo = range(base$tempo_preso)
amplitude = diff(range(base$tempo_preso))

