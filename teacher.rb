require_relative 'person'

class Teacher < Person
  attr_reader :specialization

  def initialize(age, specialization, name: 'Unknown', parent_permission: true)
    super(age, name: name, parent_permission: parent_permission) # call the Person's constructor
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def print_info
    "Name: #{name}, ID: #{id}, Age: #{age}, Specialization: #{specialization}"
  end
end
