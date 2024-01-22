variable "int_type" {
    default = "t3.micro"
}
variable "so" {
    default = "t3.micro"
}

variable "disable_api_termination" {
    description = "Protege instancia contra delete acidental"
    type = bool
    default = true
}