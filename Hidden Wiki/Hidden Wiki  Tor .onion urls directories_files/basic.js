jQuery(document).ready(function(){
	jQuery(":text,textarea").focus(function(){
		jQuery(this).parent().addClass("currentFocus");
		jQuery(".currentFocus .desc").css({"color" : "#ff5a00"});
		jQuery(".currentFocus .message_input, .currentFocus #author, .currentFocus #email, .currentFocus #url").css({"border-color" : "#ff5a00", "color" : "#000"});
	});

	jQuery(":text,textarea").blur(function(){
		jQuery(this).parent().removeClass("currentFocus");
		jQuery(".message_input, .desc, #author, #email, #url").removeAttr("style");
	});
	
	/*jQuery("#sidebar ul li ul li").hover(function(){
		jQuery("#sidebar ul li ul li").css({"cursor" : "pointer"});
	});*/
	
	/*jQuery("#sidebar ul li ul li").click(function(){
		window.location=jQuery(this).find("a").attr("href");
		return false;
	});*/
	
	/*dropdown menu 20090805*/
	jQuery("div#main_navi ul.left li").hover(
		function(){jQuery("ul", this).css("display", "block");},
		function(){jQuery("ul", this).css("display", "none");}
	);
	
});