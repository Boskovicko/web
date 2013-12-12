$(window).load(function() {
    var MIN_RELATED_ARTICLES = 1;
    var TOLERABLE_OVERHANG = 150;
    var mainColumnHeight = $('.clanek-telo').height();
    for (;;) {
        var sidebarHeight = $('.sidebar').height();
        var relatedArticleCount = $('.sidebar .clanek-nahled').length;
        if ((sidebarHeight > mainColumnHeight + TOLERABLE_OVERHANG)
            && (relatedArticleCount > MIN_RELATED_ARTICLES)) {
            $('.sidebar .clanek-nahled:last-child').remove();
        } else {
            break;
        }
    }
});
