output "id" {
  description = "The ARN of the certificate"
  value = aws_acm_certificate.main.id
}

output "arn" {
  description = "The ARN of the certificate"
  value = aws_acm_certificate.main.arn
}

output "status" {
  description = "Status of the certificate"
  value = aws_acm_certificate.main.status
}