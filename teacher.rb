require_relative 'person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(age, specialization, name)
    super(age, name)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def to_h
    {
      id: @id,
      age: @age,
      name: @name,
      specialization: @specialization,
      rentals: @rentals
    }
  end
end
