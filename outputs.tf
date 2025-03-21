output "vpn_gateway_ip" {
  value = module.network.vpn_gateway_ip
}

output "jumpbox_public_ip" {
  value = module.compute.jumpbox_public_ip
}