variable "hcloud_token"{
	description= "Token API de Hetzner Cloud"
	type = string
	sensitive = true
}

variable "ssh_public_key_path" {
	default = "~/.ssh/hetzner_lab.pub"
}

variable "server_name" {
	default = "nivel1-one-instance"
}

variable "server_type" {
	default = "cx23"
}

variable "location" {

	default = "hel1"
	
}


