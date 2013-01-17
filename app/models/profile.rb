class Profile < ActiveRecord::Base
  attr_accessible :username, :self_summary, :doing_with_my_life, :really_good_at
  attr_accessible :first_things_people_notice, :favorite_books_movies_shows_music_food
  attr_accessible :six_things, :think_about, :friday_night, :private_admission, :message_me_if

  validates :username, uniqueness: true
end
