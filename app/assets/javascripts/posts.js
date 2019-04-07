document.addEventListener('turbolinks:load', function(){
	document.querySelectorAll('.post-delete').forEach(function(a){
		a.addEventListener('ajax:success', function(){
			var content = a.parentNode;
			var item = content.parentNode;
			item.style.display = 'none';
		});
	});
});

