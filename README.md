# Docker Tor-Relay

A docker container that is running a non-exit tor-relay. The only limitation
to this container is that it's non-exit, bandwidth or data isn't restricted.

## Usage

```
docker run -p 9001:9001 selaux/tor-relay
```

## Changing Configuration

To change your configuration, all you need to do is write your own configuration
file and mount it. You might need to forward additional ports depending on your
configuration.

```
docker run -p 9001:9001 -p 9030:9030 -v /path/to/torrc:/etc/tor/torrc selaux/tor-relay
```

## Persisting the Relay's Key

To persist your relay's key you can mount a volume at ```/var/lib/tor```.
The tor user inside the docker container has UID and GID set to 9001 if you
want to set up permissions.

```
docker run -p 9001:9001  -v /some/path/:/var/lib/tor selaux/tor-relay
```
