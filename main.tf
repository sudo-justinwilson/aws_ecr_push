resource "null_resource" "example1" {
  depends_on = ["data.aws_ecr_repository.test"]
  provisioner "local-exec" {
    command = "./ecr-docker-push.sh ${var.image_tag} ${data.aws_ecr_repository.test.repository_url}"
    #interpreter = ["bash"]
  }
}   

# data.TYPE.NAME.ATTR
variable "ecr-repo-name" {
  description = "the name of the ECR repository to use"
  default = "test-repo"
}
