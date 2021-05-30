"""
You may have installed jupyter in a virtual environment, therefore update the
path in the variable and delete the second line.

Path to jupyter can be obtained by the command 'which jupyter' on your terminal.

"""
import os 

path_to_jupyter = os.getenv('HOME') + '/.local/bin/jupyter'

# path_to_jupyter = '/home/jithin/venv/bin/jupyter'
# path_to_jupyter = '/usr/bin/jupyter' # default 


