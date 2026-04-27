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

Análise de Desempenho

Os testes foram realizados com instâncias de tamanhos $10^3$, $10^4$ e $10^5$. Os resultados demonstram a eficiência teórica na prática:Comparação de Tempos (Médias)Algoritmo1.000 itens10.000 itens100.000 itensComplexidadeSelection Sort0.0003s0.0310s3.246s$O(n^2)$Insertion Sort0.0001s0.0114s1.279s$O(n^2)$Merge Sort0.0002s0.0020s0.023s$O(n \log n)$Quick Sort0.00004s0.0006s0.017s$O(n \log n)$Principais ConclusõesQuadráticos vs Logarítmicos: Para a maior instância ($100.000$ números), o Quick Sort foi aproximadamente 190 vezes mais rápido que o Selection Sort. Isso ilustra o impacto da complexidade algorítmica em grandes volumes de dados.Selection vs Insertion: O Insertion Sort foi consistentemente cerca de 2.5x mais rápido que o Selection Sort. Isso ocorre porque o Insertion Sort realiza menos trocas e pode interromper as comparações internas antecipadamente em partes já ordenadas do array.Eficiência do Quick Sort: O Quick Sort apresentou o melhor desempenho absoluto em todos os cenários, confirmando sua eficiência prática em instâncias aleatórias devido ao baixo custo de suas operações internas.Escalabilidade: Enquanto os algoritmos $O(n^2)$ viram seu tempo de execução aumentar em ~100x quando a entrada aumentou 10x (comportamento quadrático), os algoritmos $O(n \log n)$ mantiveram um crescimento muito mais controlado, tornando-os viáveis para sistemas de grande escala.