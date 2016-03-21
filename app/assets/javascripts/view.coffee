window.View ?= {}

TEMPLATE = """
  {{ if (result.data.length > 0) { }}
    <table>
      <caption>ShopifyQL</caption>
      <thead>
        <tr>
          {{ _.each(result.columns, function(row) {}}
            <th>{{! row.field }}</th>
          {{ }) }}
        </tr>
      </thead>
      <tbody>
        {{ _.each(result.data, function(row) {}}
          <tr>
            {{ _.each(row, function(column) {}}
              <td>{{! column }}</td>
            {{ }) }}
          </tr>
        {{ }) }}
      </tbody>
    </table>
  {{ } else { }}
    <h3>No data</h3>
  {{ } }}
"""

FAILURE_TEMPLATE = """
  <h3>{{! errorMessage }}</h3>
"""

View.render = (element, response) ->
  if response?.result?.data
    compiled = _.template(TEMPLATE)
    $(element).html(compiled(response))
  else
    compiled = _.template(FAILURE_TEMPLATE)
    $(element).html(compiled({errorMessage: response}))

$ -> # init lodash templates on document ready
  _.templateSettings.escape       = /\{\{=([\s\S]+?)\}\}/g
  _.templateSettings.evaluate     = /\{\{([\s\S]+?)\}\}/g
  _.templateSettings.interpolate  = /\{\{!([\s\S]+?)\}\}/g
