$(document).ready(function(){
	
	$('#slider').nivoSlider();
	
	$("nav > div.mainnav").hover(function(){
			$(this).addClass("buttonHover");
		},
		function(){
			$(this).removeClass("buttonHover");
		});
$("a.btn_inner_common").hover(function()
		{
				$(this).addClass("btn_hover_in");
		},
		function()
		{
			$(this).removeClass("btn_hover_in");
		});
});
