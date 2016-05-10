$ ->

  $('#values').selectize
    plugins: ['remove_button']
    persist: false
    maxItems: null
    valueField: 'id'
    labelField: 'name'
    searchField: [
      'id'
      'description'
    ]
