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
	$('.accordion-group').click(function() {
		$(this).find('.accordion-toggle').toggleClass('expanded');
	});
});