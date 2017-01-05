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
    url: 'api/v1/teachers/students/' + stuId
  })
  .done(getAllStudents)
  .fail(onFail);
}

getAllStudents();

// $(document).ready(function(){
  var deleteStudents = function() {
    $('.dash-stu-delete').on('click', deleteStudentById);

  }

// })
