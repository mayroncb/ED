# 1. Compila o código
mingw32-make

# 2. Configurações de arquivos
$logArquivo = "log_tempos_execucao.txt"
"Relatório de Tempos - $(Get-Date)" | Out-File -FilePath $logArquivo -Encoding utf8

# 3. Processa os arquivos .in
Get-ChildItem *.in | ForEach-Object {
    $file = $_
    "Arquivo: $($file.Name)" | Out-File -FilePath $logArquivo -Append -Encoding utf8
    Write-Host "Processando $($file.Name)..." -ForegroundColor Cyan

    foreach ($algo in @("selection", "insertion", "merge", "quick")) {
        # Executa e captura o tempo do cerr
        $tempoRaw = Get-Content $file.FullName | ./sorting.exe $algo > "saidas/saida_${algo}_$($file.BaseName).txt" 2>&1
        
        # Limpa o texto caso o PowerShell adicione lixo no log
        $tempoLimpo = $tempoRaw -replace '.*: ', ''
        
        # SALVAMENTO NO ARQUIVO (CORRIGIDO)
        "  ${algo}: ${tempoLimpo} s" | Out-File -FilePath $logArquivo -Append -Encoding utf8
        
        # IMPRESSÃO NO TERMINAL (CORRIGIDO)
        Write-Host "  ${algo}: ${tempoLimpo} s" -ForegroundColor Green
    }
    "" | Out-File -FilePath $logArquivo -Append
}

Write-Host "Concluído! Verifique o arquivo '$logArquivo'." -ForegroundColor Cyan