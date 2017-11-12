require 'open-uri'

module Jekyll

  class SpeakerDeckTag < Liquid::Tag
    def initialize(tag_name, user_string, tokens)
      super
      @user_string = user_string.gsub(%r{\"|\'},'')
    end

    def render(context)
      path      = Liquid::Template.parse(@user_string).render(context)
      url       = "https://speakerdeck.com/#{path}"
      embed_url = "https://speakerdeck.com/oembed.json?url=#{url}"
      response = open(embed_url).read
      JSON.parse(response)["html"].delete("\n")
    end
  end
end

Liquid::Template.register_tag('speaker_deck', Jekyll::SpeakerDeckTag)