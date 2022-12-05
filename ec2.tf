resource "aws_instance" "bot_instance" {
  ami                         = var.bot_instance_ami
  instance_type               = "t3.nano"
  vpc_security_group_ids      = ["${aws_security_group.sg_discord_bot.id}"]
  subnet_id                   = var.subnet_id
  associate_public_ip_address = true
  key_name                    = var.ssh_key_name
  user_data                   = templatefile("${path.module}/run_bot.sh", {
    discord_client_id = var.discord_client_id,
    discord_token = var.discord_token
  })

  ebs_block_device {
    device_name = "/dev/xvdb"
    volume_size = 10
  }

  tags = {
    Name = "Discord bot instance"
  }
}
