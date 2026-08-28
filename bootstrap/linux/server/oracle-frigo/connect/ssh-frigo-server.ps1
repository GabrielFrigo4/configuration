# ------------------------------------------------------------------------------
# SSH: Oracle Frigo Server
# ------------------------------------------------------------------------------

$ServerIp = if ($env:FRIGO_SERVER_IP) { $env:FRIGO_SERVER_IP } else { "144.22.210.65" }
$ServerUser = if ($env:FRIGO_SERVER_USER) { $env:FRIGO_SERVER_USER } else { "ubuntu" }
$ServerKey = if ($env:FRIGO_SERVER_KEY) { $env:FRIGO_SERVER_KEY } else { "$HOME/.vault/keys/ssh-key-frigo-server.key" }

ssh -i $ServerKey "${ServerUser}@${ServerIp}"
