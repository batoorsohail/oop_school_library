# rubocop:disable Metrics/cyclomatic_complexity
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

      def execute_option(option)
      end
      case option
      when '1'
        List.list_books(@books)
      when '2'
        List.list_people(@people)
      when '3'
        Create.create_person(@people)
      when '4'
        Create.create_book(@books)
      when '5'
        Create.create_rental(@people, @books, @rentals)
      when '6'
        List.list_rentals(@people)
      else
        Storage.save_all(@people, @books, @rentals)
      end
    end
  end
end

main = Main.new
main.menu
# rubocop:enable Metrics/cyclomatic_complexity
