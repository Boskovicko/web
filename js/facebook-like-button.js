$(function() {
    // Load FB SDK
    (function(d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) return;
        js = d.createElement(s); js.id = id;
        js.src = "//connect.facebook.net/cs_CZ/all.js#xfbml=1";
        fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));
    // Insert the like box
    $('<div/>', {
        'class': "fb-like",
        'data-href': document.location.href,
        'data-layout': "button_count",
        'data-action': "recommend",
        'data-show-faces': "false",
        'data-share': "true"
    }).insertAfter('#fb-root');
});
