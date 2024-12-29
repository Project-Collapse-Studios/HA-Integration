from pathlib import Path
from sys import argv

home = Path(argv[1])
ssh_key = argv[2]


with open(home / ".ssh/id_rsa", "w") as f:
    f.write(ssh_key)