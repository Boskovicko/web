$(window).load(function() {
    var MIN_RELATED_ARTICLES = 1;
    var TOLERABLE_OVERHANG = 150;
    var mainColumnHeight = $('.clanek-telo').height();
    console.log('Main column height: ' + mainColumnHeight);
    for (;;) {
        var sidebarHeight = $('.sidebar').height();
        var relatedArticleCount = $('.sidebar .clanek-nahled').length;
        console.log('Sidebar: ' + sidebarHeight);
        console.log('Related articles: ' + relatedArticleCount);
        if ((sidebarHeight > mainColumnHeight + TOLERABLE_OVERHANG)
            && (relatedArticleCount > MIN_RELATED_ARTICLES)) {
            console.log('Removing.');
            $('.sidebar .clanek-nahled:last-child').remove();
        } else {
            console.log('Finished.');
            break;
        }
    }
});
