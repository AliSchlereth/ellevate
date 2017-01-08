var onFail = function(err) {
  console.error(err);
}

var onGetContentImage = function(data) {
  var imageUrl = data['image_url'];
  $('.content-photo').append(
    '<img src="' + imageUrl + '">'
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
