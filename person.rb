require_relative 'nameable'
require_relative 'decorator'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'

class Person < Nameable
  attr_reader :id, :rentals
  attr_accessor :name, :age

  def initialize(age, name = 'Unknow', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(date, book)
    Rental.new(date, book, self)
  end

  private

  def of_age?
    @age >= 18
  end
end
