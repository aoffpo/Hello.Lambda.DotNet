variable "resource_tags" {
    type = map(string)
    default = {
        "env": "dev",
        "iac": "tf"
    }
}