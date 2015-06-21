# Docker Tor-Relay

A docker container that is running a non-exit tor-relay. The only limitation
to this container is that it's non-exit, bandwidth or data isn't restricted.

## Usage

```
docker run selaux/tor-relay
```

## Changing Configuration

To change your configuration, all you need to do is write your own configuration
file and mount it.

```
docker run -v /path/to/torrc:/etc/tor/torrc selaux/tor-relay
```

## Persisting the Relay's Key

To persist your relay's key you can mount a volume at ```/var/lib/docker```.
The tor user inside the docker container has UID and GID set to 9001 if you
want to set up permissions.

```
docker run -v /some/path/:/var/lib/docker selaux/tor-relay
```
