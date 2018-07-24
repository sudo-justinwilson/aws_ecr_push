data "aws_ecr_repository" "test" {
  name = "${var.image_tag}"
}

# data.TYPE.NAME.ATTR
output "arn" {
	value = "${data.aws_ecr_repository.test.arn}"
}

output "url" {
	value = "${data.aws_ecr_repository.test.repository_url}"
}

variable "image_tag" {
  description = "the name that the docker image will be given"
  default = "justin-test"
}
