import asyncio
import json
import websockets
import world

class VisualizationServer:
    def __init__(self):
        self.clients = set()
        self.player_last_state = None
        

    async def _handler(self, websocket):
        self.clients.add(websocket)
        await websocket.send(json.dumps({"type":"maze","world":world.world}))
        

        
        

        try:
            await websocket.wait_closed()
        finally:
            self.clients.remove(websocket)
            print("Visualizer disconnected")

    async def start(self):
        self.server = await websockets.serve(
            self._handler,
            "127.0.0.1",
            8765
        )
    
    async def publish(self, data):
        if not self.clients:
            return
        if data == self.player_last_state:
            return

        self.player_last_state = data
    
        message = json.dumps(data)

        dead = []
        print('\x1B[2J\x1B[0;0H')
        print("sent message:",data)
        print(len(self.clients))

        for client in self.clients:
            try:
                await client.send(message)
            except:
                dead.append(client)

        for client in dead:
            self.clients.remove(client)
    