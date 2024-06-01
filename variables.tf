variable "provider" {
  type        = string
  description = "The short-hand name of the cloud provider that was used to instantiate the kubernetes cluster (e.g., 'do', 'aws', etc)"
}

variable "do_token" {
  description = "DigitalOcean Personal Access Token"
}
