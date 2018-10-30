require_relative 'person'

class DSLEvaluator
  class World
    attr_reader :persons

    def initialize
      @persons = {}
    end

    def person(name)
      @persons[name] = Person.new
    end
  end

  def self.evaluate(&block)
    world = World.new
    world.instance_eval(&block)
    world.persons
  end
end
