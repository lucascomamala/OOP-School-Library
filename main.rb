require_relative './decorators/trimmer_decorator'
require_relative './decorators/capitalize_decorator'
require_relative './teacher'
require_relative './student'
require_relative './classroom'

t1 = Teacher.new(21, 'Math', name: 'james mcavoy')
t2 = Teacher.new(25, 'English', name: 'michael fassbender')
p s1 = Student.new(15, name: 'jennifer lawrence')
s2 = Student.new(13, name: 'emma stone', parent_permission: false)
s3 = Student.new(18, name: 'josh hutcherson', parent_permission: false)
class1 = Classroom.new('2a')
class2 = Classroom.new('3a')

p class1.add_student(s1)

p class1.add_student(s2)
p class1.students
class2.add_student(s3)

