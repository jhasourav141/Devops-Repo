resource "aws_cloudwatch_metric_alarm" "cpu_utilization_alarm" {
  alarm_name          = "CPUUtilizationHigh"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods = 1
  metric_name        = "CPUUtilization"
  namespace          = "AWS/EC2"
  period             = 300  # 5-minute intervals
  statistic          = "Average"
  threshold           = 80  # Adjust this threshold as needed
  alarm_description  = "CPU utilization is above 80%"
  alarm_actions      = [aws_autoscaling_policy.example_policy.arn]
  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.example.name
  }
}
