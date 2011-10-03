$(document).ready(function(){
	
	$('#slider').nivoSlider();
	
	$("nav > div.mainnav").hover(function(){
			$(this).addClass("buttonHover");
		},
		function(){
			$(this).removeClass("buttonHover");
		});

$("nav.nav2 > div.mainnav_sm").hover(function(){
			$(this).addClass("buttonHover");
		},
		function(){
			$(this).removeClass("buttonHover");
		});
});
