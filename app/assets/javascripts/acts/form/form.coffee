$ ->

  $('#values').selectize
    plugins: ['remove_button']
    persist: false
    maxItems: null

  $('addchallenge').on 'click', ->
    $(@).parent().prepend('
      <collection">
        <input class="problems" name="act[problems][]" placeholder="Describe your challenging problem here">
        <input class="solutions" name="act[solutions][]" placeholder="Describe how you solved the problem here">
      </collection>
      ')

  $('addbenefit').on 'click', ->
    $(@).parent().prepend('
      <input class="benefits" name="act[benefits][]" placeholder="Give an example of why this benefited Metova">
    ')