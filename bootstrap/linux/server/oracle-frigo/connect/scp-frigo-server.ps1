# ------------------------------------------------------------------------------
# SCP: Oracle Frigo Server
# ------------------------------------------------------------------------------

if ($args.Count -eq 0) {
    Write-Error "Uso: .\scp-frigo-server.ps1 <arquivo_ou_pasta>"
    exit 1
}

$ServerIp = if ($env:FRIGO_SERVER_IP) { $env:FRIGO_SERVER_IP } else { "144.22.210.65" }
$ServerUser = if ($env:FRIGO_SERVER_USER) { $env:FRIGO_SERVER_USER } else { "ubuntu" }
$ServerKey = if ($env:FRIGO_SERVER_KEY) { $env:FRIGO_SERVER_KEY } else { "$HOME/.vault/keys/ssh-key-frigo-server.key" }

$Target = $args[0]
scp -r -i $ServerKey $Target "${ServerUser}@${ServerIp}:/home/${ServerUser}/${Target}"
