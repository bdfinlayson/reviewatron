$ ->

  challengeCount = 0
  benefitCount = 0

  $('#values').selectize
    plugins: ['remove_button']
    persist: false
    maxItems: null

  $('addchallenge').on 'click', ->
    $(@).prev().append("
        <span>Problem #{challengeCount + 1}:</span><textarea name='act[challenges][#{challengeCount}][]' class='problem' placeholder='For example, you could say: \"Deadlines made it challenging to write tests\"'></textarea>
        <span>Solution to Problem #{challengeCount + 1}:</span><textarea name='act[challenges][#{challengeCount}][]' class='solution' placeholder='For example, you could say: \"We explained the need for testing to the client and were given more time\"'></textarea>
      ")
    challengeCount++

  $('addbenefit').on 'click', ->
    $(@).prev().append("
      <span>Benefit #{benefitCount + 1}:</span><textarea class='benefit' name='act[benefits][]' placeholder='For example, you could say: \"Client satisfaction was raised following fewer incidences of bug reports due to greater test coverage\"'></textarea>
    ")
    benefitCount++

  $('#preview-button').on 'click', ->
    $(document).find('modalcontent').empty()
    description = $("textarea[name='act[description]']").val()
    qualities = []
    $('.item').each ->
      qualities.push $(this).attr('data-value')
    problems = []
    $('.problem').each ->
      problems.push $(this).val()
    solutions = []
    $('.solution').each ->
      solutions.push $(this).val()
    challenges = []
    i = 0
    while i < problems.length
      challenges[i] = Array(problems[i], solutions[i])
      ++i
    benefits = []
    $('.benefit').each ->
      benefits.push $(this).val()
    formData = {
      act: {
        description: description,
        qualities: qualities,
        challenges: challenges,
        benefits: benefits
      }
    }
    $.ajax
      url: '/previews.json'
      type: 'POST'
      dataType: 'html'
      data: formData
      success: (response) =>
        $(document).find('modalcontent').append(response)
      error: ->
        alert 'Unable to generate preview. Please ensure all input fields are filled'

# modal js

$ ->
  $('#modal-1').on 'change', ->
    if $(this).is(':checked')
      $('body').addClass 'modal-open'
    else
      $('body').removeClass 'modal-open'
  $('.modal-fade-screen, .modal-close').on 'click', ->
    $('.modal-state:checked').prop('checked', false).change()
  $('.modal-inner').on 'click', (e) ->
    e.stopPropagation()
