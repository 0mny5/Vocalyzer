class Chord < ApplicationRecord
  belongs_to :song

  private

   def tweet_json
    url = "https://publish.twitter.com/oembed?url=https%3A%2F%2Ftwitter.com%2FInterior%2Fstatus%2F#{tweet_id}"
    uri = URI.parse(url)
    responce = Net::HTTP.get(uri)
    JSON.parse(responce)
  end
end
