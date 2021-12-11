provider "scaleway" {
  project_id      = "b82e36c8-4f62-49ea-a95b-219127c13e4c"
  region          = "fr-par"
  zone            = "fr-par-1"
}
terraform {
  required_providers {
    scaleway = {
      source = "scaleway/scaleway"
    }
  }
  required_version = ">= 0.13"
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
  type  = "DEV1-L"
  image = "centos_7.6"
  name  = "worker1"

  ip_id = scaleway_instance_ip.worker1_ip.id

  security_group_id = scaleway_instance_security_group.sg-hadoop-public.id
  placement_group_id = scaleway_instance_placement_group.availability_group.id
}

resource "scaleway_instance_ip" "worker2_ip" {}
resource "scaleway_instance_server" "worker2" {
  type  = "DEV1-L"
  image = "centos_7.6"
  name  = "worker2"

  ip_id = scaleway_instance_ip.worker2_ip.id

  security_group_id = scaleway_instance_security_group.sg-hadoop-public.id
  placement_group_id = scaleway_instance_placement_group.availability_group.id
}

resource "scaleway_instance_ip" "worker3_ip" {}
resource "scaleway_instance_server" "worker3" {
  type  = "DEV1-L"
  image = "centos_7.6"
  name  = "worker3"

  ip_id = scaleway_instance_ip.worker3_ip.id

  security_group_id = scaleway_instance_security_group.sg-hadoop-public.id
  placement_group_id = scaleway_instance_placement_group.availability_group.id
}
resource "scaleway_instance_ip" "worker4_ip" {}
resource "scaleway_instance_server" "worker4" {
  type  = "DEV1-L"
  image = "centos_7.6"
  name  = "worker4"

  ip_id = scaleway_instance_ip.worker4_ip.id

  security_group_id = scaleway_instance_security_group.sg-hadoop-public.id
  placement_group_id = scaleway_instance_placement_group.availability_group.id
}

resource "scaleway_instance_ip" "edge1_ip" {}
resource "scaleway_instance_server" "edge1" {
  type  = "DEV1-M"
  image = "centos_7.6"
  name  = "edge1"

  ip_id = scaleway_instance_ip.edge1_ip.id

  security_group_id = scaleway_instance_security_group.sg-hadoop-public.id
  placement_group_id = scaleway_instance_placement_group.availability_group.id
}
resource "scaleway_instance_ip" "edge2_ip" {}
resource "scaleway_instance_server" "edge2" {
  type  = "DEV1-M"
  image = "centos_7.6"
  name  = "edge2"

  ip_id = scaleway_instance_ip.edge2_ip.id

  security_group_id = scaleway_instance_security_group.sg-hadoop-public.id
  placement_group_id = scaleway_instance_placement_group.availability_group.id
}
resource "scaleway_instance_ip" "edge3_ip" {}
resource "scaleway_instance_server" "edge3" {
  type  = "DEV1-M"
  image = "centos_7.6"
  name  = "edge3"

  ip_id = scaleway_instance_ip.edge3_ip.id

  security_group_id = scaleway_instance_security_group.sg-hadoop-public.id
  placement_group_id = scaleway_instance_placement_group.availability_group.id
}
resource "scaleway_instance_ip" "edge4_ip" {}
resource "scaleway_instance_server" "edge4" {
  type  = "DEV1-M"
  image = "centos_7.6"
  name  = "edge4"

  ip_id = scaleway_instance_ip.edge4_ip.id

  security_group_id = scaleway_instance_security_group.sg-hadoop-public.id
  placement_group_id = scaleway_instance_placement_group.availability_group.id
}
resource "scaleway_instance_ip" "edge5_ip" {}
resource "scaleway_instance_server" "edge5" {
  type  = "DEV1-M"
  image = "centos_7.6"
  name  = "edge5"

  ip_id = scaleway_instance_ip.edge5_ip.id

  security_group_id = scaleway_instance_security_group.sg-hadoop-public.id
  placement_group_id = scaleway_instance_placement_group.availability_group.id
}
resource "scaleway_instance_ip" "edge6_ip" {}
resource "scaleway_instance_server" "edge6" {
  type  = "DEV1-M"
  image = "centos_7.6"
  name  = "edge6"

  ip_id = scaleway_instance_ip.edge6_ip.id

  security_group_id = scaleway_instance_security_group.sg-hadoop-public.id
  placement_group_id = scaleway_instance_placement_group.availability_group.id
}

resource "scaleway_instance_ip" "edge7_ip" {}
resource "scaleway_instance_server" "edge7" {
  type  = "DEV1-M"
  image = "centos_7.6"
  name  = "edge7"

  ip_id = scaleway_instance_ip.edge7_ip.id

  security_group_id = scaleway_instance_security_group.sg-hadoop-public.id
  placement_group_id = scaleway_instance_placement_group.availability_group.id
}

resource "scaleway_instance_ip" "bastion_ip" {}
resource "scaleway_instance_server" "bastion" {
  type  = "DEV1-S"
  image = "ubuntu_focal"
  name  = "bastion"

  ip_id = scaleway_instance_ip.bastion_ip.id

  security_group_id = scaleway_instance_security_group.sg-hadoop-public.id
  placement_group_id = scaleway_instance_placement_group.availability_group.id
}

