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
    if ($('.accordion-toggle').hasClass('collapsed')) {
    	// $('i.right').removeClass('icon-plus-sign').addClass('icon-minus-sign');
    	$(this).hide();
    }; 
});