require 'scraper_base'

class ProfileBuddyServer::API < Grape::API
  format :json
  version 'v1', using: :path

  helpers do

  end

  helpers ScraperBase

  resource :profile do
    get do
      Profile.all
    end

    get ':username' do
      Profile.order("created_at DESC").find_by_username(params[:username])
    end

    post 'scrape/:username' do
      username = params[:username]
      return profile if profile = Profile.find_by_username(username)

      data = scrapeProfile(username).merge({ username: username })
      Profile.create data
    end
  end
end

