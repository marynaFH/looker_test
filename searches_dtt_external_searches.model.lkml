connection: "your_clickhouse_connection"

include: "/views/searches_dtt_external_searches.view.lkml"
include: "/dashboards/searches_dtt_external_searches_dashboard.dashboard.lkml"

explore: searches_dtt_external_searches {
  label: "Searches DTT External BA/CM/EK/LA/TK/UA"
}
