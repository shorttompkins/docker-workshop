# Docker Workshop
2015-10-28 w/ Pete Shannon | DramaFever

Getting started with Docker Toolbox:
https://github.com/DramaFever/tech-handbook/blob/master/1.3%20-%20Development%20Environment%20Setup.md

Brew install Docker Toolbox:
```
$ brew install caskroom/cask/brew-cask && brew cask install Caskroom/cask/dockertoolbox
```

Need a DockerHub account!

> Image != Container

Container is an "instance" of an Image

```
$ docker run ubuntu:14.04 /bin/echo 'Hello World'

Unable to find image 'ubuntu:14.04' locally
14.04: Pulling from library/ubuntu
c63fb41c2213: Pull complete
99fcaefe76ef: Pull complete
5a4526e952f0: Pull complete
1d073211c498: Pull complete
Digest: sha256:d4b37c2fd31b0693e9e446e56a175d142b098b5056be2083fb4afe5f97c78fe5
Status: Downloaded newer image for ubuntu:14.04
Hello World
```

Success!!

Connected to Docker Hub and downloaded the Ubuntu image, and simply executed echo.  The end.

---

```
$ docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             VIRTUAL SIZE
ubuntu              14.04               1d073211c498        5 days ago          187.9 MB
```

Display a list of image instances.

---

```
$ docker pull centos
$ docker run -t -i centos /bin/bash
[root@3e53eddb58b4 /]#
```

Bash shell into a container.

---

```
$ docker search node
```

Search the registry for images.

---

```
docker rmi imagename
```

Delete an image.  Can `-f` to force delete.

---

## Best Practices

 * Use a .dockerignore file
 * Avoid unnecessary packages
 * Run only one process per container
 * Minimize number of layers
 * Sort multi-line arguments
 * Build cache

## Dockerfile commands

FROM, RUN, CMD, EXPOSE, ENV, ADD or COPY, VOLUME, USER (default user is root, use USER to specify a different user), WORKDIR (establish a default directory for commands), etc.

```
$ docker build -t jkrol/sinatra:v2 .
```

Each statement in a `Dockerfile` creates a new layer.  New layers are generated every time a statement is changed.

Container is the entire ecosystem for a "system".  It contains everything needed to run a thing and run it the same every time.

```
$ docker run --help
$ docker run <OPTIONS> <IMAGE> <COMMAND>
```

```
$ docker run -d -P training/webapp python app.py
```
Interesting to note that it will pull down all of the necessary images if not already downloaded and installed.

Runs the `python app.py` as a daemon because of the `-d` option.

```
$ docker ps
```

Lists all running docker containers.

Using the `--rm` option will remove the container after the process has completed. (i.e. the Hello World example earlier)

`-e` to inject Environment Variables via the run commands.

```
$ docker run -e DJANGO_ENVIRON=PROD -p 8000:8000 --name django <image>
```

## Building a Scripts container

Check `/scripts`.  Create a project that contains scripts to be run.
The Dockerfile copies the scripts to the container, and installs and dependencies.

To build and then run:

```
$ docker build -t jkat98/scripts .
$ docker run jkat98/scripts ruby hello_ruby.rb
Hello, World.
```

Must have built first or the name of the container wouldn't be found when executing the `run` command.

### Node server

```
$ docker build -t jkat98/node .
$ docker run -it -p 3300:3300 jkat98/node node server.js
```

Runs the node server launch command via the container, and forwards ports within the container to local (of the same value).  Then access the IP for the docker VM by port and the node server running on the container is visible to you via browser!
