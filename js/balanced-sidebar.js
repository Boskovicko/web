$(document).ready(function() {
    var mainColumnHeight = $('.clanek-telo').height();
    for (;;) {
        var MIN_RELATED_ARTICLES = 1;
        var sidebarHeight = $('.sidebar').height();
        var relatedArticleCount = $('.sidebar .clanek-nahled').length;
        if (sidebarHeight > mainColumnHeight && relatedArticleCount > MIN_RELATED_ARTICLES) {
            $('.sidebar .clanek-nahled:last-child').remove();
        } else {
            break;
        }
    }
});
