require_relative 'person'

class Student < Person
  attr_reader :classroom

  def initialize(age, classroom, name= 'Unknown', parent_permission= true)
    super(age, name= name, parent_permission= parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\\_(ツ)_/¯'.encode('utf-8')
  end
end

lucas=Student.new(18, 'AA', 'Lucas', true)
puts lucas
puts lucas.name
puts lucas.age
puts lucas.classroom
puts lucas.can_use_services?
puts lucas.id
puts lucas.play_hooky
