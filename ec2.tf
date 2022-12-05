resource "aws_instance" "bot_instance" {
  ami                         = var.bot_instance_ami
  instance_type               = "t4g.nano"
  vpc_security_group_ids      = ["${aws_security_group.sg_discord_bot.id}"]
  subnet_id                   = var.subnet_id
  associate_public_ip_address = true
  key_name                    = var.ssh_key_name
  user_data                   = file("run_bot.sh")

  tags = {
    Name = "Discord bot instance"
  }
}
