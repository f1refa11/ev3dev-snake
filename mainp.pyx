from fastrand import pcg32bounded as randint
print("loaded fastrand...")
from ev3dev2.display import Display
print("Finished loading 'Display'...")
from ev3dev2.button import Button
print("Finished loading 'Button'...")
# WIDTH = 178
# HEIGHT = 128
# from sys import getsizeof

cdef unsigned char SIZE = 12
cdef unsigned char HEIGHT = (128-(128%SIZE))//SIZE
cdef unsigned char WIDTH = (178-(178%SIZE))//SIZE

cdef unsigned char x = 1
cdef unsigned char y = 1

cdef positions = [(x,y)]
cdef length = 1

cdef DISPLAY = Display()

cdef unsigned char moving = 0
DISPLAY.clear()
DISPLAY.draw.rectangle((x*SIZE+4, y*SIZE+4, x*SIZE+9, y*SIZE+9), None, 'black')
cdef unsigned char randX = randint(WIDTH)
cdef unsigned char randY = randint(HEIGHT)
cdef BUTTON = Button()
cdef unsigned char FPS = 7
cdef unsigned char framecount = 0
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
            DISPLAY.draw.rectangle((randX*SIZE+4, randY*SIZE+4, randX*SIZE+9, randY*SIZE+9), fill='white')
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
        DISPLAY.draw.rectangle((randX*SIZE+4, randY*SIZE+4, randX*SIZE+9, randY*SIZE+9), 'black', 'black')
        framecount = 0
    DISPLAY.update()