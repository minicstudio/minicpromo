{if $newsletter}
<div id="newsletter" class="popup">
	<div class="inner">
	    <div class="header">
	        <h4>{l s='Help Us!'}</h4>
	        <span class="close-popup" data-popup="#newsletter">x</span>
	    </div>
	    <div class="popup-content">
	        <div class="container">
	            <p>{l s='By clicking to the YES button you agree to share some basic information with us.'}</p>
	            <p><b>{l s='Don`t worry we`ll be discrete with this information'}:</b></p>
	            <ul>
	                <li>{l s='Domain'}: <b>{$minic.info.domain}</b></li>
	                <li>{l s='Version'}: <b>{$minic.info.version}</b></li>
	                <li>{l s='PS Version'}: <b>{$minic.info.psVersion}</b></li>
	            </ul>
	            <form>
	                <p>{l s='If you want to riecive news about our updates, new modules, give us your e-mail address.'}</p>
	                <div>
	                    <label>{l s='Email'}:</label>
	                    <input type="text" id="sendInfoEmail" name="infoEmail" />
	                </div>  
	            </form>
	            <h3>{l s='Thank you for your help!'}</h3>
	        </div>
	        <div class="buttons">
	            <a href="#" id="sendInfo" class="submit-popup button-small green" data-popup="#newsletter">{l s='Yes'}</a>
	            <a href="#" id="cancelInfo" class="close-popup button-small grey" data-popup="#newsletter">{l s='No'}</a>
	        </div>
	    </div>  
	</div>
</div>	
{/if}