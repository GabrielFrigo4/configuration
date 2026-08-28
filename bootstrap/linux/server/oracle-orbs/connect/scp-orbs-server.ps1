# ------------------------------------------------------------------------------
# SCP: Oracle Orbs Server
# ------------------------------------------------------------------------------

if ($args.Count -eq 0) {
    Write-Error "Uso: .\scp-orbs-server.ps1 <arquivo_ou_pasta>"
    exit 1
}

$ServerIp = if ($env:ORBS_SERVER_IP) { $env:ORBS_SERVER_IP } else { "137.131.238.161" }
$ServerUser = if ($env:ORBS_SERVER_USER) { $env:ORBS_SERVER_USER } else { "ubuntu" }
$ServerKey = if ($env:ORBS_SERVER_KEY) { $env:ORBS_SERVER_KEY } else { "$HOME/.vault/keys/ssh-key-orbs-server.key" }

$Target = $args[0]
scp -r -i $ServerKey $Target "${ServerUser}@${ServerIp}:/home/${ServerUser}/${Target}"
