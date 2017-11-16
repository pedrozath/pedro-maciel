
duration = (time) ->
  speed = 1
  (time/1000)/speed

$visible_el = (selector) ->
  window_height = $(window).height()
  $(selector).filter -> $(this).offset().top < window_height

$invisible_el = (selector) ->
  window_height = $(window).height()
  $(selector).filter -> $(this).offset().top > window_height

circular_random = (r) ->
  n = (Math.random() * 2 - 1) * Math.PI
  x: Math.sin(n) * r
  y: Math.cos(n) * r

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

  logo_center =
    x: $(window).width()/2 - 648/2 - 24
    y: $(window).height()/2 - 108/2 - 48

  CSSPlugin.defaultTransformPerspective = 600
  'pages#index': => new TimelineMax
    paused: true
    align: 'normal'
    tweens: [].concat(
      TweenMax.fromTo $('footer'), duration(1000),
        x: '0%'
        opacity: 1
      ,
        x: '100%'
        opacity: 0
        ease: Cubic.easeInOut

      TweenMax.fromTo $('.left-photo'), duration(1200),
        opacity: 1
      ,
        opacity: 0
        ease: Cubic.easeInOut

      TweenMax.staggerFromTo $('.content nav.main > a').get().reverse(), duration(300),
        opacity: 1
        top: 0
      ,
        opacity: 0
        top: -20
        ease: Cubic.easeInOut
        delay: duration(300)
      , duration(120)

      TweenMax.fromTo $('main > nav.main'), duration(700),
        width: '100%'
      ,
        width: '0%'
        ease: Cubic.easeInOut
        delay: duration(600)

      TweenMax.fromTo $('.monitor.aspect-ratio'), duration(1000),
        paddingTop: "#{(1/(1400/900))*100}%"
      ,
        paddingTop: '0%'
        ease: Cubic.easeInOut
        delay: duration(1200)

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
        {x, y} = circular_random(200)

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

      TweenMax.staggerFromTo $('body > header'), duration(1500),
        width: '100%'
      ,
        width: '0%'
        delay: duration(4000)
        ease: Cubic.easeInOut
      , 0

      TweenMax.staggerFromTo $('.logo'), duration(1000),
        x: 0
        y: 0
      ,
        x: logo_center.x
        y: logo_center.y
        ease: Cubic.easeInOut
        delay: duration(4000)
      , 0

    )

  'portfolio#index': => new TimelineMax
    paused: true
    align: 'normal'
    tweens: [].concat(
      TweenMax.staggerFromTo $('nav.main a').get().reverse(), duration(300),
        top: 0
        opacity: 1
      ,
        top: -24
        opacity: 0
        ease: Cubic.easeInOut
        delay: duration(0)
      , duration(250)

      TweenMax.fromTo $('nav.main'), duration(400),
        width: '100%'
      ,
        width: '0%'
        ease: Cubic.easeInOut
        delay: duration(1000)

      TweenMax.staggerFromTo $invisible_el('.jobs li').get().reverse(), duration(100),
        opacity: 1
      ,
        opacity: 0
      , duration(0)

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
        ease: Cubic.easeInOut
        delay: duration(1300)
      , duration(400)


      TweenMax.staggerFromTo $('.left-column').get().reverse(), duration(400),
        width: 288
      ,
        width: 0
        ease: Cubic.easeInOut
        delay: duration(1600)
      , duration(100)

      # TweenMax.staggerFromTo $('header .left-column'), duration(400),
      #   marginLeft: 24
      # ,
      #   marginLeft: 24
      #   ease: Cubic.easeInOut
      # , duration(-100)

      # logo in the center

      # TweenMax.staggerFromTo $('header'), duration(300),
      #   width: '100%'
      # ,
      #   width: '0%'
      #   delay: duration(4000)
      #   ease: Cubic.easeInOut
      # , 0

      TweenMax.fromTo $('.logo'), duration(1000),
        x: 0
        y: 0
      ,
        x: logo_center.x
        y: logo_center.y
        ease: Cubic.easeInOut
        delay: duration(1700)

    )

  'portfolio#show': => new TimelineMax
    paused: true
    align: 'normal'
    tweens: [].concat(
      # TweenMax.staggerFromTo $('.caption.right-column'), duration(500),
      #   opacity: 1
      # ,
      #   opacity: 0
      #   ease: Cubic.easeInOut
      # , duration(-200)

      # TweenMax.staggerFromTo $('section img'), duration(500),
      #   opacity: 1
      # ,
      #   opacity: 0
      #   ease: Cubic.easeInOut
      # , duration(-200)

      # TweenMax.staggerFromTo $('.hat-title > * > *'), duration(300),
      #   opacity: 1
      # ,
      #   opacity: 0
      #   ease: Cubic.easeInOut
      # , duration(-200)

      # TweenMax.staggerFromTo $('.hat-title'), duration(900),
      #   width: 960
      # ,
      #   width: 0
      #   ease: Cubic.easeInOut
      # , duration(-200)

      # TweenMax.staggerFromTo $('.spacer.right-column'), duration(500),
      #   width: 288
      # ,
      #   width: 0
      #   ease: Cubic.easeInOut
      # , duration(-500)

      # TweenMax.staggerFromTo $('main'), duration(300),
      #   marginLeft: 24
      # ,
      #   marginLeft: 24
      #   ease: Cubic.easeInOut

      TweenMax.fromTo $('.logo'), duration(1000),
        x: 0
        y: 0
      ,
        x: logo_center.x
        y: logo_center.y
        ease: Cubic.easeInOut
        delay: duration(1700)
    )

@animations = animations