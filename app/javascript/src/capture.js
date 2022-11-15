// const puppeteer = require('puppeteer');

$("#js-capture").on('click',function(event){
	event.preventDefault();
	var linkUrl = $(this).attr('href');

	// ここにリンク先への遷移直前に実行する内容を記述

	(async function() {
		const browser = await puppeteer.launch({headless: true});
		const page = await browser.newPage();

		// 描画領域を取得
		const rect = await page.evaluate( () => {
			const rect = document.querySelector(".api-container").getBoundingClientRect();
			return {
				x: rect.left,
				y: rect.top,
				width: rect.width,
				height: rect.height
			};
		} );

		await page.screenshot( {
			path: "/User/Desktop/test.png",
			clip: rect
		} );

		function action() {
			location.href = linkUrl;

			// ここにリンク先への移動直後に実行する内容を記述
			// （ページ内アンカーリンクなど画面が遷移しない場合に）
		}
		setTimeout(action,5000);
	});
});
