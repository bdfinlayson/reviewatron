$ ->

  count = 0

  $('#values').selectize
    plugins: ['remove_button']
    persist: false
    maxItems: null

  $('addchallenge').on 'click', ->
    $(@).parent().prepend("
      <collection>
        <input name='act[challenges][#{count}][]' class='problem' placeholder='Describe your challenging problem here'>
        <input name='act[challenges][#{count}][]' class='solution' placeholder='Describe how you solved the problem here'>
      </collection>
      ")
    count++

  $('addbenefit').on 'click', ->
    $(@).parent().prepend('
      <input class="benefits" name="act[benefits][]" placeholder="Give an example of why this benefited Metova">
    ')
