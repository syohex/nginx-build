# nginx-build

[![Build Status](https://drone.io/github.com/cubicdaiya/nginx-build/status.png)](https://drone.io/github.com/cubicdaiya/nginx-build/latest)

`nginx-build` - provides a command to build nginx seamlessly.

## Required

 * [wget](https://www.gnu.org/software/wget/) for downloading nginx and external libraries
 * [git](http://git-scm.com/) for downloading 3rd party module

## Build Support

 * [nginx](http://nginx.org/)
 * [OpenResty](http://www.openresty.com/)
 * [Tengine](http://tengine.taobao.org/)

## Install

```bash
go get -u github.com/cubicdaiya/nginx-build
```

If you don't have go-runtime, you may download the binary from [here](https://github.com/cubicdaiya/nginx-build/releases).

## Quick Start

```bash
mkdir -p ~/opt/nginx
nginx-build -d ~/opt/nginx
cd ~/opt/nginx/1.7.9/nginx-1.7.9
objs/bin/nginx -V
```

## Custom Configuration

### Configuration for building nginx

`nginx-build` provides a mechanism for customizing configuration for building nginx.
Prepare a configure script like the following.

```bash
#!bin/sh

./configure \
--sbin-path=/usr/sbin/nginx \
--conf-path=/etc/nginx/nginx.conf \
--with-cc-opt="-Wno-deprecated-declarations" \
```

Give this file to `nginx-build` with `-c`.

```bash
$ nginx-build -d ~/opt/nginx -c configure.example
```

### Embedding ZLIB statically

Give `-zlib` to `nginx-build`.

```bash
$ nginx-build -d ~/opt/nginx -zlib
```

`-zlibverson` is an option to set a version of ZLIB.

```bash
$ nginx-build -d ~/opt/nginx -zlib -zlibversion=1.2.8
```

### Embedding PCRE statically

Give `-pcre` to `nginx-build`.

```bash
$ nginx-build -d ~/opt/nginx -pcre
```

`-pcreverson` is an option to set a version of PCRE.

```bash
$ nginx-build -d ~/opt/nginx -pcre -pcreversion=8.35
```

### Embedding OpenSSL statically

Give `-openssl` to `nginx-build`.

```bash
$ nginx-build -d ~/opt/nginx -openssl
```

`-opensslverson` is an option to set a version of OPENSSL.

```bash
$ nginx-build -d ~/opt/nginx -openssl -opensslversion=1.0.1j
```

### Embedding 3rd-party modules

`nginx-build` provides a mechanism for embedding 3rd-party modules.
Prepare a ini-file below.

```ini
[echo-nginx-module]
form=git
url=https://github.com/openresty/echo-nginx-module.git
rev=v0.53

[ngx_devel_kit]
form=git
url=https://github.com/simpl/ngx_devel_kit
rev=v0.2.19
```

Give this file to `nginx-build` with `-m`.

```bash
$ nginx-build -d ~/opt/nginx -m modules.cfg.example
```
