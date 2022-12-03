$('#js-change-song').click(function() {
    var song_id = $('#song_id').val();
	alert('イベント発生');
	console.log(song_id);

    $.ajax({
      url: "/change_songs/update",
      type: "GET",
      data: {
        song_id: song_id
      }
    })
  })
