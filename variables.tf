#-----------------------------------------------------------
# Global or/and default variables
#-----------------------------------------------------------
variable "name" {
  description = "Name to be used on all resources as prefix"
  type        = string
  default     = "TEST"
}

variable "environment" {
  description = "Environment for service"
  type        = string
  default     = "STAGE"
}

variable "tags" {
  description = "A list of tag blocks. Each element should have keys named key, value, etc."
  type        = map(string)
  default     = {}
}

#---------------------------------------------------
# AWS Gagemaker model
#---------------------------------------------------
variable "enable_sagemaker_model" {
  description = "Enable sagemaker model usage"
  type        = bool
  default     = false
}

variable "sagemaker_model_name" {
  description = "The name of the model (must be unique). If omitted, Terraform will assign a random, unique name."
  type        = string
  default     = ""
}

variable "sagemaker_model_execution_role_arn" {
  description = "(Required) A role that SageMaker can assume to access model artifacts and docker images for deployment."
  type        = string
  default     = null
}

variable "sagemaker_model_enable_network_isolation" {
  description = "(Optional) - Isolates the model container. No inbound or outbound network calls can be made to or from the model container."
  type        = bool
  default     = null
}

variable "sagemaker_model_vpc_config" {
  description = "(Optional) - Specifies the VPC that you want your model to connect to. VpcConfig is used in hosting services and in batch transform."
  type        = list(any)
  default     = []
}

variable "sagemaker_model_primary_container" {
  description = "(Optional) The primary docker image containing inference code that is used when the model is deployed for predictions. If not specified, the container argument is required. "
  type        = list(any)
  default     = []
}

variable "sagemaker_model_container" {
  description = "(Optional) - Specifies containers in the inference pipeline. If not specified, the primary_container argument is required."
  type        = list(any)
  default     = []
}

#---------------------------------------------------
# AWS Sagemaker endpoint configuration
#---------------------------------------------------
variable "enable_sagemaker_endpoint_configuration" {
  description = "Enable sagemaker endpoint configuration usage"
  type        = bool
  default     = false
}

variable "sagemaker_endpoint_configuration_name" {
  description = "The name of the endpoint configuration. If omitted, Terraform will assign a random, unique name."
  type        = string
  default     = ""
}

variable "sagemaker_endpoint_configuration_kms_key_arn" {
  description = "(Optional) Amazon Resource Name (ARN) of a AWS Key Management Service key that Amazon SageMaker uses to encrypt data on the storage volume attached to the ML compute instance that hosts the endpoint."
  type        = string
  default     = null
}

variable "sagemaker_endpoint_configuration_production_variants" {
  description = "(Required) Fields for endpoint"
  type        = list(any)
  default     = []
}

#---------------------------------------------------
# AWS Sagemaker endpoint
#---------------------------------------------------
variable "enable_sagemaker_endpoint" {
  description = "Enable sagemaker endpoint usage"
  type        = bool
  default     = false
}

variable "sagemaker_endpoint_name" {
  description = "The name of the endpoint. If omitted, Terraform will assign a random, unique name."
  type        = string
  default     = null
}

variable "sagemaker_endpoint_endpoint_config_name" {
  description = "The name of the endpoint configuration to use."
  type        = string
  default     = ""
}

#---------------------------------------------------
# AWS sagemaker notebook instance lifecycle configuration
#---------------------------------------------------
variable "enable_sagemaker_notebook_instance_lifecycle_configuration" {
  description = "Enable sagemaker notebook instance lifecycle configuration usage"
  type        = bool
  default     = false
}

variable "sagemaker_notebook_instance_lifecycle_configuration_name" {
  description = "The name of the lifecycle configuration (must be unique). If omitted, Terraform will assign a random, unique name."
  type        = string
  default     = null
}

variable "sagemaker_notebook_instance_lifecycle_configuration_on_create" {
  description = "(Optional) A shell script (base64-encoded) that runs only once when the SageMaker Notebook Instance is created."
  type        = string
  default     = null
}

variable "sagemaker_notebook_instance_lifecycle_configuration_on_start" {
  description = "(Optional) A shell script (base64-encoded) that runs every time the SageMaker Notebook Instance is started including the time it's created."
  type        = string
  default     = null
}

#---------------------------------------------------
# AWS Sagemaker notebook instance
#---------------------------------------------------
variable "enable_sagemaker_notebook_instance" {
  description = "Enable sagemaker notebook instance usage"
  type        = bool
  default     = false
}

variable "sagemaker_notebook_instance_name" {
  description = "The name of the notebook instance (must be unique)."
  type        = string
  default     = ""
}

variable "sagemaker_notebook_instance_role_arn" {
  description = "(Required) The ARN of the IAM role to be used by the notebook instance which allows SageMaker to call other services on your behalf."
  type        = string
  default     = null
}

variable "sagemaker_notebook_instance_instance_type" {
  description = "(Required) The name of ML compute instance type."
  type        = string
  default     = "ml.t2.medium"
}

variable "sagemaker_notebook_instance_subnet_id" {
  description = "(Optional) The VPC subnet ID."
  type        = string
  default     = null
}

variable "sagemaker_notebook_instance_security_groups" {
  description = "(Optional) The associated security groups."
  type        = set(string)
  default     = null
}

variable "sagemaker_notebook_instance_kms_key_id" {
  description = "(Optional) The AWS Key Management Service (AWS KMS) key that Amazon SageMaker uses to encrypt the model artifacts at rest using Amazon S3 server-side encryption."
  type        = string
  default     = null
}

variable "sagemaker_notebook_instance_lifecycle_config_name" {
  description = "(Optional) The name of a lifecycle configuration to associate with the notebook instance."
  type        = string
  default     = null
}

variable "sagemaker_notebook_instance_direct_internet_access" {
  description = "(Optional) Set to Disabled to disable internet access to notebook. Requires security_groups and subnet_id to be set. Supported values: Enabled (Default) or Disabled. If set to Disabled, the notebook instance will be able to access resources only in your VPC, and will not be able to connect to Amazon SageMaker training and endpoint services unless your configure a NAT Gateway in your VPC."
  type        = string
  default     = null
}

#---------------------------------------------------
# AWS Sagemaker user profile
#---------------------------------------------------
variable "enable_sagemaker_user_profile" {
  description = "Enable sagemaker user profile usage"
  type        = bool
  default     = false
}

variable "sagemaker_user_profile_name" {
  description = "The name for the User Profile."
  type        = string
  default     = ""
}

variable "sagemaker_user_profile_domain_id" {
  description = "The ID of the associated Domain."
  type        = string
  default     = ""
}

variable "sagemaker_user_profile_single_sign_on_user_value" {
  description = "(Required) The username of the associated AWS Single Sign-On User for this User Profile. If the Domain's AuthMode is SSO, this field is required, and must match a valid username of a user in your directory. If the Domain's AuthMode is not SSO, this field cannot be specified."
  type        = string
  default     = null
}

variable "sagemaker_user_profile_single_sign_on_user_identifier" {
  description = "(Optional) A specifier for the type of value specified in single_sign_on_user_value. Currently, the only supported value is UserName. If the Domain's AuthMode is SSO, this field is required. If the Domain's AuthMode is not SSO, this field cannot be specified."
  type        = string
  default     = null
}

variable "sagemaker_user_profile_user_settings" {
  description = "AAA"
  type = object({
    execution_role  = string
    security_groups = set(string)
  })
  default = {
    execution_role = null

    security_groups = null
  }
}

variable "sagemaker_user_profile_sharing_settings" {
  description = "(Optional) The sharing settings."
  type        = list(any)
  default     = []
}

variable "sagemaker_user_profile_tensor_board_app_settings" {
  description = "(Optional) The TensorBoard app settings."
  type        = list(any)
  default     = []
}

variable "sagemaker_user_profile_jupyter_server_app_settings" {
  description = "(Optional) The Jupyter server's app settings."
  type        = list(any)
  default     = []
}

variable "sagemaker_user_profile_kernel_gateway_app_settings" {
  description = "(Optional) The kernel gateway app settings."
  type        = list(any)
  default     = []
}

#---------------------------------------------------
# AWS Sagemaker domain
#---------------------------------------------------
variable "enable_sagemaker_domain" {
  description = "Enable sagemaker domain usage"
  type        = bool
  default     = false
}

variable "sagemaker_domain_name" {
  description = "The domain name."
  type        = string
  default     = ""
}

variable "sagemaker_domain_auth_mode" {
  description = "(Required) The mode of authentication that members use to access the domain. Valid values are IAM and SSO"
  type        = string
  default     = null
}

variable "sagemaker_domain_vpc_id" {
  description = "(Required) The ID of the Amazon Virtual Private Cloud (VPC) that Studio uses for communication."
  type        = string
  default     = null
}

variable "sagemaker_domain_subnet_ids" {
  description = "(Required) The VPC subnets that Studio uses for communication."
  type        = set(string)
  default     = null
}

variable "sagemaker_domain_kms_key_id" {
  description = "(Optional) The AWS KMS customer managed CMK used to encrypt the EFS volume attached to the domain."
  type        = string
  default     = null
}

variable "sagemaker_domain_app_network_access_type" {
  description = "(Optional) Specifies the VPC used for non-EFS traffic. The default value is PublicInternetOnly. Valid values are PublicInternetOnly and VpcOnly."
  type        = string
  default     = null
}

variable "sagemaker_domain_default_user_settings" {
  description = "(Required) The default user settings."
  type = object({
    execution_role  = string
    security_groups = set(string)
  })
  default = {
    execution_role = null

    security_groups = null
  }
}

variable "sagemaker_domain_sharing_settings" {
  description = "(Optional) The sharing settings. "
  type        = list(any)
  default     = []
}

variable "sagemaker_domain_tensor_board_app_settings" {
  description = "(Optional) The TensorBoard app settings."
  type        = list(any)
  default     = []
}

variable "sagemaker_domain_jupyter_server_app_settings" {
  description = "(Optional) The Jupyter server's app settings."
  type        = list(any)
  default     = []
}

variable "sagemaker_domain_kernel_gateway_app_settings" {
  description = "(Optional) The kernel gateway app settings."
  type        = list(any)
  default     = []
}

#---------------------------------------------------
# AWS sagemaker model package group
#---------------------------------------------------
variable "enable_sagemaker_model_package_group" {
  description = "Enable sagemaker model package group usage"
  type        = bool
  default     = false
}

variable "sagemaker_model_package_group_name" {
  description = "The name of the model group."
  type        = string
  default     = ""
}

variable "sagemaker_model_package_group_description" {
  description = "AAA"
  type        = string
  default     = null
}

#---------------------------------------------------
# AWS sagemaker image
#---------------------------------------------------
variable "enable_sagemaker_image" {
  description = "Enable sagemaker image usage"
  type        = bool
  default     = false
}

variable "sagemaker_image_name" {
  description = "The name of the image. Must be unique to your account."
  type        = string
  default     = ""
}

variable "sagemaker_image_role_arn" {
  description = "(Required) The Amazon Resource Name (ARN) of an IAM role that enables Amazon SageMaker to perform tasks on your behalf."
  type        = string
  default     = null
}

variable "sagemaker_image_display_name" {
  description = "(Optional) The display name of the image. When the image is added to a domain (must be unique to the domain)."
  type        = string
  default     = null
}

variable "sagemaker_image_description" {
  description = "(Optional) The description of the image."
  type        = string
  default     = null
}

#---------------------------------------------------
# AWS sagemaker image version
#---------------------------------------------------
variable "enable_sagemaker_image_version" {
  description = "Enable sagemaker image version usage"
  type        = bool
  default     = false
}

variable "sagemaker_image_version_image_name" {
  description = "The name of the image. Must be unique to your account."
  type        = string
  default     = ""
}

variable "sagemaker_image_version_base_image" {
  description = "(Required) The registry path of the container image on which this image version is based."
  type        = string
  default     = null
}

#---------------------------------------------------
# AWS sagemaker feature group
#---------------------------------------------------
variable "enable_sagemaker_feature_group" {
  description = "Enable sagemaker feature group usage"
  type        = bool
  default     = false
}

variable "sagemaker_feature_group_name" {
  description = "The name of the Feature Group. The name must be unique within an AWS Region in an AWS account."
  type        = string
  default     = ""
}

variable "sagemaker_feature_group_record_identifier_feature_name" {
  description = "The name of the Feature whose value uniquely identifies a Record defined in the Feature Store. Only the latest record per identifier value will be stored in the Online Store."
  type        = string
  default     = ""
}

variable "sagemaker_feature_group_event_time_feature_name" {
  description = "The name of the feature that stores the EventTime of a Record in a Feature Group."
  type        = string
  default     = ""
}

variable "sagemaker_feature_group_role_arn" {
  description = "(Required) - The Amazon Resource Name (ARN) of the IAM execution role used to persist data into the Offline Store if an offline_store_config is provided."
  type        = string
  default     = null
}

variable "sagemaker_feature_group_description" {
  description = "(Optional) - A free-form description of a Feature Group."
  type        = string
  default     = null
}

variable "sagemaker_feature_group_feature_definition" {
  description = "(Optional) - A list of Feature names and types."
  type        = list(any)
  default     = []
}

variable "sagemaker_feature_group_s3_storage_config" {
  description = "(Required) The Amazon Simple Storage (Amazon S3) location of OfflineStore."
  type        = list(any)
  default     = []
}

variable "sagemaker_feature_group_data_catalog_config" {
  description = "(Optional) The meta data of the Glue table that is autogenerated when an OfflineStore is created."
  type        = list(any)
  default     = []
}

variable "sagemaker_feature_group_security_config" {
  description = "(Required) Security config for at-rest encryption of your OnlineStore."
  type        = list(any)
  default     = []
}

#---------------------------------------------------
# AWS sagemaker code repository
#---------------------------------------------------
variable "enable_sagemaker_code_repository" {
  description = "Enable sagemaker code repository usage"
  type        = bool
  default     = false
}

variable "sagemaker_code_repository_name" {
  description = "The name of the Code Repository (must be unique)."
  type        = string
  default     = ""
}

variable "sagemaker_code_repository_git_config" {
  description = "(Required) Specifies details about the repository."
  type        = list(any)
  default     = []
}

#---------------------------------------------------
# AWS sagemaker app image config
#---------------------------------------------------
variable "enable_sagemaker_app_image_config" {
  description = "Enable sagemaker app image config usage"
  type        = bool
  default     = false
}

variable "sagemaker_app_image_config_name" {
  description = "The name of the App Image Config."
  type        = string
  default     = ""
}

variable "sagemaker_app_image_config_kernel_spec" {
  description = "(Required) The default branch for the Git repository."
  type        = list(any)
  default     = []
}

variable "sagemaker_app_image_config_file_system_config" {
  description = "(Optional) The URL where the Git repository is located."
  type        = list(any)
  default     = []
}
