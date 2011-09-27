$(document).ready(function(){
	
	$('#slider').nivoSlider();
	
	$("nav > div.mainnav").hover(function(){
			$(this).addClass("buttonHover");
		},
		function(){
			$(this).removeClass("buttonHover");
		});
});
