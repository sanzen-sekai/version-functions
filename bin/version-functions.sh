version_build_next(){
  local mode
  local last

  if [ $# -lt 2 ]; then
    echo 'version_build_next: usage: version_build_next <mode> <last_version>'
    return
  fi

  mode=$1; shift
  last=$1; shift

  case $mode in
    major|minor|patch|beta)
      ;;
    exact)
      if [ -z "$last" ]; then
        echo 'version_build_next: in exact mode, version must be specified'
        return
      fi
      version=$last
      return
      ;;
    *)
      echo "version_build_next: invalid mode [$mode]. valid option: major,minor,patch,beta"
      return
      ;;
  esac

  local major
  local minor
  local patch
  local tip

  major=0
  minor=0
  patch=0

  if [ -z "$last" ]; then
    case $mode in
      major)
        major=1
        ;;
      minor)
        minor=1
        ;;
      patch)
        patch=1
        ;;
      beta)
        minor=999
        ;;
    esac
  else
    major=${last%%.*}
    case "$last" in
      *.*)
        tip=${last#*.}
        ;;
      *)
        tip=
        ;;
    esac
    case "$tip" in
      *.*)
        minor=${tip%%.*}
        tip=${tip#*.}
        case "$tip" in
          *.*)
            patch=${tip%%.*}
            tip=${tip#*.}
            ;;
          *)
            patch=$tip
            tip=
            ;;
        esac
        ;;
      *)
        minor=$tip
        tip=
        ;;
    esac
    if [ -z "$minor" ]; then
      minor=0
    fi
    if [ -z "$patch" ]; then
      patch=0
    fi

    case $mode in
      major)
        major=$(( $major+1 ))
        minor=0
        patch=0
        tip=
        ;;
      minor)
        minor=$(( $minor+1 ))
        patch=0
        tip=
        ;;
      patch)
        patch=$(( $patch+1 ))
        ;;
      beta)
        if [ $minor = 999 ]; then
          patch=$(( $patch+1 ))
        else
          minor=999
          patch=0
        fi
        tip=
        ;;
    esac
  fi

  if [ "$minor" = 1000 ]; then
    major=$(( $major+1 ))
    minor=0
    patch=0
    tip=
  fi

  version=$major.$minor.$patch
  if [ -n "$tip" ]; then
    version=$version.$tip
  fi
}
