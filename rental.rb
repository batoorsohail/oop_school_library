require_relative 'book'
require_relative 'person'

class Rental
  attr_accessor :date, :person, :book

  def initialize(date, book, person)
    @date = date
    @book = book
    book.rentals.push(self) if @book.is_a?(Book)
    @person = person
    person.rentals.push(self) if @person.is_a?(Person)
  end

  def to_h
    {
      date: @date,
      book: @book,
      person: @person
    }
  end
end
