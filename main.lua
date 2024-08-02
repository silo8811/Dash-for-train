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
	
	
end
				
