#!/usr/bin/env bash
set -ue

if [ ! $# = 1 ]; then
  echo "Usage: makezip_rstudio.sh SIF-FILE" >&2
  exit 1
fi
if [ ! -f $1 ]; then
  echo "Given argument must be an existing SIF file: '$1'" >&2
  exit 1
fi

tmpdir=rstudio.tmp
mkdir "$tmpdir"
trap "rm -rf '$(pwd)/$tmpdir'" EXIT

# Copy the container
cp "$1" "$tmpdir"/rstudio.sif

# Set the correct container in cexec
sed 's|^CONTAINER=.*|CONTAINER="$thisdir/rstudio.sif"|' < cexec > "$tmpdir"/cexec
chmod +x "$tmpdir"/cexec

# Set the correct container in rstudio
sed 's|^CONTAINER=.*|CONTAINER="$thisdir/rstudio.sif"|' < rstudio > "$tmpdir"/rstudio
chmod +x "$tmpdir"/rstudio

# add the README
tail -n +17 README > "$tmpdir"/README
cat README.RStudio >> "$tmpdir"/README

cd "$tmpdir"
archivename="$(basename "${1%%.sif}")".tar.gz
tar czf ../"$archivename" *
cd ..



