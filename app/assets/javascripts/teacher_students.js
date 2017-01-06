var onGetStudents = function(data) {
  $('#tch-dash-students').html('');
  for (var i = 0; i < data.length; i++) {
    var student = data[i];
    $('#tch-dash-students').append(
      '<div class="dash-student" id="student-' + student.id + '">' +
      '<div class="col-md-2">' + student.username + '</div>' +
      '<div class="col-md-2">' + student.name + '</div>' +
      '<div class="col-md-2">' + student.language + '</div>' +
      '<div class="col-md-2">' + student.level + '</div>' +
      '<div class="col-md-2"><span class="' + student.img + '" aria-hidden="true"></span></div>' +
      '<div class="btn btn-danger btn-xs dash-stu-delete">Delete</div>' +
      '</div>'
    );
  }
  deleteStudents();
}

var onFail = function(err) {
  console.error(err);
}

var getAllStudents = function() {
  return $.ajax({
    method: 'GET',
    url: '/api/v1/teachers/students'
  })
  .done(onGetStudents)
  .fail(onFail);
}

var deleteStudentById = function() {
  var student = $(this).parents('div.dash-student')[0];
  var stuId = student.id.split("-")[1]
  return $.ajax({
    method: 'DELETE',
    url: '/api/v1/teachers/students/' + stuId
  })
  .done(getAllStudents)
  .fail(onFail);
}

var createStudentById = function() {
  var stuName = $('input.stu-name').val();
  var stuUsername = $('input.stu-username').val();
  var stulanguage = $('input.stu-language').val();
  var stuLevel = $('select.stu-level').val();
  var stuPassImg = $('select.stu-pass-img').val();
  return $.ajax({
    method: 'POST',
    url: '/api/v1/teachers/students',
    data: {student: {'name': stuName, 'username': stuUsername, 'level': stuLevel, 'language': stulanguage, 'pass_img_id': stuPassImg}}
  })
  .done(getAllStudents)
  .fail(onFail);
}

getAllStudents();

var deleteStudents = function() {
  $('.dash-stu-delete').on('click', deleteStudentById);
}

$(document).ready(function(){
  // var createStudents = function() {
    $('.dash-stu-create').on('click', createStudentById);
  // }

  $('form').on('submit', function(event){
    event.preventDefault();
  });

})
