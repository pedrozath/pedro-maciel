animations = =>
    CSSPlugin.defaultTransformPerspective = 600
    "pages#index": => new TimelineMax
        stagger: -0.3
        paused: true
        align: "sequence"
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

            TweenMax.staggerFromTo $("main"), 0.3, 
                marginLeft: 24
            ,
                marginLeft: 24
                ease: Cubic.easeInOut
        ]
    "portfolio#index": => new TimelineMax
        stagger: -0.4
        paused: true
        align: "sequence"
        tweens:[
            TweenMax.staggerFromTo $("nav.left-column > * > *"), 0.15,
                z: 0
                opacity: 1
            ,
                z: 100, 
                opacity: 0,
                ease: Cubic.easeInOut
            , -0.02

            TweenMax.staggerFromTo $(".left-column, nav.left-column > * "), 0.4,
                width: 288
            ,
                width: 0
                ease: Cubic.easeInOut
            , -0.1

            TweenMax.staggerFromTo $("main"), 0.6, 
                marginLeft: 336
            ,
                marginLeft: 48
                ease: Cubic.easeInOut

            TweenMax.staggerFromTo $(".jobs li"), 0.5,
                # delay: -10
                opacity: 1
                transformOrigin: "0 0"
                rotationX: "0deg"
                z: 0
            ,
                opacity: 0
                transformOrigin: "0 0"
                rotationX: "60deg"
                ease: Cubic.easeInOut
                z: 20
            , -0.10

            TweenMax.staggerFromTo $("header .left-column"), 0.4,
                marginLeft: 24
            ,
                marginLeft: 24
                ease: Cubic.easeInOut
            , -0.1

        ]
    "portfolio#show": => new TimelineMax
        stagger: -0.3
        paused: true
        align: "sequence"
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

            TweenMax.staggerFromTo $("main"), 0.3, 
                marginLeft: 24
            ,
                marginLeft: 24
                ease: Cubic.easeInOut

        ]

@animations = animations