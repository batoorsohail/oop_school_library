require './student'
require './classroom'

describe Student do
  context 'Testing functions for Student class' do
    student = Student.new(15, 'Jane', true)
    it 'returns student information' do
      expect(student).to be_a Student
      expect(student.age).to eql 15
      expect(student.name).to eql 'Jane'
    end

    it 'checks students plays hooky emoji' do
      expect(student.play_hooky).to eql('¯(ツ)/¯')
    end

    it 'adds the classroom for student' do
      new_classroom = Classroom.new('Web Dev')
      student.classroom = new_classroom
      expect(new_classroom).to be_a Classroom
      expect(student.classroom.label).to eql 'Web Dev'
    end

    it 'returns a hash representation of the student' do
      new_classroom = Classroom.new('Web Dev')
      student.classroom = new_classroom

      id = student.instance_variable_get(:@id)

      expected_hash = {
        id: id,
        age: 15,
        name: 'Jane',
        parent_permission: true,
        rentals: [],
        classroom: new_classroom
      }

      expect(student.to_h).to eq(expected_hash)
    end
  end
end