<script type="text/javascript">
jQuery(window).load(function(){
    {if $minic.first_start}
    // First start
    $('#newsletter').fadeIn();
    {/if}
});
jQuery(document).ready(function($) {
    // News Feed
    $.getJSON('http://module.minic.ro/slider/process.php?domain={$minic.info.domain}&psversion={$minic.info.psVersion}&version={$minic.info.version}&action=feed&callback=?',function(feed){
        var version = {$minic.info.version};
        if(feed.update.version != version){
          $('#banner').empty().html(feed.update.content);
        }else if(feed.news.news == 'true'){
          $('#banner').empty().html(feed.news.content);
        }else{
          return false;
        }
    });
});
</script>