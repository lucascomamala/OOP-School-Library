require './decorators/trimmer_decorator'
require './decorators/capitalize_decorator'
require './teacher'
require './student'
require './classroom'
require './book'
require './rental'

# rubocop:disable Metrics/MethodLength
class App
  def initialize
    @books = []
    @people = []
    @rentals = []

    # Add some people, books and rentals to pre-populate our app
    b1 = Book.new('The Alchemist', 'Paulo Coelho')
    b2 = Book.new('The Little Prince', 'Antoine de Saint-Exupéry')
    b3 = Book.new('The Doors of Perception', 'Aldous Huxley')
    b4 = Book.new('The Hobbit', 'J. R. R. Tolkien')
    @books << b1
    @books << b2
    @books << b3
    @books << b4
    s1 = Student.new(21, name: 'John', parent_permission: true)
    s2 = Student.new(18, name: 'Mary', parent_permission: true)
    @people << s1
    @people << s2
    t1 = Teacher.new(30, 'Math', name: 'Enrico Fermi', parent_permission: true)
    t2 = Teacher.new(25, 'Physics', name: 'Richard Feynman', parent_permission: true)
    @people << t1
    @people << t2
    @rentals << Rental.new('2021-01-01', b1, s1)
    @rentals << Rental.new('2021-01-01', b2, s1)
  end

  def select_option # rubocop:disable Metrics/CyclomaticComplexity
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

  def list_books
    puts 'Books in library:'
    @books.each do |b|
      puts "\"#{b.title}\" by #{b.author}"
    end
  end

  def list_people
    puts 'Students:'
    @people.each do |p|
      puts p.print_info if p.instance_of? Student
    end

    puts
    puts 'Teachers:'
    @people.each do |p|
      puts p.print_info if p.instance_of? Teacher
    end
  end

  def check_permission(permission)
    case permission
    when 'y', 'Y' then permit = true
    when 'n', 'N' then permit = false
    end
    permit
  end

  def check_age(msg)
    number = 0
    loop do
      print msg
      input = gets.chomp.to_i
      if input.is_a?(Integer) && input.positive?
        number = input
        break
      else
        puts 'Please enter a valid input!'
      end
    end
    number
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    person_type = gets.chomp.to_i

    until [1, 2].include?(person_type)
      print 'Please enter a valid option! '
      person_type = gets.chomp.to_i
    end

    print 'Name: '
    name = gets.chomp
    age = check_age('Age: ')

    case person_type
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

    puts 'Person created successfully!'
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    @books << Book.new(title, author)
    puts 'Book created successfully!'
  end

  def create_rental
    # TODO: validate book input
    puts 'Select a book from the following list by number (not id):'
    @books.each_with_index do |book, i|
      puts "#{i + 1}) \"#{book.title}\" by #{book.author}"
    end
    book_select = gets.chomp.to_i
    puts

    # TODO: validate person input
    puts 'Select a person from the following list by number (not id):'
    @people.each_with_index do |p, i|
      puts "#{i + 1}) [#{p.class}] Name: #{p.name}, ID: #{p.id}, Age: #{p.age}"
    end
    person_select = gets.chomp.to_i
    puts

    # TODO: validate date input
    print 'Date: '
    date = gets.chomp

    @rentals.push(Rental.new(date, @books[book_select - 1], @people[person_select - 1]))
    puts 'Rental created successfully!'
  end

  def list_rentals_for_person_id
    # TODO: Check that person exists
    print 'ID of person: '
    id = gets.chomp.to_i

    puts 'Rentals:'
    @rentals.each do |r|
      puts "Date: #{r.date}, Book: \"#{r.book.title}\" by #{r.book.author}" if r.person.id == id
    end
  end
  # rubocop:enable Metrics/MethodLength
end
