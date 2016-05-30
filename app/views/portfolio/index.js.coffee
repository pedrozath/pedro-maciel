$('<%= render "portfolio/nav_jobs" %>').prependTo(".content")
$("main").html('<%= render "jobs" %>')
do app.init_filter