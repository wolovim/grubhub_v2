$ ->
	$('.donuts').imagesLoaded ->
		$('.donuts').masonry
			itemSelector: '.item-box'
			isFitWidth: true