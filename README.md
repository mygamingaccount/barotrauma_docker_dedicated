# Barotrauma Dedicated Server using docker-compose

Run your own Barotrauma dedicated server!
On most Debian-based systems, this will be as easy as running the following commands:

    sudo apt install docker-compose docker.io
    git clone https://github.com/mygamingaccount/barotrauma_docker_dedicated.git
    cd barotrauma_docker_dedicated
    docker-compose up -d
    docker attach barotrauma_docker_dedicated_barotrauma_1

Attach the container as soon as you can, preferably in a `tmux` or a `screen` session.
The dedicated server will die if STDIN and STDOUT are anything but a tty.

You can also use `docker run` without invoking `docker-compose` if you want. I myself prefer to keep configuration parameters in neatly maintained files, and not in my `.bash_history`.

## Ports

Forward UDP ports 27015-27016 to your docker host.

## Legal

The image does not contain any copyrighted files. The dedicated server is installed at the first time.
