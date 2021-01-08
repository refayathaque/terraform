locals {
  # my_parameters = {
  #   environment = "development"
  #   version     = "1.0"
  #   mykey       = "myvalue"
  # }
  my_parameters = [
    {
      "prefix" = "/myprefix"
      "parameters" = [
        {
          "name"  = "myparameter"
          "value" = "myvalue"
        },
        {
          "name"  = "environment"
          "value" = "dev"
        },
      ]
    },
    {
      "prefix" = "/myapp"
      "parameters" = [
        {
          "name"  = "environment"
          "value" = "prod"
        },
      ]
    },
  ]
}

# module "parameters" {
#   source   = "./ssm-parameter"
#   for_each = local.my_parameters
#   name     = each.key
#   value    = each.value
# }

module "parameters" {
  source     = "./ssm-parameter"
  parameters = local.my_parameters
}

# output "all-my-parameters" {
#   value = { for k, parameter in module.parameters : k => parameter.arn }
# }