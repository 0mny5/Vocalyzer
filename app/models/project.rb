class Project < ApplicationRecord
  belongs_to :user
  has_many :songs, inverse_of: :project, dependent: :destroy
  accepts_nested_attributes_for :songs, allow_destroy: true

  has_one_attached :og_image

  before_create -> { self.uuid = SecureRandom.uuid }

  validates :title, presence: true

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
