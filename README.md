# docker-dmucs-dispatcher

## Ports

- 9714 : dmucs service port

## Volumes

To use this container, you should prepare these volumes:

### /etc/dmucs

Only one file `hosts-info` in it, for example :

    # Format: machine number-of-cpus power-index
    linux-comp-1       4         10
    solaris-comp-1     2         5
    solaris-comp-2     2         5
    old-linux-comp-1   1         4
    old-solaris-comp-3 1         2
    169.144.80.25      1         2

## Start command

    docker run --restart=always -d -p 9714:9714 -v /srv/dmucs:/etc/dmucs  starofrainnight/dmucs-dispatcher
