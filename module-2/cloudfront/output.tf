
output "origin_s3_buckets" {
  value = [
    for distribution in module.cloudfront : distribution.origin_s3_bucket
  ]
  description = "Origin bucket name"
}

output "cloudfront_id" {
  value = [
    for distribution in module.cloudfront : distribution.cloudfront_id
  ]
  description = "CloudFront ID"
}

output "cloudfront_arn" {
  value = [
    for distribution in module.cloudfront : distribution.cloudfront_arn
  ]
  description = "CloudFront ARN"
}

output "cloudfront_domain_name" {
  value = [
    for distribution in module.cloudfront : distribution.cloudfront_domain_name
  ]
  description = "CloudFront Domain name"
}

output "cloudfront_hosted_zone_id" {
  value = [
    for distribution in module.cloudfront : distribution.cloudfront_hosted_zone_id
  ]
  description = "CloudFront Hosted zone ID"
}
