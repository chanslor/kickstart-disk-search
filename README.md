# kickstart-disk-search
The install-disk can be sourced from kickstart file to determine the best disk for installation.
I wrote this because:
* servers with small 10-20gb flash drives
* Admins partitioning several raid drives

I also put this just before calling script to handle console output correctly.

```bash
#The pre-install script is not run in the change root environment.
%pre --interpreter /usr/bin/bash
#!/bin/bash

TTY=`tty`
exec < $TTY > $TTY 2> $TTY

```
