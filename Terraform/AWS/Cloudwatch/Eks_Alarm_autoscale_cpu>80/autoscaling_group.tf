resource "aws_autoscaling_group" "example" {
  # ...

  min_size = 2
  max_size = 10
  desired_capacity = 2

  # Attach the autoscaling policy
  scaling_policies = [
    aws_autoscaling_policy.example_policy.name,
  ]
}
