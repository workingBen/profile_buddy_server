class ProfileBuddyServer::API < Grape::API
  format :json
  version 'v1', using: :path

  helpers do

  end

  resource :profile do
    get do
      Profile.all
    end

    get ':username' do
      Profile.order("created_at DESC").find_by_username(params[:username])
    end

    post 'scrape/:username' do
      require 'pry'

      username = params[:username]

#      binding.pry

      Profile.last
    end
  end
end

