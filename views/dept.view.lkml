view: dept {
  sql_table_name: demo_db.dept ;;
  drill_fields: [dept_id]

#################################################
  dimension: department_name {
    type: string
    sql: ${TABLE}.DeptName ;;
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
          when {% parameter grouping_object_type_1 %} = 'Department' then .DeptName
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
          when {% parameter grouping_object_type_2 %} = 'Department' then .DeptName
          when {% parameter grouping_object_type_2 %} = 'Tier' then (f_grouping_tier_name || ': ' || coalesce(f_grouping_tier_option_name,'None'))
          when {% parameter grouping_object_type_2 %} = 'Category' then f_category_name
          when {% parameter grouping_object_type_2 %} = 'Shift' then f_shift_name
          when {% parameter grouping_object_type_2 %} = 'Supervisor' then f_supervisor_name
          when {% parameter grouping_object_type_2 %} = 'Employee Type' then f_employee_type
          --when {% parameter grouping_object_type_2 %} = 'Employee' then f_employee_name || ' (' || f_employee_code || ')'
      end ;;
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
