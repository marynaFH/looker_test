dashboard: searches_dtt_general_ba_cm_ek_la_tk_ua_dashboard {
  title: "Searches DTT General BA/CM/EK/LA/TK/UA group"

  element {
    type: table
    title: "Hourly Search and Health Comparison"
    query: {
      view: searches_dtt_general_ba_cm_ek_la_tk_ua
      fields: [
        searches_dtt_general_ba_cm_ek_la_tk_ua.day,
        searches_dtt_general_ba_cm_ek_la_tk_ua.one_hour_slot,
        searches_dtt_general_ba_cm_ek_la_tk_ua.carriers,
        searches_dtt_general_ba_cm_ek_la_tk_ua.current_searches,
        searches_dtt_general_ba_cm_ek_la_tk_ua.previous_searches,
        searches_dtt_general_ba_cm_ek_la_tk_ua.searches_diff,
        searches_dtt_general_ba_cm_ek_la_tk_ua.current_health,
        searches_dtt_general_ba_cm_ek_la_tk_ua.previous_health,
        searches_dtt_general_ba_cm_ek_la_tk_ua.health_diff
      ]
      sorts: [
        searches_dtt_general_ba_cm_ek_la_tk_ua.day desc,
        searches_dtt_general_ba_cm_ek_la_tk_ua.one_hour_slot desc
      ]
      limit: 100
    }
  }
}
