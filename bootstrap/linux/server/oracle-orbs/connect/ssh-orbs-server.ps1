# ------------------------------------------------------------------------------
# SSH: Oracle Orbs Server
# ------------------------------------------------------------------------------

$ServerIp = if ($env:ORBS_SERVER_IP) { $env:ORBS_SERVER_IP } else { "137.131.238.161" }
$ServerUser = if ($env:ORBS_SERVER_USER) { $env:ORBS_SERVER_USER } else { "ubuntu" }
$ServerKey = if ($env:ORBS_SERVER_KEY) { $env:ORBS_SERVER_KEY } else { "$HOME/.vault/keys/ssh-key-orbs-server.key" }

ssh -i $ServerKey "${ServerUser}@${ServerIp}"
