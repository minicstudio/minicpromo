{include file="{$minic.admin_tpl_path}javascript.tpl"}
<div id="minic">
	<div class="header">
		<div id="menu-top">
			<a href="https://github.com/minicstudio" class="social" title="Minic studio Github page" target="_blank"><i class="icon-github"></i></a>
			<a href="https://twitter.com/minicstudio" class="social" title="Minic studio Twitter page" target="_blank"><i class="icon-twitter"></i></a>
			<a href="https://www.facebook.com/minicmodule" class="social" title="Minic studio Facebook page" target="_blank"><i class="icon-facebook"></i></a>
			<a href="#newsletter" class="open-popup" data-popup="#newsletter">{l s='Newsletter'}</a>
            <a href="#bug" class="minic-open">{l s='Bug Report'}</a>
            <a href="#feedback" class="minic-open">{l s='Feedback'}</a>
		</div>
		<div id="banner"></div>
		<div id="navigation">
			<a href="">{l s='Menu item' mod='minicpromo'}</a>
			<a href="">{l s='Menu item' mod='minicpromo'}</a>
			<a href="">{l s='Menu item' mod='minicpromo'}</a>
		</div>
	</div>
	<!-- feedback -->
	{include file="{$minic.admin_tpl_path}feedback.tpl"}
	<!-- bug report -->
	{include file="{$minic.admin_tpl_path}bug.tpl"}
	<!-- Settings -->
	{include file="{$minic.admin_tpl_path}settings.tpl"}
	<!-- newsletter popup -->
	{include file="{$minic.admin_tpl_path}popup.tpl" newsletter='1'}
</div>