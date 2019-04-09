#!/usr/bin/env bash
set -e

export KONG_VERSION=1.1.1

KONG_PATH="$HOME/kong-$KONG_VERSION"

pushd "$HOME"
    curl -s -S -L https://github.com/Kong/kong/archive/$KONG_VERSION.tar.gz | tar xz
popd

source $KONG_PATH/.ci/setup_env.sh

pushd "$KONG_PATH"
  make dev
popd

export LUA_PATH="$KONG_PATH/?.lua;$KONG_PATH/?/init.lua;$LUA_PATH"
export KONG_PATH=$KONG_PATH
