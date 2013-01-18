buttonPressed = ""

mouse = {}
mouse.x = 0
mouse.y = 0

infoW = {}
infoW.x = 0
infoW.y = 0
infoW.w = 512
infoW.h = 512
infoW.a = 0

smileLeft = {}
smileLeft.x = 158
smileLeft.y = 351
smileLeft.w = 16
smileLeft.h = 16
smileLeft.a = 255

smileRight = {}
smileRight.x = 336
smileRight.y = 351
smileRight.w = 16
smileRight.h = 16
smileRight.a = 255

mouth = {}
mouth.x = 247
mouth.y = 350
mouth.w = 180
mouth.h = 16

leftBrow = {}
leftBrow.x = 155
leftBrow.y = 131
leftBrow.w = 1 -- 93
leftBrow.h = 1 -- 30
leftBrow.r = 0
leftBrow.speed = 100
leftBrow.rSpeed = 2


rightBrow = {}
rightBrow.x = 340
rightBrow.y = 131
rightBrow.w = 1 -- 93
rightBrow.h = 1 -- 30
rightBrow.r = 0
rightBrow.speed = 100
rightBrow.rSpeed = 2

leftEye = {}
leftEye.x = 154
leftEye.y = 208
leftEye.w = 32
leftEye.h = 32
leftEye.speed = 300

rightEye = {}
rightEye.x = 339
rightEye.y = 208
rightEye.w = 32
rightEye.h = 32
rightEye.speed = 300

function love.load()
	aDown = false
	bDown = false
	xDown = false
	yDown = false
	lbDown = false
	rbDown = false
	infoVisible = false
	smileVisible = true

	imgBack = love.graphics.newImage("images/background.png")
	imgBrow = love.graphics.newImage("images/brow.png")
end

function love.draw()
	love.graphics.setColor( 255, 255, 255, 255 )
	love.graphics.draw( imgBack, 0, 0, 0, 1, 1, 0, 0 )
	love.graphics.setColor( 255, 255, 255, 255 )
	love.graphics.print( buttonPressed, 5, 512-30 )
	love.graphics.setColor( 0, 0, 0, 255 )
	love.graphics.rectangle( "fill", leftEye.x - (leftEye.w/2), leftEye.y - (leftEye.h/2), leftEye.w, leftEye.h )
	love.graphics.rectangle( "fill", rightEye.x - (rightEye.w/2), rightEye.y - (rightEye.h/2), rightEye.w, rightEye.h )
	love.graphics.setColor( 255, 255, 255, 255 )
	love.graphics.draw( imgBrow, leftBrow.x, leftBrow.y, leftBrow.r, leftBrow.w, leftBrow.h, (93/2), (30/2) )
	love.graphics.draw( imgBrow, rightBrow.x, rightBrow.y, rightBrow.r, rightBrow.w, rightBrow.h, (93/2), (30/2) )
	love.graphics.setColor( 0, 0, 0, 255 )
	love.graphics.rectangle( "fill", mouth.x - (mouth.w/2), mouth.y - (mouth.h/2), mouth.w, mouth.h )
	love.graphics.setColor( 0, 0, 0, smileLeft.a )
	love.graphics.rectangle( "fill", smileLeft.x - smileLeft.w, smileLeft.y - smileLeft.h, smileLeft.w, smileLeft.h )
	love.graphics.setColor( 0, 0, 0, smileRight.a )
	love.graphics.rectangle( "fill", smileRight.x, smileRight.y - smileRight.h, smileRight.w, smileRight.h )
	love.graphics.setColor( 255, 255, 255, 255 )
--	love.graphics.print( "Mouse position (x,y): " .. mouse.x .. ", " .. mouse.y, 5, 512-15 )
	love.graphics.print( "Hold 'START' for info.", 5, 512-15 )
	love.graphics.setColor( 255, 255, 255, infoW.a )
	love.graphics.rectangle( "fill", infoW.x, infoW.y, infoW.w, infoW.h )
	love.graphics.setColor( 0, 0, 0, infoW.a )
	love.graphics.print( "This is a Xbox 360 controller compatible.. thing.", 5, 5 )
	love.graphics.print( "Hold 'LB' and use sticks to rotate eyebrows.", 10, 35 )
	love.graphics.print( "Hold 'RB' and use sticks to move the eyebrows.", 10, 50 )
	love.graphics.print( "Click 'Y' to reset the eyebrows.", 10, 65 )
	love.graphics.print( "Hold 'A' and use the left stick to resize the mouth.", 10, 80 )
	love.graphics.print( "Click 'B' to remove the smile.", 10, 95 )
	love.graphics.print( "Click 'X' to bring the smile back.", 10, 110 )
	love.graphics.print( "Coded by: Christoffer Torp.", 10, 140 )
	love.graphics.print( "Picture: CollumRulz from planetminecraft.com. ('Minecraft in Blender')", 10, 155 )
	love.graphics.print( "Using a combination of eyebrows, eyes and mouth you can create a", 10, 450 )
	love.graphics.print( "variety of expressions such as sad, happy, suspicious, angry etc etc..", 10, 465 )
	
end

function love.update(dt)
	mouse.x = love.mouse.getX()
	mouse.y = love.mouse.getY()
	dirLeftWE = love.joystick.getAxis( 1, 1 )
	dirLeftNS = love.joystick.getAxis( 1, 2 )
	dirRightNS = love.joystick.getAxis( 1, 4 )
	dirRightWE = love.joystick.getAxis( 1, 5 )
	
-- Brow rotation
	if lbDown == true then
		if dirLeftWE > 0.2 then
			leftBrow.r = leftBrow.r + leftBrow.rSpeed * dt
		elseif dirLeftWE < -0.2 then
			leftBrow.r = leftBrow.r - leftBrow.rSpeed * dt
		end
		if dirRightWE > 0.2 then
			rightBrow.r = rightBrow.r + rightBrow.rSpeed * dt
		elseif dirRightWE < -0.2 then
			rightBrow.r = rightBrow.r - rightBrow.rSpeed * dt
		end
	end
-- Brow movement
	if rbDown == true then
		if dirLeftNS > 0.2 then
			leftBrow.y = leftBrow.y + leftBrow.speed * dt
		elseif dirLeftNS < -0.2 then
			leftBrow.y = leftBrow.y - leftBrow.speed * dt
		end
		if dirRightNS > 0.2 then
			rightBrow.y = rightBrow.y + rightBrow.speed * dt
		elseif dirRightNS < -0.2 then
			rightBrow.y = rightBrow.y - rightBrow.speed * dt
		end
	end
	if yDown == true then
		leftBrow.y = 131
		leftBrow.r = 0
		rightBrow.y = 131
		rightBrow.r = 0
	end
	if smileVisible == true and bDown == true then
		smileLeft.a = 0
		smileRight.a = 0
		smileVisible = false
	end
	if smileVisible == false and xDown == true then
		smileLeft.a = 255
		smileRight.a = 255
		smileVisible = true
	end
	if aDown == true then
		if dirLeftWE > 0.2 then
			mouth.w = mouth.w - 150 * dt
			smileLeft.x = smileLeft.x + (150/2) * dt
			smileRight.x = smileRight.x -(150/2) * dt
		elseif dirLeftWE < -0.2 then
			mouth.w = mouth.w + 150 * dt
			smileLeft.x = smileLeft.x - (150/2) * dt
			smileRight.x = smileRight.x + (150/2) * dt
		end
		if dirLeftNS > 0.2 then
			mouth.h = mouth.h - 150 * dt
			smileLeft.y = smileLeft.y + (150/2) * dt
			smileRight.y = smileRight.y + (150/2) * dt
		elseif dirLeftNS < -0.2 then
			mouth.h = mouth.h + 150 * dt
			smileLeft.y = smileLeft.y - (150/2) * dt
			smileRight.y = smileRight.y - (150/2) * dt
		end
	end
	if smileLeft.x < 98 then
		smileLeft.x = 98
	end
	if smileLeft.y < 261 then
		smileLeft.y = 261
	end
	if smileRight.x > 396 then
		smileRight.x = 396
	end
	if smileRight.y < 261 then
		smileRight.y = 261
	end
	
	if smileLeft.x > 240 then
		smileLeft.x = 240
		smileRight.x = 253
	end
	if smileLeft.y > 343 then
		smileLeft.y = 343
		smileRight.y = 343
	end
	if mouth.w > 300 then
		mouth.w = 300
	elseif mouth.w < 16 then
		mouth.w = 16
	end
	if mouth.h > 180 then
		mouth.h = 180
	elseif mouth.h < 16 then
		mouth.h = 16
	end
	
-- Left stick
	if lbDown == false and rbDown == false and aDown == false then
		if dirLeftWE > 0.2 then
			leftEye.x = leftEye.x + leftEye.speed * dt
		elseif dirLeftWE < -0.2 then
			leftEye.x = leftEye.x - leftEye.speed * dt
		else
			leftEye.x = 154
		end
		if dirLeftNS > 0.2 then
			leftEye.y = leftEye.y + leftEye.speed * dt
		elseif dirLeftNS < -0.2 then
			leftEye.y = leftEye.y - leftEye.speed * dt
		else
			leftEye.y = 208
		end
	end
	
-- Right stick
	if lbDown == false and rbDown == false then
		if dirRightWE > 0.2 then
			rightEye.x = rightEye.x + rightEye.speed * dt
		elseif dirRightWE < -0.2 then
			rightEye.x = rightEye.x - rightEye.speed * dt
		else
			rightEye.x = 339
		end
		if dirRightNS > 0.2 then
			rightEye.y = rightEye.y + rightEye.speed * dt
		elseif dirRightNS < -0.2 then
			rightEye.y = rightEye.y - rightEye.speed * dt
		else
			rightEye.y = 208
		end
	end
	
-- Left eye restricted
	if leftEye.x < 108+16 then
		leftEye.x = 108+16
	end
	if leftEye.x > 200-16 then
		leftEye.x = 200-16
	end
	if leftEye.y > 254-16 then
		leftEye.y = 254-16
	end
	if leftEye.y < 162+16 then
		leftEye.y = 162+16
	end

-- Right eye restricted
	if rightEye.x < 294+16 then
		rightEye.x = 294+16
	end
	if rightEye.x > 386-16 then
		rightEye.x = 386 - 16
	end
	if rightEye.y > 254-16 then
		rightEye.y = 254-16
	end
	if rightEye.y < 162+16 then
		rightEye.y = 162+16
	end
	
	if infoVisible == true then
		infoW.a = 200
	else
		infoW.a = 0
	end
	if leftBrow.y < 120 then
		leftBrow.y = 120
	elseif leftBrow.y > 160 then
		leftBrow.y = 160
	end
	if rightBrow.y < 120 then
		rightBrow.y = 120
	elseif rightBrow.y > 160 then
		rightBrow.y = 160
	end
end

function love.joystickpressed( joystick, button )
	if joystick == (1) then
		if button == (1) then
			buttonPressed = "'A' pressed!"
			aDown = true
		end
		if button == (2) then
			buttonPressed = "'B' pressed!"
			bDown = true
		end
		if button == (3) then
			buttonPressed = "'X' pressed!"
			xDown = true
		end
		if button == (4) then
			buttonPressed = "'Y' pressed!"
			yDown = true
		end
		if button == (5) then
			buttonPressed = "'LB' pressed!"
			lbDown = true
			
		end
		if button == (6) then
			buttonPressed = "'RB' pressed!"
			rbDown = true
		end
		if button == (8) then
			buttonPressed = "'START' pressed!"
			infoVisible = true
		end
	end
end

function love.joystickreleased( joystick, button )
	if joystick == (1) then
		if button == (1) then
			buttonPressed = ""
			aDown = false
		end
		if button == (2) then
			buttonPressed = ""
			bDown = false
		end
		if button == (3) then
			buttonPressed = ""
			xDown = false
		end
		if button == (4) then
			buttonPressed = ""
			yDown = false
		end
		if button == (5) then
			buttonPressed = ""
			lbDown = false
		end
		if button == (6) then
			buttonPressed = ""
			rbDown = false
		end
		if button == (8) then
			buttonPressed = ""
			infoVisible = false
		end
	end
end