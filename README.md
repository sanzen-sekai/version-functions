# version-functions

build next version string

## Usage

```bash
# build.sh
. version-functions.sh
version_build_next <major|minor|patch|beta> <LAST_VERSION>
```

```bash
local version
version_build_next major 1.0.0   # => version=2.0.0
version_build_next minor 1.0.0   # => version=1.1.0
version_build_next patch 1.0.0   # => version=1.0.1
version_build_next beta  1.0.0   # => version=1.999.0
version_build_next minor 1.999.0 # => version=2.0.0

version_build_next major # => version=1.0.0
version_build_next minor # => version=0.1.0
version_build_next patch # => version=0.0.1
version_build_next beta  # => version=0.999.0
```

## Installation

```bash
git clone https://github.com/sanzen-sekai/version-functions.git
PATH=$PATH:/path/to/version-functions/bin
```

## Test

```bash
$ cd /path/to/version-functions
$ ./test/runner.sh
```
