$ ->

  $('#values').selectize
    plugins: ['remove_button']
    persist: false
    maxItems: null
    valueField: 'id'
    labelField: 'assertion'
    searchField: [
      'id'
      'assertion'
    ]
