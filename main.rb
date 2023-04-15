require_relative './decorators/trimmer_decorator'
require_relative './decorators/capitalize_decorator'
require_relative './teacher'
require_relative './student'

t1 = Teacher.new(21, 'Math', name: 'james mcavoy')
t2 = Teacher.new(25, 'English', name: 'michael fassbender')
s1 = Student.new(15, '2a', name: 'jennifer lawrence')
s2 = Student.new(13, '3a', name: 'emma stone', parent_permission: false)
s3 = Student.new(18, '2b', name: 'josh hutcherson', parent_permission: false)

stack = NameableDecorator.new(s1)
p stack.correct_name
stack = CapitalizeDecorator.new(stack)
p stack.correct_name
stack = TrimmerDecorator.new(stack)
p stack.correct_name

