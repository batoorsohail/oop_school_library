require_relative '../book'
require_relative '../person'
require_relative '../rental'

describe Rental do
  before :each do
    @person = Person.new(1, 'Person1')
    @book = Book.new('Title1', 'Author1')
    @rental = Rental.new('2000/01/01', @person, @book)
  end

  context 'rental test' do
    it 'book and person must contain added values' do
      expect(@rental.date).to eq '2000/01/01'
      expect(@rental.person.rentals.length).to eq(0)
      expect(@rental.book.rentals.length).to eq(1)
    end
  end
end
