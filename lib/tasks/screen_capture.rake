namespace :screen_capture do
  desc 'Get screen capture'
  task :capture do
    Puppeteer.launch(headless: false) do |browser|
      page = browser.new_page
      page.goto('http://localhost:3000/')
      page.wait_for_navigation do
        page.click(".capture-test")
      end
      
      page.screenshot(path: "#{Rails.root.join('app', 'assets', 'images', 'test.png')}")
    end
  end
end
