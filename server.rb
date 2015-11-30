require 'sinatra'
require 'json'
require 'pry'
require_relative 'player'
require_relative 'team'


player_array = Player.all
team_array = Team.all

set :public_folder, File.join(File.dirname(__FILE__), "public")

get "/teams" do
	erb :index, locals: { teams: team_array }
end
get "/teams/:team_name" do
	erb :teams, locals: { team_name: params[:team_name], teams: team_array }
end
get "/positions" do
	erb :index_position, locals: { teams: team_array }
end
get "/positions/:position_name" do
	erb :positions, locals: { position_name: params[:position_name], teams: player_array }
end
