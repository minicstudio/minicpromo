<div id="bug" class="minic-container">
    <form id="form-bug" class="" method="post">
        <div class="minic-top">
            <h3>{l s='Bug report' mod='minicpromo'}
                <a href="http://module.minic.ro/minic-slider-news/using-the-feedback-and-bug-report/" target="_blank" class="help">{l s='help & tips' mod='minicpromo'}</a>
            </h3>
            <a href="#bug" class="minic-close">x</a>
        </div>
        <div class="minic-content">
            <!-- Response -->
            {include file="{$minic.admin_tpl_path}messages.tpl" id='bug'}
            <div class="input-holder">
                <label>{l s='Your name' mod='minicpromo'}:</label>
                <input id="bug-name" class="name" type="text" name="name" value="{$minic.info.name}" size="50" />
            </div>
            <div class="input-holder">
                <label>{l s='Your email' mod='minicpromo'}:</label>
                <input id="bug-email" class="" type="text" name="email" size="50" value="{$minic.info.email}" />
            </div>
            <div class="input-holder">
                <label>{l s='Site address' mod='minicpromo'}:</label>
                <input id="bug-domain" class="" type="text" name="domain" size="50" value="{$minic.info.domain}" />
            </div>
            <div class="input-holder">
                <label>{l s='Message' mod='minicpromo'}:</label>
                <textarea id="bug-message" class="" name="message" rows="10" cols="49"></textarea>
            </div>
            <div class="minic-comments"> 
                <h3>{l s='Notes' mod='minicpromo'}</h3>
                <p>{l s='Please describe the bug with as much detail as it`s possible, so we can understand the problem easier.' mod='minicpromo'}</p>
                <h3>{l s='Important!' mod='minicpromo'}</h3>
                <p>{l s='By clicking to the "Send" button you agree that we will get some basic information. If you do not wish to send your e-mail address uncheck the checkbox.' mod='minicpromo'}</p>
                <ul>
                    <li>{l s='Your shop`s name' mod='minicpromo'}: <span id="info-name">{$minic.info.name}</span></li>
                    <li>{l s='By default this is the shop email address, feel free to modify.' mod='minicpromo'}: <span id="info-email">{$minic.info.email}</span></li>
                    <li>{l s='Your shops domain' mod='minicpromo'}: <span id="info-domain">{$minic.info.domain}</span></li>
                    <li>{l s='Prestashop version' mod='minicpromo'}: <span id="info-psversion">{$minic.info.psVersion}</span></li>
                    <li>{l s='Module version' mod='minicpromo'}: <span id="info-version">{$minic.info.version}</span></li>
                    <li>{l s='Server version' mod='minicpromo'}: <span id="info-server">{$minic.info.server}</span></li>
                    <li>{l s='Php version' mod='minicpromo'}: <span id="info-php">{$minic.info.php}</span></li>
                    <li>{l s='Mysql version' mod='minicpromo'}: <span id="info-mysql">{$minic.info.mysql}</span></li>
                    <li>{l s='Theme name' mod='minicpromo'}: <span id="info-theme">{$minic.info.theme}</span></li>
                    <li>{l s='Browser version' mod='minicpromo'}: <span id="info-browser">{$minic.info.userInfo}</span></li>
                </ul>
            </div>
        </div>
        <div class="minic-bottom">
            <a href="#bug" id="send-bug" class="button-large green">{l s='Send' mod='minicpromo'}</a>
            <a href="#bug" class="minic-close button-large lgrey">{l s='Close' mod='minicpromo'}</a>
            <input id="info-module" type="hidden" name="module" value="{$minic.info.module}" />
            <input id="info-context" type="hidden" value="{$minic.info.context}" name="context" />
        </div>
    </form>
</div>