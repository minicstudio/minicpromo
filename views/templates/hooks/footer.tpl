<!-- minicpromo -->
{debug}
<style type="text/css">
	.minicpromo {
		width: {$minic_promo.elem_dimension.width}{$minic_promo.elem_dimension.width_unit};
		height: {$minic_promo.elem_dimension.height}{$minic_promo.elem_dimension.height_unit};
		background-color: {$minic_promo.background};
		border: {$minic_promo.border.border_width}px {$minic_promo.border.border_style} {$minic_promo.border.border_color};
		-webkit-border-radius: {$minic_promo.border.border_radius}px;
   		border-radius: {$minic_promo.border.border_radius}{$minic_promo.border.border_radius_unit};
   		padding: {$minic_promo.elem_dimension.padding}{$minic_promo.elem_dimension.padding_unit};
   		margin-top: -{$minic_promo.elem_dimension.height/2}{$minic_promo.elem_dimension.height_unit};
	}
</style>
<div class="minicpromo position-{$minic_promo.position}">
	<h2>{$minic_promo.title}</h2>
	<p>{$minic_promo.description}</p>
	<div class="activator">
		<h2>{$minic_promo.activator_title}</h2>
	</div>
</div>
<!-- end minicpromo -->