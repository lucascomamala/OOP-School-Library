require_relative './decorators/trimmer_decorator'
require_relative './decorators/capitalize_decorator'
require_relative './teacher'
require_relative './student'
require_relative './classroom'
require_relative './book'
require_relative './rental'

t1 = Teacher.new(21, 'Math', name: 'james mcavoy')
t2 = Teacher.new(25, 'English', name: 'michael fassbender')
s1 = Student.new(15, name: 'jennifer lawrence')
s2 = Student.new(13, name: 'emma stone', parent_permission: false)
s3 = Student.new(18, name: 'josh hutcherson', parent_permission: false)
class1 = Classroom.new('2a')
class2 = Classroom.new('3a')
b1 = Book.new('The Hobbit', 'J.R.R. Tolkien')
b2 = Book.new('The Doors of Perception', 'Aldous Huxley')
b3 = Book.new('A Picture of Dorian Gray', 'Oscar Wilde')

p r1 = Rental.new('2020-10-21', b1, s1)
p '----------------'
p r2 = Rental.new('2020-10-22', b2, t1)
p '----------------'
p r3 = Rental.new('2020-10-23', b3, s2)
p '----------------'
p r4 = Rental.new('2020-10-24', b1, t2)
p '----------------'
p r5 = Rental.new('2020-10-24', b2, s3)
p '----------------'
p r6 = Rental.new('2020-10-25', b3, s1)

p '++++++++++++++++'
p t1.rentals.count
p t1.rentals.map { |rental| rental.book.title }
p '----------------'
p t2.rentals.count
p t2.rentals.map { |rental| rental.book.title }
p '----------------'
p s1.rentals.count
p s1.rentals.map { |rental| rental.book.title }
p '----------------'
p b1.rentals.count
p b1.rentals.map { |rental| rental.person.name }
