require './decorators/trimmer_decorator'
require './decorators/capitalize_decorator'
require './teacher'
require './student'
require './classroom'
require './book'
require './rental'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
    b1 = Book.new('The Alchemist', 'Paulo Coelho')
    b2 = Book.new('The Little Prince', 'Antoine de Saint-Exupéry')
    @books << b1
    @books << b2
    s1 = Student.new(21, name: 'John', parent_permission: true)
    s2 = Student.new(18, name: 'Mary', parent_permission: true)
    @people << s1
    @people << s2
    t1 = Teacher.new(30, 'Math', name: 'Peter', parent_permission: true)
    t2 = Teacher.new(25, 'Physics', name: 'John', parent_permission: true)
    @people << t1
    @people << t2
  end

  # rubocop:disable Metrics/MethodLength
  def select_option # rubocop:disable Style/CyclomaticComplexity
    selected = gets.chomp.to_i
    puts
    case selected
    when 1
      list_books
    when 2
      list_people
    when 3
      create_person
    when 4
      create_book
    when 5
      create_rental
    when 6
      list_rentals_for_person_id
    when 7
      puts 'Thank you for using this app!'
      exit(true)
    else
      puts 'That is not a valid option'
    end
    puts
    selected
  end
  # rubocop:enable Metrics/MethodLength

  def list_books
    puts 'Books in library:'
    @books.each do |b|
      puts "\"#{b.title}\" by #{b.author}"
    end
  end

  def list_people
    puts 'Students:'
    @people.each do |p|
      if p.instance_of? Student
        puts p.print_info
      end
    end
    
    puts
    puts 'Teachers:'
    @people.each do |p|
      if p.instance_of? Teacher
        puts p.print_info
      end
    end
  end

  def check_permission(permission)
    case permission
    when 'y', 'Y' then permit = true
    when 'n', 'N' then permit = false
    end
    permit
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    personType = gets.chomp.to_i

    until (personType == 1 || personType == 2)
      print 'Please enter a valid option! '
      personType = gets.chomp.to_i
    end

    print 'Name: '
    name = gets.chomp
    print 'Age: '
    age = gets.chomp.to_i
    
    case personType
    when 1
      print 'Has parent permission? [y/n]: '
      permission = gets.chomp
      permission = check_permission(permission)
      @people << Student.new(age, name: name, parent_permission: permission)
    when 2
      print 'Specialization: '
      specialization = gets.chomp
      @people << Teacher.new(age, specialization, name: name)
    end
  end
end
