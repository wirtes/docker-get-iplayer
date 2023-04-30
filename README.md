# Docker get_iplayer

This Dockerfile will create an Ubuntu image with get_iplayer pre-loaded.

Use this command to build the `ubuntu-get-iplayer` image from the `Dockerfile`:

`docker image build -t ubuntu-get-iplayer .`

This shell script will create and launch a container interactively. The `/local_data/` directory in the container will be mapped to whatever path you specify in the `docker run` command. Handy for storing your downloads outside of the container at download time.

```
# Kill and remove the running container
docker rm -f ubuntu-get-iplayer

# Re-launch the image interactively with the name "ubuntu-get-iplayer"
docker run -it --name ubuntu-get-iplayer --volume <PATH TO YOUR LOCAL DOWNLOAD DIRECTORY>:/local_data docker-iplayer
```

I wrap this command into a shell script, `ubuntu-iplayer.sh`, where I can also remind myself of useful get_iplayer commands:

```
#!/bin/zsh
# Use your shell of choice above
#
echo "* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * "
echo "*                U B U N T U    G E T    I P L A Y E R"
echo "*"
echo "* Launching an Ubuntu container with get_iplayer preinstalled"
echo "* and /local_data mapped to <PATH TO YOUR LOCAL DIRECTORY>"
echo "*"
echo '* ex: get_iplayer --tv-quality="1080p" --pid=p0ffzvy3 --output /local_data/'
echo "*"
echo "* --pid-recursive --> this will download all files in a season/show"
echo "* --force         --> this will force a redownload"
echo "* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * "

# Kill and remove the running container
docker rm -f ubuntu-get-iplayer

# Re-launch the image interactively with the name "ubuntu-get-iplayer"
docker run -it --name ubuntu-get-iplayer --volume <PATH TO YOUR LOCAL DIRECTORY>:/local_data docker-iplayer
```

You can then connect a VPN on your machine running Docker and run get_iplayer commands in the VPN without having to install get_iplayer on your local system. It keeps things clean.

https://github.com/get-iplayer/get_iplayer for full get_iplayer documentation.
