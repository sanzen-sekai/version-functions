# version-functions

build next version string

## Usage

```bash
# build.sh
. version-functions.sh
version_build_next <LAST_VERSION> <major|minor|patch|beta>
```

```bash
local version
version_build_next major 1.0.0   # => version=2.0.0   : major version up
version_build_next minor 1.0.0   # => version=1.1.0   : minor version up
version_build_next patch 1.0.0   # => version=1.0.1   : patch version up
version_build_next beta  1.0.0   # => version=1.999.0 : beta version up
version_build_next minor 1.999.0 # => version=2.0.0   : major version up
```

## Installation

```bash
git clone https://github.com/sanzen-sekai/version-functions.git
PATH=$PATH:/path/to/version-functions/bin
```

## Test

```bash
$ cd /path/to/version-functions
$ ./test_runner.sh
```
