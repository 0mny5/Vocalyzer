class User < ApplicationRecord
  before_create :default_avatar

  has_many :projects, inverse_of: :user, dependent: :destroy

  has_one_attached :avatar

  enum role: { guest: 0, twitter:1 }

  validates :name, presence: true

  def default_avatar
    if !avatar.attached?
      avatar.attach(
        io: File.open(Rails.root.join('app', 'assets', 'images', 'guest_image_blue.png')),
        filename: 'guest_image.png',
        content_type: 'image/png'
      )
    end
  end

  def self.find_or_create_from_auth_hash(auth_hash)
    parse_url = URI.parse(auth_hash[:info][:image])

    self.find_or_create_by(uid: auth_hash.uid) do |user|
      user.uid = auth_hash[:uid]
      user.name = auth_hash[:info][:name]
      user.role = :twitter
      user.avatar.attach(
        io: parse_url.open,
        filename: "#{parse_url}",
        content_type: 'image/png'
      )
    end
  end
end
