connection: "your_clickhouse_connection"

include: "/views/searches_dtt_general_lh_group.view.lkml"
include: "/dashboards/searches_dtt_general_lh_group_dashboard.dashboard.lkml"

explore: searches_dtt_general_lh_group {
  label: "Searches DTT General LH group"
}
