import asyncio
from shazamio import Shazam


async def main():
  shazam = Shazam()
  out = await shazam.recognize_song('output.ogg')
  print("Image:", out.get("track")["images"]["coverart"])
  print(out.get("track")["title"], "-", out.get("track")["subtitle"])

loop = asyncio.get_event_loop()
loop.run_until_complete(main())

