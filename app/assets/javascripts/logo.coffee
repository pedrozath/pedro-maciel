#= require processing

class Logo
	constructor: (canvas_element) ->
		new Processing canvas_element[0], (p) ->
			p.setup = ->
				p.colorMode p.HSB,360,100,100,100
				p.size canvas_element.width(), canvas_element.height()
				p.background 0,0,0,0
				p.noLoop()
				new Branch
					p: p
					x: p.width/2
					y: p.height/2

			p.draw = ->
				p.stroke 255

class Branch
	constructor: (options) -> 
		@[k] = v for k,v of options
		r = 20
		angle = @p.random(1)
		end = new @p.PVector Math.cos(angle)*r, Math.sin(angle)*r
		@p.line @x, @y, end.x, end.y


@Logo = Logo