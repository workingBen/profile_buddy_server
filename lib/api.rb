class ProfileBuddyServer::API < Grape::API
  format :json
  version 'v1', using: :path

  helpers do

  end

  resource :profile do
    get ':username' do
      Profile.where("username = #{params[:username]}").order("created_at DESC")
    end
  end
end

