import asyncio
from engine import engine
from visualizer import VisualizationServer

async def main():
    visualizer = VisualizationServer()

    await visualizer.start()

    await engine(visualizer)

asyncio.run(main())