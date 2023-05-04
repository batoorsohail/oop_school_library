require './student'
require './classroom'

describe Student do
  context 'Testing Student class functionality' do
    it 'Returns student details' do
      student = Student.new(18, 'Jhon', true)
      expect(student.age).to eq 18
      expect(student.name).to eq 'Jhon'
    end

    it 'Return ¯(ツ)/¯ if the student plays hooky' do
      student = Student.new(18, 'Jhon', true)
      expect(student.play_hooky).to eq '¯(ツ)/¯' 
    end

    it 'returns a hash with the student details' do
      student = Student.new(17, 'Jhon', true)
      id = student.instance_variable_get(:@id)
      expect(student.to_h).to eq({
        id: id,
        age: 17,
        name: 'Jhon',
        parent_permission: true,
        rentals: []
      })
    end
  end
end