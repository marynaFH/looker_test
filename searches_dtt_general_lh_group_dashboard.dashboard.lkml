dashboard: searches_dtt_general_lh_group_dashboard {
  title: "Searches DTT General LH group"

  element {
    type: table
    title: "Hourly Search and Health Comparison"
    query: {
      view: searches_dtt_general_lh_group
      fields: [
        searches_dtt_general_lh_group.day,
        searches_dtt_general_lh_group.one_hour_slot,
        searches_dtt_general_lh_group.carriers,
        searches_dtt_general_lh_group.current_searches,
        searches_dtt_general_lh_group.previous_searches,
        searches_dtt_general_lh_group.searches_diff,
        searches_dtt_general_lh_group.current_health,
        searches_dtt_general_lh_group.previous_health,
        searches_dtt_general_lh_group.health_diff
      ]
      sorts: [
        searches_dtt_general_lh_group.day desc,
        searches_dtt_general_lh_group.one_hour_slot desc
      ]
      limit: 100
    }
  }
}
