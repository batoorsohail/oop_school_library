require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'classroom'
require_relative 'book'
require_relative 'rental'

class App
  def initialize
    @people = []
    @books = []
    @rentals = []
    @classroom = Classroom.new('Grade 10')
  end

  def list_all_books
    puts 'There are no books in the list' if @books.empty?
    @books.each_with_index do |book, index|
      puts "#{index} - Title: #{book.title.capitalize}, Author: #{book.author.capitalize}"
    end
  end

  def list_all_people
    puts 'There are no people in the list' if @people.empty?
    @people.each_with_index do |person, index|
      puts "#{index} - [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  def create_person
    puts 'Do you want to create a teacher or student? Enter 1 for the student and 2 for teacher.'
    option = gets.chomp
    puts 'Name: '
    name = gets.chomp
    puts 'Age: '
    age = gets.chomp.to_i
    case option
    when '1'
      create_student(name, age)
    when '2'
      create_teacher(name, age)
    else
      puts 'Invalid! Please enter 1 or 2'
    end
  end

  def create_student(name, age)
    print 'Has parent permission? [Y/N]'
    parent_permission = gets.chomp.downcase
    student = Student.new(age, parent_permission == 'y', name)
    @people << student
    puts 'Student created successfully'
  end

  def create_teacher(name, age)
    print 'Specialization:'
    specialization = gets.chomp
    @people << Teacher.new(age, specialization, name)
    puts 'Teacher created successfully'
  end

  def create_book
    print 'Titile:'
    title = gets.chomp
    print 'Author:'
    author = gets.chomp
    @books << Book.new(title, author)
    puts 'Book created successfully'
  end

  def select_book
    list_all_books
    puts 'Select a book index from the above list by number: '
    book_id = gets.chomp.to_i
    @books[book_id]
  end

  def select_person
    list_all_people
    puts 'Select a person index from the above list by number: '
    person_id = gets.chomp.to_i
    @people[person_id]
  end

  def create_rental
    rented_book = select_book
    renter = select_person
    print 'Date: (YYYY-MM-DD)'
    date = gets.chomp
    @rentals << Rental.new(date, renter, rented_book)
    puts 'Rental created successfully'
  end

  def list_rentals
    print 'ID of person:'
    id = gets.chomp.to_i

    rentals = @rentals.filter { |rental| rental.person.id == id }

    puts 'Rentals:'
    rentals.each do |rental|
      puts "Date: #{rental.date}, Book: '#{rental.book.title}' by #{rental.book.author}"
    end
  end
end
