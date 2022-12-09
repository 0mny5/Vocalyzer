class SearchSongsController < ApplicationController
  def index
  end

  def create
    @results = {}

    song_query.each do |r|
      @results.store(r['title'], r['url'])
    end
    
    @results
  end

  private

  def url_params
    params.require(:project).permit(song_attributes: [:url])
  end

  def song_query
    query = URI.encode_www_form(q: params[:word])
    url = "https://widget.songle.jp/api/v1/songs/search.json?#{query}"
    uri = URI.parse(url)
    responce = Net::HTTP.get(uri)
    JSON.parse(responce)
  end
end
