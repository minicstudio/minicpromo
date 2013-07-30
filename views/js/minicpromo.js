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
		$('.accordion-toggle.expanded').removeClass('expanded');
		$(this).find('.accordion-toggle').addClass('expanded');
	});
});