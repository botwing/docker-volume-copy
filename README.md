# Docker Volume Copy

Bash script that simplifyes docker volume copying. It depends on [copy-volume](https://github.com/botwing/copy-volume) docker image and created with purpose that you don't need to write long `docker run` command.

## Installation

1. Go to /usr/local/
2. Clone git repository
3. Add execution permission to script
4. Go to /usr/local/bin
5. Create symlink to a downloaded script

Here is a complete list of required commands. You might need to use `sudo` to override write permissions

```
cd /usr/local/
git clone https://github.com/botwing/docker-volume-copy.git
chmod +x docker-volume-copy/docker-volume-copy.sh
cd bin
ln -s /usr/local/docker-volume-copy/docker-volume-copy.sh docker-volume-copy
```


## Usage
Basic usage is just to provide source and destination volumes names. If there is no destination volume it will be created.

For example:
```
docker-volume-copy my-project-mysql my-project-mysql-bckp
```

Also there are some pretty standart otions `-h`, `-V` that stands for help and script version correspondently.
