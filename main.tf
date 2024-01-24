#####################COMENTARIO - CODIGO #################

#terraform {: Inicia a definição da configuração do Terraform. Todas as configurações do Terraform
#estão contidas dentro deste bloco.

#required_version = ">= 1.1.0": Define a versão mínima do Terraform necessária para executar este código.
#Neste caso, o código requer a versão 1.1.0 ou superior do Terraform para garantir que as funcionalidades 
#e sintaxes utilizadas estejam disponíveis.

#required_providers {: Inicia a definição dos provedores (providers) necessários para este projeto.
#No contexto do Terraform, um provedor é um plugin que permite a interação com um provedor de nuvem específico,#
#como AWS, Azure, Google Cloud, etc.

#aws = ">= 4.0": Define a versão mínima do provedor AWS necessária para este projeto. Aqui, o código requer
#a versão 4.0 ou superior do provedor AWS para garantir que as funcionalidades utilizadas estejam disponíveis.

#}: Encerra a definição dos provedores necessários.

########################CODIGO#####################
terraform {
  required_version = ">= 1.1.0"
  required_providers {
    aws = ">= 4.0"
  }
####Salvado o terraform.tfstate no S3 #####
/*  backend "s3" {
    bucket = "klaybsonoc"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }*/
}


#####################COMENTARIO - Provider #################
# Este bloco define o provedor AWS para o Terraform, indicando que este código provisionará recursos na AWS.
# O perfil AWS a ser utilizado. Pode ser configurado com credenciais no arquivo de configuração 
# AWS (~/.aws/credentials).
# O caminho para o arquivo de credenciais compartilhadas. Neste caso, aponta para o arquivo padrão
# (~/.aws/credentials).
# A região AWS onde os recursos serão provisionados. No exemplo, os recursos serão criados na região us-east-1.

########################CODIGO#####################
provider "aws" {
  profile                  = "default"
  shared_credentials_files = ["~/.aws/credentials"]
  region                   = "us-east-1"
}

##Exemplo basico

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}



<<<<<<< HEAD
###### nova instancia 2 ###########
<<<<<<< HEAD
#Crie o diretório e o scrpts.sh como no parametro user_data e criandon um loog em count 
resource "aws_instance" "web" {
  for_each = toset(var.int_name)
=======
resource "aws_instance" "web3" {
>>>>>>> parent of 13ae950 (EC2 userdata - para executar scripts)
  ami           = var.amis[var.region]
  instance_type = each.value
  user_data = file("./files/userdata.sh")
  tags = {
    Name = var.int_name [count.index]
  }
}
=======
###### nova instancia ###########
resource "aws_instance" "web2" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.nano"

  tags = {
    Name = var.int_name [1]
  }
}
>>>>>>> parent of d1314ae (utilando variavel data)
