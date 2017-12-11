
class window.Delay
  constructor: ->
    @delay         = 0
    @last_duration = 0
    @last_stagger  = 0

  add_duration: (d) ->
    @last_duration = d
    @delay        += d

  @subtract: (d) ->
    @instance.delay -= d
    this

  @delay: ->
    output = @instance.delay - @instance.last_duration
    @instance.last_duration = 0
    output

  @add_stagger_duration: (length, d, overlap) ->
    stagger = d * overlap
    @add_duration(stagger * length)
    @instance.last_stagger = stagger
    d

  @last_stagger: ->
    @instance.last_stagger

  @add_duration: (d) ->
    @instance.add_duration(d)
    d

  @reset: ->
    @instance = new Delay
    this

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

  $tech_section = $('.job-content section').last()

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
        paddingTop: "#{(1/(16/9))*100}%"
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
        fill: yellow
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

      TweenMax.fromTo $('body > footer'), Delay.reset().add_duration(0.6),
        opacity: 1
      ,
        opacity: 0
        ease: Cubic.easeInOut
        delay: Delay.delay()

      TweenMax.fromTo $('.job-content footer a'), Delay.add_duration(0.6),
        opacity: 1
        x: '0%'
      ,
        opacity: 0
        x: '-100%'
        ease: Cubic.easeInOut
        delay: Delay.subtract(0.4).delay()

      TweenMax.staggerFromTo $('.job-content footer tr > *').get().reverse(), Delay.add_stagger_duration(4, 0.6, 0.5),
        opacity: 1
      ,
        opacity: 0
        ease: Cubic.easeInOut
        delay: Delay.subtract(0.4).delay()
        , Delay.last_stagger()

      TweenMax.fromTo $('.job-content footer > h2'), Delay.add_duration(0.6),
        opacity: 1
        y: '0%'
      ,
        opacity: 0
        y: '-100%'
        ease: Cubic.easeInOut
        delay: Delay.subtract(0.4).delay()

      for t,index in $('.job-content .technologies li')
        {x, y} = circular_random(100)

        TweenMax.fromTo t, Delay.add_duration(0.7),
          y: 0
          x: 0
        ,
          y: x
          x: y
          ease: Cubic.easeInOut
          delay: (if index == 0 then Delay.delay() else Delay.subtract(0.7).delay())

      TweenMax.fromTo $('.job-content .technologies li'), Delay.add_duration(0.4),
        opacity: 1
      ,
        opacity: 0
        ease: Cubic.easeInOut
        delay: Delay.subtract(0.2).delay()

      TweenMax.fromTo $('.job-content section > .h2'), Delay.add_duration(0.3),
        opacity: 1
        y: '0%'
      ,
        opacity: 0
        y: '-100%'
        ease: Cubic.easeInOut
        delay: Delay.subtract(0.2).delay()

      for section, index in $('.job-content section').not($tech_section).get().reverse()
        tweens = []
        if $(section).find('.caption').length > 0
          tweens.push TweenMax.fromTo $(section).find('table tr:odd > *'), Delay.add_duration(0.6),
            x: '0%'
            opacity: 1
          ,
            x: '-100%'
            opacity: 0
            ease: Cubic.easeInOut
            delay: Delay.delay()

          tweens.push TweenMax.fromTo $(section).find('table tr:even > *'), Delay.add_duration(0.6),
            x: '0%'
            opacity: 1
          ,
            x: '100%'
            opacity: 0
            ease: Cubic.easeInOut
            delay: Delay.subtract(1).delay()

          tweens.push TweenMax.fromTo $(section).find('table'), Delay.add_duration(0.6),
            transformOrigin: 'top left'
            scaleX: 1
          ,
            ease: Cubic.easeInOut
            scaleX: 0
            delay: Delay.delay()

          tweens.push TweenMax.fromTo $(section).find('.header-sandwich .bar .h2'), Delay.add_duration(0.6),
            x: '0%'
          ,
            x: '-100%'
            ease: Cubic.easeInOut
            delay: Delay.delay()

          tweens.push TweenMax.staggerFromTo $(section).find('.header-sandwich, .header-sandwich .bar'), Delay.add_stagger_duration(2, 0.4, 0.5),
            scaleX: 1
          ,
            scaleX: 0
            transformOrigin: 'top left'
            ease: Cubic.easeInOut
            delay: Delay.delay()
          , Delay.last_stagger()

        tweens.push TweenMax.fromTo $(section).find('> *:first'), Delay.add_duration(0.6),
          transformOrigin: 'top left'
          opacity: 1
          scale: 1
        ,
          opacity: 0
          ease: Cubic.easeInOut
          scale: 0
          delay: Delay.delay()

        tweens

      TweenMax.fromTo $('.job-content > header .bar > *'), Delay.add_duration(0.6),
        x: '0%'
      ,
        x: '-100%'
        ease: Cubic.easeInOut
        delay: Delay.subtract(0.2).delay()

      TweenMax.fromTo $('.job-content > header'), Delay.add_duration(0.6),
        transformOrigin: 'top left'
        scaleX: 1
      ,
        ease: Cubic.easeInOut
        scaleX: 0
        delay: Delay.subtract(0.2).delay()

      TweenMax.fromTo $('.spacer.right-column'), Delay.add_duration(0.6),
        transformOrigin: 'top left'
        scaleX: 1
      ,
        ease: Cubic.easeInOut
        scaleX: 0
        delay: Delay.subtract(0.2).delay()

      TweenMax.staggerFromTo $('nav.main a').get().reverse(), Delay.add_stagger_duration(2, 0.3, 0.5),
        top: 0
        opacity: 1
      ,
        top: -24
        opacity: 0
        ease: Cubic.easeInOut
        delay: Delay.subtract(0.2).delay()
      , Delay.last_stagger()

      TweenMax.fromTo $('nav.main'), Delay.add_duration(0.4),
        width: '100%'
      ,
        width: '0%'
        ease: Cubic.easeInOut
        delay: Delay.subtract(0.2).delay()

      TweenMax.fromTo $('.logo'), Delay.add_duration(0.6),
        x: 0
        y: 0
      ,
        x: logo_center.x
        y: logo_center.y
        ease: Cubic.easeInOut
        delay: Delay.subtract(0.2).delay()

      TweenMax.fromTo $('body'), Delay.add_duration(0.6),
        paddingLeft: '10%'
      ,
        paddingLeft: '0%'
        ease: Cubic.easeInOut
        delay: Delay.subtract(0.6).delay()
    )

@animations = animations