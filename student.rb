require_relative 'person'

class Student < Person
  attr_reader :classroom

  def initialize(age, classroom, name: 'Unknown', parent_permission: true)
    super(age, name: name, parent_permission: parent_permission) # call the Person's constructor
    @classroom = classroom
  end

  def play_hooky
    '¯\\_(ツ)_/¯'.encode('utf-8')
  end
end
