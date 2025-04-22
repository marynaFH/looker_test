dashboard: searches_dtt_external_searches_dashboard {
  title: "Searches DTT External BA/CM/EK/LA/TK/UA"

  element {
    type: table
    title: "Hourly Search and Health Comparison"
    query: {
      view: searches_dtt_external_searches
      fields: [
        searches_dtt_external_searches.day,
        searches_dtt_external_searches.one_hour_slot,
        searches_dtt_external_searches.carriers,
        searches_dtt_external_searches.current_searches,
        searches_dtt_external_searches.previous_searches,
        searches_dtt_external_searches.searches_diff,
        searches_dtt_external_searches.current_health,
        searches_dtt_external_searches.previous_health,
        searches_dtt_external_searches.health_diff
      ]
      sorts: [
        searches_dtt_external_searches.day desc,
        searches_dtt_external_searches.one_hour_slot desc
      ]
      limit: 100
    }
  }
}
