require_relative 'person'

class Student < Person
  attr_reader :classroom

  def initialize(age, name, parent_permission)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def to_h
    {
      id: @id,
      age: @age,
      name: @name,
      parent_permission: @parent_permission,
      rentals: @rentals
    }
  end
end
