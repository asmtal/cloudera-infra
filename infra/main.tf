provider "scaleway" {
  version = "1.13"
  organization_id = "a1f482fa-bcaa-429f-b01f-95bab7bd91c2"
  region          = "fr-par"
  zone            = "fr-par-1"
}

resource "scaleway_instance_placement_group" "availability_group" {
  name = "spg-hadoop"
  policy_type = "low_latency"
  policy_mode = "optional"
}

resource "scaleway_instance_security_group" "sg-hadoop-public" {
  name = "sg-hadoop-public"
  inbound_default_policy  = "accept"
  outbound_default_policy = "accept"
}

resource "scaleway_instance_security_group" "sg-hadoop-worker" {
  name = "sg-hadoop-worker"
  inbound_default_policy  = "accept"
  outbound_default_policy = "accept"

//  inbound_rule {
//    action = "accept"
//    ip = var.my-ip # Only allow incoming conection to this IP.
//  }
//
//  outbound_rule {
//    action = "accept"
//    ip = var.my-ip # Only allow outgoing conection to this IP.
//  }
//
//  inbound_rule {
//    action = "accept"
//    protocol = "ANY"
//    ip_range = "10.0.0.0/8" # Only allow incoming conection to scw server.
//  }
//
//  outbound_rule {
//    action = "accept"
//    protocol = "ANY"
//    ip_range = "10.0.0.0/8" # Only allow outgoing conection to scw server.
//  }
}

resource "scaleway_instance_ip" "manager_ip" {}
resource "scaleway_instance_server" "manager" {
  type  = "GP1-XS"
  image = "centos_7.6"
  name  = "manager"

  ip_id = scaleway_instance_ip.manager_ip.id

  security_group_id = scaleway_instance_security_group.sg-hadoop-public.id
  placement_group_id = scaleway_instance_placement_group.availability_group.id
}

resource "scaleway_instance_ip" "master_ip" {}
resource "scaleway_instance_server" "master" {
  type  = "GP1-XS"
  image = "centos_7.6"
  name  = "master"

  ip_id = scaleway_instance_ip.master_ip.id

  security_group_id = scaleway_instance_security_group.sg-hadoop-public.id
  placement_group_id = scaleway_instance_placement_group.availability_group.id
}

resource "scaleway_instance_ip" "worker1_ip" {}
resource "scaleway_instance_server" "worker1" {
  type  = "DEV1-XL"
  image = "centos_7.6"
  name  = "worker1"

  ip_id = scaleway_instance_ip.worker1_ip.id

  security_group_id = scaleway_instance_security_group.sg-hadoop-worker.id
  placement_group_id = scaleway_instance_placement_group.availability_group.id
}

resource "scaleway_instance_ip" "worker2_ip" {}
resource "scaleway_instance_server" "worker2" {
  type  = "DEV1-XL"
  image = "centos_7.6"
  name  = "worker2"

  ip_id = scaleway_instance_ip.worker2_ip.id

  security_group_id = scaleway_instance_security_group.sg-hadoop-worker.id
  placement_group_id = scaleway_instance_placement_group.availability_group.id
}

resource "scaleway_instance_ip" "worker3_ip" {}
resource "scaleway_instance_server" "worker3" {
  type  = "DEV1-XL"
  image = "centos_7.6"
  name  = "worker3"

  ip_id = scaleway_instance_ip.worker3_ip.id

  security_group_id = scaleway_instance_security_group.sg-hadoop-worker.id
  placement_group_id = scaleway_instance_placement_group.availability_group.id
}

resource "scaleway_instance_ip" "edge_ip" {}
resource "scaleway_instance_server" "edge" {
  type  = "DEV1-S"
  image = "centos_7.6"
  name  = "edge"

  ip_id = scaleway_instance_ip.edge_ip.id

  security_group_id = scaleway_instance_security_group.sg-hadoop-public.id
  placement_group_id = scaleway_instance_placement_group.availability_group.id
}