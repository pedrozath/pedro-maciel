#= require processing

class Logo
	constructor: (options) ->
		new Processing options.element[0], (p) ->
			p[k] = v for k,v of options
			p.setup = ->
				p.colorMode p.HSB,360,100,100,100
				p.size p.element.width(), p.element.height()
				p.strokeCap p.ROUND
				p.noLoop()
				p.background 0,0,0,0
				p.create_tree()

			p.draw = -> 

			p.create_tree = ->
				p.background 0,0,0,0
				new Tree
					p: p
					x: Math.random()*p.width
					y: p.height

class Tree
	constructor: (options) ->
		@[k] = v for k,v of options
		@trunk_height = 5
		@m = @p.module_size
		@branches = []
		@grow_trunk @trunk_height

	grow_trunk: (i) ->
		th = @y-(@trunk_height-i)*@m
		@p.pushMatrix()
		@p.strokeWeight 1
		@p.stroke 0,0,0,30
		@p.popMatrix()
		@p.line @x, @y, @x, th
		setTimeout =>
			if i>0
				@grow_trunk i-1 
			else new Branch
				p: @p 			# processing context
				s: new @p.PVector(@x, th) # starting point
				i: @p.iterations 			# iterations
				d: -90 			# initial direction angle
				parent: this
				tree: this
		, 50

	callback_end: -> @p.create_tree()

class Branch
	constructor: (options) -> 
		@[k] = v for k,v of options
		@tree.branches.push this
		seed = Math.random()
		a = Math.round(seed*4)*45-90+@d 
		m = @tree.m
		r = if a % 90 is 0 then m else Math.sqrt m*m*2
		rads = @p.radians a
		end = new @p.PVector Math.cos(rads)*r, Math.sin(rads)*r
		
		@p.pushMatrix()
		@p.strokeWeight 1
		@p.stroke 0,0,0,30
		@p.popMatrix()
		
		end.add @s
		@p.line @s.x, @s.y, end.x, end.y
		chances = 1/@p.branching_rate
		branch = 0
		inside_the_drawing =
			end.x > 0 and end.x < @p.width and
			end.y > 0 and end.y < @p.height

		if @i > 0 # and inside_the_drawing
			while Math.random() < chances
				branch++
				chances /= @p.branching_rate
				setTimeout => 
					new Branch
						p: @p
						s: end
						i: @i-1
						d: if branch is 0 then -90 else a
						parent: this
						tree: @tree				
				, 100

			setTimeout => 
				new Branch
					p: @p
					s: end
					i: @i-1
					d: a
					parent: this
					tree: @tree

		else
			@p.pushMatrix()
			@p.fill 62, 93, 100
			@p.noStroke()
			@p.popMatrix()

			@p.ellipse end.x, end.y, @tree.m/2, @tree.m/2
			clearTimeout @tree.end_timer
			@tree.end_timer = setTimeout =>
				@tree.callback_end.call(@tree)
			, 4000
@Logo = Logo