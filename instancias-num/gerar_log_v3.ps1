# 1. Compila
mingw32-make

# 2. Pasta e Log
if (!(Test-Path "saidas")) { New-Item -ItemType Directory -Path "saidas" }
$logArquivo = "log_tempos_execucao.txt"
"Relatorio de Tempos - $(Get-Date)" | Out-File $logArquivo -Encoding utf8

# 3. Processa
Get-ChildItem *.in | ForEach-Object {
    $file = $_
    "Arquivo: $($file.Name)" | Out-File $logArquivo -Append
    Write-Host "Processando $($file.Name)..." -ForegroundColor Cyan

    foreach ($algo in @("selection", "insertion", "merge", "quick")) {
        $caminhoSaida = "saidas/saida_${algo}_$($file.BaseName).txt"
        
        # Executa o algoritmo
        Get-Content $file.FullName | ./sorting.exe $algo > $caminhoSaida
        
        # Lê a última linha do arquivo gerado para pegar o tempo
        $ultimaLinha = Get-Content $caminhoSaida | Select-Object -Last 1
        
        # Extrai apenas o número (remove a tag TEMPO_TOTAL)
        $apenasTempo = $ultimaLinha -replace "TEMPO_TOTAL ", ""
        
        # Salva no log
        "  ${algo}: ${apenasTempo} s" | Out-File $logArquivo -Append
        Write-Host "  ${algo}: ${apenasTempo} s" -ForegroundColor Green
    }
    "" | Out-File $logArquivo -Append
}