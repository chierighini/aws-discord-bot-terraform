resource "aws_instance" "bot_instance" {
  ami                         = var.bot_instance_ami
  instance_type               = "t4g.nano"
  vpc_security_group_ids      = ["${aws_security_group.sg_discord_bot.id}"]
  subnet_id                   = var.subnet_id
  associate_public_ip_address = true
  key_name                    = var.ssh_key_name
  user_data                   = <<-EOT
    #!/bin/bash

    echo "Install Dependencies"
    yum -y update
    yum install -y git
    yum install -y docker
    yum install -y yum-utils

    echo "Enable systemd services"
    systemctl enable jenkins
    systemctl start jenkins
    systemctl enable docker
    systemctl start docker

    echo "Run bot"
    docker pull renatofernandes/discord-bot

    docker run -e CLIENT_ID='${var.discord_client_id}' -e TOKEN='${var.discord_token}' renatofernandes/discord-bot
  EOT

  tags = {
    Name = "Discord bot instance"
  }
}
