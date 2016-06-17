job_content = $('<%= render "job" %>')
images = job_content.find("img")
$("main").html job_content

CSSPlugin.defaultTransformPerspective = 600
images.on "load", (e) =>
    TweenMax.fromTo $(e.target), 10,
        rotateX: 90
    ,
        rotateX: 0
        easing: Cubic.easeInOut