# ------------------------------------------------------------------------------
# Connect: SSH to FreeBSD Server (KVM / QEMU)
# ------------------------------------------------------------------------------

$FreeBsdIp = try {
    (((virsh --connect "qemu:///system" domifaddr FreeBSD 2>$null) -match "ipv4").Trim() -split '\s+')[3].Split('/')[0]
} catch {
    $null
}

if (-not $FreeBsdIp) {
    Write-Error "❌ [FreeBSD Connect]: Não foi possível detectar o IP da VM 'FreeBSD' via virsh."
    exit 1
}

ssh "freebsd@${FreeBsdIp}"
