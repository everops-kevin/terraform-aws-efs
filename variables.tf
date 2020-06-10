#------------------------------------------------------------------------------
# Variables for EFS Module
#------------------------------------------------------------------------------
variable "create_security_group" {
  description = "Decides whether to create the default security group. Defaults to true."
  default     = true
  type        = bool
}

variable "throughput_in_mibps" {
  description = "Throughput provisioned for the EFS"
  type        = number
}

variable "additional_security_group_ids" {
  description = "Additional security groups to add to EFS mount points."
  default     = []
  type        = list(string)
}

variable "security_group_ingress" {
  description = "Can be specified multiple times for each ingress rule. "
  type = list(object({
    from_port   = number
    protocol    = string
    to_port     = number
    self        = bool
    cidr_blocks = list(string)
  }))
  default = [{
    from_port   = 2049
    protocol    = "tcp"
    to_port     = 2049
    self        = true
    cidr_blocks = []
  }]
}

variable "security_group_egress" {
  description = "Can be specified multiple times for each egress rule. "
  type = list(object({
    from_port   = number
    protocol    = string
    to_port     = number
    self        = bool
    cidr_blocks = list(string)
  }))
  default = [{
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    self        = false
    cidr_blocks = ["0.0.0.0/0"]
  }]
}

variable "name" {
  description = "A unique name (a maximum of 64 characters are allowed) used as reference when creating the Elastic File System to ensure idempotent file system creation."
  type        = string
}

variable "vpc_id" {
  description = "The name of the VPC that EFS will be deployed to"
  type        = string
}

variable "subnet_ids" {
  description = "Subnet IDs for Mount Targets"
  type        = list(string)
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}
