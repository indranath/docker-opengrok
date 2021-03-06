# docker-opengrok

The one-liner to spin up a code search engine

OpenGrok is a code search engine made by Sun (and now Oracle). It provides
similar functions to [LXR](http://lxr.linux.no/) but more. This project
encapsulated OpenGrok into a docker container. Allowing you to start an
instance of OpenGrok by one command.

## Usage

To start the OpenGrok, simply run:

```sh
docker run -d -v [source to be indexed on host]:/src -p [public port]:8080 indranath/opengrok
```

It may take a while for the indexer to finish the first-time indexing, after
that, the search engine is available at `http://host:[public port]/source/`.

## Note

The project supports dynamic index updating through `inotifywait` recursively on the source folder.
This needs to be enabled with the environment variable `INOTIFY_RECURSIVE` at runtime.
Also, if you have more than 8192 files to watch, you will need to increase the amount of 
inotify watches allowed per user `(/proc/sys/fs/inotify/max_user_watches)` on your host system.

However, `touch` doesn't help. You should add or delete or modify the content of some source file to make it happen.
