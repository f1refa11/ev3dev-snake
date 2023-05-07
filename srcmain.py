#!/usr/bin/env python3
# WIDTH = 178
# HEIGHT = 128
from fastrand import pcg32bounded as randint
print("loaded fastrand...")
from ev3dev2.display import Display
print("Finished loading 'Display'...")
from ev3dev2.button import Button
print("Finished loading 'Button'...")

SIZE = 12
HEIGHT = 9
WIDTH = 14
FPS = 9

x = 1
y = 1
positions = [(x,y)]
length = 1
moving = 0
framecount = 0
randX = randint(WIDTH+1)
randY = randint(HEIGHT+1)

DISPLAY = Display()
BUTTON = Button()

DISPLAY.clear()
while 1:
    BUTTON.process()
    if BUTTON.left:
        moving = 1
    elif BUTTON.right:
        moving = 2
    elif BUTTON.up:
        moving = 3
    elif BUTTON.down:
        moving = 4
    if framecount < FPS:
        framecount += 1
    else:
        if x == randX and y == randY:
            DISPLAY._draw.rectangle((randX*SIZE+4, randY*SIZE+4, randX*SIZE+9, randY*SIZE+9), fill='white')
            randX = randint(WIDTH)
            randY = randint(HEIGHT)
            length += 1
        if moving == 1:
            x -= 1
        elif moving == 2:
            x += 1
        elif moving == 3:
            y -= 1
        elif moving == 4:
            y += 1
        if y < 0:
            y = HEIGHT
        elif y > HEIGHT:
            y = 0
        elif x < 0:
            x = WIDTH
        elif x > WIDTH:
            x = 0
        positions.append((x, y))
        c,d = positions[0]
        size1 = c*SIZE+4
        size2 = d*SIZE+4
        size3 = c*SIZE+9
        size4 = d*SIZE+9

        DISPLAY._draw.rectangle(((size1, size2), (size3, size4)), fill="white")
        positions = positions[-length:]
        for a,b in positions:
            DISPLAY.draw.rectangle((a*SIZE+4, b*SIZE+4, a*SIZE+9, b*SIZE+9), None, 'black')
        DISPLAY._draw.rectangle((randX*SIZE+4, randY*SIZE+4, randX*SIZE+9, randY*SIZE+9), 'black', 'black')
        framecount = 0
    DISPLAY.update()