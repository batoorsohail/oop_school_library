require './capitalize_decorator'
require './person'

describe CapitalizeDecorator do
  context 'Capitalize Decorator' do
    it 'capitalizes the first name' do
      person = Person.new(24, 'josue')
      capitalize_person = CapitalizeDecorator.new(person).correct_name
      expect(capitalize_person).to eq 'Josue'
    end
  end
end