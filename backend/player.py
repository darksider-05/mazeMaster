class Player():
    def __init__(self):
        self.x = 0
        self.y = 0

        self.hints = 5

        self.hasWon = False
        self.hasLost = False


        self.deadEndSafe = True
        self.lastx = 0
        self.lasty = 0
    
    def moveX(self, amount: float, max):
        self.x += amount
        if(self.x>max):
            self.x = max
        if(self.x<0):
            self.x = 0
        if(self.lastx != int(self.x)):
            self.lastx = int(self.x)
            self.deadEndSafe = False
    
    def moveY(self, amount: float, max):
        self.y += amount
        if(self.x>max):
            self.x = max
        if(self.y<0):
            self.y = 0
        if(self.lastx != int(self.x)):
            self.lastx = int(self.x)
            self.deadEndSafe = False
        
    

p = Player()