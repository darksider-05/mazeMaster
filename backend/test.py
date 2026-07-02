
gsize = 5

world = [
    [0,1,0,1,1],
    [0,1,0,1,1],
    [0,0,0,0,0],
    [1,1,0,1,0],
    [1,1,1,1,0]
]







def blocker(current):
    global gsize, world
    neighbors = []

    for i in [-1,0,1]:
        if current[0] + i >= 0 and current[0] + i <gsize:
            for j in [-1,0,1]:
                if current[1] + j >= 0 and current[1] + j <gsize:
                    if (i == 0) != (j == 0):
                        if (world[current[0] + i][current[1] + j]) ==0:
                            neighbors.append((current[0]+i,current[1]+j))
    
    if(len(neighbors) < 3):
        return
    
    for neighbor in neighbors:
        if not(finder(neighbor,[current])):
            world[neighbor[0]][neighbor[1]] = 1
        


def finder(current,track = None):
    global gsize, world

    if track is None:
        track = []

    neighbors = []
    if current == (gsize-1,gsize-1):
        return True

    for i in [-1,0,1]:
        if current[0] + i >= 0 and current[0] + i <gsize:
            for j in [-1,0,1]:
                if current[1] + j >= 0 and current[1] + j <gsize:
                    if (i == 0) != (j == 0):
                        if not((current[0]+i,current[1]+j) in track):
                            if (world[current[0]+i][current[1]+j]) ==0:
                                neighbors.append((current[0]+i,current[1]+j))
    
    for neighbor in neighbors:
        if finder(neighbor, track + [current]):
            return True

    return False

blocker((2,2))
print(world)