module ApplicationHelper
  def default_meta_tags
  {
    noindex: ! Rails.env.production?,
    og: {
      description: 'Vocaloid楽曲を比較、分析して快適な音楽ライフを送りませんか',
      type: 'website',
      url: request.original_url,
      image: image_url('og_image.png'),
      locale: 'ja_JP',
    },
    twitter: {
      card: 'summary_large_image',
      site: '@0mny5_erb',
    }
  }
  end

  def full_title(page_title = '')
    base_title = "Vocalyzer"
    if page_title.empty?
      base_title
    else
      base_title + " - " + page_title
    end
  end
end
