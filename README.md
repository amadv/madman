# madman - Dev Container 

The *madman* is a quick start into a curiated dev container for peek
a terminal/coding experience. This repo contains a Linux
[Containerfile](Containerfile) that has a bit of everything to have fun
while sampling and learning. Inspired by Robs boost container and all of
this work. He is the best check him out [Rob's
socials](https://linktr.ee/rwxrob).

1. Install [Podman](https://podman.io/) (or [Docker](https://docker.com) if you must)
1. Build and run the `dejavu` container locally

```sh
podman build -t madman https://github.com/amadv/madman.git
podman run -it --privileged --hostname madman --name madman madman
```

If you want to throw away the container after running just add `--rm` to the `run` command above. Otherwise, when you `exit` it will still be there and you can restart and attach later to continue your work until you explicitly remove it:

```sh
podman start -a madman
```

When you are ready to use the `man` pages consider running `sudo unminimize`.

## Beyond Mad

- Creating and customizing containers
- Kubernetes and "cloud native"
- Virtual machines and Proxmox
- Editor custom configuration
- ...
