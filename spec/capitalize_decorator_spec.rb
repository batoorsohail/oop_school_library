require './capitalize_decorator'
require './person'

describe CapitalizeDecorator do
  context 'Capitalize Decorator' do
    it 'capitalizes the first name' do
      person = Person.new(24, 'sohail')
      capitalize_person = CapitalizeDecorator.new(person).correct_name
      expect(capitalize_person).to eq 'Sohail'
    end
  end
end
