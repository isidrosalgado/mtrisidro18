view: order_items {
  sql_table_name: demo_db.order_items ;;
  drill_fields: [id]

  #####################################new test












################################################
  parameter: item_to_add_up {
    type: unquoted
    allowed_value: {
      label: "Total Sale Price"
      value: "sale_price"
    }

    allowed_value: {
      label: "Total Cost"
      value: "cost"
    }

    allowed_value: {
      label: "Total Profit"
      value: "profit"
    }
  }

  #parameter: grouping_object_type_2 {
   # label: "grouping_level_2"
    #allowed_value: {
     # label: ""
      #value: ""
    #}
    #allowed_value: {
    #  label: "department"
    #  value: "Department"
    #}
#  }
#################################################
  measure: dynamic_sum {
    type: sum
    #sql: ${TABLE} ;;
    sql: ${TABLE}.{% parameter item_to_add_up %} ;;
    label_from_parameter: item_to_add_up
    value_format_name: "usd"
  }

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: inventory_item_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.inventory_item_id ;;
  }
  dimension: order_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.order_id ;;
  }
  dimension: phone {
    type: string
    sql: ${TABLE}.phone ;;
  }
  dimension: phones {
    type: string
    sql: ${TABLE}.phones ;;
  }
  dimension_group: returned {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.returned_at ;;
  }
  dimension: sale_price {
    type: number
    sql: ${TABLE}.sale_price ;;
  }
  measure: count {
    type: count
    drill_fields: [id, orders.id, inventory_items.id]
  }
}
