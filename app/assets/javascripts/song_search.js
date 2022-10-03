$('#js-song-search').on('click', function() {
        $('#js-search-result').clear();
					$('#js-search-result').append(
						$('<li></li>').append(
            $('<a></a>')
								href: (data.url, this).text()
							})
							.text(data.title, this)
						));
				});
      // 中身が空の場合は、エラーメッセージを反映
      } else {
        $('#js-search-result-1').val('楽曲が見つかりません');
      }
  });
});

