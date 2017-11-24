#= require video

class @Presentation
  constructor: (args) ->
    @video_A   = new Video(args.$video_A)
    @video_B   = new Video(args.$video_B)
    @$play_btn = args.$play_btn

    @video_B.$el.get(0).mute = true
    @video_B.$el.get(0).loop = true
    @video_B.register_callback 'afterLoad', => @video_B.play()

    for video in [@video_A, @video_B]
      video.register_callback 'afterLoad', => @attempt_make_playable()
      video.preload()

  attempt_make_playable: ->
    for video in [@video_A, @video_B]
      if @video_A.loaded and @video_B.loaded
        @make_playable()

  make_playable: ->
    @$play_btn.removeClass('disabled').text('Watch my Introduction')
    @$play_btn.on 'click', => @play()

  play: ->
    for video in [@video_A, @video_B]
      video.rewind().play()