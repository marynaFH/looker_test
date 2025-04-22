connection: "your_clickhouse_connection"

include: "/views/searches_dtt_general_ba_cm_ek_la_tk_ua.view.lkml"
include: "/dashboards/searches_dtt_general_ba_cm_ek_la_tk_ua_dashboard.dashboard.lkml"

explore: searches_dtt_general_ba_cm_ek_la_tk_ua {
  label: "Searches DTT General BA/CM/EK/LA/TK/UA group"
}
