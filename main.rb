require_relative './app'

def print_question
  puts "Please choose an option by entering a number:
    1- List all books.
    2- List all people.
    3- Create a person.
    4- Create a book.
    5- Create a rental.
    6- List all rentals for a given person id.
    7- Exit."
end

class Main
  app = App.new
  puts 'Welcome to the School Library Application!'
  puts
  loop do
    print_question
    selected = app.select_option
    break if selected == 7
  end
end

Main
