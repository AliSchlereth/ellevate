var onFail = function(err) {
  console.error(err);
}

var onGetContentImage = function(data) {
  var imageUrl = data['image_url'];
  var imageTag = data['animal']
  $('.content-photo').append(
    '<img src="' + imageUrl + '" class="content-img">' +
    '<h3>' + imageTag + '</h3>'
  );
}

var onGetSentenceFrame = function(data) {
  var sentenceFrame = data['sentence_frame'];
  $('.sentence-frame').append(
    '<h4>' + sentenceFrame + '</h4>'
  );

}

var onGetTranslation = function(data) {
  var translatedMessage = data['message'];
  $('textarea.translated-sentence').val(translatedMessage);
}

var getContentImage = function() {
  return $.ajax({
    method: 'GET',
    url: '/api/v1/image'
  })
  .done(onGetContentImage)
  .fail(onFail);
}

var getSentenceFrame = function() {
  return $.ajax({
    method: 'GET',
    url: '/api/v1/sentence'
  })
  .done(onGetSentenceFrame)
  .fail(onFail);
}

var translateSentence = function() {
  var inputMessage = $('textarea.input-sentence').val();
  return $.ajax({
    method: 'POST',
    url: '/api/v1/translation',
    data: {translation: {'message': inputMessage}}
  })
  .done(onGetTranslation)
  .fail(onFail);
}

var refreshContent = function() {
  $('.content-photo').html('');
  $('textarea').val('')
  $('.sentence-frame').html('');
  getContentImage();
  getSentenceFrame();
}

$('.student-content-page').ready(function(){
  getContentImage();
  getSentenceFrame();
  $('.submit-sentence').on('click', translateSentence);
  $('.request-refresh').on('click', refreshContent)

  $('form.sentence-form').on('submit', function(event){
    event.preventDefault();
  });
});
