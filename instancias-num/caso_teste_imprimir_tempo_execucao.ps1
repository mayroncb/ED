# 1. Compila o código
mingw32-make

# 2. Cria a pasta de saídas se não existir
if (!(Test-Path "saidas")) { New-Item -ItemType Directory -Path "saidas" }

# 3. Define o arquivo de log de tempos e limpa se já existir
$logTempos = "log_execucao_tempos.txt"
"--- Log de Execução: $(Get-Date) ---`n" | Out-File -FilePath $logTempos

# 4. Loop pelos arquivos .in
Get-ChildItem *.in | ForEach-Object {
    $nomeBase = $_.BaseName
    $arquivoIn = $_.FullName
    
    Write-Host "Processando: $nomeBase ..." -ForegroundColor Cyan
    
    # Adiciona o nome do arquivo no log
    "Instância: $nomeBase" | Out-File -FilePath $logTempos -Append

    # Executa Selection Sort
    # O '2>>' pega o que o cerr imprimiu e anexa ao log
    "  Selection Sort: " | Out-File -FilePath $logTempos -Append -NoNewline
    Get-Content $arquivoIn | ./sorting.exe selection > "saidas/saida_selection_$nomeBase.txt" 2>> $logTempos
    "`n" | Out-File -FilePath $logTempos -Append -NoNewline

    # Executa Insertion Sort
    "  Insertion Sort: " | Out-File -FilePath $logTempos -Append -NoNewline
    Get-Content $arquivoIn | ./sorting.exe insertion > "saidas/saida_insertion_$nomeBase.txt" 2>> $logTempos
    "`n`n" | Out-File -FilePath $logTempos -Append
}

Write-Host "Concluído! Verifique a pasta 'saidas' e o arquivo '$logTempos'." -ForegroundColor Green