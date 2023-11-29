view: dept {
  sql_table_name: demo_db.dept ;;
  drill_fields: [dept_id]

###################################################
  parameter: test {
    label: "parameter_label_test"
    #default_value: ""
    allowed_value: {
      label: ""
      value: ""
    }
    allowed_value: {
      label: "Value 1"
      value: "Value_1"
    }
    allowed_value: {
      label: "Value 2"
      value: "Value_2"
    }
  }

  dimension: test_dimension_localization{
    label: "test_dimension"
    label_from_parameter: test
    sql: "Test" ;;
  }

###################################################


  dimension: dept_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.DeptID ;;
  }
  dimension: dept_name {
    type: string
    sql: ${TABLE}.DeptName ;;
  }
  measure: count {
    type: count
    drill_fields: [dept_id, dept_name, salary.count]
  }
}
