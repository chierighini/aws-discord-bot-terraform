data "aws_secretsmanager_secret" "discord_bot_client_id" {
  name = "discord_bot_client_id"
}

data "aws_secretsmanager_secret" "discord_bot_token" {
  name = "discord_bot_token"
}

data "aws_secretsmanager_secret" "discord_bot_ssh_public_key" {
  name = "discord_bot_public_ssh_key"
}
