# Comparação de Algoritmos de Ordenação

Este projeto realiza a implementação e análise de desempenho de dois algoritmos clássicos de ordenação: **Selection Sort** e **Insertion Sort**. O objetivo é comparar a eficiência de ambos utilizando diferentes tamanhos de instâncias numéricas.

##  Estrutura do Projeto

- `main.cpp`: Implementação em C++ dos algoritmos e medição de tempo.
- `Makefile`: Script para compilação simplificada utilizando o `gcc`.
- `caso_teste_imprimir_tempo_execucao.ps1`: Script PowerShell para automatizar os testes em todas as instâncias.
- `instancias-num/`: Pasta contendo os arquivos de entrada (`.in`) com as listas de números.
- `log_execucao_tempos.txt`: Registro consolidado dos tempos de execução após os testes.
- `saidas/`: Pasta gerada automaticamente para armazenar os resultados ordenados.

##  Compilação

Para compilar o projeto no Windows, utilize o comando abaixo (requer MinGW):

```powershell
mingw32-make
```

Isso gerará o executável `sorting.exe`.

##  Como Executar

### Automação de Testes
Para rodar todos os testes de uma vez e gerar o log de tempos, execute o script PowerShell:

```powershell
./caso_teste_imprimir_tempo_execucao.ps1
```

##  Resultados
Os tempos de execução de cada algoritmo para cada instância são anexados ao arquivo `log_execucao_tempos.txt`, permitindo uma análise comparativa direta da complexidade prática dos algoritmos implementados.
