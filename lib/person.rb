class Person
  attr_reader :name, :interests, :supplies

  def initialize(person)
    @name = person[:name]
    @interests = person[:interests]
    @supplies = Hash.new
  end
end
