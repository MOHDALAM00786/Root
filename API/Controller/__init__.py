import os
import glob
# get all filename from current folder
__all__=[os.path.basename(f)[:-3] for f in glob.glob(os.path.dirname(__file__) + "/*.py" )]
