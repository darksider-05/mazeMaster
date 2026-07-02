import keyboard
import math

helpBuffer = 0


def mover(player, world, dt, blocker):
    global helpBuffer
    scaledt = min(dt * 8, 1)
    speed = 0.35 * scaledt

    if keyboard.is_pressed("h"):
        helpBuffer +=1
        if (helpBuffer >=50 and player.hints != 0):
            helpBuffer = 0
            player.deadEndSafe = True
            player.hints -=1
            help(player, blocker)
    else:
        if helpBuffer > 0:
            helpBuffer = helpBuffer-1

    if keyboard.is_pressed("w"):
        newy = player.y-speed
        if sizecheck(newy, len(world)):
            if world[int(newy)][int(player.x)] != 1:
                player.moveY(-speed, len(world))
    
    if keyboard.is_pressed("s"):
        newy = player.y+speed
        if sizecheck(newy, len(world)):
            if world[int(newy)][int(player.x)] != 1:
                player.moveY(speed, len(world))
    
    if keyboard.is_pressed("a"):
        newx = player.x-speed
        if sizecheck(newx,len(world[int(player.y)])):
            if world[int(player.y)][int(newx)] != 1:
                player.moveX(-speed, len(world[int(player.y)]))
    
    if keyboard.is_pressed("d"):
        newx = player.x+speed
        if sizecheck(newx,len(world[int(player.y)])):
            if world[int(player.y)][int(newx)] != 1:
                player.moveX(speed, len(world[int(player.y)]))


def help(player,blocker):
    blocker((int(player.x),int(player.y)))

def sizecheck(target,size):
    return 0 <= target <= size