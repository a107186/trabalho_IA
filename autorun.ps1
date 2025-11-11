# Autorun PowerShell script to run the Prolog test harness using SWI-Prolog
$swipl = 'swipl'
$script = 'c:/Users/Utilizador/OneDrive/Ambiente de Trabalho/PROGRAMAÇÃO/trabalho_IA/run_tests.pl'

Write-Host "Running SWI-Prolog autorun tests..."
& $swipl -q -s "$script"
if ($LASTEXITCODE -ne 0) {
    Write-Host "swipl exited with code $LASTEXITCODE"
    exit $LASTEXITCODE
} else {
    Write-Host "Finished autorun (exit code 0)."
}
