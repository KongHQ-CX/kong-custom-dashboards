# Kong Custom Dashboards

## What does this do?

Two things:

### 1. Generates Namespace-Scope Dashboards

For each namespace in the `ALL_NAMESPACES` array, it will create a specific dashboard file for that namespace "family".

For example, a value of `openbanking` will create a dashboard with a drop-down for `openbanking-*` that matches "dev", "sandbox", "prod", and all others. You can then use Grafana RBAC permissions to restrict certain persons to seeing only the Kong Prometheus plugin information for their specific namespace family.

### 2. Adds Features

In addition to `namespace` filters on every graph, and the `namespace` drop-down filter item at the top, this also adds a `consumer` drop-down selection at the top of the dashboard (adn a corresponding `Per-Consumer Metrics` accordion).

This allows a Kong administrator to visualise exactly what any one consumer is doing, on any one/many of their managed Kong installations.

## How does it work?

Add your namespaces into the array at the top of `generate-all.sh`, like the example:

```sh
ALL_NAMESPACES=(kong-team1 kong-team2 all)
```

Leave "all" in there if you want to create an extra dashboard for administrators to see **everything**. Remove if not.

Then run it!

```sh
./generate-all.sh
```

Your dashboards for each namespace (and `all` if specified) will be output to this directory.
