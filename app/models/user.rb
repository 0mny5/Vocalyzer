class User < ApplicationRecord
  has_many :projects, dependent: :destroy
  has_many :songs, dependent: :destroy

  enum role: { guest: 0, twitter:1 }

  def self.find_or_create_from_auth_hash(auth_hash)
    find_or_create_by(uid: auth_hash.uid) do |user|
            user.uid = auth_hash[:uid]
            user.name = auth_hash[:info][:name]
            user.image = auth_hash[:info][:image]
            user.role = :twitter
    end
  end
end
