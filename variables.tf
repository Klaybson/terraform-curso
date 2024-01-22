variable "int_type" {
    default = "t3.micro"
}
variable "so" {
    default = "t3.micro"
}

/* booleano
variable "disable_api_termination" {
    description = "Protege instancia contra delete acidental"
    type = bool
    default = false
}*/

variable "int_name" {
    description = "Lista de nome para instancias"
    type = list(string)
    default = [ "Hellowolrd","Hellowolrd2","Helloword3"]

}