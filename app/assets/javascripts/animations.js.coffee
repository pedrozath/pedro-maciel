animations = ->
    "jobs/index": new TimelineMax
        paused: true
        stagger: 0.5
        align: "start"
        tweens:[
            TweenMax.staggerTo $(".left-column"), 0.5,
                width: 0
                marginLeft: 0
                ease: Cubic.easeInOut
            , -0.1
            TweenMax.staggerTo $(".projects li"), 0.5,
                opacity: 0
                ease: Cubic.easeInOut
            , -0.1
            , => callback.call() if callback?
        ]
    "jobs/show": new TimelineMax
        stagger: 0.5
        align: "start"
        tweens:[
            TweenMax.staggerTo $(".right-column"), 0.5,
                width: 0
                ease: Cubic.easeInOut
        ]

@animations = animations