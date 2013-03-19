<div id="promo-settings" class="minic-container visible">
	<form id="form-feed" class="" method="post" action="{$minic.post_action}">
        <div class="minic-top">
            <h3>{l s='Minicpromo Option' mod='minicpromo'}
                <a href="http://module.minic.ro/minic-slider-news/using-the-feedback-and-bug-report/" target="_blank" class="help">{l s='help & tips' mod='minicpromo'}</a>
            </h3>
        </div>
        <div class="minic-content">
            <!-- Response -->
            {* include file="{$minic.admin_tpl_path}messages.tpl" id='feedback' *}
            <div class="input-holder">
                <label>{l s='Activator Title' mod='minicpromo'}:</label>
                <input class="title" type="text" name="activator_title" value="" size="50" />
            </div>
    		<div class="input-holder">
    			<label>{l s='Title for Promotion' mod='minicpromo'}:</label>
    			<input class="title" type="text" name="title" value="" size="50" />
    		</div>
            <div class="input-holder">
                <label>{l s='Promotion text' mod='minicpromo'}:</label>
                <textarea class="text" name="description" rows="10" cols="49"></textarea>
            </div>
        </div>
        <div class="minic-content">
            <div class="input-holder">
                <label>{l s='Position in the page' mod='minicpromo'}:</label>
                <select name="position">
                    <option value="top">top</option>
                    <option value="right">right</option>
                    <option value="bottom">bottom</option>
                    <option value="left">left</option>
                </select>
            </div>
            <div class="input-holder background">
                <label>{l s='Background color' mod='minicpromo'}:</label>
                <input type="text" class="background-color" value="#8fff00" id="background-color" name="background-color">
            </div>
            <div class="input-holder border">
                <label>{l s='Border' mod='minicpromo'}:</label>
                <input class="title" type="number" name="border-width" value="" size="50" />
                <select name="border-style">
                    <option value="solid">solid</option>
                    <option value="dashed">dashed</option>
                    <option value="dotted">dotted</option>
                    <option value="double">double</option>
                </select>
                <label>{l s='Border color' mod='minicpromo'}:</label>
                <input type="text" class="border-color" value="rgb(0,194,255,0.78)" id="border-color" data-color-format="rgba" name="border-color">
                <label>{l s='Border radius' mod='minicpromo'}:</label>
                <input class="title" type="number" name="border-radius" value="" size="50" />
                <select name="border-radius-unit">
                    <option value="px">px</option>
                    <option value="%">em</option>
                </select>
            </div>
            <div class="input-holder width">
                <label>{l s='Minic Promotion modul width' mod='minicpromo'}:</label>
                <input class="title" type="number" name="width" value="" size="50" />
                <select name="width-unit">
                    <option value="px">px</option>
                    <option value="%">%</option>
                </select>
            </div>
            <div class="input-holder height">
                <label>{l s='Minic Promotion modul height' mod='minicpromo'}:</label>
                <input class="title" type="number" name="height" value="" size="50" />
                <select name="height-unit">
                    <option value="px">px</option>
                    <option value="%">%</option>
                </select>
            </div>
            <div class="input-holder padding">
                <label>{l s='Padding' mod='minicpromo'}:</label>
                <input class="title" type="number" name="padding" value="" size="50" />
                <select name="padding-unit">
                    <option value="px">px</option>
                    <option value="%">%</option>
                </select>
            </div>
        </div>
        <div class="minic-bottom">
            <input type="submit" name="submitSettings" class="button-large green" value="{l s='Save' mod='minicpromo'}" />
        </div>
	</form>
</div>