require 'json'
require 'fileutils'

class ReadFile
  def self.create_directory
    return if File.directory?('./store')
    FileUtils.mkdir_p('./store')
  end

  def self.load_books
    books = []
    create_directory
    File.write('./store/books.json', []) unless File.exist?('./store/books.json')
    records = JSON.parse(File.read('./store/books.json'))
    records.each { |record| books << Book.new(record['title'], record['author']) }
    books
  end

  def self.load_people
    people = []
    create_directory
    File.write('./store/people.json', []) unless File.exist?('./store/people.json')
    records = JSON.parse(File.read('./store/people.json'))
    records.each do |record|
      person = if record['type'] == 'Student'
                 Student.new(record['age'],
                             nil,
                             record['name'],
                             parent_permission: record['parent_permission'])
               else
                 Teacher.new(record['age'], '', record['name'])
               end

      person.id = record['id']
      people << person
    end
    
    people
  end

  def self.load_rentals(books, people)
    rentals = []
    create_directory
    File.write('./store/rentals.json', []) unless File.exist?('./store/rentals.json')
    records = JSON.parse(File.read('./store/rentals.json'))
    records.each do |record|
      book = books.select { |el| el.title == record['title'] }[0]
      person = people.select { |el| el.id == record['id'] }[0]
      rental = person.add_rental(record['date'], book)
      rentals << rental
    end
    rentals
  end
end
