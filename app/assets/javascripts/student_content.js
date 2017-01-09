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

var getContentImage = function() {
  return $.ajax({
    method: 'GET',
    url: '/api/v1/image'
  })
  .done(onGetContentImage)
  .fail(onFail);
}

getContentImage();
