$(function(){
	$('#nav_toggle').click(function(){
				$("header").toggleClass('open');
		$("nav").fadeToggle(500);
	});
	// modal window
	$('#openModal').click(function(){
		$('#modalArea').fadeIn();
		});
	$('#closeModal , #modalBg').click(function(){
		$('#modalArea').fadeOut();
	});
 });
