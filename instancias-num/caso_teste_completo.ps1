# 1. Compila o projeto com as novas implementações
mingw32-make

# 2. Garante que a pasta de saídas existe
if (!(Test-Path "saidas")) { New-Item -ItemType Directory -Path "saidas" }

# 3. Define o arquivo de log
$logArquivo = "log_tempos_execucao.txt"
"--- Relatório de Performance (Todos os Algoritmos) ---`n" | Out-File -FilePath $logArquivo -Encoding utf8

# 4. Lista de algoritmos (agora com os 4)
$algoritmos = @("selection", "insertion", "merge", "quick")

# 5. Processa cada arquivo .in
Get-ChildItem *.in | ForEach-Object {
    $file = $_
    $nomeBase = $file.BaseName
    
    Write-Host "---------------------------------------" -ForegroundColor Gray
    Write-Host "Instância: $nomeBase" -ForegroundColor Yellow
    "Instância: $nomeBase" | Out-File -FilePath $logArquivo -Append -Encoding utf8

    foreach ($algo in $algoritmos) {
        Write-Host "  Executando ${algo}..." -NoNewline
        
        # Captura o tempo do cerr e salva a saída ordenada
        # O 2>&1 é essencial para pegar o tempo que o C++ envia
        $tempo = Get-Content $file.FullName | ./sorting.exe $algo > "saidas/saida_${algo}_$nomeBase.txt" 2>&1
        
        # Salva no log
        "    $($algo.PadRight(10)): $tempo" | Out-File -FilePath $logArquivo -Append -Encoding utf8
        
        Write-Host " OK ($tempo)" -ForegroundColor Green
    }
    "`n" | Out-File -FilePath $logArquivo -Append
}

Write-Host "`nConcluído! Resultados em 'saidas' e tempos em '$logArquivo'." -ForegroundColor Cyan