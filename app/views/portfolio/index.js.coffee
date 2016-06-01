$("main").html('<%= render "jobs" %>')

if $("[data-partial=\"nav_jobs\"]").size() > 0
    do app.assign_elements_to_filter

else
    $('<%= render "portfolio/nav_jobs" %>').prependTo(".content")
    do app.init_filter
    do app.fixed_nav