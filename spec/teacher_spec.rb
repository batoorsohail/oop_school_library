require_relative '../teacher'
require_relative '../book'

describe Teacher do
  before :each do
    @teacher = Teacher.new(49, 'Specialization1', 'Teacher1')
  end

  context 'teacher creation test' do
    it 'should have' do
      expect(@teacher.age).to eq 49
      expect(@teacher.specialization).to eq 'Specialization1'
      expect(@teacher.name).to eq 'Teacher1'
      expect(@teacher.can_use_services?).to be true
    end
  end

  context 'Teacher rental test' do
    it 'should have' do
      @teacher.add_rental('2023/04/27', Book.new('Title1', 'Author1'))
      @teacher.add_rental('2023/04/27', Book.new('Title2', 'Author2'))
      @teacher.add_rental('2023/04/27', Book.new('Title3', 'Author3'))
      expect(@teacher.rentals.length).to be 3
      expect(@teacher.rentals[0].book.title).to eq 'Title1'
      expect(@teacher.rentals[1].book.author).to eq 'Author2'
      expect(@teacher.rentals[2].book.author).to eq 'Author3'
    end
  end

  context 'can use services test' do
    it 'must return true' do
      expect(@teacher.can_use_services?).to eq true
    end
  end
end
