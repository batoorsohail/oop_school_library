require 'json'
require 'fileutils'

class ReadFile
  def self.create_directory
    return if File.directory?('./data-storage')
    FileUtils.mkdir_p('./data-storage')
  end

  def self.load_books
    books = []
    create_directory
    File.write('./data-storage/books.json', []) unless File.exist?('./data-storage/books.json')
    records = JSON.parse(File.read('./data-storage/books.json'))
    records.each { |record| books << Book.new(record['title'], record['author']) }
    books
  end

  def self.load_people
    people = []
    create_directory
    File.write('./data-storage/people.json', []) unless File.exist?('./data-storage/people.json')
    records = JSON.parse(File.read('./data-storage/people.json'))
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
    File.write('./data-storage/rentals.json', []) unless File.exist?('./data-storage/rentals.json')
    records = JSON.parse(File.read('./data-storage/rentals.json'))
    records.each do |record|
      book = books.select { |el| el.title == record['title'] }[0]
      person = people.select { |el| el.id == record['id'] }[0]
      rental = person.add_rental(record['date'], book)
      rentals << rental
    end
    rentals
  end
end
