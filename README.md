docker-debuild
==============

This is a Docker image to build Debian source packages in Docker containers.  To download it, run:

    docker pull dochang/debuild:latest

Usage
-----

You have to bind the directory which contains source package files as `/target` in the container.  For example, if you want to build `foo-1.0`, `bar-1.1` and `baz-2.0` in `$HOME/src/`, just run this:

    docker run --rm -v $HOME/src:/target dochang/debuild foo-1.0 bar-1.1 baz-2.0

This command will build all three packages.

If you want to customize the options of `dpkg-buildpackage` and `lintian`, please set environment variables:

    docker run --rm -v $HOME/src:/target -e DEBUILD_DPKG_BUILDPACKAGE_OPTS="-k'NONAME <noname@debian.org>' -sa" -e DEBUILD_LINTIAN_OPTS="-i" dochang/debuild foo-1.0 bar-1.1 baz-2.0

You can also customize the options of `debuild` by `DOCKER_DEBUILD_OPTS`:

    docker run --rm -v $HOME/src:/target -e DOCKER_DEBUILD_OPTS="--no-lintian" dochang/debuild foo-1.0 bar-1.1 baz-2.0

