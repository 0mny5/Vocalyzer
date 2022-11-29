$("#js-capture").on('click',function(event){
	event.preventDefault();
	var linkUrl = $(this).attr('href');

		function action() {
			location.href = linkUrl;
		}
		setTimeout(action,5000);
	});
});
