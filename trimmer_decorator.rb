require_relative 'decorator.rb'

class TrimmerDecorator < Decorator
  def correct_name
    super[0..9]
  end
end