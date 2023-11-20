- dashboard: alert_test
  title: Alert Test
  model: mtrisidro18
  explore: order_items
  type: looker_line
  fields: [orders.count, users.count, orders.created_quarter]
  fill_fields: [orders.created_quarter]
  filters:
    orders.created_quarter: 3 years
    users.first_name: Aaron
  sorts: [orders.created_quarter desc]
  limit: 500
  column_limit: 50
  query_timezone: America/Los_Angeles
  analysis_config:
    forecasting:
    - field_name: users.count
      forecast_n: 5
      forecast_interval: month
  x_axis_gridlines: false
  y_axis_gridlines: true
  show_view_names: false
  show_y_axis_labels: true
  show_y_axis_ticks: true
  y_axis_tick_density: default
  y_axis_tick_density_custom: 5
  show_x_axis_label: true
  show_x_axis_ticks: true
  y_axis_scale_mode: linear
  x_axis_reversed: false
  y_axis_reversed: false
  plot_size_by_field: false
  trellis: ''
  stacking: ''
  limit_displayed_rows: false
  legend_position: center
  point_style: none
  show_value_labels: false
  label_density: 25
  x_axis_scale: auto
  y_axis_combined: true
  show_null_points: true
  interpolation: linear
  ordering: none
  show_null_labels: false
  show_totals_labels: false
  show_silhouette: false
  totals_color: "#808080"
  defaults_version: 1
