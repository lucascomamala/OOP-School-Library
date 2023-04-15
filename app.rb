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
  end

  def select_option
    selected = gets.chomp.to_i
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
      puts
    end
    selected
  end
end
