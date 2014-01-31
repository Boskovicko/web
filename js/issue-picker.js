$(document).ready(function() {
    $('.issue-picker option').each(function() {
        var issue = $(this).attr('value');
        var url_pattern = '/temata/' + issue;
        var index = window.location.href.indexOf(url_pattern);
        if (index != -1) {
            $('.issue-picker').val(issue);
        }
    });
    $('.issue-picker').change(function() {
        var issue = $(this).val();
        if (issue) {
            window.location = '/temata/' + $(this).val() + '/';
        }
    });
});
