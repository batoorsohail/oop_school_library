require_relative '../teacher'
require_relative '../book'

describe Teacher do
  context 'Testing Teacher class functionality' do
    it 'Returns teacher details' do
      teacher = Teacher.new(21, 'Ruby', 'Jhon')
      expect(teacher.age).to eq 21
      expect(teacher.name).to eq 'Jhon'
      expect(teacher.specialization).to eq 'Ruby'
    end

    it 'Return ¯(ツ)/¯ if the teacher plays hooky' do
      teacher = Teacher.new(21, 'Ruby', 'Jhon')
      expect(teacher.can_use_services?).to eq true
    end

    it 'returns a hash with the teacher details' do
      teacher = Teacher.new(21, 'Ruby', 'Jhon')
      id = teacher.instance_variable_get(:@id)
      expect(teacher.to_h).to eq({
                                   id: id,
                                   age: 21,
                                   name: 'Jhon',
                                   specialization: 'Ruby',
                                   rentals: []
                                 })
    end
  end
end
