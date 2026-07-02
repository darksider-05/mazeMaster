


def checkState(player, world):

    current = (int(player.y),int(player.x))
    worldSize = len(world)
    if (current == (worldSize-1,worldSize-1)):
        player.hasWon = True
        return


    neighbors = []
    for i in [-1,0,1]:
        if current[0] + i >= 0 and current[0] + i <worldSize:
            for j in [-1,0,1]:
                if current[1] + j >= 0 and current[1] + j <worldSize:
                    if (i == 0) != (j == 0):
                        if (world[current[0] + i][current[1] + j]) ==0:
                            neighbors.append((current[0]+i,current[1]+j))
    
    if ( len(neighbors) <= 1 and not(player.deadEndSafe) ):
        player.hasLost = True