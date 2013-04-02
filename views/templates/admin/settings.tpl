<div id="promo-settings" class="minic-container visible" style="display: block;">{debug}
	<form id="form-feed" class="" method="post" action="{$minic.post_action}"  enctype="multipart/form-data">
        <div class="minic-top">
            <h3>{l s='Minicpromo Option' mod='minicpromo'}
                <a href="http://module.minic.ro/minic-slider-news/using-the-feedback-and-bug-report/" target="_blank" class="help">{l s='help & tips' mod='minicpromo'}</a>
            </h3>
        </div>
        <div class="minic-content activator-title">
            <div class="text-construct inner">
                <!-- Response -->
                {* include file="{$minic.admin_tpl_path}messages.tpl" id='feedback' *}
                <div class="input-holder">
                    <label>{l s='Activator Title' mod='minicpromo'}:</label>
                    <input class="title" type="text" name="activator_title" value="{$promo.settings.activator_title}" size="50" />
                </div>
        		<div class="input-holder title">
        			<label>{l s='Title for Promotion' mod='minicpromo'}:</label>
        			<input class="title" type="text" name="title" value="{$promo.settings.title.promo_title}" size="50" />
        		</div>
                <div class="input-holder description">
                    <label>{l s='Promotion text' mod='minicpromo'}:</label>
                    <textarea class="text" name="description" rows="10" value="{$promo.settings.description}" cols="49"></textarea>
                </div>
            </div>
            <div class="text-style inner">
                <div class="input-holder link">
                    <label>{l s='Link for Promotion' mod='minicpromo'}:</label>
                    <input class="link" type="text" name="link" value="{$promo.settings.title.link}" size="50" />
                </div>
                <div class="input-holder color">
                    <label>{l s='Title color' mod='minicpromo'}:</label>
                    <input class="title-color" type="text" value="{$promo.settings.title.title_color}" id="title-color" name="title-color" />
                </div>
                <div class="input-holder font-size">
                    <label>{l s='Size of title' mod='minicpromo'}:</label>
                    <input class="font-size" type="number" name="title-font-size" value="{$promo.settings.title.title_size}" size="50" step="any" />
                    <select name="title-size-unit">
                        <option value="px">px</option>
                        <option value="em">em</option>
                    </select>
                </div>
                <div class="input-holder line-height">
                    <label>{l s='Title line height' mod='minicpromo'}:</label>
                    <input class="title-line-height" type="number" id="title-line-height" value="{$promo.settings.title.title_line_height}" name="title-line-height" step="any" />
                </div>
                <div class="input-holder upload">
                    <label for="file">Filename:</label>
                    <input type="file" name="file" id="file"><br>
                </div>
            </div>
        </div>
        <div class="minic-content position">
            <div class="module-dimension inner">
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
                    <input type="text" class="background-color" value="{$promo.settings.background}" id="background-color" name="background-color">
                </div>
                <div class="input-holder border">
                    <label>{l s='Border' mod='minicpromo'}:</label>
                    <input class="title" type="number" name="border-width" value="{$promo.settings.border.border_width}" size="50" />
                    <select name="border-style">
                        <option value="solid">solid</option>
                        <option value="dashed">dashed</option>
                        <option value="dotted">dotted</option>
                        <option value="double">double</option>
                    </select>
                    <label>{l s='Border color' mod='minicpromo'}:</label>
                    <input type="text" class="border-color" value="{$promo.settings.border.border_color}" id="border-color" name="border-color">
                    <label>{l s='Border radius' mod='minicpromo'}:</label>
                    <input class="title" type="number" name="border-radius" value="{$promo.settings.border.border_radius}" size="50" />
                    <select name="border-radius-unit">
                        <option value="px">px</option>
                        <option value="%">em</option>
                    </select>
                </div>
                <div class="input-holder width">
                    <label>{l s='Minic Promotion modul width' mod='minicpromo'}:</label>
                    <input class="title" type="number" name="width" value="{$promo.settings.dimension.width}" size="50" />
                    <select name="width-unit">
                        <option value="px">px</option>
                        <option value="%">%</option>
                    </select>
                </div>
                <div class="input-holder height">
                    <label>{l s='Minic Promotion modul height' mod='minicpromo'}:</label>
                    <input class="title" type="number" name="height" value="{$promo.settings.dimension.height}" size="50" />
                    <select name="height-unit">
                        <option value="px">px</option>
                        <option value="%">%</option>
                    </select>
                </div>
                <div class="input-holder padding">
                    <label>{l s='Padding' mod='minicpromo'}:</label>
                    <input class="title" type="number" name="padding" value="{$promo.settings.dimension.padding}" size="50" />
                    <select name="padding-unit">
                        <option value="px">px</option>
                        <option value="%">%</option>
                    </select>
                </div>
            </div>
            <div class="module-animation inner">
                <div class="input-holder duration">
                    <label>{l s='Animation duration' mod='minicpromo'}:</label>
                    <input class="duration" type="text" name="duration" value="{$promo.settings.animation.duration}" size="50" />
                </div>
                <div class="input-holder duration">
                    <label>{l s='Animation easing' mod='minicpromo'}:</label>
                    <input class="easing" type="text" name="easing" value="{$promo.settings.animation.easing}" size="50" />
                </div>
                <div class="input-holder cubic-bezier-link">
                    <label>Bouncing transitions with cubic-bezier: <a href="http://cubic-bezier.com" target="_blank" title="Cubic-Bezier">cubic-bezier.com</a></label>
                    
                    
                </div>
            </div>
        </div>
        <div class="minic-bottom">
            <input type="submit" name="submitSettings" class="button-large green" value="{l s='Save' mod='minicpromo'}" />
        </div>
	</form>
</div>