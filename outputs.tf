output "vms_devops01_public_ip" {
    description = "Endereço IP público da instância vms_devops01"
    value       = aws_instance.vms_devops01.public_ip
}