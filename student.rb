require_relative 'person'

class Student < Person
  attr_reader :classroom

  def initialize(age, parent_permission, name)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def to_h
    {
      id: @id,
      age: @age,
      name: @name,
      parent_permission: @parent_permission,
      rentals: @rentals,
      classroom: @classroom
    }
  end
end
