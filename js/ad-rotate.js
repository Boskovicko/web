$(function() {
    $.getJSON('/ads/list.js', function(adList) {
        // Sanity check
        if (!$.isArray(adList)) {
            return;
        }
        // Pick random ad
        var ad = adList[Math.floor(Math.random()*adList.length)];
        // Create the link
        var image = $('<img/>', {
            "src": ad.image,
            "alt": ad.text || '',
            "class": 'img-responsive ad-square'
        });
        var link = $('<a/>', {"href": ad.url});
        link.append(image);
        link.click(function(event) {
            event.preventDefault();
            trackLink(this, 'reklama', 'klik', ad.name)
        });
        link.appendTo("#ad-wrapper");
        // Log ad view
        try {
            ga('send', 'event', 'reklama', 'zobrazení', ad.name);
        } catch (err) {}
    });
});
