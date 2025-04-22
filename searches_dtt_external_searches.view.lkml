view: searches_dtt_external_searches {
  derived_table: {
    sql: 
      WITH
          toDate('2025-04-22') AS current_day,
          toDate('2025-04-21') AS previous_day,
          [ 'BA', 'CM', 'EK', 'LA', 'TK', 'UA'] AS allowed_carriers

      SELECT
          curr.day,
          curr.carriers,
          curr.slot_time AS one_hour_slot,
          curr.searches AS current_searches,
          curr.health AS current_health,
          prev.searches AS previous_searches,
          prev.health AS previous_health,
          round(curr.searches - prev.searches, 2) AS searches_diff,
          round(curr.health - prev.health, 1) AS health_diff
      FROM (
          SELECT
              toDate(date_added) AS day,
              JSONExtractString(request_options, 'suppliers_to_fetch') AS carriers,
              formatDateTime(toStartOfInterval(date_added, INTERVAL 1 HOUR), '%H:00') AS slot_time,
              SUM(num_packages_returned > 0) * 1.0 / COUNT() AS health,
              COUNT() AS searches
          FROM search_api_stats.gds_raw
          WHERE
              content_source = 'downtowntravel'
              AND (
                  (api_user IN ('kayak', 'kayakapp') AND site_id = 1)
                  OR api_user NOT IN ('kayak', 'kayakapp')
              )
              AND toDate(date_added) = current_day
              AND source = 'external'
              AND JSONExtractString(request_options, 'suppliers_to_fetch') IN allowed_carriers
              AND toStartOfInterval(date_added, INTERVAL 1 HOUR) < toStartOfInterval(now(), INTERVAL 1 HOUR)
          GROUP BY
              day,
              carriers,
              slot_time
      ) AS curr

      LEFT JOIN (
          SELECT
              JSONExtractString(request_options, 'suppliers_to_fetch') AS carriers,
              formatDateTime(toStartOfInterval(date_added, INTERVAL 1 HOUR), '%H:00') AS slot_time,
              SUM(num_packages_returned > 0) * 1.0 / COUNT() AS health,
              COUNT() AS searches
          FROM search_api_stats.gds_raw
          WHERE
              content_source = 'downtowntravel'
              AND (
                  (api_user IN ('kayak', 'kayakapp') AND site_id = 1)
                  OR api_user NOT IN ('kayak', 'kayakapp')
              )
              AND source = 'external'
              AND toDate(date_added) = previous_day
              AND JSONExtractString(request_options, 'suppliers_to_fetch') IN allowed_carriers
              AND toStartOfInterval(date_added, INTERVAL 1 HOUR) < toStartOfInterval(now(), INTERVAL 1 HOUR)
          GROUP BY
              carriers,
              slot_time
      ) AS prev

      ON curr.carriers = prev.carriers AND curr.slot_time = prev.slot_time

      ORDER BY curr.day, curr.slot_time DESC, current_searches DESC
    ;;
  }

  dimension: day {
    type: date
    sql: ${TABLE}.day ;;
  }

  dimension: carriers {
    type: string
    sql: ${TABLE}.carriers ;;
  }

  dimension: one_hour_slot {
    type: string
    sql: ${TABLE}.one_hour_slot ;;
  }

  measure: current_searches {
    type: number
    sql: ${TABLE}.current_searches ;;
  }

  measure: current_health {
    type: number
    sql: ${TABLE}.current_health ;;
  }

  measure: previous_searches {
    type: number
    sql: ${TABLE}.previous_searches ;;
  }

  measure: previous_health {
    type: number
    sql: ${TABLE}.previous_health ;;
  }

  measure: searches_diff {
    type: number
    sql: ${TABLE}.searches_diff ;;
  }

  measure: health_diff {
    type: number
    sql: ${TABLE}.health_diff ;;
  }
}
