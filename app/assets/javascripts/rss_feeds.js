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
});