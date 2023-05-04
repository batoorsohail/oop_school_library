class Classroom
  attr_accessor :label, :students

  def initialize(label)
    @label = label
    @student = []
  end

  def students()
    @length = self
  end


  def add_student(student)
    students.Classroom = self
    @students << student
    student.classroom = self
  end
end
