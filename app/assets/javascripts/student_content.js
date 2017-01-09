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

var onGetTranslation = function(data) {
  debugger;
}

var getContentImage = function() {
  return $.ajax({
    method: 'GET',
    url: '/api/v1/image'
  })
  .done(onGetContentImage)
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

getContentImage();

$(document).ready(function(){
  $('.dash-stu-create').on('click', createStudentById);
  $('.submit-sentence').on('click', translateSentence);
})
