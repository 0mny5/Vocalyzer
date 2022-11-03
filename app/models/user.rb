class User < ApplicationRecord
  before_create :default_avatar

  has_many :projects, inverse_of: :user, dependent: :destroy

  has_one_attached :avatar

  enum role: { guest: 0, twitter:1 }

  def default_avatar
    if !avatar.attached?
      avatar.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'guest_image.png')), filename: 'guest_image.png', content_type: 'image/png')
    end
  end

  def self.find_or_create_from_auth_hash(auth_hash)
    self.find_or_create_by(uid: auth_hash.uid) do |user|
      user.uid = auth_hash[:uid]
      user.name = auth_hash[:info][:name]
      user.image = auth_hash[:info][:image]
      user.role = :twitter
    end
  end

  def user_associate(controller)
    Project.transaction do
      user = current_user.projects << @project
      user.save!
    end
  end
end
