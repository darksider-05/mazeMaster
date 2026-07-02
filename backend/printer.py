
def printer(player, world, helpBuffer):
    temp = [row[:] for row in world]
    temp[int(player.y)][int(player.x)] = 4
    print('\x1B[H')


    print()
    print("hints left:", player.hints)
    print()
    for line in temp:
        print(line)
    print("--------")
    print("help bar: [" + (helpBuffer//2)*"=" + (25 - helpBuffer//2)*" " + "]")