# group definition
resource "aws_iam_group" "admins_tf" {
  name = "admins_tf"
}

resource "aws_iam_policy_attachment" "admins-attach" {
  name       = "admins-attach"
  groups     = [aws_iam_group.admins_tf.name]
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

# users
resource "aws_iam_user" "admin1_tf" {
  name = "admin1_tf"
}

resource "aws_iam_user" "admin2_tf" {
  name = "admin2_tf"
}

resource "aws_iam_group_membership" "admin-users" {
  name = "admin-users"
  users = [
    aws_iam_user.admin1_tf.name,
    aws_iam_user.admin2_tf.name,
  ]
  group = aws_iam_group.admins_tf.name
}

output "warning" {
  value = "WARNING: make sure you're not using the AdministratorAccess policy for other users/groups/roles. If this is the case, don't run terraform destroy, but manually unlink the created resources"
}
