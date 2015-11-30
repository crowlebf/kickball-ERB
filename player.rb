require 'json'


class Player
	attr_reader :name, :position, :team_name
	def initialize(name, position, team_name)
		@name = name
		@position = position
		@team_name = team_name
	end
	
	def self.all
		file = File.read('roster.json')
		teams = JSON.parse(file)
		player_array = []
		teams.each do |team_key, team_values|
			team_values.each do |position, player|
				player_array << self.new(player, position, team_key)
			end
		end
		player_array
	end
end

p Player.all
