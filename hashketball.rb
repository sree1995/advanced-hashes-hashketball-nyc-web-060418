# Write your code here!
 require "pry"

 def game_hash
   hash = {
     home: {
       team_name: "Brooklyn Nets",
       colors: ["Black", "White"],
       players: {
         "Alan Anderson" => {
            :number => 0,
            :shoe => 16,
            :points => 22,
            :rebounds => 12,
            :assists => 12,
            :steals => 3,
            :blocks => 1,
            :slam_dunks => 1
         },
         "Reggie Evans" => {
           :number => 30,
           :shoe => 14,
           :points => 12,
           :rebounds => 12,
           :assists => 12,
           :steals => 12,
           :blocks => 12,
           :slam_dunks => 7
         },
         "Brook Lopez" => {
           :number => 11,
           :shoe => 17,
           :points => 17,
           :rebounds => 19,
           :assists => 10,
           :steals => 3,
           :blocks => 1,
           :slam_dunks => 15
         },
         "Mason Plumlee" => {
           :number => 1,
           :shoe => 19,
           :points => 26,
           :rebounds => 12,
           :assists => 6,
           :steals => 3,
           :blocks => 8,
           :slam_dunks => 5
         },
         "Jason Terry" => {
           :number => 31,
           :shoe => 15,
           :points => 19,
           :rebounds => 2,
           :assists => 2,
           :steals => 4,
           :blocks => 11,
           :slam_dunks => 1
         }
       }
     },
     away: {
       team_name: "Charlotte Hornets",
       colors: ["Turquoise", "Purple"],
       players: {
         "Jeff Adrien" => {
            :number => 4,
            :shoe => 18,
            :points => 10,
            :rebounds => 1,
            :assists => 1,
            :steals => 2,
            :blocks => 7,
            :slam_dunks => 2
         },
         "Bismak Biyombo" => {
           :number => 0,
           :shoe => 16,
           :points => 12,
           :rebounds => 4,
           :assists => 7,
           :steals => 7,
           :blocks => 15,
           :slam_dunks => 10
         },
         "DeSagna Diop" => {
           :number => 2,
           :shoe => 14,
           :points => 24,
           :rebounds => 12,
           :assists => 12,
           :steals => 4,
           :blocks => 5,
           :slam_dunks => 5
         },
         "Ben Gordon" => {
           :number => 8,
           :shoe => 15,
           :points => 33,
           :rebounds => 3,
           :assists => 2,
           :steals => 1,
           :blocks => 1,
           :slam_dunks => 0
         },
         "Brendan Haywood" => {
           :number => 33,
           :shoe => 15,
           :points => 6,
           :rebounds => 12,
           :assists => 12,
           :steals => 22,
           :blocks => 5,
           :slam_dunks => 12
         }

       }
     }
   }
 end

 def num_points_scored(players_name)
   game_hash.each do |location, team_data|
     team_data[:players].each do |name, data|
       if name == players_name
         return data[:points]
       end
     end
   end
 end

 def shoe_size(players_name)
   game_hash.each do |location, team_data|
     team_data[:players].each do |name, data|
       if name == players_name
         return data[:shoe]
       end
     end
   end
 end

 def team_colors(team_name)
   game_hash.each do |location, team_data|
     if team_data[:team_name] == team_name
       return team_data[:colors]
     end
   end
 end

def team_names
  array = []
  game_hash.each do |location, team_data|
    array << team_data[:team_name]
  end
  return array
end

def player_numbers(team_name)
  array = []
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team_name
      team_data[:players].each do |name, value|
        array << value[:number]
      end
    end
  end
  return array
end

def player_stats(players_name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |name, value|
      if name == players_name
        return value
      end
    end
  end
end

def big_shoe_rebounds()
  shoe_size = 0
  rebounds = 0
  game_hash.each do |location, team_data|
    team_data[:players].each do |name, values|
      if values[:shoe] > shoe_size
        shoe_size = values[:shoe]
        rebounds = values[:rebounds]
      end
    end
  end
  return rebounds
end

def most_points_scored()
  player_name = nil
  player_points = 0
  game_hash.each do |location, team_data|
    team_data[:players].each do |name, stats|
      if stats[:points] > player_points
        player_points = stats[:points]
        player_name = name
      end
    end
  end
  player_name
end

def winning_team()
  home = 0
  away = 0
  game_hash.each do |location, team_data|
    if location = :home
      team_data[:players].each do |name, stats|
        home += stats[:points]
      end
    elsif location = :away
      team_data.each do |name, stats|
        away += stats[:points]
      end
    end
  end
  if home > away
    "Brooklyn Nets"
  else
    "Charlotte Hornets"
  end
end

def player_with_longest_name()
  player_name = ""
  game_hash.each do |location, team_data|
    team_data[:players].each do |name, stats|
      if name.length > player_name.length
        player_name = name
      end
    end
  end
  player_name
end

def long_name_steals_a_ton?()
  highest_steals = 0
  player_name = ""
  game_hash.each do |location, team_data|
    team_data[:players].each do |name, stats|
      if stats[:steals] > highest_steals
        highest_steals = stats[:steals]
        player_name = name
      end
    end
  end
  if player_with_longest_name() == player_name
    true
  end
end
