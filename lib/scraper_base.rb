module ScraperBase
  require 'nokogiri'
  require 'open-uri'
  require 'net/http'

  def scrapeProfile username
    url = "http://okcupid.com/profile/#{username}"

    doc = Nokogiri::HTML(open(url))

    data = {}
    data[:self_summary] = doc.css('#essay_text_0').text.strip
    data[:doing_with_my_life] = doc.css('#essay_text_1').text.strip
    data[:really_good_at] = doc.css('#essay_text_2').text.strip
    data[:first_things_people_notice] = doc.css('#essay_text_3').text.strip
    data[:favorite_books_movies_shows_music_food] = doc.css('#essay_text_4').text.strip
    data[:six_things] = doc.css('#essay_text_5').text.strip
    data[:think_about] = doc.css('#essay_text_6').text.strip
    data[:friday_night] = doc.css('#essay_text_7').text.strip
    data[:private_admission] = doc.css('#essay_text_8').text.strip
    data[:message_me_if] = doc.css('#essay_text_9').text.strip

    data
  end
end
