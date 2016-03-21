window.Transformer ?= {}

Transformer.toC3Format = (response) ->
  columns = []

  # get the column names and insert at the front
  response.columns.forEach (column) -> columns.push([column.field])

  # add all data behind the column names i.e. ["day", "2016-03-09", "2016-03-10"]
  response.data.forEach (row) ->
    row.forEach (item, i) ->
      # c3 will not parse iso 8601 dates, such as 2016-03-09T00:00:00-05:00
      columns[i].push(if i == 0 then item.substring(0, 10) else item)

  columns
