$(function() {
	// limits the number of categories

	$('#songs').on('cocoon:after-insert', function() {
		check_to_hide_or_show_add_link();
	});


	$('#songs').on('cocoon:after-remove', function() {
		check_to_hide_or_show_add_link();
	});

	check_to_hide_or_show_add_link();

	function check_to_hide_or_show_add_link() {
		if ($('#songs .nested-fields:visible').length >= 10) {
			$('#add-song').hide();
		} else {
			$('#add-song').show();
		}
	}

	function check_to_hide_or_show_remove_link() {
		if ($('#songs .nested-fields:visible').length <= 10) {
			$('#remove-song').hide();
		} else {
			$('#remove-song').show();
		}
	}
})
