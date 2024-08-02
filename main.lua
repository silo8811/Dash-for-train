function circleSpin(sx, sy, l, r)
	screen.drawLine(sx, sy, sx+l*math.sin(r), sy+l*math.cos(r))
	screen.drawRectF((sx+l*math.sin(r))-1.5, (sy+l*math.cos(r))-1.5, 3, 3)
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
end

function onDraw()
	screen.setColor(255, 255, 255)
	circle(10, 48, 35, 25)
	circle(86, 48, 35, 25)
	screen.drawLine(48, 0, 48, 96)
	screen.setColor(255, 0, 0)
	circleSpin(10, 48, 27, leftPipe)
	circleSpin(86, 48, 27, (rightPipe*-1))
	screen.setColor(255, 255, 255)
	circleSpin(10, 48, 27, leftCyl)
	circleSpin(86, 48, 27, (rightCyl*-1))
	textSpin(10, 48, 25, 0, 0)
	textSpin(10, 48, 20, (math.pi/4), 50)
	textSpin(10, 48, 17, (math.pi/2), 100)
	textSpin(10, 48, 20, ((math.pi/4)+(math.pi/2)), 150)
	textSpin(10, 48, 30, (math.pi), 200)
	
	textSpin(86, 48, 25, 0, 0)
	textSpin(86, 48, 25, math.pi/-3.5, 50)
	textSpin(86, 48, 30, math.pi/-2, 100)
	textSpin(86, 48, 32, ((math.pi/-1.5)), 150)
	textSpin(86, 48, 30, (math.pi*-.95), 200)
	for i = 0, 200, 10 do
		circleSpinC(10, 48, 35, (i/200)*math.pi, 30)
		circleSpinC(86, 48, 35, (i/200)*-math.pi, 30)
	end
end
