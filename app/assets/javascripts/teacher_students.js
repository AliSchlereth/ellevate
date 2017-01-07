var onGetStudents = function(data) {
  $('#tch-dash-students').html('');
  for (var i = 0; i < data.length; i++) {
    var student = data[i];
    $('#tch-dash-students').append(
      '<div class="dash-student" id="student-' + student.id + '">' +
      '<div class="col-md-2 stu-username">' + student.username + '</div>' +
      '<div class="col-md-2 stu-name">' + student.name + '</div>' +
      '<div class="col-md-2 stu-language">' + student.language + '</div>' +
      '<div class="col-md-2 stu-level">' + student.level + '</div>' +
      '<div class="col-md-2 stu-pass-img"><span class="' + student.img + '" aria-hidden="true"></span></div>' +
      '<div class="btn btn-danger btn-xs dash-stu-delete">Delete</div>' +
      '<div class="btn btn-warning btn-xs dash-stu-update">Edit</div>' +
      '</div>'
    );
  }
  manageStudents();
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
  var stuName = $('input.new-stu-name').val();
  var stuUsername = $('input.new-stu-username').val();
  var stulanguage = $('input.new-stu-language').val();
  var stuLevel = $('select.new-stu-level').val();
  var stuPassImg = $('select.new-stu-pass-img').val();
  return $.ajax({
    method: 'POST',
    url: '/api/v1/teachers/students',
    data: {student: {'name': stuName, 'username': stuUsername, 'level': stuLevel, 'language': stulanguage, 'pass_img_id': stuPassImg}}
  })
  .done(function() {
    $('input').val('');
    $('select.new-stu-level').val('1');
    $('select.new-stu-pass-img').val('');
    getAllStudents();
  })
  .fail(onFail);
}

var editStudentField = function(stuInput) {
  var currentValue = stuInput.innerHTML;
  var currentClass = stuInput.classList[0];
  stuInput.outerHTML = '<input class="col-md-2' +
    currentClass + '" value="' + currentValue + '"/>'
}

var updateStudentById = function() {
  var student = $(this).parents('.dash-student');
  var stuName = student.find('.stu-name')[0];
  var stuLanguage = student.find('.stu-language')[0];
  var stuUsername = student.find('.stu-username')[0];
  var stuInfo = [stuName, stuLanguage, stuUsername]
  for (var i = 0; i < stuInfo.length; i++) {
    editStudentField(stuInfo[i]);
  }
  var stuLevel = student.find('.stu-level')[0];
  var currentClass = stuLevel.classList[0];
  var currentLevel = stuLevel.innerHTML;
  if (currentLevel === '3') {
    stuLevel.outerHTML = '<select> <option value="one">1</option> <option value="two">2</option> <option selected value="three">3</option> </select>';
  } else if (currentLevel === '2') {
    stuLevel.outerHTML = '<select> <option value="one">1</option> <option selected value="two">2</option> <option value="three">3</option> </select>';
  } else {
    stuLevel.outerHTML = '<select> <option selected value="one">1</option> <option value="two">2</option> <option value="three">3</option> </select>';
  }
  



}

getAllStudents();

var manageStudents = function() {
  $('.dash-stu-delete').on('click', deleteStudentById);
  $('.dash-stu-update').on('click', updateStudentById);
}


$(document).ready(function(){
  // var createStudents = function() {
    $('.dash-stu-create').on('click', createStudentById);
  // }

  $('form').on('submit', function(event){
    event.preventDefault();
  });

})
