region      = "us-east-1"
environment = "dev"

name              = "arc-iac-health-check"
domain_name       = "shankar-arc-iac.sourcef.us"
resource_path     = "/index.html"
type              = "HTTPS_STR_MATCH"
measure_latency   = true
alarm_prefix      = "test"
failure_threshold = 2
request_interval  = 10
search_string     = "My CloudFront Test" // Note:- string with space(eg. "Health API") is not working , it always goes to in-alarm state
alarm_endpoint    = "https://api.opsgenie.com/v1/json/cloudwatch?apiKey=xxxxx-xx-4xxc9c-xx-xxxx"
