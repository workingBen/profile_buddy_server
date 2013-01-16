class ProfileBuddyServer::API < Grape::API
  format :json
  version 'v1', using: :path

  helpers do

  end

  resource :profiles do
    get do
      Profile.all
    end

    get ':username' do
      Profile.where("username = #{params[:username]}").order("created_at DESC")
    end
  end
end

