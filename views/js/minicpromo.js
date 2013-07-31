jQuery(document).ready(function($) {
	// Colorpicker
	$('.border-color').colorpicker();
	$('.background-color').colorpicker();
	$('.title-color').colorpicker();
	$('.activator-color').colorpicker();
	$('.description-color').colorpicker();
	$('.description').each(function() {
        $('#'+$(this).attr('id')).wysihtml5();
    });
	$('.accordion-toggle').click(function() {
		if($(this).hasClass('expanded')){
			$(this).removeClass('expanded');
		}else{
			$('.accordion-toggle.expanded').removeClass('expanded');
			$(this).addClass('expanded');	
		}
	});
});