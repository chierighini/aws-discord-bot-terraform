resource "aws_key_pair" "discord_bot_kms_key" {
  key_name   = "discord_bot_key"
  public_key = aws_secretsmanager_secret.discord_bot_ssh_public_key
}
