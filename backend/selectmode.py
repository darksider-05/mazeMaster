def selectMode():
    a = None
    while (a != "1") and (a != "2"):
        print('\x1B[2J\x1B[0;0H')
        print(
            """ welcome to MazeMaster
            before starting the game, please choose:

                1: to play the game in terminal mode
                    (it is not suitable with big worlds)

                2: to play the game in GUI mode
                    (you have to run the Gui manually) """)
        a = input("your choice: ")
    if a == "1":
        return False
    return True