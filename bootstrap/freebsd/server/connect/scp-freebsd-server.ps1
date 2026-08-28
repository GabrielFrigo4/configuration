# ------------------------------------------------------------------------------
# Connect: SCP to FreeBSD Server (KVM / QEMU)
# ------------------------------------------------------------------------------

if ($args.Count -eq 0) {
    Write-Error "Uso: .\scp-freebsd-server.ps1 <arquivo_ou_pasta>"
    exit 1
}

$FreeBsdIp = try {
    (((virsh --connect "qemu:///system" domifaddr FreeBSD 2>$null) -match "ipv4").Trim() -split '\s+')[3].Split('/')[0]
} catch {
    $null
}

if (-not $FreeBsdIp) {
    Write-Error "❌ [FreeBSD Connect]: Não foi possível detectar o IP da VM 'FreeBSD' via virsh."
    exit 1
}

$Target = $args[0]
scp -r $Target "freebsd@${FreeBsdIp}:/home/freebsd/$Target"
