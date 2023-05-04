require './person'
require './book'
require './rental'

describe Person do
  context 'Add teacher or person' do
    it 'Returns age and name of the person' do
      person = Person.new(20, 'Jacob')
      expect(person.age).to eq 20
      expect(person.name).to eq 'Jacob'
    end

    it 'Returns true if the user is > 18 or the user has parent permission otherwise false' do
      person = Person.new(19, 'Sohail')
      expect(person.can_use_services?).to eq true
    end

    it 'Returns correct name' do
      person = Person.new(18, 'John')
      expect(person.correct_name).to eq('John')
    end

    it 'Add a rental book for a person' do
      book = Book.new('Book', 'Author')
      person = Person.new('Ruby', 'Ahmad')
      rental = book.add_rental('2021-10-12', person)
      expect(rental).to be_a Rental
    end

    it 'Returns true if age is > 18' do
      person = Person.new(18, 'John')
      expect(person.age).to eq (18)
    end
  end
end