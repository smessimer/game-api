require 'net/http'

class SteamFriendsController < ApplicationController
  def index 
    @steam_user = SteamUser.find(params[:steam_user_id])

    if !auth_steam_user
      render :json => { :response => 'Cannot access another user\'s profile' }, :status => 403
      return
    end

    steam_id = @steam_user.steamid
    url = URI.parse("http://api.steampowered.com/ISteamUser/GetFriendList/v0001/?key=#{ENV['STEAM_API_KEY']}&steamid=#{steam_id}&relationship=friend")
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port) { |http|
      http.request(req)
    }

    render json: JSON.parse(res.body)['friendslist']['friends']
  end

  def show
    @steam_user = SteamUser.find(params[:steam_user_id])
  
    if !auth_steam_user
      render :json => { :response => 'Cannot access another user\'s profile' }, :status => 403
      return
    end 

    steam_friend_id = params[:id]

    # Get friend profile
    url = URI.parse("http://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/?key=#{ENV['STEAM_API_KEY']}&steamids=#{steam_friend_id}")
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port) { |http|
      http.request(req)
    }

    profile = JSON.parse(res.body)['response']['players'][0]

    url = URI.parse("http://api.steampowered.com/IPlayerService/GetRecentlyPlayedGames/v0001/?key=#{ENV['STEAM_API_KEY']}&steamid=#{steam_friend_id}&format=json")
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port) { |http|
      http.request(req)
    }

    friend_playtime = profile
    friend_playtime['playtime'] = JSON.parse(res.body)['response']
    # Get total playtime of all games over last 2 weeks
    friend_playtime['total_playtime'] = friend_playtime['playtime']['games'].sum {|game| game['playtime_2weeks']}

    render json: friend_playtime
  end

  def auth_steam_user
    puts 'current user id: ', current_user.id
    puts 'steam user id: ', @steam_user.user_id
    current_user.id == @steam_user.user_id
  end
end
