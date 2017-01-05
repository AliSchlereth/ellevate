var onGetStudents = function(data) {
  for (var i = 0; i < data.length; i++) {
    var student = data[i];
    $('#tch-dash-students').append(
      '<div class="col-md-2">' + student.username + '</div>' +
      '<div class="col-md-2">' + student.name + '</div>' +
      '<div class="col-md-2">' + student.language + '</div>' +
      '<div class="col-md-2">' + student.level + '</div>' +
      '<div class="col-md-2">' + student.level + '</div>' +
      '<div class="col-md-2">' + student.img + '</div>'
    );
  }
}

var getAllStudents = function() {
  return $.ajax({
    method: 'GET',
    url: '/api/v1/teachers/students'
  })
  .done(onGetStudents);
  // .fail(onFail);
}

getAllStudents();

$(document).ready(function(){

})
