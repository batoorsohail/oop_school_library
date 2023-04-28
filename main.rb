require_relative 'app'

class Main
  def initialize
    @app = App.new
  end

  def menu
    puts 'Welcome to School Library App!'
    loop do
      puts 'Please choose an option by entering a number:'
      puts '1 - List all books'
      puts '2 - List all people'
      puts '3 - Create a person'
      puts '4 - Create a book'
      puts '5 - Create a rental'
      puts '6 - List all rentals for a given person id'
      puts '7 - Exit'
      option = gets.chomp

      case option
      when '1'
        @app.list_all_books
      when '2'
        @app.list_all_people
      when '3'
        @app.create_person
      when '4'
        @app.create_book
      when '5'
        @app.create_rental
      when '6'
        @app.list_rentals
      when '7'
        puts 'Thank you for using our library ¯\^-^/¯'
        return
      else
        puts 'Please enter a number between 1 and 7'
      end
    end
  end
end

main = Main.new
main.menu