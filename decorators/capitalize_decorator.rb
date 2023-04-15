require_relative 'base_decorator'

class CapitalizeDecorator < NameableDecorator
  def correct_name
    @nameable.correct_name.split.each(&:capitalize!).join(' ')
  end
end
