variable "region" {
    default = "us-east-1"
  
}


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


#Lista
variable "int_name" {
    description = "Lista de nome para instancias"
    type = list(string)
    default = [ "Hellowolrd","Hellowolrd2","Helloword3"]

}

#map
variable "amis" {
    description = "amis para determinar SO por regioes"
    type = map(any)
    default = {
        "us-east-1" = "ami-05fa00d4c63e32376"
        "us-east-2" = "ami-0568773882d492fc8"
    }
  
}