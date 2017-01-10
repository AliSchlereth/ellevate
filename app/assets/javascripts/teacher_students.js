var onGetStudents = function(data) {
  $('#tch-dash-students').html('');
  for (var i = 0; i < data.length; i++) {
    var student = data[i];
    $('#tch-dash-students').append(
      '<div class="dash-student row" id="student-' + student.id + '">' +
      '<div class="col-md-2 stu-username">' + student.username + '</div>' +
      '<div class="col-md-2 stu-name">' + student.name + '</div>' +
      '<div class="col-md-2 stu-language">' + student.language + '</div>' +
      '<div class="col-md-2 stu-level">' + student.level + '</div>' +
      '<div class="col-md-2 stu-pass-img"><span class="' + student.img + '" aria-hidden="true"></span></div>' +
      '<div class="btn btn-danger btn-xs dash-stu-delete">Delete</div>' +
      '<div class="btn btn-warning btn-xs dash-stu-edit">Edit</div>' +
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
  var stuLanguage = $('input.new-stu-language').val();
  var stuLevel = $('select.new-stu-level').val();
  var stuPassImg = $('select.new-stu-pass-img').val();
  return $.ajax({
    method: 'POST',
    url: '/api/v1/teachers/students',
    data: {student: {'name': stuName, 'username': stuUsername, 'level': stuLevel, 'language': stuLanguage, 'pass_img_id': stuPassImg}}
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
  var currentClass = stuInput.classList[1];
  stuInput.outerHTML = '<input class="col-md-2 ' +
    currentClass + '" value="' + currentValue + '"/>'
}

var convertToInput = function(student) {
  var stuName = student.find('.stu-name')[0];
  var stuLanguage = student.find('.stu-language')[0];
  var stuUsername = student.find('.stu-username')[0];
  var stuInfo = [stuName, stuLanguage, stuUsername];
  for (var i = 0; i < stuInfo.length; i++) {
    editStudentField(stuInfo[i]);
  }
}

var convertLevelToSelect = function(student) {
  var stuLevel = student.find('.stu-level')[0];
  var currentClass = stuLevel.classList[0];
  var currentLevel = stuLevel.innerHTML;
  if (currentLevel === '3') {
    stuLevel.outerHTML = '<select class="col-md-2 stu-level"> <option value="1">1</option> <option value="2">2</option> <option selected value="3">3</option> </select>';
  } else if (currentLevel === '2') {
    stuLevel.outerHTML = '<select class="col-md-2 stu-level"> <option value="1">1</option> <option selected value="2">2</option> <option value="3">3</option> </select>';
  } else {
    stuLevel.outerHTML = '<select class="col-md-2 stu-level"> <option selected value="1">1</option> <option value="2">2</option> <option value="3">3</option> </select>';
  }
}

var convertPassImgToSelect = function(student) {
  var stuPassImg      = student.find('.stu-pass-img')[0];
  var currentClass    = stuPassImg.classList[0];
  var currentPassImg  = stuPassImg.innerHTML;
  var passImgClass    = $(currentPassImg)[0].classList[1].split('-')[1];
  var passImgs        = ['book', 'bell', 'fire', 'gift', 'heart', 'home', 'apple', 'lock', 'asterisk'];

  var passImgDropdownHTML = '<select class="col-md-2 stu-pass-img">' +
    '<option value="glyphicon glyphicon-' + passImgClass + '">' + passImgClass + '</option>'
    for (var i = 0; i < passImgs.length; i++) {
      if (passImgs[i] !== passImgClass) {
        passImgDropdownHTML = passImgDropdownHTML + '<option value="glyphicon glyphicon-' + passImgs[i] + '">' + passImgs[i] + '</option>'
      }
    }
    stuPassImg.outerHTML = passImgDropdownHTML + '</select>';
}

var convertEditButtonToUpdate = function(student) {
  var stuEditButton = student.find('.dash-stu-edit')[0];
  stuEditButton.outerHTML = '<div class="btn btn-success btn-xs dash-stu-update">Update</div>'
 }

var editStudentById = function() {
  var student = $(this).parents('.dash-student');
  convertToInput(student);
  convertLevelToSelect(student);
  convertPassImgToSelect(student);
  convertEditButtonToUpdate(student);
  updateStudents();
}

var updateStudentById = function() {
  var student = $(this).parents('.dash-student');
  var stuId = student[0].id.split("-")[1]
  var stuName     = student.find('input.stu-name').val();
  var stuUsername = student.find('input.stu-username').val();
  var stuLanguage = student.find('input.stu-language').val();
  var stuLevel    = student.find('select.stu-level').val();
  var stuPassImg  = student.find('select.stu-pass-img').val();
  $.ajax({
    method: 'PATCH',
    url: '/api/v1/teachers/students/' + stuId,
    data: {student: {'name': stuName, 'username': stuUsername, 'language': stuLanguage, 'level': stuLevel, 'pass_img': stuPassImg}}
  })
  .done(getAllStudents)
  .fail(onFail);
}

getAllStudents();

var manageStudents = function() {
  $('.dash-stu-delete').on('click', deleteStudentById);
}

var updateStudents = function() {
  $('.dash-stu-update').on('click', updateStudentById);
}


$(document).ready(function(){
    $('.dash-stu-create').on('click', createStudentById);
    $('#tch-dash-students').on('click', '.dash-stu-edit', editStudentById )
    // $('#tch-dash-')

})
