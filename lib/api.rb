require 'scraper_base'

class ProfileBuddyServer::API < Grape::API
  format :json
  version 'v1', using: :path

  helpers do

  end

  helpers ScraperBase

  resource :users do
    get ':username' do
      User.find_by_username(params[:username])
    end

    post 'scrape/:username' do
      username = params[:username]
      if user = User.find_by_username(username)
        return user
      end

      user = User.create({ username: username })

      data = scrapeProfile(username)
      user.profiles.create data

      user
    end
  end

  resource :profiles do
  end
end

