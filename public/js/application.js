$(document).ready(function(){
	$("form").on('submit', function(event) {
		event.preventDefault();
		$.ajax({
			cache: false,
			url: 'urls',
			dataType: 'JSON',
			type: 'POST',
			data: $(this).serialize(),
			success: function(data) {
				if (data.short_url == null){
					$('p#error').html(data)
				} else {
					$('th#last').append("<td>" + data.count + "</td>")
					$('th#first').append("<td><a href='"+ data.short_url + "'>" + data.short_url + "</a></td>")
				};
			}
		});
	});
	$(document).ready(function(){
		$(document).click(function(){
			$.ajax({
			cache: false,
			url: 'http://thecatapi.com/api/images/get?format=html&type=gif',
			dataType: 'html',
			type: 'GET',
			success: function(data) {
				var debger = $.parseHTML(data)[0].children[0]['src']
				
				$('body').css('background-image', '');
				$('body').css('background-image', 'url(' + debger + ')');

			}
		});
		});
	});
});