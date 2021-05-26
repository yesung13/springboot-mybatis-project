var csrfToken = $("meta[name='_csrf']").attr("content");
$.ajaxPrefilter(function(options, originalOptions, jqXHR){
    if (options['type'].toLowerCase() === "post") {
        jqXHR.setRequestHeader('X-CSRF-TOKEN', csrfToken);
    }
});