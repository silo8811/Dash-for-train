function circleSpin(sx, sy, l, r)
	screen.drawLine(sx, sy, sx+l*math.sin(r), sy+l*math.cos(r))
	screen.drawRectF((sx+l*math.sin(r)*0.8)-1.5, (sy+l*math.cos(r)*0.8)-1.5, 3, 3)
end
function circleSpinC(sx, sy, l, r, c)
	screen.drawLine(sx+c*math.sin(r), sy+c*math.cos(r), sx+l*math.sin(r), sy+l*math.cos(r))
end
function textSpin(sx, sy, l, r, text)
	screen.drawTextBox(sx+l*math.sin(r), sy+l*math.cos(r), (#tostring(text)*5), 5, text, b, 0)
end
function circle(x, y, r, segments)
	local cos, sin = math.cos, math.sin
	local step = (math.pi * 2) / segments
	for i = 0, math.pi*2, step do
		screen.drawLine(x + cos(i) * r, y + sin(i) * r, x + cos(i+step) * r, y + sin(i+step) * r)
	end
end
function circle2(x, y, r, segments, coff)
	local cos, sin = math.cos, math.sin
	local step = (math.pi * 2) / segments
	for i = coff, math.pi*2, step do
		screen.drawLine(x + cos(i) * r, y + sin(i) * r, x + cos(i+step) * r, y + sin(i+step) * r)
	end
end

function clamp(x, mi, ma)
	return math.max(math.min(x, ma), mi)
end

function onTick()
	leftPipe = (clamp(input.getNumber(1), 0, 200)/200)*(math.pi*1.12732)-.2
	leftCyl = (clamp(input.getNumber(2), 0, 200)/200)*(math.pi*1.12732)-.2
	
	rightPipe = (clamp(input.getNumber(3), 0, 200)/200)*(math.pi*1.12732)-.2
	rightCyl = (clamp(input.getNumber(4), 0, 200)/200)*(math.pi*1.12732)-.2
	color = (clamp(input.getNumber(5), 0, 100))
	light = (clamp(input.getNumber(6), 0, 10))
end

function onDraw()
	screen.setColor(color/10 + light/4 ,color/10 + light /6,color/10)
	screen.drawRectF(0,0, 100, 100)
	
	screen.setColor(color + light/2, color + light/3, color)
	circle(10, 48, 36, 25)
	circle(10, 48, 33, 25)
	circle(86, 48, 36, 25)
	circle(86, 48, 33, 25)
	
	screen.setColor(color/10 + light/4 ,color/10 + light/6,color/10)
	screen.drawRectF(0,0, 5, 100)
	screen.drawRectF(92,0, 5,100)
	screen.setColor(color + light/2, color + light/3, color)
	
	textSpin(5, 48, 23, 0, 10)
	textSpin(9, 48, 21, (math.pi/4.7), 50)
	textSpin(13, 49, 17, (math.pi/2.1), 90)
	textSpin(10, 51, 20, ((math.pi/3)+(math.pi/2)), 130)
	textSpin(8, 51, 30, (math.pi), 170)
	
	textSpin(80, 45, 25, 0, 10)
	textSpin(86, 49, 25, math.pi/-3.4, 50)
	textSpin(86, 48, 30, math.pi/-2.1, 90)
	textSpin(86, 48, 30, ((math.pi/-1.5)), 130)
	textSpin(86, 48, 30, (math.pi*-.85), 170)
	
	screen.setColor(color*1.1 + light/2 ,0, 0)
	circleSpin(10, 48, 27, leftPipe)
	circleSpin(86, 48, 27, (rightPipe*-1))
	screen.setColor(color + light/2, color + light/3, color)
	circleSpin(10, 48, 27, leftCyl)
	circleSpin(86, 48, 27, (rightCyl*-1))
	
	for i = 0, 200, 10 do
		circleSpinC(10, 48, 36, (i/180)*math.pi-0.17, 32)
		circleSpinC(86, 48, 36, (i/180)*-math.pi+0.17, 32)
	end
	for i = 10, 170, 40 do
		circleSpinC(10, 48, 38, (i/180)*math.pi-0.17, 32)
		circleSpinC(86, 48, 38, (i/180)*-math.pi+0.17, 32)
	end
	
	circleSpinC(10, 48, 38, (0/180)*math.pi-0.17, 32)
	circleSpinC(86, 48, 38, (0/180)*-math.pi+0.17, 32)
	circleSpinC(10, 48, 38, (200/180)*math.pi-0.17, 32)
	circleSpinC(86, 48, 38, (200/180)*-math.pi+0.17, 32)
	
	
end">
					<pos x="-1" y="-0.5"/>
					<in1 component_id="14"/>
				</object>
			</c>
			<c type="34">
				<object id="19" n="light intensity">
					<pos x="-4" y="-3.25"/>
					<v text="10" value="10"/>
				</object>
			</c>
			<c type="22">
				<object id="20">
					<pos x="-0.25" y="-3"/>
					<in1 component_id="19"/>
					<in3 component_id="18"/>
				</object>
			</c>
			<c type="6">
				<object id="21">
					<pos x="2.25" y="-2.5"/>
					<in1 component_id="24"/>
					<in2 component_id="22"/>
				</object>
			</c>
			<c type="45">
				<object id="22" e="x/5">
					<pos x="1" y="-2.5"/>
					<in1 component_id="20"/>
				</object>
			</c>
			<c type="45">
				<object id="23" e="((-15*((x - 0.5)^2))+1)*25">
					<pos x="-2.75" y="-2.25"/>
					<in1 component_id="17"/>
				</object>
			</c>
			<c type="11">
				<object id="24">
					<pos x="-1.5" y="-2.25"/>
					<in1 component_id="23"/>
					<min text="1.5" value="1.5"/>
					<max text="30" value="30"/>
				</object>
			</c>
		</components>
		<components_bridge>
			<c type="2">
				<object id="6">
					<pos x="-4" y="-0.25"/>
				</object>
			</c>
			<c type="2">
				<object id="7">
					<pos x="-4" y="0.25"/>
				</object>
			</c>
			<c type="2">
				<object id="8">
					<pos x="-4" y="-1.5"/>
				</object>
			</c>
			<c type="2">
				<object id="9">
					<pos x="-4" y="-1"/>
				</object>
			</c>
			<c type="7">
				<object id="13">
					<pos x="0.25" y="-0.5"/>
					<in1 component_id="15" node_index="1"/>
				</object>
			</c>
			<c type="2">
				<object id="17">
					<pos x="-4" y="-2.25"/>
				</object>
			</c>
			<c>
				<object id="18">
					<pos x="-4" y="-2.75"/>
				</object>
			</c>
		</components_bridge>
		<groups/>
		<component_states>
			<c0 id="14" count="6">
				<pos x="-2.25" y="-1.25"/>
				<in1 component_id="7"/>
				<in2 component_id="6"/>
				<in3 component_id="9"/>
				<in4 component_id="8"/>
				<in5 component_id="21"/>
				<in6 component_id="20"/>
			</c0>
			<c1 id="15" script="function circleSpin(sx, sy, l, r)
	screen.drawLine(sx, sy, sx+l*math.sin(r), sy+l*math.cos(r))
	screen.drawRectF((sx+l*math.sin(r)*0.8)-1.5, (sy+l*math.cos(r)*0.8)-1.5, 3, 3)
end
function circleSpinC(sx, sy, l, r, c)
	screen.drawLine(sx+c*math.sin(r), sy+c*math.cos(r), sx+l*math.sin(r), sy+l*math.cos(r))
end
function textSpin(sx, sy, l, r, text)
	screen.drawTextBox(sx+l*math.sin(r), sy+l*math.cos(r), (#tostring(text)*5), 5, text, b, 0)
end
function circle(x, y, r, segments)
	local cos, sin = math.cos, math.sin
	local step = (math.pi * 2) / segments
	for i = 0, math.pi*2, step do
		screen.drawLine(x + cos(i) * r, y + sin(i) * r, x + cos(i+step) * r, y + sin(i+step) * r)
	end
end
function circle2(x, y, r, segments, coff)
	local cos, sin = math.cos, math.sin
	local step = (math.pi * 2) / segments
	for i = coff, math.pi*2, step do
		screen.drawLine(x + cos(i) * r, y + sin(i) * r, x + cos(i+step) * r, y + sin(i+step) * r)
	end
end

function clamp(x, mi, ma)
	return math.max(math.min(x, ma), mi)
end

function onTick()
	leftPipe = (clamp(input.getNumber(1), 0, 200)/200)*(math.pi*1.12732)-.2
	leftCyl = (clamp(input.getNumber(2), 0, 200)/200)*(math.pi*1.12732)-.2
	
	rightPipe = (clamp(input.getNumber(3), 0, 200)/200)*(math.pi*1.12732)-.2
	rightCyl = (clamp(input.getNumber(4), 0, 200)/200)*(math.pi*1.12732)-.2
	color = (clamp(input.getNumber(5), 0, 100))
	light = (clamp(input.getNumber(6), 0, 10))
end

function onDraw()
	screen.setColor(color/10 + light/4 ,color/10 + light /6,color/10)
	screen.drawRectF(0,0, 100, 100)
	
	screen.setColor(color + light/2, color + light/3, color)
	circle(10, 48, 36, 25)
	circle(10, 48, 33, 25)
	circle(86, 48, 36, 25)
	circle(86, 48, 33, 25)
	
	screen.setColor(color/10 + light/4 ,color/10 + light/6,color/10)
	screen.drawRectF(0,0, 5, 100)
	screen.drawRectF(92,0, 5,100)
	screen.setColor(color + light/2, color + light/3, color)
	
	textSpin(5, 48, 23, 0, 10)
	textSpin(9, 48, 21, (math.pi/4.7), 50)
	textSpin(13, 49, 17, (math.pi/2.1), 90)
	textSpin(10, 51, 20, ((math.pi/3)+(math.pi/2)), 130)
	textSpin(8, 51, 30, (math.pi), 170)
	
	textSpin(80, 45, 25, 0, 10)
	textSpin(86, 49, 25, math.pi/-3.4, 50)
	textSpin(86, 48, 30, math.pi/-2.1, 90)
	textSpin(86, 48, 30, ((math.pi/-1.5)), 130)
	textSpin(86, 48, 30, (math.pi*-.85), 170)
	
	screen.setColor(color*1.1 + light/2 ,0, 0)
	circleSpin(10, 48, 27, leftPipe)
	circleSpin(86, 48, 27, (rightPipe*-1))
	screen.setColor(color + light/2, color + light/3, color)
	circleSpin(10, 48, 27, leftCyl)
	circleSpin(86, 48, 27, (rightCyl*-1))
	
	for i = 0, 200, 10 do
		circleSpinC(10, 48, 36, (i/180)*math.pi-0.17, 32)
		circleSpinC(86, 48, 36, (i/180)*-math.pi+0.17, 32)
	end
	for i = 10, 170, 40 do
		circleSpinC(10, 48, 38, (i/180)*math.pi-0.17, 32)
		circleSpinC(86, 48, 38, (i/180)*-math.pi+0.17, 32)
	end
	
	circleSpinC(10, 48, 38, (0/180)*math.pi-0.17, 32)
	circleSpinC(86, 48, 38, (0/180)*-math.pi+0.17, 32)
	circleSpinC(10, 48, 38, (200/180)*math.pi-0.17, 32)
	circleSpinC(86, 48, 38, (200/180)*-math.pi+0.17, 32)
	
	
end
