# Docker Volume Copy

Bash script that simplifyes docker volume copying. It depends on [copy-volume](https://github.com/botwing/copy-volume) docker image and created with purpose that you don't need to write long `docker run` command.

## Installation

1. Download docker-volume-copy.sh script file or [archive](https://github.com/botwing/docker-volume-copy/archive/refs/tags/v1.0.0.zip) from release page
2. Put docker-volume-copy.sh script file wherever you feel comfortable. I'll use `~/.docker-volume-copy.sh` for the example
3. Add execution permissions `chmod +x ~/.docker-volume-copy.sh`
4. Add symlink to your bin folder `sudo ln -s <full path to your>/.docker-volume-copy.sh /usr/local/bin/docker-volume-copy`

Now you are ready to use `docker-volume-copy` as a CLI command.


## Usage
The usage is very basic. Just provide source and destination volumes names. If there is no destination volume it will be created.

For example:
```
docker-volume-copy my-project-mysql my-project-mysql-bckp
```

Also there are some pretty standart otions `-h`, `-V` that stands for help and script version correspondently.
