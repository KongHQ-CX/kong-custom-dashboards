{
  "__inputs": [
    {
      "name": "DS_PROMETHEUS",
      "label": "Prometheus",
      "description": "",
      "type": "datasource",
      "pluginId": "prometheus",
      "pluginName": "Prometheus"
    }
  ],
  "__elements": {},
  "__requires": [
    {
      "type": "panel",
      "id": "gauge",
      "name": "Gauge",
      "version": ""
    },
    {
      "type": "grafana",
      "id": "grafana",
      "name": "Grafana",
      "version": "9.3.2"
    },
    {
      "type": "panel",
      "id": "graph",
      "name": "Graph (old)",
      "version": ""
    },
    {
      "type": "panel",
      "id": "heatmap",
      "name": "Heatmap",
      "version": ""
    },
    {
      "type": "datasource",
      "id": "prometheus",
      "name": "Prometheus",
      "version": "1.0.0"
    },
    {
      "type": "panel",
      "id": "stat",
      "name": "Stat",
      "version": ""
    },
    {
      "type": "panel",
      "id": "table-old",
      "name": "Table (old)",
      "version": ""
    }
  ],
  "annotations": {
    "list": [
      {
        "builtIn": 1,
        "datasource": {
          "type": "prometheus",
          "uid": "${DS_PROMETHEUS}"
        },
        "enable": true,
        "hide": true,
        "iconColor": "rgba(0, 211, 255, 1)",
        "name": "Annotations & Alerts",
        "type": "dashboard"
      }
    ]
  },
  "description": "Dashboard that graphs metrics exported via Prometheus plugin in Kong (http://github.com/kong/kong)",
  "editable": true,
  "fiscalYearStartMonth": 0,
  "gnetId": 7424,
  "graphTooltip": 0,
  "id": null,
  "links": [],
  "liveNow": false,
  "panels": [
    {
      "collapsed": true,
      "datasource": {
        "type": "prometheus",
        "uid": "iBujgiB7z"
      },
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 0
      },
      "id": 53,
      "panels": [
        {
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "fieldConfig": {
            "defaults": {
              "color": {
                "mode": "thresholds"
              },
              "mappings": [],
              "max": 100,
              "min": 0,
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green",
                    "value": null
                  },
                  {
                    "color": "red",
                    "value": 80
                  }
                ]
              },
              "unit": "percent"
            },
            "overrides": []
          },
          "gridPos": {
            "h": 6,
            "w": 24,
            "x": 0,
            "y": 1
          },
          "id": 22,
          "options": {
            "orientation": "auto",
            "reduceOptions": {
              "calcs": [
                "mean"
              ],
              "fields": "",
              "values": false
            },
            "showThresholdLabels": false,
            "showThresholdMarkers": true,
            "text": {}
          },
          "pluginVersion": "9.3.2",
          "repeat": "instance",
          "repeatDirection": "v",
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "exemplar": true,
              "expr": "(kong_memory_lua_shared_dict_bytes{instance=~\"$instance\",shared_dict!~\"kong_process_events\"}/kong_memory_lua_shared_dict_total_bytes{instance=~\"$instance\",shared_dict!~\"kong_process_events\"})*100",
              "format": "time_series",
              "instant": false,
              "interval": "",
              "legendFormat": "{{shared_dict}} ({{kong_subsystem}})",
              "refId": "A"
            }
          ],
          "title": "Kong shared memory usage by Node ($instance)",
          "type": "gauge"
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "fieldConfig": {
            "defaults": {
              "links": []
            },
            "overrides": []
          },
          "fill": 1,
          "fillGradient": 0,
          "gridPos": {
            "h": 6,
            "w": 24,
            "x": 0,
            "y": 7
          },
          "hiddenSeries": false,
          "id": 43,
          "legend": {
            "avg": false,
            "current": false,
            "max": false,
            "min": false,
            "show": true,
            "total": false,
            "values": false
          },
          "lines": true,
          "linewidth": 1,
          "nullPointMode": "null",
          "options": {
            "alertThreshold": true
          },
          "percentage": false,
          "pluginVersion": "9.3.2",
          "pointradius": 2,
          "points": false,
          "renderer": "flot",
          "repeat": "instance",
          "repeatDirection": "v",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "exemplar": true,
              "expr": "kong_memory_workers_lua_vms_bytes{instance=~\"$instance\"}",
              "format": "time_series",
              "instant": false,
              "interval": "",
              "legendFormat": "PID:{{pid}} ({{kong_subsystem}})",
              "refId": "A"
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Kong worker Lua VM usage by Node ($instance)",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "bytes",
              "logBase": 1,
              "show": true
            },
            {
              "format": "bytes",
              "logBase": 1,
              "show": true
            }
          ],
          "yaxis": {
            "align": false
          }
        }
      ],
      "targets": [
        {
          "datasource": {
            "type": "prometheus",
            "uid": "iBujgiB7z"
          },
          "refId": "A"
        }
      ],
      "title": "Caching",
      "type": "row"
    },
    {
      "collapsed": true,
      "datasource": {
        "type": "prometheus",
        "uid": "iBujgiB7z"
      },
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 1
      },
      "id": 51,
      "panels": [
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "fieldConfig": {
            "defaults": {
              "links": []
            },
            "overrides": []
          },
          "fill": 1,
          "fillGradient": 0,
          "gridPos": {
            "h": 7,
            "w": 24,
            "x": 0,
            "y": 2
          },
          "hiddenSeries": false,
          "id": 17,
          "legend": {
            "avg": false,
            "current": false,
            "max": false,
            "min": false,
            "show": true,
            "total": false,
            "values": false
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "alertThreshold": true
          },
          "paceLength": 10,
          "percentage": false,
          "pluginVersion": "9.3.2",
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "exemplar": true,
              "expr": "sum(kong_nginx_connections_total{state=~\"active|reading|writing|waiting\", instance=~\"$instance\"}) by (state)",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "{{state}}",
              "refId": "A"
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Nginx connection state",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "short",
              "logBase": 1,
              "show": true
            },
            {
              "format": "short",
              "logBase": 1,
              "show": true
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "fieldConfig": {
            "defaults": {
              "color": {
                "fixedColor": "rgb(31, 120, 193)",
                "mode": "fixed"
              },
              "mappings": [
                {
                  "options": {
                    "match": "null",
                    "result": {
                      "text": "N/A"
                    }
                  },
                  "type": "special"
                }
              ],
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green",
                    "value": null
                  },
                  {
                    "color": "red",
                    "value": 80
                  }
                ]
              },
              "unit": "none"
            },
            "overrides": []
          },
          "gridPos": {
            "h": 7,
            "w": 8,
            "x": 0,
            "y": 9
          },
          "id": 18,
          "links": [],
          "maxDataPoints": 100,
          "options": {
            "colorMode": "none",
            "graphMode": "area",
            "justifyMode": "auto",
            "orientation": "horizontal",
            "reduceOptions": {
              "calcs": [
                "lastNotNull"
              ],
              "fields": "",
              "values": false
            },
            "textMode": "auto"
          },
          "pluginVersion": "9.3.2",
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "exemplar": true,
              "expr": "sum(kong_nginx_connections_total{state=\"total\", instance=~\"$instance\"})",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "Total",
              "refId": "A"
            }
          ],
          "title": "Total Connections",
          "type": "stat"
        },
        {
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "fieldConfig": {
            "defaults": {
              "color": {
                "fixedColor": "rgb(31, 120, 193)",
                "mode": "fixed"
              },
              "mappings": [
                {
                  "options": {
                    "match": "null",
                    "result": {
                      "text": "N/A"
                    }
                  },
                  "type": "special"
                }
              ],
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green",
                    "value": null
                  },
                  {
                    "color": "red",
                    "value": 80
                  }
                ]
              },
              "unit": "none"
            },
            "overrides": []
          },
          "gridPos": {
            "h": 7,
            "w": 8,
            "x": 8,
            "y": 9
          },
          "id": 19,
          "links": [],
          "maxDataPoints": 100,
          "options": {
            "colorMode": "none",
            "graphMode": "area",
            "justifyMode": "auto",
            "orientation": "horizontal",
            "reduceOptions": {
              "calcs": [
                "lastNotNull"
              ],
              "fields": "",
              "values": false
            },
            "textMode": "auto"
          },
          "pluginVersion": "9.3.2",
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "expr": "sum(kong_nginx_connections_total{state=\"handled\", instance=~\"$instance\"})",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "Handled",
              "refId": "A"
            }
          ],
          "title": "Handled Connections",
          "type": "stat"
        },
        {
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "fieldConfig": {
            "defaults": {
              "color": {
                "fixedColor": "rgb(31, 120, 193)",
                "mode": "fixed"
              },
              "mappings": [
                {
                  "options": {
                    "match": "null",
                    "result": {
                      "text": "N/A"
                    }
                  },
                  "type": "special"
                }
              ],
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green",
                    "value": null
                  },
                  {
                    "color": "red",
                    "value": 80
                  }
                ]
              },
              "unit": "none"
            },
            "overrides": []
          },
          "gridPos": {
            "h": 7,
            "w": 8,
            "x": 16,
            "y": 9
          },
          "id": 20,
          "links": [],
          "maxDataPoints": 100,
          "options": {
            "colorMode": "none",
            "graphMode": "area",
            "justifyMode": "auto",
            "orientation": "horizontal",
            "reduceOptions": {
              "calcs": [
                "lastNotNull"
              ],
              "fields": "",
              "values": false
            },
            "textMode": "auto"
          },
          "pluginVersion": "9.3.2",
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "expr": "sum(kong_nginx_connections_total{state=\"accepted\", instance=~\"$instance\"})",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "Accepted",
              "refId": "A"
            }
          ],
          "title": "Accepted Connections",
          "type": "stat"
        }
      ],
      "targets": [
        {
          "datasource": {
            "type": "prometheus",
            "uid": "iBujgiB7z"
          },
          "refId": "A"
        }
      ],
      "title": "Nginx",
      "type": "row"
    },
    {
      "collapsed": true,
      "datasource": {
        "type": "prometheus",
        "uid": "iBujgiB7z"
      },
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 2
      },
      "id": 38,
      "panels": [
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "fieldConfig": {
            "defaults": {
              "links": []
            },
            "overrides": []
          },
          "fill": 1,
          "fillGradient": 0,
          "gridPos": {
            "h": 7,
            "w": 24,
            "x": 0,
            "y": 3
          },
          "hiddenSeries": false,
          "id": 1,
          "legend": {
            "alignAsTable": false,
            "avg": false,
            "current": false,
            "max": false,
            "min": false,
            "rightSide": false,
            "show": true,
            "total": false,
            "values": false
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "alertThreshold": true
          },
          "paceLength": 10,
          "percentage": false,
          "pluginVersion": "9.3.2",
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "expr": "sum(rate(kong_http_requests_total{instance=~\"$instance\"}[1m]))",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "Requests/second",
              "refId": "A"
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Total requests per second (RPS)",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "short",
              "logBase": 1,
              "show": true
            },
            {
              "format": "s",
              "logBase": 1,
              "show": true
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "fieldConfig": {
            "defaults": {
              "links": []
            },
            "overrides": []
          },
          "fill": 1,
          "fillGradient": 0,
          "gridPos": {
            "h": 7,
            "w": 24,
            "x": 0,
            "y": 10
          },
          "hiddenSeries": false,
          "id": 16,
          "legend": {
            "avg": false,
            "current": false,
            "max": false,
            "min": false,
            "show": true,
            "total": false,
            "values": false
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "alertThreshold": true
          },
          "paceLength": 10,
          "percentage": false,
          "pluginVersion": "9.3.2",
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "expr": "sum(rate(kong_http_requests_total{service=~\"$service\", route=~\"$route\", instance=~\"$instance\"}[1m])) by (service)",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "service:{{service}}",
              "refId": "A"
            },
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "expr": "sum(rate(kong_http_requests_total{service=~\"$service\", route=~\"$route\", instance=~\"$instance\"}[1m])) by (route)",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "route:{{route}}",
              "refId": "B"
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "RPS per route/service ($service)",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "short",
              "logBase": 1,
              "show": true
            },
            {
              "format": "short",
              "logBase": 1,
              "show": true
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "fieldConfig": {
            "defaults": {
              "links": []
            },
            "overrides": []
          },
          "fill": 1,
          "fillGradient": 0,
          "gridPos": {
            "h": 7,
            "w": 24,
            "x": 0,
            "y": 17
          },
          "hiddenSeries": false,
          "id": 39,
          "legend": {
            "avg": false,
            "current": false,
            "max": false,
            "min": false,
            "show": true,
            "total": false,
            "values": false
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "alertThreshold": true
          },
          "paceLength": 10,
          "percentage": false,
          "pluginVersion": "9.3.2",
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "expr": "sum(rate(kong_http_requests_total{service=~\"$service\", route=~\"$route\", instance=~\"$instance\"}[1m])) by (service,code)",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "service:{{service}}-{{code}}",
              "refId": "A"
            },
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "expr": "sum(rate(kong_http_requests_total{service=~\"$service\", route=~\"$route\", instance=~\"$instance\"}[1m])) by (route,code)",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "route:{{route}}-{{code}}",
              "refId": "B"
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "RPS per route/service by status code",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "short",
              "logBase": 1,
              "show": true
            },
            {
              "format": "short",
              "logBase": 1,
              "show": true
            }
          ],
          "yaxis": {
            "align": false
          }
        }
      ],
      "targets": [
        {
          "datasource": {
            "type": "prometheus",
            "uid": "iBujgiB7z"
          },
          "refId": "A"
        }
      ],
      "title": "Request Rate",
      "type": "row"
    },
    {
      "collapsed": true,
      "datasource": {
        "type": "prometheus",
        "uid": "iBujgiB7z"
      },
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 3
      },
      "id": 36,
      "panels": [
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "fieldConfig": {
            "defaults": {
              "links": []
            },
            "overrides": []
          },
          "fill": 1,
          "fillGradient": 0,
          "gridPos": {
            "h": 7,
            "w": 8,
            "x": 0,
            "y": 4
          },
          "hiddenSeries": false,
          "id": 10,
          "legend": {
            "avg": false,
            "current": false,
            "max": false,
            "min": false,
            "show": true,
            "total": false,
            "values": false
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "alertThreshold": true
          },
          "paceLength": 10,
          "percentage": false,
          "pluginVersion": "9.3.2",
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "expr": "histogram_quantile(0.90, sum(rate(kong_kong_latency_ms_bucket{instance=~\"$instance\"}[1m])) by (le))",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "p90",
              "refId": "A"
            },
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "expr": "histogram_quantile(0.95, sum(rate(kong_kong_latency_ms_bucket{instance=~\"$instance\"}[1m])) by (le))",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "p95",
              "refId": "B"
            },
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "expr": "histogram_quantile(0.99, sum(rate(kong_kong_latency_ms_bucket{instance=~\"$instance\"}[1m])) by (le))",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "p99",
              "refId": "C"
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Kong Proxy Latency across all services",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "ms",
              "logBase": 1,
              "show": true
            },
            {
              "format": "short",
              "logBase": 1,
              "show": true
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "fieldConfig": {
            "defaults": {
              "links": []
            },
            "overrides": []
          },
          "fill": 1,
          "fillGradient": 0,
          "gridPos": {
            "h": 7,
            "w": 8,
            "x": 8,
            "y": 4
          },
          "hiddenSeries": false,
          "id": 11,
          "legend": {
            "avg": false,
            "current": false,
            "max": false,
            "min": false,
            "show": true,
            "total": false,
            "values": false
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "alertThreshold": true
          },
          "paceLength": 10,
          "percentage": false,
          "pluginVersion": "9.3.2",
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "exemplar": true,
              "expr": "histogram_quantile(0.90, sum(rate(kong_kong_latency_ms_bucket{service =~ \"$service\",route=~\"$route\",instance=~\"$instance\"}[1m])) by (service,le))",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "p90-{{service}}",
              "refId": "A"
            },
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "expr": "histogram_quantile(0.95, sum(rate(kong_kong_latency_ms_bucket{service =~ \"$service\",route=~\"$route\",instance=~\"$instance\"}[1m])) by (service,le))",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "p95-{{service}}",
              "refId": "B"
            },
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "expr": "histogram_quantile(0.99, sum(rate(kong_kong_latency_ms_bucket{service =~ \"$service\",route=~\"$route\",instance=~\"$instance\"}[1m])) by (service,le))",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "p99-{{service}}",
              "refId": "C"
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Kong Proxy Latency per Service",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "ms",
              "logBase": 1,
              "show": true
            },
            {
              "format": "short",
              "logBase": 1,
              "show": true
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "fieldConfig": {
            "defaults": {
              "links": []
            },
            "overrides": []
          },
          "fill": 1,
          "fillGradient": 0,
          "gridPos": {
            "h": 7,
            "w": 8,
            "x": 16,
            "y": 4
          },
          "hiddenSeries": false,
          "id": 42,
          "legend": {
            "avg": false,
            "current": false,
            "max": false,
            "min": false,
            "show": true,
            "total": false,
            "values": false
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "alertThreshold": true
          },
          "paceLength": 10,
          "percentage": false,
          "pluginVersion": "9.3.2",
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "expr": "histogram_quantile(0.90, sum(rate(kong_kong_latency_ms_bucket{service =~ \"$service\",route=~\"$route\",instance=~\"$instance\"}[1m])) by (route,le))",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "p90-{{route}}",
              "refId": "A"
            },
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "expr": "histogram_quantile(0.95, sum(rate(kong_kong_latency_ms_bucket{service =~ \"$service\",route=~\"$route\",instance=~\"$instance\"}[1m])) by (route,le))",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "p95-{{route}}",
              "refId": "B"
            },
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "expr": "histogram_quantile(0.99, sum(rate(kong_kong_latency_ms_bucket{service =~ \"$service\",route=~\"$route\",instance=~\"$instance\"}[1m])) by (route,le))",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "p99-{{route}}",
              "refId": "C"
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Kong Proxy Latency per Route",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "ms",
              "logBase": 1,
              "show": true
            },
            {
              "format": "short",
              "logBase": 1,
              "show": true
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "fieldConfig": {
            "defaults": {
              "links": []
            },
            "overrides": []
          },
          "fill": 1,
          "fillGradient": 0,
          "gridPos": {
            "h": 7,
            "w": 8,
            "x": 0,
            "y": 11
          },
          "hiddenSeries": false,
          "id": 12,
          "legend": {
            "avg": false,
            "current": false,
            "max": false,
            "min": false,
            "show": true,
            "total": false,
            "values": false
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "alertThreshold": true
          },
          "paceLength": 10,
          "percentage": false,
          "pluginVersion": "9.3.2",
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "expr": "histogram_quantile(0.90, sum(rate(kong_request_latency_ms_bucket{}[1m])) by (le))",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "p90",
              "refId": "A"
            },
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "expr": "histogram_quantile(0.95, sum(rate(kong_request_latency_ms_bucket{}[1m])) by (le))",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "p95",
              "refId": "B"
            },
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "expr": "histogram_quantile(0.99, sum(rate(kong_request_latency_ms_bucket{}[1m])) by (le))",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "p99",
              "refId": "C"
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Request Time across all services",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "ms",
              "logBase": 1,
              "show": true
            },
            {
              "format": "short",
              "logBase": 1,
              "show": true
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "fieldConfig": {
            "defaults": {
              "links": []
            },
            "overrides": []
          },
          "fill": 1,
          "fillGradient": 0,
          "gridPos": {
            "h": 7,
            "w": 8,
            "x": 8,
            "y": 11
          },
          "hiddenSeries": false,
          "id": 13,
          "legend": {
            "avg": false,
            "current": false,
            "max": false,
            "min": false,
            "show": true,
            "total": false,
            "values": false
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "alertThreshold": true
          },
          "paceLength": 10,
          "percentage": false,
          "pluginVersion": "9.3.2",
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "expr": "histogram_quantile(0.90, sum(rate(kong_request_latency_ms_bucket{service =~ \"$service\",route=~\"$route\",instance=~\"$instance\"}[1m])) by (service,le))",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "p90-{{service}}",
              "refId": "A"
            },
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "expr": "histogram_quantile(0.95, sum(rate(kong_request_latency_ms_bucket{service =~ \"$service\",route=~\"$route\",instance=~\"$instance\"}[1m])) by (service,le))",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "p95-{{service}}",
              "refId": "B"
            },
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "expr": "histogram_quantile(0.99, sum(rate(kong_request_latency_ms_bucket{service =~ \"$service\",route=~\"$route\",instance=~\"$instance\"}[1m])) by (service,le))",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "p99-{{service}}",
              "refId": "C"
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Request Time per service",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "ms",
              "logBase": 1,
              "show": true
            },
            {
              "format": "short",
              "logBase": 1,
              "show": true
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "fieldConfig": {
            "defaults": {
              "links": []
            },
            "overrides": []
          },
          "fill": 1,
          "fillGradient": 0,
          "gridPos": {
            "h": 7,
            "w": 8,
            "x": 16,
            "y": 11
          },
          "hiddenSeries": false,
          "id": 41,
          "legend": {
            "avg": false,
            "current": false,
            "max": false,
            "min": false,
            "show": true,
            "total": false,
            "values": false
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "alertThreshold": true
          },
          "paceLength": 10,
          "percentage": false,
          "pluginVersion": "9.3.2",
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "expr": "histogram_quantile(0.90, sum(rate(kong_request_latency_ms_bucket{service =~ \"$service\",route=~\"$route\",instance=~\"$instance\"}[1m])) by (route,le))",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "p90-{{route}}",
              "refId": "A"
            },
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "expr": "histogram_quantile(0.95, sum(rate(kong_request_latency_ms_bucket{service =~ \"$service\",route=~\"$route\",instance=~\"$instance\"}[1m])) by (route,le))",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "p95-{{route}}",
              "refId": "B"
            },
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "expr": "histogram_quantile(0.99, sum(rate(kong_request_latency_ms_bucket{service =~ \"$service\",route=~\"$route\",instance=~\"$instance\"}[1m])) by (route,le))",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "p99-{{route}}",
              "refId": "C"
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Request Time per Route",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "ms",
              "logBase": 1,
              "show": true
            },
            {
              "format": "short",
              "logBase": 1,
              "show": true
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "fieldConfig": {
            "defaults": {
              "links": []
            },
            "overrides": []
          },
          "fill": 1,
          "fillGradient": 0,
          "gridPos": {
            "h": 7,
            "w": 8,
            "x": 0,
            "y": 18
          },
          "height": "250",
          "hiddenSeries": false,
          "id": 14,
          "legend": {
            "avg": false,
            "current": false,
            "max": false,
            "min": false,
            "show": true,
            "total": false,
            "values": false
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "alertThreshold": true
          },
          "paceLength": 10,
          "percentage": false,
          "pluginVersion": "9.3.2",
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "expr": "histogram_quantile(0.90, sum(rate(kong_upstream_latency_ms_bucket{}[1m])) by (le))",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "p90",
              "refId": "A"
            },
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "expr": "histogram_quantile(0.95, sum(rate(kong_upstream_latency_ms_bucket{}[1m])) by (le))",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "p95",
              "refId": "B"
            },
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "expr": "histogram_quantile(0.99, sum(rate(kong_upstream_latency_ms_bucket{}[1m])) by (le))",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "p99",
              "refId": "C"
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Upstream time across all services",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "ms",
              "logBase": 1,
              "show": true
            },
            {
              "format": "short",
              "logBase": 1,
              "show": true
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "fieldConfig": {
            "defaults": {
              "links": []
            },
            "overrides": []
          },
          "fill": 1,
          "fillGradient": 0,
          "gridPos": {
            "h": 7,
            "w": 8,
            "x": 8,
            "y": 18
          },
          "height": "250",
          "hiddenSeries": false,
          "id": 15,
          "legend": {
            "avg": false,
            "current": false,
            "max": false,
            "min": false,
            "show": true,
            "total": false,
            "values": false
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "alertThreshold": true
          },
          "paceLength": 10,
          "percentage": false,
          "pluginVersion": "9.3.2",
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "expr": "histogram_quantile(0.90, sum(rate(kong_upstream_latency_ms_bucket{service =~ \"$service\",route=~\"$route\",instance=~\"$instance\"}[1m])) by (service,le))",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "p90-{{service}}",
              "refId": "A"
            },
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "expr": "histogram_quantile(0.95, sum(rate(kong_upstream_latency_ms_bucket{service =~ \"$service\",route=~\"$route\",instance=~\"$instance\"}[1m])) by (service,le))",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "p95-{{service}}",
              "refId": "B"
            },
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "expr": "histogram_quantile(0.99, sum(rate(kong_upstream_latency_ms_bucket{service =~ \"$service\",route=~\"$route\",instance=~\"$instance\"}[1m])) by (service,le))",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "p99-{{service}}",
              "refId": "C"
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Upstream Time across per service",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "ms",
              "logBase": 1,
              "show": true
            },
            {
              "format": "short",
              "logBase": 1,
              "show": true
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "fieldConfig": {
            "defaults": {
              "links": []
            },
            "overrides": []
          },
          "fill": 1,
          "fillGradient": 0,
          "gridPos": {
            "h": 7,
            "w": 8,
            "x": 16,
            "y": 18
          },
          "height": "250",
          "hiddenSeries": false,
          "id": 40,
          "legend": {
            "avg": false,
            "current": false,
            "max": false,
            "min": false,
            "show": true,
            "total": false,
            "values": false
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "alertThreshold": true
          },
          "paceLength": 10,
          "percentage": false,
          "pluginVersion": "9.3.2",
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "expr": "histogram_quantile(0.90, sum(rate(kong_upstream_latency_ms_bucket{service =~ \"$service\",route=~\"$route\",instance=~\"$instance\"}[1m])) by (route,le))",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "p90-{{route}}",
              "refId": "A"
            },
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "expr": "histogram_quantile(0.95, sum(rate(kong_upstream_latency_ms_bucket{service =~ \"$service\",route=~\"$route\",instance=~\"$instance\"}[1m])) by (route,le))",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "p95-{{route}}",
              "refId": "B"
            },
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "expr": "histogram_quantile(0.99, sum(rate(kong_upstream_latency_ms_bucket{service =~ \"$service\",route=~\"$route\",instance=~\"$instance\"}[1m])) by (route,le))",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "p99-{{route}}",
              "refId": "C"
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Upstream Time across per Route",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "ms",
              "logBase": 1,
              "show": true
            },
            {
              "format": "short",
              "logBase": 1,
              "show": true
            }
          ],
          "yaxis": {
            "align": false
          }
        }
      ],
      "targets": [
        {
          "datasource": {
            "type": "prometheus",
            "uid": "iBujgiB7z"
          },
          "refId": "A"
        }
      ],
      "title": "Latencies",
      "type": "row"
    },
    {
      "collapsed": true,
      "datasource": {
        "type": "prometheus",
        "uid": "iBujgiB7z"
      },
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 4
      },
      "id": 34,
      "panels": [
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "fieldConfig": {
            "defaults": {
              "links": []
            },
            "overrides": []
          },
          "fill": 1,
          "fillGradient": 0,
          "gridPos": {
            "h": 7,
            "w": 24,
            "x": 0,
            "y": 5
          },
          "hiddenSeries": false,
          "id": 3,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "rightSide": true,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "alertThreshold": true
          },
          "paceLength": 10,
          "percentage": false,
          "pluginVersion": "9.3.2",
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "exemplar": true,
              "expr": "sum(irate(kong_bandwidth_bytes{instance=~\"$instance\"}[1m])) by (type)",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "{{type}}",
              "refId": "A"
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Total Bandwidth",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "Bps",
              "logBase": 1,
              "show": true
            },
            {
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "fieldConfig": {
            "defaults": {
              "links": []
            },
            "overrides": []
          },
          "fill": 1,
          "fillGradient": 0,
          "gridPos": {
            "h": 7,
            "w": 12,
            "x": 0,
            "y": 12
          },
          "hiddenSeries": false,
          "id": 2,
          "legend": {
            "avg": false,
            "current": false,
            "max": false,
            "min": false,
            "show": true,
            "total": false,
            "values": false
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "alertThreshold": true
          },
          "paceLength": 10,
          "percentage": false,
          "pluginVersion": "9.3.2",
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "expr": "sum(irate(kong_bandwidth_bytes{direction=\"egress\", service =~\"$service\",route=~\"$route\",instance=~\"$instance\"}[1m])) by (service)",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "service:{{service}}",
              "refId": "A"
            },
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "expr": "sum(irate(kong_bandwidth_bytes{direction=\"egress\", service =~\"$service\",route=~\"$route\",instance=~\"$instance\"}[1m])) by (route)",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "route:{{route}}",
              "refId": "B"
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Egress per service/route",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "Bps",
              "logBase": 1,
              "show": true
            },
            {
              "format": "short",
              "logBase": 1,
              "show": true
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "fieldConfig": {
            "defaults": {
              "links": []
            },
            "overrides": []
          },
          "fill": 1,
          "fillGradient": 0,
          "gridPos": {
            "h": 7,
            "w": 12,
            "x": 12,
            "y": 12
          },
          "hiddenSeries": false,
          "id": 9,
          "legend": {
            "avg": false,
            "current": false,
            "max": false,
            "min": false,
            "show": true,
            "total": false,
            "values": false
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "alertThreshold": true
          },
          "paceLength": 10,
          "percentage": false,
          "pluginVersion": "9.3.2",
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "expr": "sum(irate(kong_bandwidth_bytes{direction=\"ingress\", service =~\"$service\"}[1m])) by (service)",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "{{service}}",
              "refId": "A"
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Ingress per service/route",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "Bps",
              "logBase": 1,
              "show": true
            },
            {
              "format": "short",
              "logBase": 1,
              "show": true
            }
          ],
          "yaxis": {
            "align": false
          }
        }
      ],
      "targets": [
        {
          "datasource": {
            "type": "prometheus",
            "uid": "iBujgiB7z"
          },
          "refId": "A"
        }
      ],
      "title": "Bandwidth",
      "type": "row"
    },
    {
      "collapsed": true,
      "datasource": {
        "type": "prometheus",
        "uid": "iBujgiB7z"
      },
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 5
      },
      "id": 45,
      "panels": [
        {
          "cards": {},
          "color": {
            "cardColor": "#b4ff00",
            "colorScale": "sqrt",
            "colorScheme": "interpolateRdYlGn",
            "exponent": 0.5,
            "mode": "spectrum"
          },
          "dataFormat": "tsbuckets",
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "fieldConfig": {
            "defaults": {
              "custom": {
                "hideFrom": {
                  "legend": false,
                  "tooltip": false,
                  "viz": false
                },
                "scaleDistribution": {
                  "type": "linear"
                }
              }
            },
            "overrides": []
          },
          "gridPos": {
            "h": 8,
            "w": 12,
            "x": 0,
            "y": 6
          },
          "heatmap": {},
          "hideZeroBuckets": false,
          "highlightCards": true,
          "id": 49,
          "legend": {
            "show": false
          },
          "options": {
            "calculate": false,
            "calculation": {},
            "cellGap": 2,
            "cellValues": {},
            "color": {
              "exponent": 0.5,
              "fill": "#b4ff00",
              "mode": "scheme",
              "reverse": false,
              "scale": "exponential",
              "scheme": "RdYlGn",
              "steps": 128
            },
            "exemplars": {
              "color": "rgba(255,0,255,0.7)"
            },
            "filterValues": {
              "le": 1e-9
            },
            "legend": {
              "show": false
            },
            "rowsFrame": {
              "layout": "auto"
            },
            "showValue": "never",
            "tooltip": {
              "show": true,
              "yHistogram": false
            },
            "yAxis": {
              "axisPlacement": "left",
              "reverse": false,
              "unit": "short"
            }
          },
          "pluginVersion": "9.3.2",
          "reverseYBuckets": false,
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "exemplar": true,
              "expr": "sum(kong_upstream_target_health{state=\"healthy\",upstream=~\"$upstream\"}) by (upstream,target,address) * -1  + sum(kong_upstream_target_health{state=~\"(unhealthy|dns_error)\",upstream=~\"$upstream\"}) by (upstream,target,address)",
              "format": "heatmap",
              "hide": false,
              "instant": false,
              "interval": "",
              "legendFormat": "{{upstream}}:{{target}}::{{address}}",
              "refId": "A"
            }
          ],
          "title": "Healthy status",
          "tooltip": {
            "show": true,
            "showHistogram": false
          },
          "transformations": [
            {
              "id": "seriesToColumns",
              "options": {}
            }
          ],
          "type": "heatmap",
          "xAxis": {
            "show": true
          },
          "yAxis": {
            "format": "short",
            "logBase": 1,
            "show": true
          },
          "yBucketBound": "auto"
        },
        {
          "columns": [],
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "fontSize": "100%",
          "gridPos": {
            "h": 8,
            "w": 12,
            "x": 12,
            "y": 6
          },
          "id": 47,
          "options": {
            "frameIndex": 0,
            "showHeader": true
          },
          "pluginVersion": "7.5.4",
          "showHeader": true,
          "sort": {
            "col": 0,
            "desc": true
          },
          "styles": [
            {
              "alias": "",
              "align": "auto",
              "colors": [
                "rgba(245, 54, 54, 0.9)",
                "rgba(237, 129, 40, 0.89)",
                "rgba(50, 172, 45, 0.97)"
              ],
              "dateFormat": "YYYY-MM-DD HH:mm:ss",
              "decimals": 2,
              "mappingType": 1,
              "pattern": "Time",
              "thresholds": [],
              "type": "hidden",
              "unit": "short"
            },
            {
              "alias": "",
              "align": "auto",
              "colors": [
                "rgba(245, 54, 54, 0.9)",
                "rgba(237, 129, 40, 0.89)",
                "rgba(50, 172, 45, 0.97)"
              ],
              "dateFormat": "YYYY-MM-DD HH:mm:ss",
              "decimals": 2,
              "mappingType": 1,
              "pattern": "state",
              "thresholds": [],
              "type": "hidden",
              "unit": "short"
            },
            {
              "alias": "state",
              "align": "auto",
              "colorMode": "cell",
              "colors": [
                "rgba(245, 54, 54, 0.9)",
                "#FADE2A",
                "rgba(50, 172, 45, 0.97)"
              ],
              "dateFormat": "YYYY-MM-DD HH:mm:ss",
              "decimals": 2,
              "mappingType": 1,
              "pattern": "state_value",
              "thresholds": [
                "0",
                "1"
              ],
              "type": "string",
              "unit": "short",
              "valueMaps": [
                {
                  "text": "healthy",
                  "value": "1"
                },
                {
                  "text": "healthchecks_off",
                  "value": "0"
                },
                {
                  "text": "unhealthy",
                  "value": "-1"
                }
              ]
            },
            {
              "alias": "",
              "align": "auto",
              "colors": [
                "rgba(245, 54, 54, 0.9)",
                "rgba(237, 129, 40, 0.89)",
                "rgba(50, 172, 45, 0.97)"
              ],
              "dateFormat": "YYYY-MM-DD HH:mm:ss",
              "decimals": 2,
              "mappingType": 1,
              "pattern": "Value",
              "thresholds": [],
              "type": "hidden",
              "unit": "short"
            }
          ],
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "exemplar": false,
              "expr": "sum(\n# map state to a numeric value\n# since grafana doesn't support value mapping yet\n  label_replace(\n    label_replace(\n      label_replace(\n       kong_upstream_target_health{upstream=~\"$upstream\"}\n       # healthy is positive number\n       , \"state_value\", \"1\", \"state\", \"healthy\"\n       # healthchecks_off is 0\n      ), \"state_value\", \"0\", \"state\", \"healthchecks_off\"\n      # unhealthy is negative number\n    ), \"state_value\", \"-1\", \"state\", \"(dns_error|unhealthy)\"\n  )\n)\nby (upstream, target, address, state, state_value) > 0",
              "format": "table",
              "instant": true,
              "interval": "",
              "legendFormat": "",
              "refId": "A"
            }
          ],
          "transform": "table",
          "transformations": [
            {
              "id": "organize",
              "options": {
                "excludeByName": {
                  "Time": true,
                  "Value": true,
                  "state": true
                },
                "indexByName": {
                  "Time": 0,
                  "Value": 5,
                  "address": 3,
                  "state": 4,
                  "target": 2,
                  "upstream": 1
                },
                "renameByName": {
                  "Value": "report node count",
                  "state": "state_original",
                  "state_value": "state"
                }
              }
            }
          ],
          "type": "table-old"
        }
      ],
      "targets": [
        {
          "datasource": {
            "type": "prometheus",
            "uid": "iBujgiB7z"
          },
          "refId": "A"
        }
      ],
      "title": "Upstream",
      "type": "row"
    }
  ],
  "refresh": false,
  "schemaVersion": 37,
  "style": "dark",
  "tags": [],
  "templating": {
    "list": [
      {
        "allValue": ".*",
        "current": {},
        "datasource": {
          "type": "prometheus",
          "uid": "${DS_PROMETHEUS}"
        },
        "definition": "label_values({__name__=~\"kong_http_requests_total|kong_kong_latency_ms_bucket\"},service)",
        "hide": 0,
        "includeAll": true,
        "label": "",
        "multi": true,
        "name": "service",
        "options": [],
        "query": {
          "query": "label_values({__name__=~\"kong_http_requests_total|kong_kong_latency_ms_bucket\"},service)",
          "refId": "StandardVariableQuery"
        },
        "refresh": 1,
        "regex": "",
        "skipUrlSync": false,
        "sort": 1,
        "tagValuesQuery": "",
        "tagsQuery": "",
        "type": "query",
        "useTags": false
      },
      {
        "allValue": ".*",
        "current": {},
        "datasource": {
          "type": "prometheus",
          "uid": "${DS_PROMETHEUS}"
        },
        "definition": "label_values(kong_nginx_connections_total,instance)",
        "hide": 0,
        "includeAll": true,
        "label": "",
        "multi": true,
        "name": "instance",
        "options": [],
        "query": {
          "query": "label_values(kong_nginx_connections_total,instance)",
          "refId": "StandardVariableQuery"
        },
        "refresh": 2,
        "regex": ".*",
        "skipUrlSync": false,
        "sort": 1,
        "tagValuesQuery": "",
        "tagsQuery": "",
        "type": "query",
        "useTags": false
      },
      {
        "allValue": ".*",
        "current": {},
        "datasource": {
          "type": "prometheus",
          "uid": "${DS_PROMETHEUS}"
        },
        "definition": "label_values({__name__=~\"kong_http_requests_total|kong_kong_latency_ms_bucket\"},route)",
        "hide": 0,
        "includeAll": true,
        "label": "",
        "multi": true,
        "name": "route",
        "options": [],
        "query": {
          "query": "label_values({__name__=~\"kong_http_requests_total|kong_kong_latency_ms_bucket\"},route)",
          "refId": "StandardVariableQuery"
        },
        "refresh": 1,
        "regex": "",
        "skipUrlSync": false,
        "sort": 1,
        "tagValuesQuery": "",
        "tagsQuery": "",
        "type": "query",
        "useTags": false
      },
      {
        "current": {},
        "datasource": {
          "type": "prometheus",
          "uid": "${DS_PROMETHEUS}"
        },
        "definition": "label_values(kong_upstream_target_health, upstream)",
        "hide": 0,
        "includeAll": true,
        "multi": true,
        "name": "upstream",
        "options": [],
        "query": {
          "query": "label_values(kong_upstream_target_health, upstream)",
          "refId": "Prometheus-upstream-Variable-Query"
        },
        "refresh": 1,
        "regex": "",
        "skipUrlSync": false,
        "sort": 0,
        "tagValuesQuery": "",
        "tagsQuery": "",
        "type": "query",
        "useTags": false
      }
    ]
  },
  "time": {
    "from": "now-15m",
    "to": "now"
  },
  "timepicker": {
    "refresh_intervals": [
      "5s",
      "10s",
      "30s",
      "1m",
      "5m",
      "15m",
      "30m",
      "1h",
      "2h",
      "1d"
    ],
    "time_options": [
      "5m",
      "15m",
      "1h",
      "6h",
      "12h",
      "24h",
      "2d",
      "7d",
      "30d"
    ]
  },
  "timezone": "",
  "title": "Kong (official)",
  "uid": "mY9p7dQmz",
  "version": 1,
  "weekStart": ""
}