$(window).load(function() {
    var MIN_RELATED_ARTICLES = 1;
    var TOLERABLE_OVERHANG = 150;
    var mainColumnHeight = $('.article-container').height();
    for (;;) {
        var sidebarHeight = $('.sidebar').height();
        var relatedArticleCount = $('.sidebar .article-preview').length;
        if ((sidebarHeight > mainColumnHeight + TOLERABLE_OVERHANG)
            && (relatedArticleCount > MIN_RELATED_ARTICLES)) {
            $('.sidebar .article-preview:last-child').remove();
        } else {
            break;
        }
    }
});
