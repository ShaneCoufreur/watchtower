#!/usr/bin/env bash
# docker rm watchtower -f && \
git add . && \
git commit --amend --no-edit && \
git tag -d v1.0.0 && \
git tag v1.0.0 && \
../goreleaser/goreleaser --skip-publish --rm-dist && \
docker rmi containrrr/watchtower:latest && \
docker tag containrrr/watchtower:1.0.0 containrrr/watchtower:latest && \
docker run --name watchtower -v /var/run/docker.sock:/var/run/docker.sock containrrr/watchtower --interval 10 --notifications-level debug
