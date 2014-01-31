$(function() {
    $('.article-preview img').each(function(i, preview) {
        $(preview).load(function() {
            var image = $(this);
            var aspect = image.width()/image.height();
            if (aspect < 1.9) {
                $(preview).parents('.article-preview').addClass('low-aspect');
            }
        });
    });
});
