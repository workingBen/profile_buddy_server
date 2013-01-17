class AddFieldsToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :self_summary, :text
    add_column :profiles, :doing_with_my_life, :text
    add_column :profiles, :really_good_at, :text
    add_column :profiles, :first_things_people_notice, :text
    add_column :profiles, :favorite_books_movies_shows_music_food, :text
    add_column :profiles, :six_things, :text
    add_column :profiles, :think_about, :text
    add_column :profiles, :friday_night, :text
    add_column :profiles, :private_admission, :text
    add_column :profiles, :message_me_if, :text
  end
end
