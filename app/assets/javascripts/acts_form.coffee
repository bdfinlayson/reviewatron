$ ->

  $('#values').selectize
    plugins: ['remove_button']
    persist: false
    maxItems: null

  $('addchallenge').on 'click', ->
    $('addchallenge').prepend('<br><input class="problem" name="problem" placeholder="Describe your challenging problem here"><br><input class="solution" placeholder="Describe how you solved the problem here">')
