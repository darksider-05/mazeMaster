import asyncio
from selectmode import selectMode
from engine import engine
from visualizer import VisualizationServer





async def main():

    gui = selectMode()
    if gui:
        visualizer = VisualizationServer()
        await visualizer.start()
    if not(gui):
        visualizer = None

    await engine(visualizer, gui)

asyncio.run(main())