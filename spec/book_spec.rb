require './book'
require './rental'
require './teacher'

describe Book do
  context 'Create book' do
    it 'Add book title and book author' do
      book = Book.new('Book', 'Author')
      expect(book.title).to eq 'Book'
      expect(book.author).to eq 'Author'
    end

    it 'Add a rental book' do
      book = Book.new('Book', 'Author')
      teacher = Teacher.new(29, 'Ruby', 'Ahmad')
      rental_book = book.add_rental(teacher, '2021-10-12')
      expect(rental_book).to be_a Rental
    end

    it 'returns a hash with the correct keys and values' do
      book = Book.new('Atomic Habits', 'James Clear')
      expected_hash = {
        title: 'Atomic Habits',
        author: 'James Clear',
        rentals: []
      }
      expect(book.to_h).to eq(expected_hash)
    end
  end
end
