require_relative '../student'
require_relative '../classroom'

describe Classroom do
  before :each do
    @classroom = Classroom.new('Classroom 1')
  end

  context 'classroom test' do
    it 'classroom label should be "Classroom 1"' do
      expect(@classroom.student.length).to eq(0)
      expect(@classroom.label).to eq 'Classroom 1'
    end
  end

  context 'add student to classsroom' do
    it 'student added to class' do
      @classroom.add_student(Student.new(1, nil, 'Student1'))
      expect(@classroom.student.length).to eq(1)
    end
  end
end
