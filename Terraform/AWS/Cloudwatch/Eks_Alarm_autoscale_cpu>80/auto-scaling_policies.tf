resource "aws_autoscaling_policy" "example_policy" {
  name                   = "cpu-scaling-policy"
  policy_type            = "SimpleScaling"
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = 1  # Increase capacity by 1 instance
  cooldown               = 300  # 5-minute cooldown period
  autoscaling_group_name = aws_autoscaling_group.example.name
}
