import asyncio
import time
from printer import printer
from player import p
import world
import mover
from checker import checkState

async def engine() :
    print('\x1B[2J\x1B[0;0H')
    frames = 10
    interval = 1/frames
    last_time = time.perf_counter()
    
    
    

    while not(p.hasWon) and not(p.hasLost):
        current_time = time.perf_counter()
        dt = current_time - last_time  # seconds since last frame
        last_time = current_time
        
        
        checkState(p, world.world)
        printer(p, world.world, mover.helpBuffer)
        
        mover.mover(p, world.world, dt, world.blocker)
        await asyncio.sleep(interval)
    


    print('\x1B[2J\x1B[0;0H')
    if (p.hasLost):
        print("you lost :|")
    if (p.hasWon):
        print("you won! :) ")

    print("\n\n")
    input("press enter to exit (the jank is disposed after this, it's safe to igonre it)---")
    print('\x1B[2J\x1B[0;0H')
asyncio.run(engine())