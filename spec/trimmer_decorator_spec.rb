require './nameable'
require './person'
require './trimmer_decorator'

describe TrimmerDecorator do
  context 'Create trimmer test functions' do
    it 'should trim the name with more than 10 characters' do
      person = Person.new(24, 'josuerushanika')
      trimmed_name = TrimmerDecorator.new(person).correct_name
      expect(trimmed_name).to eql 'josuerusha'
      expect(trimmed_name.length).to be <= 10
    end
  end
end
