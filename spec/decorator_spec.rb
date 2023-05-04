require './decorator'
require './nameable'

describe Decorator do
  context 'Creating decorator test methods' do
    decorator = Decorator.new('Soha Bar')
    it 'sets decorator nameable as Soha Bar' do
      expect(decorator.nameable).to eql 'Soha Bar'
    end
  end
end