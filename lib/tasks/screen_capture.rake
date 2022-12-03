namespace :screen_capture do
  desc 'Get screen capture'
  task :capture do
    Puppeteer.launch(headless: false) do |browser|
      page = browser.new_page
      page.goto(page.url(location.href))

      
      page.wait_for_navigation do
        page.click("#js-capture")
      end
      
      page.screenshot(path: "#{Rails.root.join('app', 'assets', 'images', 'test.png')}")
    end
  end
end
