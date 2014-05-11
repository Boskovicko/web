$(function() {
    $.getJSON('/ads/upoutavky.js', function(adList) {
        // Sanity check
        if (!$.isArray(adList)) {
            return;
        }
        // Pick random ad
        var ad = adList[Math.floor(Math.random()*adList.length)];
        // Create the link
        var link = $('<a/>', {"href": ad.url});
        link.append(ad.text);
        link.click(function(event) {
            event.preventDefault();
            trackLink(this, 'reklama', 'klik', ad.name)
        });
        link.appendTo("#promo-wrapper");
        // Log ad view
        try {
            ga('send', 'event', 'reklama', 'zobrazení', ad.name);
        } catch (err) {}
    });
});
