resource "aws_instance" "bot_instance" {
  ami                         = "ami-0f72d3c899140e51a"
  instance_type               = "t2.nano"
  vpc_security_group_ids      = ["${aws_security_group.sg_discord_bot.id}"]
  subnet_id                   = aws_subnet.main_public.id
  associate_public_ip_address = true
  key_name                    = aws_key_pair.discord_bot_kms_key.key_name
  user_data                   = file("run_bot.sh")

  tags = {
    Name = "Discord bot instance"
  }
}
