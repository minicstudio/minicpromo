<!-- minicpromo -->
<style type="text/css">
	.minicpromo {
		width: {$minic_promo.dimension.width}{$minic_promo.dimension.width_unit};
		height: {$minic_promo.dimension.height}{$minic_promo.dimension.height_unit};
		{if $minic_promo.border.border_width && $minic_promo.border.border_style && $minic_promo.border.border_color}
			border: {$minic_promo.border.border_width}px {$minic_promo.border.border_style} {$minic_promo.border.border_color};
		{/if}
		{if $minic_promo.border.border_radius && $minic_promo.border.border_radius_unit}
			-webkit-border-radius: {$minic_promo.border.border_radius}{$minic_promo.border.border_radius_unit};
	   		border-radius: {$minic_promo.border.border_radius}{$minic_promo.border.border_radius_unit};
	   	{/if}
	   	{if $minic_promo.dimension.padding && $minic_promo.dimension.padding_unit}	
   			padding: {$minic_promo.dimension.padding}{$minic_promo.dimension.padding_unit};
   		{/if}

   		{if $minic_promo.position == "left"}
   			left: -{$minic_promo.dimension.width + 2*($minic_promo.dimension.padding + $minic_promo.border.border_width)}px;
   			margin-top: -{$minic_promo.dimension.height/2}{$minic_promo.dimension.height_unit};
   		{/if}
   		{if $minic_promo.position == "right"}
   			right: -{$minic_promo.dimension.width + 2*($minic_promo.dimension.padding + $minic_promo.border.border_width)}px;
   			margin-top: -{$minic_promo.dimension.height/2}{$minic_promo.dimension.height_unit};
   		{/if}
   		{if $minic_promo.position == "top"}
   			top: -{$minic_promo.dimension.height + 2*($minic_promo.dimension.padding + $minic_promo.border.border_width)}px;
   			margin-left: -{($minic_promo.dimension.width + 2*($minic_promo.dimension.padding) +2*($minic_promo.border.border_width))/2}{$minic_promo.dimension.width_unit};
   		{/if}
   		{if $minic_promo.position == "bottom"}
   			bottom: -{$minic_promo.dimension.height + 2*($minic_promo.dimension.padding + $minic_promo.border.border_width)}px;
   			margin-left: -{($minic_promo.dimension.width + 2*($minic_promo.dimension.padding) +2*($minic_promo.border.border_width))/2}{$minic_promo.dimension.width_unit};
   		{/if}
   		{if $minic_promo_image}
   			background: url('{$module_dir}upload/minicpromo_background.jpg') center center no-repeat;
   		{/if}
   		{if $minic_promo.background}
			background-color: {$minic_promo.background};
		{/if}
	}
	.minicpromo .promo-title a{
		font-size: {$minic_promo.title.title_size}{$minic_promo.title.title_unit};
		line-height: {$minic_promo.title.title_line_height};
	}
	.minicpromo .activator{
		{if $minic_promo_activatorimage}
   			background: url('{$module_dir}upload/minicactivator_background.jpg') center center no-repeat;
   		{/if}
		background-color: {$minic_promo.dimension_activator.background};
		width: {$minic_promo.dimension_activator.width}{$minic_promo.dimension_activator.width_unit};
		height: {$minic_promo.dimension_activator.height}{$minic_promo.dimension_activator.height_unit};
		padding: {$minic_promo.dimension_activator.padding}{$minic_promo.dimension_activator.padding_unit};
		{$minic_promo.position}: {$minic_promo.dimension.width + 2*($minic_promo.dimension.padding) + ($minic_promo.border.border_width)}px;
		{if $minic_promo.position == "bottom"}
			bottom: {$minic_promo.dimension.height + 2*($minic_promo.dimension.padding) + ($minic_promo.border.border_width)}px;
		{/if}
		{if $minic_promo.position == "top"}
			top: {$minic_promo.dimension.height + 2*($minic_promo.dimension.padding) + ($minic_promo.border.border_width)}px;
		{/if}
		{if $minic_promo.position == "top" || $minic_promo.position == "bottom"}
			left: {(($minic_promo.dimension.width + 2*($minic_promo.dimension.padding) + 2*($minic_promo.border.border_width))-($minic_promo.dimension_activator.width +2*$minic_promo.dimension_activator.padding))/2}px;
		{/if}
		{if $minic_promo.position == "left" || $minic_promo.position == "right"}
			top: {(($minic_promo.dimension.height + 2*($minic_promo.dimension.padding) + 2*($minic_promo.border.border_width))-($minic_promo.dimension_activator.height +2*$minic_promo.dimension_activator.padding))/2}px;
		{/if}
		cursor: pointer;
	}
	.minicpromo .activator h2{
		line-height: {$minic_promo.dimension_activator.height}px;
		font-size: {$minic_promo.activator.title_size}{$minic_promo.activator.title_unit};
		color: {$minic_promo.activator.title_color}
	}
	.minicpromo .description{
		font-size: {$minic_promo.description.size}{$minic_promo.description.unit};
		line-height: {$minic_promo.description.line_height};
		color: {$minic_promo.description.color};
	}
	.minicpromo.active .activator{
		opacity: 0;
	}
</style>
<script type="text/javascript">
	//<![CDATA[

	var duration = {$minic_promo.animation.duration};
	var animEasing = '{$minic_promo.animation.easing}';
	
	

	{literal}
 	jQuery(document).ready(function($) {
		// $('.minicpromo').click(function() {
		// 	$(this).toggleClass('active');
		// 	if ($(this).hasClass('active')) {
		// 		$(this).transition({{/literal}{$minic_promo.animation.axis}: {$minic_promo.dimension.value}{literal}},duration, animEasing);
		// 	}else{
		// 		$(this).transition({{/literal}{$minic_promo.animation.axis}: 0{literal}},duration, animEasing);
		// 	};
		// });

		$('.minicpromo').click(function() {
			$(this).addClass('active').transition({{/literal}{$minic_promo.animation.axis}: {$minic_promo.dimension.value}{literal}},duration, animEasing);
		});

		$(document).mouseup(function (e){
		    var container = $(".minicpromo");
		    if (e.target.id != "minicpromo")
		    {
		        container.removeClass('active').transition({{/literal}{$minic_promo.animation.axis}: 0{literal}},duration, animEasing);
		    }
		});

			
	});
	{/literal}
	//]]>
</script>
<div class="minicpromo position-{$minic_promo.position}" id="minicpromo">
	<h2 class="promo-title"><a href="{$minic_promo.texts.link}" target="{$minic_promo.open_link}" title="{$minic_promo.texts.title}" style="color: {$minic_promo.title.title_color};">{$minic_promo.texts.title}</a></h2>
	<p class="description">{$minic_promo.texts.description|unescape:"html"}</p>
	<div class="activator">
		<h2>{$minic_promo.texts.activator}</h2>
	</div>
</div>
<!-- end minicpromo -->