require_relative 'book'
require_relative 'person'

class Rental
  attr_accessor :date, :person, :book

  def initialize(date, book, person)
    @date = date
    @book = book
    book.rentals.push(self)
    @person = person
    person.rentals.push(self)
  end

  def to_h
    {
      date: @date,
      book: @book,
      person: @person
    }
  end
end
