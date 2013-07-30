<div id="promo-settings" class="minic-container visible" style="display: block;">
	<form id="form-feed" class="" method="post" action="{$minic.post_action}"  enctype="multipart/form-data">
        <div class="minic-top">
            <h3>{l s='Minicpromo Option' mod='minicpromo'}
                <!-- <a href="http://module.minic.ro/minic-slider-news/using-the-feedback-and-bug-report/" target="_blank" class="help">{l s='help & tips' mod='minicpromo'}</a> -->
            </h3>
        </div>
        <div class="minic-content activator-title">
            <div class="accordion" id="accordion2">
                <div class="accordion-group">
                    <div class="accordion-heading">
                      <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion2" href="#collapseOne" title="{l s='Click to modify the activator settings' mod='minicpromo'}">
                        <div class="">
                            <label>{l s='Activator Title and options' mod='minicpromo'}: {$promo.texts.flags.activator} <i class="icon-plus-sign right"></i><i class="icon-minus-sign right"></i></label>
                            {foreach from=$promo.languages item=language}
                                <div id="activator_{$language.id_lang}" style="display: {if $language.id_lang == $promo.default_lang}block{else}none{/if};">
                                    <input class="title" type="text" name="activator_{$language.id_lang}" value="{$promo.texts.{$language.id_lang}.activator}" size="50" />
                                </div>
                            {/foreach}
                        </div>
                      </a>
                    </div>
                    <div id="collapseOne" class="accordion-body collapse">
                        <div class="accordion-inner">
                            <div class="rotate">
                                <label>{l s='Title rotation' mod='minicpromo'}</label>
                                <label id="activator-rotation-label" for="activator-rotation">
                                    <input type="checkbox" id="activator-rotation" name="activator-rotation" value="1">{l s='Enable / Disable rotation' mod='minicpromo'}
                                </label>
                                <p>{l s='Old browsers doesnt support this. Use wisely!' mod='minicpromo'}</p>
                            </div>
                            <div class="width">
                                <label>{l s='Activator width' mod='minicpromo'}:</label>
                                <input class="width" type="number" name="activator-width" value="{$promo.settings.dimension_activator.width}" size="50" />
                                <select name="activator-width-unit">
                                    <option value="px">px</option>
                                    <option value="%">%</option>
                                </select>
                            </div>
                            <div class="height">
                                <label>{l s='Activator height' mod='minicpromo'}:</label>
                                <input class="height" type="number" name="activator-height" value="{$promo.settings.dimension_activator.height}" size="50" />
                                <select name="activator-height-unit">
                                    <option value="px">px</option>
                                    <option value="%">%</option>
                                </select>
                            </div>
                            <div class="upload">
                                <label for="activator-file">Activator background image:</label>
                                <input type="file" name="activator-file" id="activator-file"><br>
                                <label id="title-image-label" for="title-image">
                                    <input type="checkbox" id="title-image" value="1" name="title-image">{l s='Enable / Disable background image' mod='minicpromo'}
                                </label><br>
                            </div>
                            <div class="padding">
                                <label>{l s='Padding for activator' mod='minicpromo'}:</label>
                                <input class="padding" type="number" name="activator-padding" value="{$promo.settings.dimension_activator.padding}" size="50" />
                                <select name="activator-padding-unit">
                                    <option value="px">px</option>
                                    <option value="%">%</option>
                                </select>
                            </div>
                            <div class="color">
                                <label>{l s='Activator color' mod='minicpromo'}:</label>
                                <input class="activator-color" type="text" value="{$promo.settings.activator.title_color}" id="activator-color" name="activator-color" />
                            </div>
                            <div class="font-size">
                                <label>{l s='Activator font size' mod='minicpromo'}:</label>
                                <input class="font-size" type="number" name="activator-font-size" value="{$promo.settings.activator.title_size}" size="50" step="any" />
                                <select name="activator-size-unit">
                                    <option value="px">px</option>
                                    <option value="em">em</option>
                                </select>
                            </div>
                            <div class="background">
                                <label>{l s='Activator background color' mod='minicpromo'}:</label>
                                <input type="text" class="background-color" value="{$promo.settings.dimension_activator.background}" id="background-color" name="activator-background-color" data-color-format="rgba">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="accordion-group">
                    <div class="accordion-heading">
                      <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion2" href="#collapseTwo" title="{l s='Click to edit the promotion title options' mod='minicpromo'}">
                        <div class="title">
                            <label>{l s='Title for Promotion and options' mod='minicpromo'}: {$promo.texts.flags.title} <i class="icon-plus-sign right"></i><i class="icon-minus-sign right"></i></label>
                            
                            {foreach from=$promo.languages item=language}
                                <div id="title_{$language.id_lang}" style="display: {if $language.id_lang == $promo.default_lang}block{else}none{/if};">
                                    <input class="title" type="text" name="title_{$language.id_lang}" value="{$promo.texts.{$language.id_lang}.title}" size="50" />
                                </div>
                            {/foreach}
                        </div>
                      </a>
                    </div>
                    <div id="collapseTwo" class="accordion-body collapse">
                      <div class="accordion-inner">
                        <div class="color">
                            <label>{l s='Title color' mod='minicpromo'}:</label>
                            <input class="title-color" type="text" value="{$promo.settings.title.title_color}" id="title-color" name="title-color" />
                        </div>
                        <div class="font-size">
                            <label>{l s='Title font size' mod='minicpromo'}:</label>
                            <input class="font-size" type="number" name="title-font-size" value="{$promo.settings.title.title_size}" size="50" step="any" />
                            <select name="title-size-unit">
                                <option value="px">px</option>
                                <option value="em">em</option>
                            </select>
                        </div>
                        <div class="line-height">
                            <label>{l s='Title line height' mod='minicpromo'}:</label>
                            <input class="title-line-height" type="number" id="title-line-height" value="{$promo.settings.title.title_line_height}" name="title-line-height" step="any" />
                        </div>
                      </div>
                    </div>
                </div>
                <div class="accordion-group">
                    <div class="accordion-heading">
                        <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion2" href="#collapseSix" title="{l s='Click to change the link behavior' mod='minicpromo'}">
                            <div class="link">
                                <label>{l s='Promotion link' mod='minicpromo'}: {$promo.texts.flags.link} <i class="icon-plus-sign right"></i><i class="icon-minus-sign right"></i></label>
                                
                                {foreach from=$promo.languages item=language}
                                    <div id="link_{$language.id_lang}" style="display: {if $language.id_lang == $promo.default_lang}block{else}none{/if};">
                                        <input class="link" type="text" name="link_{$language.id_lang}" size="50" value="{$promo.texts.{$language.id_lang}.link}" />
                                    </div>
                                {/foreach}
                            </div>
                        </a>
                    </div>
                    <div id="collapseSix" class="accordion-body collapse">
                        <div class="accordion-inner">
                            <label>{l s='Link target attribute' mod='minicpromo'}:</label>
                            <select name="open-link" id="">
                                <option value="_blank">blank</option>
                                <option value="_self">default</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="accordion-group">
                    <div class="accordion-heading">
                        <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion2" href="#collapseThree" title="{l s='Click to edit the promotion description' mod='minicpromo'}">
                            <div class="description">
                                <label>{l s='Promotion description and options' mod='minicpromo'}: {$promo.texts.flags.description} <i class="icon-plus-sign right"></i><i class="icon-minus-sign right"></i></label>
                                
                                {foreach from=$promo.languages item=language}
                                    <div id="description_{$language.id_lang}" style="display: {if $language.id_lang == $promo.default_lang}block{else}none{/if};">
                                        <textarea class="description" id="bootstrap-wysi-editor-{$language.id_lang}" type="text" name="description_{$language.id_lang}" rows="10" cols="63">{$promo.texts.{$language.id_lang}.description|unescape:"html"}</textarea>
                                    </div>
                                {/foreach}
                            </div>
                        </a>
                    </div>
                    <div id="collapseThree" class="accordion-body collapse">
                        <div class="accordion-inner">
                            <div class="color">
                                <label>{l s='Description color' mod='minicpromo'}:</label>
                                <input class="description-color" type="text" value="{$promo.settings.description.color}" id="description-color" name="description-color" />
                            </div>
                            <div class="font-size">
                                <label>{l s='Description font size' mod='minicpromo'}:</label>
                                <input class="font-size" type="number" name="description-font-size" value="{$promo.settings.description.size}" size="50" step="any" />
                                <select name="description-size-unit">
                                    <option value="px">px</option>
                                    <option value="em">em</option>
                                </select>
                            </div>
                            <div class="line-height">
                                <label>{l s='Description line height' mod='minicpromo'}:</label>
                                <input class="description-line-height" type="number" id="description-line-height" value="{$promo.settings.description.line_height}" name="description-line-height" step="any" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="accordion-group">
                    <div class="accordion-heading">
                        <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion2" href="#collapseFour" title="{l s='Click for the container options' mod='minicpromo'}">
                            <div class="container-option">
                                <label><i class="icon-cogs"></i>{l s='Container options' mod='minicpromo'}: <i class="icon-plus-sign right"></i><i class="icon-minus-sign right"></i></label>
                            </div>
                        </a>
                    </div>
                    <div id="collapseFour" class="accordion-body collapse">
                        <div class="accordion-inner">
                            <div class="">
                                <label>{l s='Position on the page' mod='minicpromo'}:</label>
                                <select name="position">
                                    <option value="left">left</option>
                                    <option value="right">right</option>
                                    <option value="top">top</option>
                                    <option value="bottom">bottom</option>
                                </select>
                            </div>
                            <div class="background">
                                <label>{l s='Background color' mod='minicpromo'}:</label>
                                <input type="text" class="background-color" value="{$promo.settings.background}" id="background-color" name="background-color" data-color-format="rgba">
                            </div>
                            <div class="upload">
                                <label for="file">Background image:</label>
                                <input type="file" name="file" id="file"><br>
                            </div>
                            <div class="border">
                                <label>{l s='Border (size, style, color)' mod='minicpromo'}:</label>
                                <input class="title" type="number" name="border-width" value="{$promo.settings.border.border_width}" size="50" />
                                <select name="border-style">
                                    <option value="solid">solid</option>
                                    <option value="dashed">dashed</option>
                                    <option value="dotted">dotted</option>
                                    <option value="double">double</option>
                                </select>
                                <input type="text" class="border-color" value="{$promo.settings.border.border_color}" id="border-color" name="border-color">
                                <label>{l s='Border radius' mod='minicpromo'}:</label>
                                <input class="title" type="number" name="border-radius" value="{$promo.settings.border.border_radius}" size="50" />
                                <select name="border-radius-unit">
                                    <option value="px">px</option>
                                    <option value="%">em</option>
                                </select>
                            </div>
                            <div class="width">
                                <label>{l s='Container width' mod='minicpromo'}:</label>
                                <input class="title" type="number" name="width" value="{$promo.settings.dimension.width}" size="50" />
                                <select name="width-unit">
                                    <option value="px">px</option>
                                    <option value="%">%</option>
                                </select>
                            </div>
                            <div class="height">
                                <label>{l s='Container height' mod='minicpromo'}:</label>
                                <input class="title" type="number" name="height" value="{$promo.settings.dimension.height}" size="50" />
                                <select name="height-unit">
                                    <option value="px">px</option>
                                    <option value="%">%</option>
                                </select>
                            </div>
                            <div class="padding">
                                <label>{l s='Padding' mod='minicpromo'}:</label>
                                <input class="title" type="number" name="padding" value="{$promo.settings.dimension.padding}" size="50" />
                                <select name="padding-unit">
                                    <option value="px">px</option>
                                    <option value="%">%</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="accordion-group">
                    <div class="accordion-heading">
                        <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion2" href="#collapseFive" title="{l s='Click for the animation options' mod='minicpromo'}">
                            <div class="global-option">
                                <label><i class="icon-cog"></i>{l s='Global options' mod='minicpromo'}: <i class="icon-plus-sign right"></i><i class="icon-minus-sign right"></i></label>
                            </div>
                        </a>
                    </div>
                    <div id="collapseFive" class="accordion-body collapse">
                        <div class="accordion-inner">
                            <div class="animation">
                                <label>{l s='Animation duration' mod='minicpromo'}:</label>
                                <input class="duration" type="text" name="duration" value="{$promo.settings.animation.duration}" size="50" />
                            </div>
                            <div class="cubic-bezier-link">
                                <label>{l s='Aniamtion easing' mod='minicpromo'}</label>
                                <select class="easing" type="text" name="easing" >
                                    <option value="Linear.easeNone">Linear.easeNone</option>
                                    <option value="Power0.easeIn">Power0.easeIn  (linear)</option>
                                    <option value="Power0.easeInOut">Power0.easeInOut  (linear)</option>
                                    <option value="Power0.easeOut">Power0.easeOut  (linear)</option>
                                    <option value="Power1.easeIn">Power1.easeIn</option>
                                    <option value="Power1.easeInOut">Power1.easeInOut</option>
                                    <option value="Power1.easeOut" selected="selected">Power1.easeOut</option>
                                    <option value="Power2.easeIn">Power2.easeIn</option>
                                    <option value="Power2.easeInOut">Power2.easeInOut</option>
                                    <option value="Power2.easeOut">Power2.easeOut</option>
                                    <option value="Power3.easeIn">Power3.easeIn</option>
                                    <option value="Power3.easeInOut">Power3.easeInOut</option>
                                    <option value="Power3.easeOut">Power3.easeOut</option>
                                    <option value="Power4.easeIn">Power4.easeIn</option>
                                    <option value="Power4.easeInOut">Power4.easeInOut</option>
                                    <option value="Power4.easeOut">Power4.easeOut</option>
                                    <option value="Quad.easeIn">Quad.easeIn  (same as Power1.easeIn)</option>
                                    <option value="Quad.easeInOut">Quad.easeInOut  (same as Power1.easeInOut)</option>
                                    <option value="Quad.easeOut">Quad.easeOut  (same as Power1.easeOut)</option>
                                    <option value="Cubic.easeIn">Cubic.easeIn  (same as Power2.easeIn)</option>
                                    <option value="Cubic.easeInOut">Cubic.easeInOut  (same as Power2.easeInOut)</option>
                                    <option value="Cubic.easeOut">Cubic.easeOut  (same as Power2.easeOut)</option>
                                    <option value="Quart.easeIn">Quart.easeIn  (same as Power3.easeIn)</option>
                                    <option value="Quart.easeInOut">Quart.easeInOut  (same as Power3.easeInOut)</option>
                                    <option value="Quart.easeOut">Quart.easeOut  (same as Power3.easeOut)</option>
                                    <option value="Quint.easeIn">Quint.easeIn  (same as Power4.easeIn)</option>
                                    <option value="Quint.easeInOut">Quint.easeInOut  (same as Power4.easeInOut)</option>
                                    <option value="Quint.easeOut">Quint.easeOut  (same as Power4.easeOut)</option>
                                    <option value="Strong.easeIn">Strong.easeIn  (same as Power4.easeIn)</option>
                                    <option value="Strong.easeInOut">Strong.easeInOut  (same as Power4.easeInOut)</option>
                                    <option value="Strong.easeOut">Strong.easeOut  (same as Power4.easeOut)</option>
                                    <option value="Back.easeIn">Back.easeIn</option>
                                    <option value="Back.easeInOut">Back.easeInOut</option>
                                    <option value="Back.easeOut">Back.easeOut</option>
                                    <option value="Bounce.easeIn">Bounce.easeIn</option>
                                    <option value="Bounce.easeInOut">Bounce.easeInOut</option>
                                    <option value="Bounce.easeOut">Bounce.easeOut</option>
                                    <option value="Circ.easeIn">Circ.easeIn</option>
                                    <option value="Circ.easeInOut">Circ.easeInOut</option>
                                    <option value="Circ.easeOut">Circ.easeOut</option>
                                    <option value="Elastic.easeIn">Elastic.easeIn</option>
                                    <option value="Elastic.easeInOut">Elastic.easeInOut</option>
                                    <option value="Elastic.easeOut">Elastic.easeOut</option>
                                    <option value="Expo.easeIn">Expo.easeIn</option>
                                    <option value="Expo.easeInOut">Expo.easeInOut</option>
                                    <option value="Expo.easeOut">Expo.easeOut</option>
                                    <option value="Sine.easeIn">Sine.easeIn</option>
                                    <option value="Sine.easeInOut">Sine.easeInOut</option>
                                    <option value="Sine.easeOut">Sine.easeOut</option>
                                    <option value="SlowMo.ease">SlowMo.ease</option>
                                </select>
                                <p><a href="http://www.greensock.com/get-started-js/#easing" target="_blank">{l s='Click here to go to the animation playground on Greensock`s website' mod='minicpromo'}</a></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- END of accordions -->
            <div class="text-construct inner">
                <!-- Response -->
                {* include file="{$minic.admin_tpl_path}messages.tpl" id='feedback' *}
            </div>
        </div>
        <div class="minic-content position">
            <div class="module-dimension inner">
            </div>
            <div class="module-animation inner">
            </div>
        </div>
        <div class="minic-bottom">
            <input type="submit" name="submitSettings" class="button-large green" value="{l s='Save' mod='minicpromo'}" />
        </div>
	</form>
</div>