class Person
	attr_reader :name
	attr_accessor :caffeine_level

	def initialize(name, caffeine_level=0)
		@name = name
		@caffeine_level = caffeine_level
	end

	def run(meters)
		puts "#{@name} is running #{meters} meters."
	end

	def scream
		puts "ARGGHHH!!"
	end

	def drink_coffee
		@caffeine_level += 1
		puts "#{@name}'s caffeine level is #{@caffeine_level}."
	end
end

class PowerRanger < Person
	attr_accessor :strength
	attr_reader :color
	def initialize(name, caffeine_level=5, strength=5, color)
		super(name, caffeine_level)
		@strength = strength
		@color = color
	end

	def punch(person, strength)
		if strength <= @strength && @caffeine_level >= 1
			puts "#{@name} punched #{person.name}!"
			puts "#{person.name}:"
			print " #{person.scream}"
			puts "#{person.name} has been somersalted in the air!" if strength > 5
			puts "#{person.name} ran away!"
			@strength -= strength
			@caffeine_level -= 1
		elsif strength > @strength
			puts "Not enough strength! #{@name} needs to rest!"
		else
			puts "Not enough caffeine. Drink more coffee!"
		end
	end

	def rest
		@strength += 1
	end

	def use_megazord(person)
		if @caffeine_level > 1
			@strength = 5000
			puts "Go! Go! Power Rangers!"
			puts "#{@name} has entered his zord!"
			puts "#{@name}'s Zord punched #{person.name}!"
			puts "#{person.name} has been defeated!"
			person.caffeine_level = 0
		else
			puts "Not enough energy! Drink more coffee!"
		end
	end

end

class EvilNinja < Person
	def initialize(name, strength=5, evilness=5)
		super(name)
		@strength = strength
		@evilness = evilness
	end

	def punch(person, strength)
		if strength <= @strength && @caffeine_level >= 1
			puts "#{@name} punched #{person.name}!"
			puts "#{person.name}:"
			print " #{person.scream}"
			puts "#{person.name} has been somersalted in the air!" if strength > 5
			puts "#{person.name} ran away!"
			@strength -= strength
			@caffeine_level -= 1
		elsif strength > @strength
			puts "Not enough strength! #{@name} needs to rest!"
		else
			puts "Not enough caffeine. Drink more coffee!"
		end
	end

	def cause_mayhem(person)
		if @evilness > 5
			puts "#{@name} has grown to 100 feet!"
			puts "#{@name} attacks #{person.name}!"
			person.caffeine_level = 0
		else
			puts "#{@name} is not evil enough."
		end
	end
end

def fight(ranger1, ranger2, ninja1, ninja2, person1, person2)
	person1.drink_coffee
	person2.drink_coffee
	ninja1.punch(ranger1, 1)
	person1.run(50)
	ranger2.punch(ninja1, 2)
	person2.run(200)
	ninja2.punch(ranger2, 1)
	ninja1.cause_mayhem(ranger1)
	ranger2.use_megazord(ninja1)
	ranger1.drink_coffee
	ranger1.use_megazord(ninja2)
end

red = PowerRanger.new("Jason", "Red")
black = PowerRanger.new("Zach", "Black")
rita = EvilNinja.new("Rita")
zed = EvilNinja.new("Lord Zed")
bob = Person.new("Bob")
george = Person.new("George")
fight(red, black, rita, zed, bob, george)
