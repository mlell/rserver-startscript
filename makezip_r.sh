#!/usr/bin/env bash
set -ue

if [ ! $# = 1 ]; then
  echo "Usage: makezip_r.sh SIF-FILE" >&2
  exit 1
fi
if [ ! -f $1 ]; then
  echo "Given argument must be an existing SIF file: '$1'" >&2
  exit 1
fi

tmpdir="r.tmp"
mkdir "$tmpdir"
trap "rm -rf '$(pwd)/$tmpdir'" EXIT

# Copy the container
cp "${1:?Missing argument 1: Container file name}" "$tmpdir"/r.sif

# Set the correct container in cexec
sed 's|^CONTAINER=.*|CONTAINER="$thisdir/r.sif"|' < cexec > "$tmpdir"/cexec
chmod +x "$tmpdir"/cexec

tail -n +17 README > "$tmpdir"/README


archivename="$(basename "${1%%.sif}")".tar.gz
cd "$tmpdir"
tar czf ../"$archivename" *
cd ..

rm -r "$tmpdir"

