# /cyclomatic_complexity
require_relative 'app'

def main
  app = App.new

  puts 'Welcome to School Library App!'
  puts ' '

  loop do
    options_menu
    option = gets.chomp.to_i

    options(option, app)

    if option == 7
      puts 'Thank you for using this app!'
      exit
    end
  end
end

def options_menu
  puts ' '
  puts 'Please choose an option by entering a number: '
  puts '1 - List all books'
  puts '2 - List all people'
  puts '3 - Create a person'
  puts '4 - Create a book'
  puts '5 - Create a rental'
  puts '6 - List all rentals for a given person id'
  puts '7 - Exit'
  puts ' '
  puts 'Enter number: '
end

def options(option, app)
  case option
  when 1
    app.list_all_books
  when 2
    app.list_all_people
  when 3
    app.create_person
  when 4
    app.create_book
  when 5
    app.create_rental
  when 6
    app.rental_list
  else
    puts 'Please choose a number between 1 and 7'
  end
end

main

# /cyclomatic_complexity
