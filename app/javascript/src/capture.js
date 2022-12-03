import puppeteer from 'puppeteer'
const tmp = path.join(__dirname, '..', '..', 'app', 'images')

function snapShot(ss) {
  return new Promise((resolve, reject) => {
    tmp.snapShot(ss, (err, results) => {
      if (err) reject(err);
      else resolve(results);
    });
  });
}

(async () => {
  const browser = await puppeteer.launch();
  const page = await browser.newPage();
  await page.goto('http://example.com');
  await page.screenshot({path: 'example.png'});
  await browser.close();
})();
/* function { 
$("#js-capture").on('click',function(event){
	event.preventDefault();
	var linkUrl = $(this).attr('href');

		function action() {
			location.href = linkUrl;
		}
		setTimeout(action,5000);
	});
}.call(this) */
