import ffmpy
import sys
import os

path = sys.argv[1]

if path.endswith('.mp4'):
    ff = ffmpy.FFmpeg(
        inputs={path: None},
        outputs={path[:-3] + 'avi': None}
    )
    print("Converting {}".format(path))
    ff.run()
else:
    for file in os.listdir(path):
        if file.endswith('.mp4'):
            filePath = path + '/' + file
            print("Converting {}".format(filePath))
            ff = ffmpy.FFmpeg(
                inputs={filePath: None},
                outputs={filePath[:-3] + 'avi': None}
            )
            ff.run()

