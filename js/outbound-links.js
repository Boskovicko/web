// https://support.google.com/analytics/answer/1136920
// https://developers.google.com/analytics/devguides/collection/gajs/eventTrackerGuide
function trackLink(link, category, action, label)
{
    try {
        _gaq.push(['_trackEvent', category, action, label]);
    } catch (err) {}
    setTimeout(function() {
        document.location.href = link.href;
    }, 100);
    return false;
}
