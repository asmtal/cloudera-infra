resource "local_file" "hosts" {
  content     = <<EOF
127.0.1.1       localhost2
127.0.0.1       localhost
::1             localhost ip6-localhost ip6-loopback
ff02::1         ip6-allnodes
ff02::2         ip6-allrouters

${scaleway_instance_server.manager.public_ip} ${trimprefix(scaleway_instance_server.manager.id, "fr-par-1/")}.pub.cloud.scaleway.com ${trimprefix(scaleway_instance_server.manager.id, "fr-par-1/")}
${scaleway_instance_server.master.public_ip} ${trimprefix(scaleway_instance_server.master.id, "fr-par-1/")}.pub.cloud.scaleway.com ${trimprefix(scaleway_instance_server.master.id, "fr-par-1/")}
${scaleway_instance_server.edge.public_ip} ${trimprefix(scaleway_instance_server.edge.id, "fr-par-1/")}.pub.cloud.scaleway.com ${trimprefix(scaleway_instance_server.edge.id, "fr-par-1/")}
${scaleway_instance_server.worker1.public_ip} ${trimprefix(scaleway_instance_server.worker1.id, "fr-par-1/")}.pub.cloud.scaleway.com ${trimprefix(scaleway_instance_server.worker1.id, "fr-par-1/")}
${scaleway_instance_server.worker2.public_ip} ${trimprefix(scaleway_instance_server.worker2.id, "fr-par-1/")}.pub.cloud.scaleway.com ${trimprefix(scaleway_instance_server.worker2.id, "fr-par-1/")}
${scaleway_instance_server.worker3.public_ip} ${trimprefix(scaleway_instance_server.worker3.id, "fr-par-1/")}.pub.cloud.scaleway.com ${trimprefix(scaleway_instance_server.worker3.id, "fr-par-1/")}
  EOF
  filename = "${path.module}/../roles/prepare/files/hosts"
}
resource "local_file" "ansible_hosts" {
  content     = <<EOF
[scm_server]
${trimprefix(scaleway_instance_server.manager.id, "fr-par-1/")}.pub.cloud.scaleway.com

[db_server]
${trimprefix(scaleway_instance_server.manager.id, "fr-par-1/")}.pub.cloud.scaleway.com

[utility_servers:children]
scm_server
db_server

[gateway_servers]
${trimprefix(scaleway_instance_server.edge.id, "fr-par-1/")}.pub.cloud.scaleway.com        host_template=HostTemplate-Gateway

[edge_servers]
${trimprefix(scaleway_instance_server.edge.id, "fr-par-1/")}.pub.cloud.scaleway.com        host_template=HostTemplate-Edge    role_ref_names=HDFS-HTTPFS-1

[master_servers]
${trimprefix(scaleway_instance_server.master.id, "fr-par-1/")}.pub.cloud.scaleway.com        host_template=HostTemplate-Master1

[worker_servers]
${trimprefix(scaleway_instance_server.worker1.id, "fr-par-1/")}.pub.cloud.scaleway.com
${trimprefix(scaleway_instance_server.worker2.id, "fr-par-1/")}.pub.cloud.scaleway.com
${trimprefix(scaleway_instance_server.worker3.id, "fr-par-1/")}.pub.cloud.scaleway.com

[worker_servers:vars]
host_template=HostTemplate-Workers

[cdh_servers:children]
utility_servers
gateway_servers
master_servers
worker_servers

[all:vars]
ansible_user=root
  EOF
  filename = "${path.module}/../tf_hosts"
}
