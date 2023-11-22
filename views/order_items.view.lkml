view: order_items {
  sql_table_name: demo_db.order_items ;;
  drill_fields: [id]

  #####################################new test
  parameter: grouping_object_type_1 {
    label: "grouping_level_1"
    allowed_value: {
      label: ""
      value: ""
    }
    allowed_value: {
      label: "department"
      value: "department"
    }
    allowed_value: {
      label: "tier"
      value: "Tier"
    }
    allowed_value: {
      label: "category"
      value: "Category"
    }
    allowed_value: {
      label: "shift"
      value: "Shift"
    }
    allowed_value: {
      label: "supervisor"
      value: "Supervisor"
    }
    allowed_value: {
      label: "employee_type"
      value: "Employee Type"
    }
    allowed_value: {
      label: "employee"
      value: "Employee"
    }
  }

  parameter: grouping_object_type_2 {
    label: "grouping_level_2"
    allowed_value: {
      label: ""
      value: ""
    }
    allowed_value: {
      label: "department"
      value: "department"
    }
    allowed_value: {
      label: "tier"
      value: "Tier"
    }
    allowed_value: {
      label: "category"
      value: "Category"
    }
    allowed_value: {
      label: "shift"
      value: "Shift"
    }
    allowed_value: {
      label: "supervisor"
      value: "Supervisor"
    }
    allowed_value: {
      label: "employee_type"
      value: "Employee Type"
    }
    allowed_value: {
      label: "employee"
      value: "Employee"
    }
  }



  dimension: grp_grouping_object_value_1 {
    label: "grouping_1"
    label_from_parameter: grouping_object_type_1
    sql: case
          when {% parameter grouping_object_type_1 %} = 'Department' then f_department_name
          when {% parameter grouping_object_type_1 %} = 'Tier' then (f_grouping_tier_name || ': ' || coalesce(f_grouping_tier_option_name,'None'))
          when {% parameter grouping_object_type_1 %} = 'Category' then f_category_name
          when {% parameter grouping_object_type_1 %} = 'Shift' then f_shift_name
          when {% parameter grouping_object_type_1 %} = 'Supervisor' then f_supervisor_name
          when {% parameter grouping_object_type_1 %} = 'Employee Type' then f_employee_type
          --when {% parameter grouping_object_type_1 %} = 'Employee' then f_employee_name || ' (' || f_employee_code || ')'
      end ;;
  }

  dimension: grp_grouping_object_value_2 {
    label: "grouping_2"
    label_from_parameter: grouping_object_type_2
    sql: case
          when {% parameter grouping_object_type_2 %} = 'Department' then f_department_name
          when {% parameter grouping_object_type_2 %} = 'Tier' then (f_grouping_tier_name || ': ' || coalesce(f_grouping_tier_option_name,'None'))
          when {% parameter grouping_object_type_2 %} = 'Category' then f_category_name
          when {% parameter grouping_object_type_2 %} = 'Shift' then f_shift_name
          when {% parameter grouping_object_type_2 %} = 'Supervisor' then f_supervisor_name
          when {% parameter grouping_object_type_2 %} = 'Employee Type' then f_employee_type
          --when {% parameter grouping_object_type_2 %} = 'Employee' then f_employee_name || ' (' || f_employee_code || ')'
      end ;;
  }











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
