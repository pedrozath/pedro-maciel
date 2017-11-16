
duration = (time) ->
  speed = 1
  (time/1000)/speed

$visible_el = (selector) ->
  window_height = $(window).height()
  $(selector).filter -> $(this).offset().top < window_height

$invisible_el = (selector) ->
  window_height = $(window).height()
  $(selector).filter -> $(this).offset().top > window_height

# window_center = ->
#   x: $(window).width()/2
#   y: $(window).height()/2

# el_dims = ($el) ->
#   x: $el.width()
#   y: $el.height()

# el_center = ($el) ->
#   dims   = el_dims($el)
#   wc     = window_center()
#   offset = x: $el.offset().left, y: $el.offset().top
#   x: (wc.x/2) - offset.x - dims.x/2
#   y: (wc.y/2) - offset.y - dims.y/2

animations = =>
  black      = '#000000'
  white      = '#FFFFFF'
  yellow     = '#FFF030'
  space_gray = '#121212'
  light_gray = '#494949'
  purple     = '#2F0089'

  CSSPlugin.defaultTransformPerspective = 600
  'pages#index': => new TimelineMax
    stagger: duration(0)
    paused: true
    align: 'normal'
    tweens: [].concat(
      TweenMax.fromTo $('.left-photo'), duration(1200),
        opacity: 1
      ,
        opacity: 0
        ease: Cubic.easeInOut

      TweenMax.staggerFromTo $('.content nav.main > a').get().reverse(), duration(300),
        top: 0
        opacity: 1
      ,
        top: -20
        opacity: 0
        ease: Cubic.easeInOut
        delay: duration(900)
      , duration(120)

      TweenMax.staggerFromTo $('.monitor.aspect-ratio'), duration(1000),
        paddingTop: "#{(1/(1400/900))*100}%"
      ,
        paddingTop: '0%'
        ease: Cubic.easeInOut
        delay: duration(1200)

      TweenMax.staggerFromTo $('footer'), duration(600),
        marginBottom: 0
        opacity: 1
      ,
        marginBottom: -100
        opacity: 0
        delay: duration(1200)
      , 0

      TweenMax.staggerFromTo $('.tagline .h3'), duration(500),
        opacity: 1
        zIndex: 2
      ,
        opacity: 0
        zIndex: 2
        delay: duration(1500)
        ease: Cubic.easeInOut

      TweenMax.staggerFromTo _.shuffle($('.tagline .square')), duration(300),
        backgroundColor: light_gray
      ,
        backgroundColor: white
        delay: duration(1800)
      , duration(15)

      for square, index in $('.tagline .square').get().reverse()
        r = 200
        n = (Math.random() * 2 - 1) * Math.PI
        x = Math.sin(n) * r
        y = Math.cos(n) * r

        TweenMax.staggerFromTo $(square), duration(500),
          x: 0
          y: 0
        ,
          x: x
          y: y
          delay: duration(2000 + index * 20)
          # immediateRender: false
          ease: Cubic.easeInOut
        , duration(15)

      TweenMax.staggerFromTo _.shuffle($('.tagline .square')), duration(200),
        opacity: 1
      ,
        opacity: 0
        delay: duration(3500)
        ease: Cubic.easeInOut
      , duration(6)

      TweenMax.staggerFromTo $('body'), duration(1000),
        backgroundColor: black
      ,
        backgroundColor: yellow
        delay: duration(4000)
      , 0

      TweenMax.staggerFromTo $('.logo'), duration(300),
        fill: purple
      ,
        fill: black
        delay: duration(4000)
      , 0

      TweenMax.staggerFromTo $('.logo'), duration(1000),
        x: 0
      ,
        x: '60%'
        ease: Cubic.easeInOut
        delay: duration(3000)
      , 0

      TweenMax.staggerFromTo $('.logo'), duration(1000),
        right: 0
        top: 0
      ,
        top: $(window).height()/2 - 108
        right: $(window).width()/2
        delay: duration(3000)
        ease: Cubic.easeInOut
      , 0

    )

  'portfolio#index': => new TimelineMax
    paused: true
    align: 'normal'
    tweens: [].concat(
      TweenMax.staggerFromTo $visible_el('.jobs li').get().reverse(), duration(210),
        opacity: 1
        transformOrigin: '0 0'
        z: 0
      ,
        opacity: 0
        transformOrigin: '0 0'
        ease: Cubic.easeInOut
        z: 60
      , duration(100)

      TweenMax.staggerFromTo $('nav.left-column ul li').get().reverse(), duration(150),
        z: 0
        opacity: 1
      ,
        z: 100,
        opacity: 0,
        ease: Cubic.easeInOut
        delay: duration(900)
      , duration(20)

      TweenMax.staggerFromTo $('.header-sandwich .bar .h2'), duration(300),
        x: '0%'
      ,
        x: '-100%'
        delay: duration(1300)
        ease: Cubic.easeInOut
      , duration(400)

      TweenMax.staggerFromTo $('.left-column').get().reverse(), duration(400),
        width: 288
      ,
        width: 0
        ease: Cubic.easeInOut
        delay: duration(1600)
      , duration(100)

      TweenMax.staggerFromTo $('.tagline .h3'), duration(400),
        x: '0%'
      ,
        x: '-110%'
        ease: Cubic.easeInOut
        delay: duration(2000)
      , 0

      # TweenMax.staggerFromTo $('header .left-column'), duration(400),
      #   marginLeft: 24
      # ,
      #   marginLeft: 24
      #   ease: Cubic.easeInOut
      # , duration(-100)

      # logo in the center

      TweenMax.staggerFromTo $('.logo'), duration(1000),
        position: 'static'
        x: 0
      ,
        position: 'relative'
        ease: Cubic.easeInOut
        delay: duration(3000)
        x: '60%'
      , 0

      TweenMax.staggerFromTo $('.logo'), duration(1000),
        right: 0
        top: 0
      ,
        top: $(window).height()/2 - 108
        right: $(window).width()/2
        delay: duration(3000)
        ease: Cubic.easeInOut
      , 0


    )

  'portfolio#show': => new TimelineMax
    stagger: -0.3
    paused: true
    align: 'sequence'
    tweens: [
      TweenMax.staggerFromTo $('.caption.right-column'), 0.5,
        opacity: 1
      ,
        opacity: 0
        ease: Cubic.easeInOut
      , -0.2

      TweenMax.staggerFromTo $('section img'), 0.5,
        opacity: 1
      ,
        opacity: 0
        ease: Cubic.easeInOut
      , -0.2

      TweenMax.staggerFromTo $('.hat-title > * > *'), 0.3,
        opacity: 1
      ,
        opacity: 0
        ease: Cubic.easeInOut
      , -0.2

      TweenMax.staggerFromTo $('.hat-title'), 0.9,
        width: 960
      ,
        width: 0
        ease: Cubic.easeInOut
      , -0.2
      TweenMax.staggerFromTo $('.spacer.right-column'), 0.5,
        width: 288
      ,
        width: 0
        ease: Cubic.easeInOut
      , -0.5

      TweenMax.staggerFromTo $('main'), 0.3,
        marginLeft: 24
      ,
        marginLeft: 24
        ease: Cubic.easeInOut

    ]

@animations = animations