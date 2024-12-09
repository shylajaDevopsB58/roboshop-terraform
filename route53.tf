resource "aws_route53_record" "main" {
  count   = length(var.components)
  zone_id = "Z07747471HGVYA865UF0V"
  name    = "${var.components[count.index]}-${var.env}"
  type    = "A"
  ttl     = "3"
  records = [aws_instance.main.*.private_ip[count.index]]
}