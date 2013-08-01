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
   			background: url('{$module_dir}upload/minicpromo_background.png') center center no-repeat;
   		{/if}
   		{if $minic_promo.background}
			background-color: {$minic_promo.background};
		{/if}
	}
	.minicpromo .promo-title a{
		font-size: {$minic_promo.title.title_size}{$minic_promo.title.title_unit};
		line-height: {$minic_promo.title.title_line_height};
	}
	#activator{
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
	#activator h2{
		font-size: {$minic_promo.activator.title_size}{$minic_promo.activator.title_unit};
		color: {$minic_promo.activator.title_color};
		line-height: 1.2em;
		{if $minic_promo.title.title_rotation}
		position: absolute;
		left: {$minic_promo.dimension_activator.width}px;
		bottom: 0;
		width: {$minic_promo.dimension_activator.height}px;
		line-height: {$minic_promo.dimension_activator.width}px;
		-moz-transform: rotate(-90deg);
		-webkit-transform: rotate(-90deg);
		-o-transform: rotate(-90deg);
		-ms-transform: rotate(-90deg);
		transform: rotate(-90deg);

		-moz-transform-origin: 0 {$minic_promo.dimension_activator.width}px;
		-webkit-transform-origin: 0 {$minic_promo.dimension_activator.width}px;
		-o-transform-origin: 0 {$minic_promo.dimension_activator.width}px;
		-ms-transform-origin: 0 {$minic_promo.dimension_activator.width}px;
		transform-origin: 0 {$minic_promo.dimension_activator.width}px;
		{/if}
		padding: 0;
	}
	.minicpromo .description{
		font-size: {$minic_promo.description.size}{$minic_promo.description.unit};
		line-height: {$minic_promo.description.line_height};
		color: {$minic_promo.description.color};
	}
</style>
<script type="text/javascript">
	//<![CDATA[
	var duration = {$minic_promo.animation.duration};
	var animEasing = '{$minic_promo.animation.easing}';
	var dimension = {$minic_promo.dimension.value};

	{literal}
 	jQuery(document).ready(function($) {
		var minicPromo = $('#minicpromo');

 		var animate = new TweenLite.to("#minicpromo", duration, {{/literal}{$minic_promo.animation.axis}: {$minic_promo.dimension.value}{literal}, ease: animEasing, paused: true});

 		$('#activator').click(function() {
 			if($('#activator').hasClass('active')){
 				$('#activator').removeClass('active');
 				animate.reverse();
 			}else{
 				animate.play();
 				$('#activator').addClass('active');	
 			}
 		});
 		$(document).click(function() {
 			if($('#activator').hasClass('active')){
 				$('#activator').removeClass('active');
 				animate.reverse();	
 			}
		});

		$("#minicpromo").click(function(event) {
		    event.stopPropagation();
		});
	});
	{/literal}
	//]]>
</script>
<div class="minicpromo position-{$minic_promo.position}" id="minicpromo">
	<h2 class="promo-title"><a href="{$minic_promo.texts.link}" target="{$minic_promo.open_link}" title="{$minic_promo.texts.title}" style="color: {$minic_promo.title.title_color};">{$minic_promo.texts.title}</a></h2>
	<p class="description">{$minic_promo.texts.description|unescape:"html"}</p>
	<div id="activator" class="">
		<h2>{$minic_promo.texts.activator}</h2>
	</div>
</div>
<!-- end minicpromo -->