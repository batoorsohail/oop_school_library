require './decorator'
require './nameable'
require './person'

describe Decorator do
  context 'Creating decorator test methods' do
    decorator = Decorator.new('Soha Bar')
    it 'sets decorator nameable as Soha Bar' do
      expect(decorator.nameable).to eql 'Soha Bar'
    end

    person = Person.new(40, 'Sohail', parent_permission: false)
    it 'should return correct name' do
      expect(person.correct_name).to eql 'Sohail'
    end
  end
end
