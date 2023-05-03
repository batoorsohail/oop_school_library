require 'json'
class Storage
  def self.create_directory
    return if File.directory?('./data-storage')
    FileUtils.mkdir_p('./data-storage')
  end

  def self.save_all(people, books, _rentals)
    create_directory
    save_people(people)
    save_books(books)
    save_rentals(rentals)
  end

  def self.save_people(people)
    File.write('./data-storage/people.json', []) unless File.exist?('./data-storage/people.json')
    records = []
    people.each do |person|
      records << {
        id: person.id,
        type: person.class,
        name: person.name,
        age: person.age,
        parent_permission: person.can_use_services?
      }
    end
    File.write('./data-storage/people.json', JSON.generate(records))
  end
  def self.save_books(books)
    File.write('./data-storage/books.json', []) unless File.exist?('./data-storagebooks.json')
    records = []
    books.each { |book| records << { title: book.title, author: book.author } }
    File.write('./data-storage/books.json', JSON.generate(records))
  end

  def self.save_rentals(rentals)
    File.write('./data-storage/rentals.json', []) unless File.exist?('./data-storage/rentals.json')
    records = []
    rentals.each do |rental|
      records << {
        date: rental.date,
        id: rental.person.id,
        name: rental.person.name,
        title: rental.book.title,
        author: rental.book.author
      }
    end
    File.write('./data-storage/rentals.json', JSON.generate(records))
  end
end
