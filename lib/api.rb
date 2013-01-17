require 'scraper_base'

class ProfileBuddyServer::API < Grape::API
  format :json
  version 'v1', using: :path

  helpers do

  end

  helpers ScraperBase

  resource :profiles do
    get do
      Profile.all
    end

    get ':id' do
      Profile.find(params[:id])
    end

#   get ':username' do
#     Profile.order("created_at DESC").find_by_username(params[:username])
#   end

    post 'scrape/:username' do
      username = params[:username]
      return profile if profile = Profile.find_by_username(username)

      data = scrapeProfile(username).merge({ username: username })
      Profile.create data
    end
  end
end

