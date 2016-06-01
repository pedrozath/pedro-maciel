animations = ->
    CSSPlugin.defaultTransformPerspective = 600
    "pages#index": new TimelineMax
        paused: true
        stagger: 0.3
        align: "start"
        tweens:[
            TweenMax.staggerFromTo $(".contact-info ul li"), 0.5,
                opacity: 1
            ,
                opacity: 0
                ease: Cubic.easeInOut
            , -0.3
            TweenMax.staggerFromTo $(".contact-info h2"), 0.5,
                opacity: 1
            ,
                opacity: 0
                ease: Cubic.easeInOut
            , -0.1
            TweenMax.staggerFromTo $(".contact-info hr"), 0.5,
                width: 648
            ,
                width: 0
                ease: Cubic.easeInOut
            , -0.1
            TweenMax.staggerFromTo $(".left-photo"), 0.5,
                width: 420
            ,
                width: 0
                ease: Cubic.easeInOut
            , -0.1
            TweenMax.staggerFromTo $(".motion-reel"), 0.5,
                height: 364
            ,
                height: 0
                ease: Cubic.easeInOut
            , -0.1
            TweenMax.staggerFromTo $("header .left-column"), 0.5,
                width: 288
                marginLeft: 24
            ,
                width: 0
                marginLeft: 0
                ease: Cubic.easeInOut
            , -0.1
        ]
    "portfolio#index": new TimelineMax
        paused: true
        stagger: 0
        align: "normal"
        tweens:[
            TweenMax.staggerFromTo $("nav.left-column > * > *"), 0.4,
                perspective: 600, z: 0, opacity: 1
            ,
                z: 100, opacity: 0,
                ease: Cubic.easeIn
            , -0.05
            
            TweenMax.staggerFromTo $(".left-column"), 0.8,
                width: 288
                marginLeft: 24
            ,
                width: 0
                marginLeft: 0
                ease: Cubic.easeInOut
            , -0.1

            TweenMax.staggerFromTo $(".jobs li"), 0.5,
                opacity: 1
                transformOrigin: "0 0"
                rotationX: "0deg"
                z: 0
            ,
                opacity: 0
                transformOrigin: "0 0"
                rotationX: "30deg"
                ease: Cubic.easeIn
                z: 20
            , -0.09
            , => callback.call() if callback?
        ]
    "portfolio#show": new TimelineMax
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
            , -0.5

        ]

@animations = animations