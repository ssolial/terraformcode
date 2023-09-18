resource "aws_lightsail_instance" "example_instance" {
  name              = "custom"
  availability_zone = "us-east-1b"
  blueprint_id      = "amazon_linux_2"
  bundle_id         = "nano_1_0"
  user_data         = "sudo yum install -y httpd && sudo systemctl start httpd && sudo systemctl enable httpd && echo '<h1>Deployed via Terraform</h1>' | sudo tee /var/www/html/index.html"
}

output "public_ip" {
    value = aws_lightsail_static_ip.example_static_ip.ip_address
}
