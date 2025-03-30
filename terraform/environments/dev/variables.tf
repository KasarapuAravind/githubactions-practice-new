variable "bucket_name" {
    type = string
}

variable "tags" {
    type = map(string)
    default = {}  
}

variable "region" {
    type = string
    default = "us-east-1"  
}

variable "env" {}
