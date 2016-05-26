animations = ->
    console.log "refresh!"
    "jobs#index": new TimelineMax
        paused: true
        stagger: 0.5
        align: "start"
        tweens:[
            TweenMax.staggerFromTo $(".left-column"), 0.5,
                width: 288
                marginLeft: 24
            ,
                width: 0
                marginLeft: 0
                ease: Cubic.easeInOut
            , -0.1

            TweenMax.staggerFromTo $(".jobs li"), 0.5,
                opacity: 1
            ,
                opacity: 0
                ease: Cubic.easeInOut
            , -0.1
            , => callback.call() if callback?
        ]
    "jobs#show": new TimelineMax
        stagger: 0.5
        paused: true
        align: "start"
        tweens:[
            TweenMax.staggerFromTo $(".caption.right-column"), 0.5,
                opacity: 1
            ,
                opacity: 0
                ease: Cubic.easeInOut
            , -0.2

            TweenMax.staggerFromTo $("section img"), 0.5,
                opacity: 1
            ,
                opacity: 0
                ease: Cubic.easeInOut
            , -0.2

            TweenMax.staggerFromTo $(".hat-title > * > *"), 0.3,
                opacity: 1
            ,
                opacity: 0
                ease: Cubic.easeInOut
            , -0.2

            TweenMax.staggerFromTo $(".hat-title"), 0.9,
                width: 960
            ,
                width: 0
                ease: Cubic.easeInOut                
            , -0.2
            TweenMax.staggerFromTo $(".spacer.right-column"), 0.5,
                width: 288
            ,
                width: 0
                ease: Cubic.easeInOut
            , -0.2

        ]

@animations = animations