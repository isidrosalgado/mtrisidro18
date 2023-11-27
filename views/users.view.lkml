view: users {
  sql_table_name: demo_db.users ;;
  drill_fields: [id]
#################################################
  dimension: department_name {
    type: string
    label_from_parameter: grouping_object_type_1
    sql: ${TABLE}.first_name ;;
    hidden: no
  }

  parameter: grouping_object_type_1 {
    label: "grouping_level_1"
    allowed_value: {
      label: ""
      value: ""
    }
    allowed_value: {
      label: "department"
      value: "Department"
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
  }

  parameter: grouping_object_type_2 {
    label: "grouping_level_2"
    allowed_value: {
      label: ""
      value: ""
    }
    allowed_value: {
      label: "department"
      value: "Department"
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

  }

  dimension: grp_grouping_object_value_1 {
    label: "grouping_1"
    label_from_parameter: grouping_object_type_1
    sql: case
          when {% parameter grouping_object_type_1 %} = 'Department' then first_name
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
          when {% parameter grouping_object_type_2 %} = 'Department' then first_name
          when {% parameter grouping_object_type_2 %} = 'Tier' then (f_grouping_tier_name || ': ' || coalesce(f_grouping_tier_option_name,'None'))
          when {% parameter grouping_object_type_2 %} = 'Category' then f_category_name
          when {% parameter grouping_object_type_2 %} = 'Shift' then f_shift_name
          when {% parameter grouping_object_type_2 %} = 'Supervisor' then f_supervisor_name
          when {% parameter grouping_object_type_2 %} = 'Employee Type' then f_employee_type
          --when {% parameter grouping_object_type_2 %} = 'Employee' then f_employee_name || ' (' || f_employee_code || ')'
      end ;;
  }


###################################################
  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
  }
  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }
  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }
  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }
  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }
  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }
  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }
  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }
  dimension: zip {
    type: zipcode
    sql: ${TABLE}.zip ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
  id,
  first_name,
  last_name,
  events.count,
  orders.count,
  saralooker.count,
  sindhu.count,
  user_data.count
  ]
  }

}
