connection: "your_clickhouse_connection"

include: "/views/searches_dtt_lh_group_external.view.lkml"
include: "/dashboards/searches_dtt_lh_group_external_dashboard.dashboard.lkml"

explore: searches_dtt_lh_group_external {
  label: "Searches DTT LH group external"
}
