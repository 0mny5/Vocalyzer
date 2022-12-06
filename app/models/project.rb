class Project < ApplicationRecord
  belongs_to :user
  has_many :songs, inverse_of: :project, dependent: :destroy
  accepts_nested_attributes_for :songs, allow_destroy: true

  has_one_attached :og_image

  before_create -> { self.uuid = SecureRandom.uuid }

  validates :title, presence: true
  validate :analyze_cannot_be_less_than_one, on: :create

  private

  def analyze_cannot_be_less_than_one
    unless (2..10).cover?(songs.size)
      errors.add(:url, '楽曲は２〜１０曲の範囲で登録が可能です。')
    end
  end

  def capture
    Puppeteer.launch(headless: false) do |browser|
      page = browser.new_page
      page.goto(page.url(users_project_path(@project.uuid)))
      page.wait_for_navigation do
        page.click("#js-capture")
      end
      
      page.screenshot(path: "/assets/images/capture_screen.png")
    end
  end
end
