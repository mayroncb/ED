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

Para rodar uma bateria de testes básicos e gerar um log inicial de tempos, execute o script PowerShell:

```powershell
./caso_teste_imprimir_tempo_execucao.ps1
```

#### Geração de Log Completo (Novos Algoritmos)

Para realizar a execução em lote abrangendo todos os quatro algoritmos (Selection, Insertion, Merge e Quick Sort) e gerar o registro consolidado detalhado, utilize o novo script dedicado:

```powershell
./gerar_log_v3.ps1
```

*(Nota: Certifique-se de estar no mesmo diretório dos scripts ao executá-los).*

##  Resultados
Os tempos de execução de cada algoritmo para cada instância são anexados ao arquivo `log_tempos_execucao.txt`, permitindo uma análise comparativa direta da complexidade prática dos algoritmos implementados.

## Análise de Desempenho - Selection Sort, Insertion Sort, Merge Sort e Quick Sort

O estudo experimental foi conduzido empregando instâncias numéricas de tamanhos variados ($N \in \{10^3, 10^4, 10^5\}$), visando avaliar o comportamento empírico dos algoritmos implementados frente ao crescimento da carga de trabalho. Os resultados obtidos corroboram as expectativas teóricas estabelecidas pela análise de complexidade assintótica de tempo.

### Tabela 1: Comparação de Tempos de Execução (em segundos)

| Algoritmo | $N = 10^3$ | $N = 10^4$ | $N = 10^5$ | Complexidade |
| :--- | :--- | :--- | :--- | :--- |
| **Selection Sort** | 0.0003 | 0.0310 | 3.246 | $\mathcal{O}(n^2)$ |
| **Insertion Sort** | 0.0001 | 0.0114 | 1.279 | $\mathcal{O}(n^2)$ |
| **Merge Sort** | 0.0002 | 0.0020 | 0.023 | $\mathcal{O}(n \log n)$ |
| **Quick Sort** | 0.00004 | 0.0006 | 0.017 | $\mathcal{O}(n \log n)$ |

### Discussão dos Resultados

A partir dos dados empíricos coletados, destacam-se as seguintes observações analíticas:

*   **Dicotomia de Desempenho (Classes de Complexidade):** A discrepância entre as abordagens quadráticas e linear-logarítmicas torna-se evidente e substancial nas instâncias de maior magnitude. No cenário com $N = 100.000$, o *Quick Sort* exibiu um tempo de execução aproximadamente 190 vezes inferior ao do *Selection Sort*. Tal comportamento ratifica a importância crítica da escolha algorítmica apropriada ao lidar com grandes volumes de dados, onde a assíntota domina o custo computacional.
*   **Comportamento Intra-classe (Algoritmos Quadráticos):** Embora pertencentes à mesma classe de complexidade assintótica $\mathcal{O}(n^2)$, nota-se uma vantagem empírica consistente do *Insertion Sort* em relação ao *Selection Sort* (com um fator de aceleração na ordem de $2.5\times$). Este fenômeno deve-se à natureza adaptativa do *Insertion Sort*, que pode interromper precocemente o laço interno ao encontrar a posição correta, contrastando com o número determinístico e invariável de comparações inerente ao *Selection Sort*.
*   **Superioridade Prática do Quick Sort:** O *Quick Sort* obteve o menor tempo absoluto em todos os estratos experimentais. A despeito da possibilidade teórica de degradação quadrática em seu pior caso, sua eficiência notável na prática sobre entradas aleatórias é justificada por um fator constante ínfimo nas suas operações internas e por apresentar excelente localidade de referência em memória cache.
*   **Análise de Escalabilidade Empírica:** A validação empírica do comportamento quadrático é plenamente observável ao analisarmos a progressão do tamanho da entrada. Ao incrementarmos $N$ em um fator de 10 (passando de $10^4$ para $10^5$), os algoritmos de classe $\mathcal{O}(n^2)$ sofreram um acréscimo temporal de aproximadamente um fator de 100 (i.e., $10^2$). Em contrapartida, os algoritmos com complexidade $\mathcal{O}(n \log n)$ mantiveram um escalonamento significativamente mais atenuado, atestando sua robustez computacional.