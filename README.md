# kickstart-disk-search
Search for the disks and determine size during a RHEL/Centos kickstart
```bash
#The pre-install script is not run in the change root environment.
%pre --interpreter /usr/bin/bash
#!/bin/bash

TTY=`tty`
exec < $TTY > $TTY 2> $TTY

```
