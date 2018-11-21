require 'net/http'

class SteamProfileController < ApplicationController
  def index 
    @steam_user = SteamUser.find(params[:steam_user_id])

    if !auth_steam_user
      render :json => { :response => 'Cannot access another user\'s profile' }, :status => 403
      return
    end

    steam_id = @steam_user.steamid
    url = URI.parse("http://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/?key=#{ENV['STEAM_API_KEY']}&steamids=#{steam_id}")
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port) { |http|
      http.request(req)
    }

    profile = JSON.parse(res.body)['response']['players'][0]
    render json: profile
  end

  def auth_steam_user
    puts 'current user id: ', current_user.id
    puts 'steam user id: ', @steam_user.user_id
    current_user.id == @steam_user.user_id
  end
end
