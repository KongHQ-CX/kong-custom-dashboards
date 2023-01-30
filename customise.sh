#!/bin/bash

echo_usage() {
  echo ""
  echo "USAGE:"
  echo "   ./customise.sh {namespace-prefix} {output-filename.json}"
  echo ""
  exit 1
}

if [[ -z "$1"  || -z "$2" ]]
then
  echo_usage
fi

echo ""

echo "Producing a dashboard for namespace(s) $1 - outputting to ./$2"
cp kong-3.0-dashboard-template.json.tpl $2.stagein
echo ""

echo "> Adding title 'Kong Filtered $1'"
jq ".title = \"Kong Filtered $1\"" $2.stagein > $2.stageout
mv $2.stageout $2.stagein

NEW_UID="$(openssl rand -hex 4)f"
echo "> Adding uid $NEW_UID"
jq ".uid = \"$NEW_UID\"" $2.stagein > $2.stageout
mv $2.stageout $2.stagein

echo "> Removing import placeholders"
jq 'del(.__elements)' $2.stagein > $2.stageout
mv $2.stageout $2.stagein
jq 'del(.__inputs)' $2.stagein > $2.stageout
mv $2.stageout $2.stagein
jq 'del(.__requires)' $2.stagein > $2.stageout
mv $2.stageout $2.stagein
jq '.annotations.list[0].datasource = "Prometheus"' $2.stagein > $2.stageout
mv $2.stageout $2.stagein


echo "> Adding 'namespace' label"
jq ".templating.list[.templating.list | length] |= . + $(cat ./kong-snippets/namespace-label.json)" $2.stagein > $2.stageout
mv $2.stageout $2.stagein

if [ "$1" == "all" ]
then
  echo '!! "ALL" namespaces requested - setting namespace filter to .* !!'
  jq "(.templating.list[] | select(.name == \"namespace\").regex) |= \".*\"" $2.stagein > $2.stageout
  mv $2.stageout $2.stagein
  jq "(.templating.list[] | select(.name == \"namespace\").includeAll) |= true" $2.stagein > $2.stageout
  mv $2.stageout $2.stagein
else
  jq "(.templating.list[] | select(.name == \"namespace\").regex) |= \"$1.*\"" $2.stagein > $2.stageout
  mv $2.stageout $2.stagein
fi

echo "> Adding 'consumer' label"
jq ".templating.list[.templating.list | length] |= . + $(cat ./kong-snippets/consumer-label.json)" $2.stagein > $2.stageout
mv $2.stageout $2.stagein
jq ".templating.list[.templating.list | length - 1].definition = \"label_values(kong_http_requests_total{namespace=~\\\"$1.*\\\"}, consumer)\"" $2.stagein > $2.stageout
mv $2.stageout $2.stagein
jq ".templating.list[.templating.list | length - 1].query.query = \"label_values(kong_http_requests_total{namespace=~\\\"$1.*\\\"}, consumer)\"" $2.stagein > $2.stageout
mv $2.stageout $2.stagein

echo "> Updating existing labels"
echo ">> Adding '\$namespace' to 'instance' label predicate"
jq '(.templating.list[] | select(.name == "instance").definition) |= "label_values(kong_nginx_connections_total{namespace=\"$namespace\"},instance)"' $2.stagein > $2.stageout
mv $2.stageout $2.stagein
jq '(.templating.list[] | select(.name == "instance").query.query) |= "label_values(kong_nginx_connections_total{namespace=\"$namespace\"},instance)"' $2.stagein > $2.stageout
mv $2.stageout $2.stagein

echo ">> Adding '\$namespace' to 'service' label predicate"
jq '(.templating.list[] | select(.name == "service").definition) |= "label_values(kong_http_requests_total{namespace=\"$namespace\"},service)"' $2.stagein > $2.stageout
mv $2.stageout $2.stagein
jq '(.templating.list[] | select(.name == "service").query.query) |= "label_values(kong_http_requests_total{namespace=\"$namespace\"},service)"' $2.stagein > $2.stageout
mv $2.stageout $2.stagein

echo ">> Adding '\$namespace' to 'route' label predicate"
jq '(.templating.list[] | select(.name == "route").definition) |= "label_values(kong_http_requests_total{namespace=\"$namespace\"},route)"' $2.stagein > $2.stageout
mv $2.stageout $2.stagein
jq '(.templating.list[] | select(.name == "route").query.query) |= "label_values(kong_http_requests_total{namespace=\"$namespace\"},route)"' $2.stagein > $2.stageout
mv $2.stageout $2.stagein

echo ">> Adding '\$namespace' to 'route' label predicate"
jq '(.templating.list[] | select(.name == "route").definition) |= "label_values(kong_http_requests_total{namespace=\"$namespace\"},route)"' $2.stagein > $2.stageout
mv $2.stageout $2.stagein
jq '(.templating.list[] | select(.name == "route").query.query) |= "label_values(kong_http_requests_total{namespace=\"$namespace\"},route)"' $2.stagein > $2.stageout
mv $2.stageout $2.stagein

echo ">> Adding '\$namespace' to 'upstream' label predicate"
jq '(.templating.list[] | select(.name == "upstream").definition) |= "label_values(kong_upstream_target_health{namespace=\"$namespace\"},upstream)"' $2.stagein > $2.stageout
mv $2.stageout $2.stagein
jq '(.templating.list[] | select(.name == "upstream").query.query) |= "label_values(kong_upstream_target_health{namespace=\"$namespace\"},upstream)"' $2.stagein > $2.stageout
mv $2.stageout $2.stagein

echo ">> Adding '\$namespace' to graph filters"
echo ">>> 'Nginx connection state'"
jq '(.panels[].panels[] | select(.title == "Nginx connection state").targets[0].expr) |= "sum(kong_nginx_connections_total{state=~\"active|reading|writing|waiting\", instance=~\"$instance\", namespace=\"$namespace\"}) by (state)"' $2.stagein > $2.stageout
mv $2.stageout $2.stagein
echo ">>> 'Total Connections'"
jq '(.panels[].panels[] | select(.title == "Total Connections").targets[0].expr) |= "sum(kong_nginx_connections_total{state=\"total\", instance=~\"$instance\", namespace=\"$namespace\"})"' $2.stagein > $2.stageout
mv $2.stageout $2.stagein
echo ">>> 'Handled Connections'"
jq '(.panels[].panels[] | select(.title == "Handled Connections").targets[0].expr) |= "sum(kong_nginx_connections_total{state=\"handled\", instance=~\"$instance\", namespace=\"$namespace\"})"' $2.stagein > $2.stageout
mv $2.stageout $2.stagein
echo ">>> 'Accepted Connections'"
jq '(.panels[].panels[] | select(.title == "Accepted Connections").targets[0].expr) |= "sum(kong_nginx_connections_total{state=\"accepted\", instance=~\"$instance\", namespace=\"$namespace\"})"' $2.stagein > $2.stageout
mv $2.stageout $2.stagein
echo ">>> 'Total requests per second (RPS)'"
jq '(.panels[].panels[] | select(.title == "Total requests per second (RPS)").targets[0].expr) |= "sum(rate(kong_http_requests_total{service=~\"$service\", route=~\"$route\", instance=~\"$instance\", namespace=\"$namespace\"}[1m])) by (service)"' $2.stagein > $2.stageout
mv $2.stageout $2.stagein

echo ">>> 'RPS per route/service (\$service)'"
jq '(.panels[].panels[] | select(.title == "RPS per route/service ($service)").targets[0].expr) |= "sum(rate(kong_http_requests_total{instance=~\"$instance\", namespace=\"$namespace\"}[1m]))"' $2.stagein > $2.stageout
mv $2.stageout $2.stagein
jq '(.panels[].panels[] | select(.title == "RPS per route/service ($service)").targets[1].expr) |= "sum(rate(kong_http_requests_total{service=~\"$service\", route=~\"$route\", instance=~\"$instance\", namespace=\"$namespace\"}[1m])) by (route)"' $2.stagein > $2.stageout
mv $2.stageout $2.stagein

echo ">>> 'RPS per route/service by status code'"
jq '(.panels[].panels[] | select(.title == "RPS per route/service by status code").targets[0].expr) |= "sum(rate(kong_http_requests_total{service=~\"$service\", route=~\"$route\", instance=~\"$instance\", namespace=\"$namespace\"}[1m])) by (service,code)"' $2.stagein > $2.stageout
mv $2.stageout $2.stagein
jq '(.panels[].panels[] | select(.title == "RPS per route/service by status code").targets[1].expr) |= "sum(rate(kong_http_requests_total{service=~\"$service\", route=~\"$route\", instance=~\"$instance\", namespace=\"$namespace\"}[1m])) by (route,code)"' $2.stagein > $2.stageout
mv $2.stageout $2.stagein

echo ">>> 'Kong Proxy Latency across all services'"
jq '(.panels[].panels[] | select(.title == "Kong Proxy Latency across all services").targets[0].expr) |= "histogram_quantile(0.90, sum(rate(kong_kong_latency_ms_bucket{instance=~\"$instance\", namespace=\"$namespace\"}[1m])) by (le))"' $2.stagein > $2.stageout
mv $2.stageout $2.stagein
jq '(.panels[].panels[] | select(.title == "Kong Proxy Latency across all services").targets[1].expr) |= "histogram_quantile(0.95, sum(rate(kong_kong_latency_ms_bucket{instance=~\"$instance\", namespace=\"$namespace\"}[1m])) by (le))"' $2.stagein > $2.stageout
mv $2.stageout $2.stagein
jq '(.panels[].panels[] | select(.title == "Kong Proxy Latency across all services").targets[2].expr) |= "histogram_quantile(0.99, sum(rate(kong_kong_latency_ms_bucket{instance=~\"$instance\", namespace=\"$namespace\"}[1m])) by (le))"' $2.stagein > $2.stageout
mv $2.stageout $2.stagein

echo ">>> 'Kong Proxy Latency per Service'"
jq '(.panels[].panels[] | select(.title == "Kong Proxy Latency per Service").targets[0].expr) |= "histogram_quantile(0.90, sum(rate(kong_kong_latency_ms_bucket{service =~ \"$service\",route=~\"$route\",instance=~\"$instance\",namespace=\"$namespace\"}[1m])) by (service,le))"' $2.stagein > $2.stageout
mv $2.stageout $2.stagein
jq '(.panels[].panels[] | select(.title == "Kong Proxy Latency per Service").targets[1].expr) |= "histogram_quantile(0.95, sum(rate(kong_kong_latency_ms_bucket{service =~ \"$service\",route=~\"$route\",instance=~\"$instance\",namespace=\"$namespace\"}[1m])) by (service,le))"' $2.stagein > $2.stageout
mv $2.stageout $2.stagein
jq '(.panels[].panels[] | select(.title == "Kong Proxy Latency per Service").targets[2].expr) |= "histogram_quantile(0.99, sum(rate(kong_kong_latency_ms_bucket{service =~ \"$service\",route=~\"$route\",instance=~\"$instance\",namespace=\"$namespace\"}[1m])) by (service,le))"' $2.stagein > $2.stageout
mv $2.stageout $2.stagein

echo ">>> 'Kong Proxy Latency per Route'"
jq '(.panels[].panels[] | select(.title == "Kong Proxy Latency per Route").targets[0].expr) |= "histogram_quantile(0.90, sum(rate(kong_kong_latency_ms_bucket{service =~ \"$service\",route=~\"$route\",instance=~\"$instance\",namespace=\"$namespace\"}[1m])) by (route,le))"' $2.stagein > $2.stageout
mv $2.stageout $2.stagein
jq '(.panels[].panels[] | select(.title == "Kong Proxy Latency per Route").targets[1].expr) |= "histogram_quantile(0.95, sum(rate(kong_kong_latency_ms_bucket{service =~ \"$service\",route=~\"$route\",instance=~\"$instance\",namespace=\"$namespace\"}[1m])) by (route,le))"' $2.stagein > $2.stageout
mv $2.stageout $2.stagein
jq '(.panels[].panels[] | select(.title == "Kong Proxy Latency per Route").targets[2].expr) |= "histogram_quantile(0.99, sum(rate(kong_kong_latency_ms_bucket{service =~ \"$service\",route=~\"$route\",instance=~\"$instance\",namespace=\"$namespace\"}[1m])) by (route,le))"' $2.stagein > $2.stageout
mv $2.stageout $2.stagein

echo ">>> 'Request Time across all services'"
jq '(.panels[].panels[] | select(.title == "Request Time across all services").targets[0].expr) |= "histogram_quantile(0.90, sum(rate(kong_request_latency_ms_bucket{namespace=\"$namespace\"}[1m])) by (le))"' $2.stagein > $2.stageout
mv $2.stageout $2.stagein
jq '(.panels[].panels[] | select(.title == "Request Time across all services").targets[1].expr) |= "histogram_quantile(0.95, sum(rate(kong_request_latency_ms_bucket{namespace=\"$namespace\"}[1m])) by (le))"' $2.stagein > $2.stageout
mv $2.stageout $2.stagein
jq '(.panels[].panels[] | select(.title == "Request Time across all services").targets[2].expr) |= "histogram_quantile(0.99, sum(rate(kong_request_latency_ms_bucket{namespace=\"$namespace\"}[1m])) by (le))"' $2.stagein > $2.stageout
mv $2.stageout $2.stagein

echo ">>> 'Request Time per service'"
jq '(.panels[].panels[] | select(.title == "Request Time per service").targets[0].expr) |= "histogram_quantile(0.90, sum(rate(kong_request_latency_ms_bucket{service =~ \"$service\",route=~\"$route\",instance=~\"$instance\",namespace=\"$namespace\"}[1m])) by (service,le))"' $2.stagein > $2.stageout
mv $2.stageout $2.stagein
jq '(.panels[].panels[] | select(.title == "Request Time per service").targets[1].expr) |= "histogram_quantile(0.95, sum(rate(kong_request_latency_ms_bucket{service =~ \"$service\",route=~\"$route\",instance=~\"$instance\",namespace=\"$namespace\"}[1m])) by (service,le))"' $2.stagein > $2.stageout
mv $2.stageout $2.stagein
jq '(.panels[].panels[] | select(.title == "Request Time per service").targets[2].expr) |= "histogram_quantile(0.99, sum(rate(kong_request_latency_ms_bucket{service =~ \"$service\",route=~\"$route\",instance=~\"$instance\",namespace=\"$namespace\"}[1m])) by (service,le))"' $2.stagein > $2.stageout
mv $2.stageout $2.stagein

echo ">>> 'Request Time per Route'"
jq '(.panels[].panels[] | select(.title == "Request Time per Route").targets[0].expr) |= "histogram_quantile(0.90, sum(rate(kong_request_latency_ms_bucket{service =~ \"$service\",route=~\"$route\",instance=~\"$instance\",namespace=\"$namespace\"}[1m])) by (route,le))"' $2.stagein > $2.stageout
mv $2.stageout $2.stagein
jq '(.panels[].panels[] | select(.title == "Request Time per Route").targets[1].expr) |= "histogram_quantile(0.95, sum(rate(kong_request_latency_ms_bucket{service =~ \"$service\",route=~\"$route\",instance=~\"$instance\",namespace=\"$namespace\"}[1m])) by (route,le))"' $2.stagein > $2.stageout
mv $2.stageout $2.stagein
jq '(.panels[].panels[] | select(.title == "Request Time per Route").targets[2].expr) |= "histogram_quantile(0.99, sum(rate(kong_request_latency_ms_bucket{service =~ \"$service\",route=~\"$route\",instance=~\"$instance\",namespace=\"$namespace\"}[1m])) by (route,le))"' $2.stagein > $2.stageout
mv $2.stageout $2.stagein

echo ">>> 'Upstream time across all services'"
jq '(.panels[].panels[] | select(.title == "Upstream time across all services").targets[0].expr) |= "histogram_quantile(0.90, sum(rate(kong_upstream_latency_ms_bucket{namespace=\"$namespace\"}[1m])) by (le))"' $2.stagein > $2.stageout
mv $2.stageout $2.stagein
jq '(.panels[].panels[] | select(.title == "Upstream time across all services").targets[1].expr) |= "histogram_quantile(0.95, sum(rate(kong_upstream_latency_ms_bucket{namespace=\"$namespace\"}[1m])) by (le))"' $2.stagein > $2.stageout
mv $2.stageout $2.stagein
jq '(.panels[].panels[] | select(.title == "Upstream time across all services").targets[2].expr) |= "histogram_quantile(0.99, sum(rate(kong_upstream_latency_ms_bucket{namespace=\"$namespace\"}[1m])) by (le))"' $2.stagein > $2.stageout
mv $2.stageout $2.stagein

echo ">>> 'Upstream Time across per service'"
jq '(.panels[].panels[] | select(.title == "Upstream Time across per service").targets[0].expr) |= "histogram_quantile(0.90, sum(rate(kong_upstream_latency_ms_bucket{service =~ \"$service\",route=~\"$route\",instance=~\"$instance\",namespace=\"$namespace\"}[1m])) by (service,le))"' $2.stagein > $2.stageout
mv $2.stageout $2.stagein
jq '(.panels[].panels[] | select(.title == "Upstream Time across per service").targets[1].expr) |= "histogram_quantile(0.95, sum(rate(kong_upstream_latency_ms_bucket{service =~ \"$service\",route=~\"$route\",instance=~\"$instance\",namespace=\"$namespace\"}[1m])) by (service,le))"' $2.stagein > $2.stageout
mv $2.stageout $2.stagein
jq '(.panels[].panels[] | select(.title == "Upstream Time across per service").targets[2].expr) |= "histogram_quantile(0.99, sum(rate(kong_upstream_latency_ms_bucket{service =~ \"$service\",route=~\"$route\",instance=~\"$instance\",namespace=\"$namespace\"}[1m])) by (service,le))"' $2.stagein > $2.stageout
mv $2.stageout $2.stagein

echo ">>> 'Upstream Time across per Route'"
jq '(.panels[].panels[] | select(.title == "Upstream Time across per Route").targets[0].expr) |= "histogram_quantile(0.90, sum(rate(kong_upstream_latency_ms_bucket{service =~ \"$service\",route=~\"$route\",instance=~\"$instance\",namespace=\"$namespace\"}[1m])) by (route,le))"' $2.stagein > $2.stageout
mv $2.stageout $2.stagein
jq '(.panels[].panels[] | select(.title == "Upstream Time across per Route").targets[1].expr) |= "histogram_quantile(0.95, sum(rate(kong_upstream_latency_ms_bucket{service =~ \"$service\",route=~\"$route\",instance=~\"$instance\",namespace=\"$namespace\"}[1m])) by (route,le))"' $2.stagein > $2.stageout
mv $2.stageout $2.stagein
jq '(.panels[].panels[] | select(.title == "Upstream Time across per Route").targets[2].expr) |= "histogram_quantile(0.99, sum(rate(kong_upstream_latency_ms_bucket{service =~ \"$service\",route=~\"$route\",instance=~\"$instance\",namespace=\"$namespace\"}[1m])) by (route,le))"' $2.stagein > $2.stageout
mv $2.stageout $2.stagein

echo ">>> 'Total Bandwidth'"
jq '(.panels[].panels[] | select(.title == "Total Bandwidth").targets[0].expr) |= "sum(irate(kong_bandwidth_bytes{instance=~\"$instance\",namespace=\"$namespace\"}[1m])) by (type)"' $2.stagein > $2.stageout
mv $2.stageout $2.stagein

echo ">>> 'Egress per service/route'"
jq '(.panels[].panels[] | select(.title == "Egress per service/route").targets[0].expr) |= "sum(irate(kong_bandwidth_bytes{direction=\"egress\", service =~\"$service\",route=~\"$route\",instance=~\"$instance\",namespace=\"$namespace\"}[1m])) by (service)"' $2.stagein > $2.stageout
mv $2.stageout $2.stagein
jq '(.panels[].panels[] | select(.title == "Egress per service/route").targets[1].expr) |= "sum(irate(kong_bandwidth_bytes{direction=\"egress\", service =~\"$service\",route=~\"$route\",instance=~\"$instance\",namespace=\"$namespace\"}[1m])) by (route)"' $2.stagein > $2.stageout
mv $2.stageout $2.stagein

echo ">>> 'Ingress per service/route'"
jq '(.panels[].panels[] | select(.title == "Ingress per service/route").targets[0].expr) |= "sum(irate(kong_bandwidth_bytes{direction=\"ingress\", service =~\"$service\",namespace=\"$namespace\"}[1m])) by (service)"' $2.stagein > $2.stageout
mv $2.stageout $2.stagein

echo ">>> 'Healthy status'"
jq '(.panels[].panels[] | select(.title == "Healthy status").targets[0].expr) |= "sum(kong_upstream_target_health{state=\"healthy\",upstream=~\"$upstream\",namespace=\"$namespace\"}) by (upstream,target,address) * -1  + sum(kong_upstream_target_health{state=~\"(unhealthy|dns_error)\",upstream=~\"$upstream\",namespace=\"$namespace\"}) by (upstream,target,address)"' $2.stagein > $2.stageout
mv $2.stageout $2.stagein


echo "> Adding Per-Consumer row"
jq ".panels[.panels | length ] |= . + $(cat ./kong-snippets/per-consumer-row.json)" $2.stagein > $2.stageout
mv $2.stageout $2.stagein

echo "> Setting all datasources to default Prometheus"
jq '.panels[].datasource |= "Prometheus"' $2.stagein > $2.stageout
mv $2.stageout $2.stagein
jq '(.panels[] | select(has("targets") == true).targets[].datasource) |= "Prometheus"' $2.stagein > $2.stageout
mv $2.stageout $2.stagein
jq '.panels[].panels[].datasource |= "Prometheus"' $2.stagein > $2.stageout
mv $2.stageout $2.stagein
jq '.templating.list[].datasource |= "Prometheus"' $2.stagein > $2.stageout
mv $2.stageout $2.stagein
jq '.panels[].panels[].targets[].datasource |= "Prometheus"' $2.stagein > $2.stageout
mv $2.stageout $2.stagein

echo ""
echo "Finished."
mv $2.stagein $2
