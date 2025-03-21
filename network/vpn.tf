resource "azurerm_virtual_network_gateway" "vpn_gateway" {
  name                = "vpn-gateway"
  location            = var.location
  resource_group_name = var.resource_group_name
  type                = "Vpn"
  vpn_type            = "RouteBased"
  active_active       = false
  enable_bgp          = false

  sku                 = "VpnGw1" # ← Add this explicitly ✅

  ip_configuration {
    name                          = "vnetGatewayConfig"
    public_ip_address_id          = azurerm_public_ip.vpn_gateway_ip.id
    subnet_id                     = azurerm_subnet.gateway.id
    private_ip_address_allocation = "Dynamic"
  }

  vpn_client_configuration {
    address_pool = ["172.16.0.0/24"]

    root_certificate {
      name             = "P2SRootCert"
      public_cert_data = filebase64("../certs/rootcert.pem")
    }
  }
}