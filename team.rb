require 'json'
require_relative 'player'
require 'pry'


class Team
	attr_reader :name
	def initialize(name)
		@name = name
	end
	
	def self.all
		file = File.read('roster.json')
		teams = JSON.parse(file)
		team_array = []
		teams.each do |team_key, team_values|
				team_array << self.new(team_key)
			end
		team_array
	end

	def self.players(team)
		file = File.read('roster.json')
		teams = JSON.parse(file)
		player_array = []
		teams[team].each do |position, player|
			player_array << Player.new(player, position, team)
		end
		player_array
	end
end

p Team.all
p Team.players("Simpson Slammers")
