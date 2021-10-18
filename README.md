# Work with AWS Sagemaker via terraform

A terraform module for making Sagemaker.

*NOTE*: Full list of Terraform modules that I have are located here: [https://github.com/SebastianUA/terraform](https://github.com/SebastianUA/terraform)


## Usage
----------------------
Import the module and retrieve with ```terraform get``` or ```terraform get --update```. Adding a module resource to your template, e.g. `main.tf`:

```
#
# MAINTAINER Vitaliy Natarov "vitaliy.natarov@yahoo.com"
#
terraform {
  required_version = "~> 0.13"
}

provider "aws" {
  region                  = "us-east-1"
  shared_credentials_file = pathexpand("~/.aws/credentials")
}

module "sagemaker" {
  source      = "../../modules/sagemaker"
  name        = "TEST"
  environment = "stage"

  # Sagemaker model
  enable_sagemaker_model             = true
  sagemaker_model_name               = ""
  sagemaker_model_execution_role_arn = "arn:aws:iam::167127734783:role/admin-role"

  sagemaker_model_primary_container = [{
    image = "167127734783.dkr.ecr.us-east-1.amazonaws.com/sagemaker-sparkml-serving"
  }]
  sagemaker_model_container = []

  # Sagemaker endpoint config
  enable_sagemaker_endpoint_configuration = true
  sagemaker_endpoint_configuration_name   = ""
  sagemaker_endpoint_configuration_production_variants = [{
    initial_instance_count = 1
    instance_type          = "ml.t2.medium"
    variant_name           = "sage-endpoint-config-1"
  }]

  # Sagemaker endpoint
  enable_sagemaker_endpoint = true
  sagemaker_endpoint_name   = ""

  # Sagemaker notebook instance lifecycle configuration
  enable_sagemaker_notebook_instance_lifecycle_configuration    = true
  sagemaker_notebook_instance_lifecycle_configuration_name      = ""
  sagemaker_notebook_instance_lifecycle_configuration_on_create = null
  sagemaker_notebook_instance_lifecycle_configuration_on_start  = null

  # Sagemaker notebook instance
  enable_sagemaker_notebook_instance        = true
  sagemaker_notebook_instance_name          = ""
  sagemaker_notebook_instance_role_arn      = "arn:aws:iam::167127734783:role/admin-role"
  sagemaker_notebook_instance_instance_type = "ml.t2.medium"

  sagemaker_notebook_instance_subnet_id              = null
  sagemaker_notebook_instance_security_groups        = null
  sagemaker_notebook_instance_kms_key_id             = null
  sagemaker_notebook_instance_direct_internet_access = null

  tags = map("Env", "dev", "Orchestration", "Terraform", "Createdby", "Vitalii Natarov")
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_sagemaker_app_image_config.sagemaker_app_image_config](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sagemaker_app_image_config) | resource |
| [aws_sagemaker_code_repository.sagemaker_code_repository](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sagemaker_code_repository) | resource |
| [aws_sagemaker_domain.sagemaker_domain](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sagemaker_domain) | resource |
| [aws_sagemaker_endpoint.sagemaker_endpoint](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sagemaker_endpoint) | resource |
| [aws_sagemaker_endpoint_configuration.sagemaker_endpoint_configuration](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sagemaker_endpoint_configuration) | resource |
| [aws_sagemaker_feature_group.sagemaker_feature_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sagemaker_feature_group) | resource |
| [aws_sagemaker_image.sagemaker_image](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sagemaker_image) | resource |
| [aws_sagemaker_image_version.sagemaker_image_version](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sagemaker_image_version) | resource |
| [aws_sagemaker_model.sagemaker_model](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sagemaker_model) | resource |
| [aws_sagemaker_model_package_group.sagemaker_model_package_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sagemaker_model_package_group) | resource |
| [aws_sagemaker_notebook_instance.sagemaker_notebook_instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sagemaker_notebook_instance) | resource |
| [aws_sagemaker_notebook_instance_lifecycle_configuration.sagemaker_notebook_instance_lifecycle_configuration](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sagemaker_notebook_instance_lifecycle_configuration) | resource |
| [aws_sagemaker_user_profile.sagemaker_user_profile](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sagemaker_user_profile) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_enable_sagemaker_app_image_config"></a> [enable\_sagemaker\_app\_image\_config](#input\_enable\_sagemaker\_app\_image\_config) | Enable sagemaker app image config usage | `bool` | `false` | no |
| <a name="input_enable_sagemaker_code_repository"></a> [enable\_sagemaker\_code\_repository](#input\_enable\_sagemaker\_code\_repository) | Enable sagemaker code repository usage | `bool` | `false` | no |
| <a name="input_enable_sagemaker_domain"></a> [enable\_sagemaker\_domain](#input\_enable\_sagemaker\_domain) | Enable sagemaker domain usage | `bool` | `false` | no |
| <a name="input_enable_sagemaker_endpoint"></a> [enable\_sagemaker\_endpoint](#input\_enable\_sagemaker\_endpoint) | Enable sagemaker endpoint usage | `bool` | `false` | no |
| <a name="input_enable_sagemaker_endpoint_configuration"></a> [enable\_sagemaker\_endpoint\_configuration](#input\_enable\_sagemaker\_endpoint\_configuration) | Enable sagemaker endpoint configuration usage | `bool` | `false` | no |
| <a name="input_enable_sagemaker_feature_group"></a> [enable\_sagemaker\_feature\_group](#input\_enable\_sagemaker\_feature\_group) | Enable sagemaker feature group usage | `bool` | `false` | no |
| <a name="input_enable_sagemaker_image"></a> [enable\_sagemaker\_image](#input\_enable\_sagemaker\_image) | Enable sagemaker image usage | `bool` | `false` | no |
| <a name="input_enable_sagemaker_image_version"></a> [enable\_sagemaker\_image\_version](#input\_enable\_sagemaker\_image\_version) | Enable sagemaker image version usage | `bool` | `false` | no |
| <a name="input_enable_sagemaker_model"></a> [enable\_sagemaker\_model](#input\_enable\_sagemaker\_model) | Enable sagemaker model usage | `bool` | `false` | no |
| <a name="input_enable_sagemaker_model_package_group"></a> [enable\_sagemaker\_model\_package\_group](#input\_enable\_sagemaker\_model\_package\_group) | Enable sagemaker model package group usage | `bool` | `false` | no |
| <a name="input_enable_sagemaker_notebook_instance"></a> [enable\_sagemaker\_notebook\_instance](#input\_enable\_sagemaker\_notebook\_instance) | Enable sagemaker notebook instance usage | `bool` | `false` | no |
| <a name="input_enable_sagemaker_notebook_instance_lifecycle_configuration"></a> [enable\_sagemaker\_notebook\_instance\_lifecycle\_configuration](#input\_enable\_sagemaker\_notebook\_instance\_lifecycle\_configuration) | Enable sagemaker notebook instance lifecycle configuration usage | `bool` | `false` | no |
| <a name="input_enable_sagemaker_user_profile"></a> [enable\_sagemaker\_user\_profile](#input\_enable\_sagemaker\_user\_profile) | Enable sagemaker user profile usage | `bool` | `false` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment for service | `string` | `"STAGE"` | no |
| <a name="input_name"></a> [name](#input\_name) | Name to be used on all resources as prefix | `string` | `"TEST"` | no |
| <a name="input_sagemaker_app_image_config_file_system_config"></a> [sagemaker\_app\_image\_config\_file\_system\_config](#input\_sagemaker\_app\_image\_config\_file\_system\_config) | (Optional) The URL where the Git repository is located. | `list(any)` | `[]` | no |
| <a name="input_sagemaker_app_image_config_kernel_spec"></a> [sagemaker\_app\_image\_config\_kernel\_spec](#input\_sagemaker\_app\_image\_config\_kernel\_spec) | (Required) The default branch for the Git repository. | `list(any)` | `[]` | no |
| <a name="input_sagemaker_app_image_config_name"></a> [sagemaker\_app\_image\_config\_name](#input\_sagemaker\_app\_image\_config\_name) | The name of the App Image Config. | `string` | `""` | no |
| <a name="input_sagemaker_code_repository_git_config"></a> [sagemaker\_code\_repository\_git\_config](#input\_sagemaker\_code\_repository\_git\_config) | (Required) Specifies details about the repository. | `list(any)` | `[]` | no |
| <a name="input_sagemaker_code_repository_name"></a> [sagemaker\_code\_repository\_name](#input\_sagemaker\_code\_repository\_name) | The name of the Code Repository (must be unique). | `string` | `""` | no |
| <a name="input_sagemaker_domain_app_network_access_type"></a> [sagemaker\_domain\_app\_network\_access\_type](#input\_sagemaker\_domain\_app\_network\_access\_type) | (Optional) Specifies the VPC used for non-EFS traffic. The default value is PublicInternetOnly. Valid values are PublicInternetOnly and VpcOnly. | `string` | `null` | no |
| <a name="input_sagemaker_domain_auth_mode"></a> [sagemaker\_domain\_auth\_mode](#input\_sagemaker\_domain\_auth\_mode) | (Required) The mode of authentication that members use to access the domain. Valid values are IAM and SSO | `string` | `null` | no |
| <a name="input_sagemaker_domain_default_user_settings"></a> [sagemaker\_domain\_default\_user\_settings](#input\_sagemaker\_domain\_default\_user\_settings) | (Required) The default user settings. | <pre>object({<br>    execution_role  = string<br>    security_groups = set(string)<br>  })</pre> | <pre>{<br>  "execution_role": null,<br>  "security_groups": null<br>}</pre> | no |
| <a name="input_sagemaker_domain_jupyter_server_app_settings"></a> [sagemaker\_domain\_jupyter\_server\_app\_settings](#input\_sagemaker\_domain\_jupyter\_server\_app\_settings) | (Optional) The Jupyter server's app settings. | `list(any)` | `[]` | no |
| <a name="input_sagemaker_domain_kernel_gateway_app_settings"></a> [sagemaker\_domain\_kernel\_gateway\_app\_settings](#input\_sagemaker\_domain\_kernel\_gateway\_app\_settings) | (Optional) The kernel gateway app settings. | `list(any)` | `[]` | no |
| <a name="input_sagemaker_domain_kms_key_id"></a> [sagemaker\_domain\_kms\_key\_id](#input\_sagemaker\_domain\_kms\_key\_id) | (Optional) The AWS KMS customer managed CMK used to encrypt the EFS volume attached to the domain. | `string` | `null` | no |
| <a name="input_sagemaker_domain_name"></a> [sagemaker\_domain\_name](#input\_sagemaker\_domain\_name) | The domain name. | `string` | `""` | no |
| <a name="input_sagemaker_domain_sharing_settings"></a> [sagemaker\_domain\_sharing\_settings](#input\_sagemaker\_domain\_sharing\_settings) | (Optional) The sharing settings. | `list(any)` | `[]` | no |
| <a name="input_sagemaker_domain_subnet_ids"></a> [sagemaker\_domain\_subnet\_ids](#input\_sagemaker\_domain\_subnet\_ids) | (Required) The VPC subnets that Studio uses for communication. | `set(string)` | `null` | no |
| <a name="input_sagemaker_domain_tensor_board_app_settings"></a> [sagemaker\_domain\_tensor\_board\_app\_settings](#input\_sagemaker\_domain\_tensor\_board\_app\_settings) | (Optional) The TensorBoard app settings. | `list(any)` | `[]` | no |
| <a name="input_sagemaker_domain_vpc_id"></a> [sagemaker\_domain\_vpc\_id](#input\_sagemaker\_domain\_vpc\_id) | (Required) The ID of the Amazon Virtual Private Cloud (VPC) that Studio uses for communication. | `string` | `null` | no |
| <a name="input_sagemaker_endpoint_configuration_kms_key_arn"></a> [sagemaker\_endpoint\_configuration\_kms\_key\_arn](#input\_sagemaker\_endpoint\_configuration\_kms\_key\_arn) | (Optional) Amazon Resource Name (ARN) of a AWS Key Management Service key that Amazon SageMaker uses to encrypt data on the storage volume attached to the ML compute instance that hosts the endpoint. | `string` | `null` | no |
| <a name="input_sagemaker_endpoint_configuration_name"></a> [sagemaker\_endpoint\_configuration\_name](#input\_sagemaker\_endpoint\_configuration\_name) | The name of the endpoint configuration. If omitted, Terraform will assign a random, unique name. | `string` | `""` | no |
| <a name="input_sagemaker_endpoint_configuration_production_variants"></a> [sagemaker\_endpoint\_configuration\_production\_variants](#input\_sagemaker\_endpoint\_configuration\_production\_variants) | (Required) Fields for endpoint | `list(any)` | `[]` | no |
| <a name="input_sagemaker_endpoint_endpoint_config_name"></a> [sagemaker\_endpoint\_endpoint\_config\_name](#input\_sagemaker\_endpoint\_endpoint\_config\_name) | The name of the endpoint configuration to use. | `string` | `""` | no |
| <a name="input_sagemaker_endpoint_name"></a> [sagemaker\_endpoint\_name](#input\_sagemaker\_endpoint\_name) | The name of the endpoint. If omitted, Terraform will assign a random, unique name. | `string` | `null` | no |
| <a name="input_sagemaker_feature_group_data_catalog_config"></a> [sagemaker\_feature\_group\_data\_catalog\_config](#input\_sagemaker\_feature\_group\_data\_catalog\_config) | (Optional) The meta data of the Glue table that is autogenerated when an OfflineStore is created. | `list(any)` | `[]` | no |
| <a name="input_sagemaker_feature_group_description"></a> [sagemaker\_feature\_group\_description](#input\_sagemaker\_feature\_group\_description) | (Optional) - A free-form description of a Feature Group. | `string` | `null` | no |
| <a name="input_sagemaker_feature_group_event_time_feature_name"></a> [sagemaker\_feature\_group\_event\_time\_feature\_name](#input\_sagemaker\_feature\_group\_event\_time\_feature\_name) | The name of the feature that stores the EventTime of a Record in a Feature Group. | `string` | `""` | no |
| <a name="input_sagemaker_feature_group_feature_definition"></a> [sagemaker\_feature\_group\_feature\_definition](#input\_sagemaker\_feature\_group\_feature\_definition) | (Optional) - A list of Feature names and types. | `list(any)` | `[]` | no |
| <a name="input_sagemaker_feature_group_name"></a> [sagemaker\_feature\_group\_name](#input\_sagemaker\_feature\_group\_name) | The name of the Feature Group. The name must be unique within an AWS Region in an AWS account. | `string` | `""` | no |
| <a name="input_sagemaker_feature_group_record_identifier_feature_name"></a> [sagemaker\_feature\_group\_record\_identifier\_feature\_name](#input\_sagemaker\_feature\_group\_record\_identifier\_feature\_name) | The name of the Feature whose value uniquely identifies a Record defined in the Feature Store. Only the latest record per identifier value will be stored in the Online Store. | `string` | `""` | no |
| <a name="input_sagemaker_feature_group_role_arn"></a> [sagemaker\_feature\_group\_role\_arn](#input\_sagemaker\_feature\_group\_role\_arn) | (Required) - The Amazon Resource Name (ARN) of the IAM execution role used to persist data into the Offline Store if an offline\_store\_config is provided. | `string` | `null` | no |
| <a name="input_sagemaker_feature_group_s3_storage_config"></a> [sagemaker\_feature\_group\_s3\_storage\_config](#input\_sagemaker\_feature\_group\_s3\_storage\_config) | (Required) The Amazon Simple Storage (Amazon S3) location of OfflineStore. | `list(any)` | `[]` | no |
| <a name="input_sagemaker_feature_group_security_config"></a> [sagemaker\_feature\_group\_security\_config](#input\_sagemaker\_feature\_group\_security\_config) | (Required) Security config for at-rest encryption of your OnlineStore. | `list(any)` | `[]` | no |
| <a name="input_sagemaker_image_description"></a> [sagemaker\_image\_description](#input\_sagemaker\_image\_description) | (Optional) The description of the image. | `string` | `null` | no |
| <a name="input_sagemaker_image_display_name"></a> [sagemaker\_image\_display\_name](#input\_sagemaker\_image\_display\_name) | (Optional) The display name of the image. When the image is added to a domain (must be unique to the domain). | `string` | `null` | no |
| <a name="input_sagemaker_image_name"></a> [sagemaker\_image\_name](#input\_sagemaker\_image\_name) | The name of the image. Must be unique to your account. | `string` | `""` | no |
| <a name="input_sagemaker_image_role_arn"></a> [sagemaker\_image\_role\_arn](#input\_sagemaker\_image\_role\_arn) | (Required) The Amazon Resource Name (ARN) of an IAM role that enables Amazon SageMaker to perform tasks on your behalf. | `string` | `null` | no |
| <a name="input_sagemaker_image_version_base_image"></a> [sagemaker\_image\_version\_base\_image](#input\_sagemaker\_image\_version\_base\_image) | (Required) The registry path of the container image on which this image version is based. | `string` | `null` | no |
| <a name="input_sagemaker_image_version_image_name"></a> [sagemaker\_image\_version\_image\_name](#input\_sagemaker\_image\_version\_image\_name) | The name of the image. Must be unique to your account. | `string` | `""` | no |
| <a name="input_sagemaker_model_container"></a> [sagemaker\_model\_container](#input\_sagemaker\_model\_container) | (Optional) - Specifies containers in the inference pipeline. If not specified, the primary\_container argument is required. | `list(any)` | `[]` | no |
| <a name="input_sagemaker_model_enable_network_isolation"></a> [sagemaker\_model\_enable\_network\_isolation](#input\_sagemaker\_model\_enable\_network\_isolation) | (Optional) - Isolates the model container. No inbound or outbound network calls can be made to or from the model container. | `bool` | `null` | no |
| <a name="input_sagemaker_model_execution_role_arn"></a> [sagemaker\_model\_execution\_role\_arn](#input\_sagemaker\_model\_execution\_role\_arn) | (Required) A role that SageMaker can assume to access model artifacts and docker images for deployment. | `string` | `null` | no |
| <a name="input_sagemaker_model_name"></a> [sagemaker\_model\_name](#input\_sagemaker\_model\_name) | The name of the model (must be unique). If omitted, Terraform will assign a random, unique name. | `string` | `""` | no |
| <a name="input_sagemaker_model_package_group_description"></a> [sagemaker\_model\_package\_group\_description](#input\_sagemaker\_model\_package\_group\_description) | AAA | `string` | `null` | no |
| <a name="input_sagemaker_model_package_group_name"></a> [sagemaker\_model\_package\_group\_name](#input\_sagemaker\_model\_package\_group\_name) | The name of the model group. | `string` | `""` | no |
| <a name="input_sagemaker_model_primary_container"></a> [sagemaker\_model\_primary\_container](#input\_sagemaker\_model\_primary\_container) | (Optional) The primary docker image containing inference code that is used when the model is deployed for predictions. If not specified, the container argument is required. | `list(any)` | `[]` | no |
| <a name="input_sagemaker_model_vpc_config"></a> [sagemaker\_model\_vpc\_config](#input\_sagemaker\_model\_vpc\_config) | (Optional) - Specifies the VPC that you want your model to connect to. VpcConfig is used in hosting services and in batch transform. | `list(any)` | `[]` | no |
| <a name="input_sagemaker_notebook_instance_direct_internet_access"></a> [sagemaker\_notebook\_instance\_direct\_internet\_access](#input\_sagemaker\_notebook\_instance\_direct\_internet\_access) | (Optional) Set to Disabled to disable internet access to notebook. Requires security\_groups and subnet\_id to be set. Supported values: Enabled (Default) or Disabled. If set to Disabled, the notebook instance will be able to access resources only in your VPC, and will not be able to connect to Amazon SageMaker training and endpoint services unless your configure a NAT Gateway in your VPC. | `string` | `null` | no |
| <a name="input_sagemaker_notebook_instance_instance_type"></a> [sagemaker\_notebook\_instance\_instance\_type](#input\_sagemaker\_notebook\_instance\_instance\_type) | (Required) The name of ML compute instance type. | `string` | `"ml.t2.medium"` | no |
| <a name="input_sagemaker_notebook_instance_kms_key_id"></a> [sagemaker\_notebook\_instance\_kms\_key\_id](#input\_sagemaker\_notebook\_instance\_kms\_key\_id) | (Optional) The AWS Key Management Service (AWS KMS) key that Amazon SageMaker uses to encrypt the model artifacts at rest using Amazon S3 server-side encryption. | `string` | `null` | no |
| <a name="input_sagemaker_notebook_instance_lifecycle_config_name"></a> [sagemaker\_notebook\_instance\_lifecycle\_config\_name](#input\_sagemaker\_notebook\_instance\_lifecycle\_config\_name) | (Optional) The name of a lifecycle configuration to associate with the notebook instance. | `string` | `null` | no |
| <a name="input_sagemaker_notebook_instance_lifecycle_configuration_name"></a> [sagemaker\_notebook\_instance\_lifecycle\_configuration\_name](#input\_sagemaker\_notebook\_instance\_lifecycle\_configuration\_name) | The name of the lifecycle configuration (must be unique). If omitted, Terraform will assign a random, unique name. | `string` | `null` | no |
| <a name="input_sagemaker_notebook_instance_lifecycle_configuration_on_create"></a> [sagemaker\_notebook\_instance\_lifecycle\_configuration\_on\_create](#input\_sagemaker\_notebook\_instance\_lifecycle\_configuration\_on\_create) | (Optional) A shell script (base64-encoded) that runs only once when the SageMaker Notebook Instance is created. | `string` | `null` | no |
| <a name="input_sagemaker_notebook_instance_lifecycle_configuration_on_start"></a> [sagemaker\_notebook\_instance\_lifecycle\_configuration\_on\_start](#input\_sagemaker\_notebook\_instance\_lifecycle\_configuration\_on\_start) | (Optional) A shell script (base64-encoded) that runs every time the SageMaker Notebook Instance is started including the time it's created. | `string` | `null` | no |
| <a name="input_sagemaker_notebook_instance_name"></a> [sagemaker\_notebook\_instance\_name](#input\_sagemaker\_notebook\_instance\_name) | The name of the notebook instance (must be unique). | `string` | `""` | no |
| <a name="input_sagemaker_notebook_instance_role_arn"></a> [sagemaker\_notebook\_instance\_role\_arn](#input\_sagemaker\_notebook\_instance\_role\_arn) | (Required) The ARN of the IAM role to be used by the notebook instance which allows SageMaker to call other services on your behalf. | `string` | `null` | no |
| <a name="input_sagemaker_notebook_instance_security_groups"></a> [sagemaker\_notebook\_instance\_security\_groups](#input\_sagemaker\_notebook\_instance\_security\_groups) | (Optional) The associated security groups. | `set(string)` | `null` | no |
| <a name="input_sagemaker_notebook_instance_subnet_id"></a> [sagemaker\_notebook\_instance\_subnet\_id](#input\_sagemaker\_notebook\_instance\_subnet\_id) | (Optional) The VPC subnet ID. | `string` | `null` | no |
| <a name="input_sagemaker_user_profile_domain_id"></a> [sagemaker\_user\_profile\_domain\_id](#input\_sagemaker\_user\_profile\_domain\_id) | The ID of the associated Domain. | `string` | `""` | no |
| <a name="input_sagemaker_user_profile_jupyter_server_app_settings"></a> [sagemaker\_user\_profile\_jupyter\_server\_app\_settings](#input\_sagemaker\_user\_profile\_jupyter\_server\_app\_settings) | (Optional) The Jupyter server's app settings. | `list(any)` | `[]` | no |
| <a name="input_sagemaker_user_profile_kernel_gateway_app_settings"></a> [sagemaker\_user\_profile\_kernel\_gateway\_app\_settings](#input\_sagemaker\_user\_profile\_kernel\_gateway\_app\_settings) | (Optional) The kernel gateway app settings. | `list(any)` | `[]` | no |
| <a name="input_sagemaker_user_profile_name"></a> [sagemaker\_user\_profile\_name](#input\_sagemaker\_user\_profile\_name) | The name for the User Profile. | `string` | `""` | no |
| <a name="input_sagemaker_user_profile_sharing_settings"></a> [sagemaker\_user\_profile\_sharing\_settings](#input\_sagemaker\_user\_profile\_sharing\_settings) | (Optional) The sharing settings. | `list(any)` | `[]` | no |
| <a name="input_sagemaker_user_profile_single_sign_on_user_identifier"></a> [sagemaker\_user\_profile\_single\_sign\_on\_user\_identifier](#input\_sagemaker\_user\_profile\_single\_sign\_on\_user\_identifier) | (Optional) A specifier for the type of value specified in single\_sign\_on\_user\_value. Currently, the only supported value is UserName. If the Domain's AuthMode is SSO, this field is required. If the Domain's AuthMode is not SSO, this field cannot be specified. | `string` | `null` | no |
| <a name="input_sagemaker_user_profile_single_sign_on_user_value"></a> [sagemaker\_user\_profile\_single\_sign\_on\_user\_value](#input\_sagemaker\_user\_profile\_single\_sign\_on\_user\_value) | (Required) The username of the associated AWS Single Sign-On User for this User Profile. If the Domain's AuthMode is SSO, this field is required, and must match a valid username of a user in your directory. If the Domain's AuthMode is not SSO, this field cannot be specified. | `string` | `null` | no |
| <a name="input_sagemaker_user_profile_tensor_board_app_settings"></a> [sagemaker\_user\_profile\_tensor\_board\_app\_settings](#input\_sagemaker\_user\_profile\_tensor\_board\_app\_settings) | (Optional) The TensorBoard app settings. | `list(any)` | `[]` | no |
| <a name="input_sagemaker_user_profile_user_settings"></a> [sagemaker\_user\_profile\_user\_settings](#input\_sagemaker\_user\_profile\_user\_settings) | AAA | <pre>object({<br>    execution_role  = string<br>    security_groups = set(string)<br>  })</pre> | <pre>{<br>  "execution_role": null,<br>  "security_groups": null<br>}</pre> | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A list of tag blocks. Each element should have keys named key, value, etc. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_sagemaker_app_image_config_arn"></a> [sagemaker\_app\_image\_config\_arn](#output\_sagemaker\_app\_image\_config\_arn) | The Amazon Resource Name (ARN) assigned by AWS to this App Image Config. |
| <a name="output_sagemaker_app_image_config_id"></a> [sagemaker\_app\_image\_config\_id](#output\_sagemaker\_app\_image\_config\_id) | The name of the app image config. |
| <a name="output_sagemaker_code_repository_arn"></a> [sagemaker\_code\_repository\_arn](#output\_sagemaker\_code\_repository\_arn) | The Amazon Resource Name (ARN) assigned by AWS to this Code Repository. |
| <a name="output_sagemaker_code_repository_id"></a> [sagemaker\_code\_repository\_id](#output\_sagemaker\_code\_repository\_id) | The name of the Code Repository. |
| <a name="output_sagemaker_domain_arn"></a> [sagemaker\_domain\_arn](#output\_sagemaker\_domain\_arn) | The Amazon Resource Name (ARN) assigned by AWS to this Domain. |
| <a name="output_sagemaker_domain_home_efs_file_system_id"></a> [sagemaker\_domain\_home\_efs\_file\_system\_id](#output\_sagemaker\_domain\_home\_efs\_file\_system\_id) | The ID of the Amazon Elastic File System (EFS) managed by this Domain. |
| <a name="output_sagemaker_domain_id"></a> [sagemaker\_domain\_id](#output\_sagemaker\_domain\_id) | The ID of the Domain. |
| <a name="output_sagemaker_domain_single_sign_on_managed_application_instance_id"></a> [sagemaker\_domain\_single\_sign\_on\_managed\_application\_instance\_id](#output\_sagemaker\_domain\_single\_sign\_on\_managed\_application\_instance\_id) | The SSO managed application instance ID. |
| <a name="output_sagemaker_domain_url"></a> [sagemaker\_domain\_url](#output\_sagemaker\_domain\_url) | The domain's URL. |
| <a name="output_sagemaker_endpoint_arn"></a> [sagemaker\_endpoint\_arn](#output\_sagemaker\_endpoint\_arn) | The Amazon Resource Name (ARN) assigned by AWS to this endpoint. |
| <a name="output_sagemaker_endpoint_configuration_arn"></a> [sagemaker\_endpoint\_configuration\_arn](#output\_sagemaker\_endpoint\_configuration\_arn) | The Amazon Resource Name (ARN) assigned by AWS to this endpoint configuration. |
| <a name="output_sagemaker_endpoint_configuration_id"></a> [sagemaker\_endpoint\_configuration\_id](#output\_sagemaker\_endpoint\_configuration\_id) | The ID of sagemaker endpoint configuration |
| <a name="output_sagemaker_endpoint_configuration_name"></a> [sagemaker\_endpoint\_configuration\_name](#output\_sagemaker\_endpoint\_configuration\_name) | The name of the endpoint configuration. |
| <a name="output_sagemaker_endpoint_id"></a> [sagemaker\_endpoint\_id](#output\_sagemaker\_endpoint\_id) | The ID of sagemaker endpoint |
| <a name="output_sagemaker_endpoint_name"></a> [sagemaker\_endpoint\_name](#output\_sagemaker\_endpoint\_name) | The name of the endpoint. |
| <a name="output_sagemaker_feature_group_arn"></a> [sagemaker\_feature\_group\_arn](#output\_sagemaker\_feature\_group\_arn) | The Amazon Resource Name (ARN) assigned by AWS to this feature\_group. |
| <a name="output_sagemaker_feature_group_id"></a> [sagemaker\_feature\_group\_id](#output\_sagemaker\_feature\_group\_id) | The name of the feature group. |
| <a name="output_sagemaker_feature_group_name"></a> [sagemaker\_feature\_group\_name](#output\_sagemaker\_feature\_group\_name) | The name of the Feature Group. |
| <a name="output_sagemaker_image_arn"></a> [sagemaker\_image\_arn](#output\_sagemaker\_image\_arn) | The Amazon Resource Name (ARN) assigned by AWS to this Image. |
| <a name="output_sagemaker_image_id"></a> [sagemaker\_image\_id](#output\_sagemaker\_image\_id) | The name of the Image. |
| <a name="output_sagemaker_image_version_arn"></a> [sagemaker\_image\_version\_arn](#output\_sagemaker\_image\_version\_arn) | The Amazon Resource Name (ARN) assigned by AWS to this Image version. |
| <a name="output_sagemaker_image_version_id"></a> [sagemaker\_image\_version\_id](#output\_sagemaker\_image\_version\_id) | The name of the Image version. |
| <a name="output_sagemaker_model_arn"></a> [sagemaker\_model\_arn](#output\_sagemaker\_model\_arn) | The Amazon Resource Name (ARN) assigned by AWS to this model. |
| <a name="output_sagemaker_model_id"></a> [sagemaker\_model\_id](#output\_sagemaker\_model\_id) | The ID of sagemaker model |
| <a name="output_sagemaker_model_name"></a> [sagemaker\_model\_name](#output\_sagemaker\_model\_name) | The name of the model. |
| <a name="output_sagemaker_model_package_group_arn"></a> [sagemaker\_model\_package\_group\_arn](#output\_sagemaker\_model\_package\_group\_arn) | The Amazon Resource Name (ARN) assigned by AWS to this Model Package Group. |
| <a name="output_sagemaker_model_package_group_id"></a> [sagemaker\_model\_package\_group\_id](#output\_sagemaker\_model\_package\_group\_id) | The name of the Model Package Group. |
| <a name="output_sagemaker_notebook_instance_arn"></a> [sagemaker\_notebook\_instance\_arn](#output\_sagemaker\_notebook\_instance\_arn) | The Amazon Resource Name (ARN) assigned by AWS to this notebook instance. |
| <a name="output_sagemaker_notebook_instance_id"></a> [sagemaker\_notebook\_instance\_id](#output\_sagemaker\_notebook\_instance\_id) | The name of the notebook instance. |
| <a name="output_sagemaker_notebook_instance_lifecycle_configuration_arn"></a> [sagemaker\_notebook\_instance\_lifecycle\_configuration\_arn](#output\_sagemaker\_notebook\_instance\_lifecycle\_configuration\_arn) | The Amazon Resource Name (ARN) assigned by AWS to this lifecycle configuration. |
| <a name="output_sagemaker_notebook_instance_lifecycle_configuration_id"></a> [sagemaker\_notebook\_instance\_lifecycle\_configuration\_id](#output\_sagemaker\_notebook\_instance\_lifecycle\_configuration\_id) | The ID of notebook instance lifecycle configuration |
| <a name="output_sagemaker_user_profile_arn"></a> [sagemaker\_user\_profile\_arn](#output\_sagemaker\_user\_profile\_arn) | The user profile Amazon Resource Name (ARN). |
| <a name="output_sagemaker_user_profile_home_efs_file_system_uid"></a> [sagemaker\_user\_profile\_home\_efs\_file\_system\_uid](#output\_sagemaker\_user\_profile\_home\_efs\_file\_system\_uid) | The ID of the user's profile in the Amazon Elastic File System (EFS) volume. |
| <a name="output_sagemaker_user_profile_id"></a> [sagemaker\_user\_profile\_id](#output\_sagemaker\_user\_profile\_id) | The user profile Amazon Resource Name (ARN). |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Authors

Created and maintained by [Vitaliy Natarov](https://github.com/SebastianUA). An email: [vitaliy.natarov@yahoo.com](vitaliy.natarov@yahoo.com).

## License

Apache 2 Licensed. See [LICENSE](https://github.com/SebastianUA/terraform/blob/master/LICENSE) for full details.
