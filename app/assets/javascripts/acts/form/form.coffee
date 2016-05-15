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
      <span>Benefit #{benefitCount + 1}:</span><textarea class='benefits' name='act[benefits][]' placeholder='For example, you could say: \"Client satisfaction was raised following fewer incidences of bug reports due to greater test coverage\"'></textarea>
    ")
    benefitCount++

  $('#preview-button').on 'click', ->
    $.ajax
      url: '/previews.json'
      type: 'POST'
      data: { act: {description: "my preview", qualities: [1]}}
      success: (response) ->
        alert response.html
