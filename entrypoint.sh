#!/bin/sh

cd /target || exit 1

for i; do
	(
		set -e
		cd $i
		eval "debuild $DOCKER_DEBUILD_OPTS -us -uc --lintian-opts --allow-root"
	)
done
