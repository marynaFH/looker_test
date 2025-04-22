dashboard: searches_dtt_lh_group_external_dashboard {
  title: "Searches DTT LH group external"

  element {
    type: table
    title: "Hourly Search and Health Comparison"
    query: {
      view: searches_dtt_lh_group_external
      fields: [
        searches_dtt_lh_group_external.day,
        searches_dtt_lh_group_external.one_hour_slot,
        searches_dtt_lh_group_external.carriers,
        searches_dtt_lh_group_external.current_searches,
        searches_dtt_lh_group_external.previous_searches,
        searches_dtt_lh_group_external.searches_diff,
        searches_dtt_lh_group_external.current_health,
        searches_dtt_lh_group_external.previous_health,
        searches_dtt_lh_group_external.health_diff
      ]
      sorts: [
        searches_dtt_lh_group_external.day desc,
        searches_dtt_lh_group_external.one_hour_slot desc
      ]
      limit: 100
    }
  }
}
