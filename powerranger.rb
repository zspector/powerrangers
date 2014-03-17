class Person
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

class PowerRanger
end

class EvilNinja
end
