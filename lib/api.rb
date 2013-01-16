class ProfileBuddyServer::API < Grape::API
  format :json
  version 'v1', using: :path

  helpers do

  end

  resource :profiles do
    get do
      Profile.all
    end

    get ':id' do
      Profile.order("created_at DESC").find(params[:id])
    end
  end
end

