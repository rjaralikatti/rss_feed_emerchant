$(document).ready(function () {
    if ($('#list_feeds').length) {
        $.ajax('/rss_feeds/titles', {
            type: 'GET'
        });
    }

    if ($('#reader').length) {
        $.ajax('/rss_feeds/all_latest_feeds', {
            type: 'GET'
        });
    }
    
    $( ".target" ).change(function() {
      var str = "";
      $( "select option:selected" ).each(function() {
        str += $( this ).text();
      });
      
      if(str === 'Patient') {
        $('#patient').show();
        $('#practitioner').hide();
        $('#patient').css('visibility', 'visible');
        $('#practitioner').css('visibility', 'hidden');
      } else if(str === 'Practitioner'){
        $('#practitioner').show();
        $('#patient').hide();
        $('#practitioner').css('visibility', 'visible');
        $('#patient').css('visibility', 'hidden');
      }
    });
});