#= require video

class @Presentation
  constructor: (args) ->
    @video_A   = new Video(args.$video_A)
    @video_B   = new Video(args.$video_B)
    @$play_btn = args.$play_btn

    for video in [@video_A, @video_B]
      video.register_callback 'afterLoad', => @attempt_make_playable()
      video.preload()

  attempt_make_playable: ->
    for video in [@video_A, @video_B]
      if @video_A.loaded and @video_B.loaded
        @make_playable()

  make_playable: ->
    @$play_btn.removeClass('disabled').addClass('live').text('Watch my Introduction')
    @$play_btn.on 'click.presentation', => @play()

  play: ->
    video.rewind().play() for video in [@video_A, @video_B]

  stop: ->
    video.stop() for video in [@video_A, @video_B]

  destroy: ->
    @stop()
    @tear_down()

  tear_down: ->
    @$play_btn.off '.presentation'