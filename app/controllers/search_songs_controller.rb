class SongSearchesController < ApplicationController
  def index
  end

  def create
    results = song_query
    @results = {}
    results.each do |r|
      @results.store(r['title'], r['url'])
    end
  end

  private

  def url_params
    params.require(:project).permit(song_attributes: [:url])
  end

  def song_query
    query = URI.encode_www_form(q: params[:word])
    url = "https://widget.songle.jp/api/v1/songs/search.json?#{query}"
    uri = URI.parse(url)
    responce = Net::HTTP.get(uri)  # リクエストを送り、返り値をresponceに代入
    JSON.parse(responce)
  end
end
