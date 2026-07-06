import random


gsize = None

def initWorld(size:int):
    global gsize
    
    if (size<3):
        size = 3
    size = size * 2 + 1
    gsize = size


    result = [[1 for y in range(size)] for x in range(size)]
    return carveBack(result, size,(size-1,size-1))

    
    

def carveBack(grid:list, size:int, target:tuple ,current = (0,0), previous = None, depth = 0):
    grid[current[0]][current[1]] = 0

    if(previous):
        grid[(current[0]+previous[0])//2][(current[1]+previous[1])//2] = 0
    
    if (current == target):
        return
    
    neighbors = []

    for i in [-2,0,2]:
        if current[0] + i >= 0 and current[0] + i <size:
            for j in [-2,0,2]:
                if current[1] + j >= 0 and current[1] + j <size:
                    if (i == 0) != (j == 0):
                        neighbors.append((current[0]+i,current[1]+j))
    
    neighbors = shuffle(neighbors)

    

    for neighbor in neighbors:
        if grid[neighbor[0]][neighbor[1]] != 0:
            carveBack(grid,size,target,neighbor, current, depth+1)
    
    if(depth == 0):
        return grid
    





def shuffle(lst:list):
    result = []
    for i in range(len(lst)):
        a = random.randint(0,len(lst)-1)
        result.append(lst.pop(a))
    return result


print("the maximum size for a grid is 44")
world = initWorld(int(input("please tell me the maze size: ")))


def blocker(current):
    current = (current[1],current[0])
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
        


    