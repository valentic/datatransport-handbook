#!/bin/sh

DOWNLOADDIR=downloads
PACKAGESDIR=packages

mkdir -p $DOWNLOADDIR 
mkdir -p $PACKAGESDIR

WGETOPTS="-N -P $DOWNLOADDIR"

wget $WGETOPTS https://mirrors.ctan.org/install/fonts/ebgaramond.tds.zip
wget $WGETOPTS https://mirrors.ctan.org/macros/latex/contrib/endnotes.zip 
wget $WGETOPTS https://mirrors.ctan.org/macros/latex/contrib/xpatch.zip 

# Unpack endnotes

if [ ! -d $PACKAGESDIR/endnotes ]; then
    echo "Unpacking endnotes"
    unzip -d $PACKAGESDIR $DOWNLOADDIR/endnotes.zip
fi

# Unpack and build xpatch.sty 
#
if [ ! -d $PACKAGESDIR/xpatch ]; then
    echo "Unpacking xpatch"
    unzip -d $PACKAGESDIR $DOWNLOADDIR/xpatch.zip
    (cd $PACKAGESDIR/xpatch; latex xpatch.ins)
fi

# Print message about fonts

echo "Unpack ebgaramond.tds.zip and copy opentype to your fonts directory."
echo "Run fc-cache -f -v to rebuilt the font cache." 

echo "Setup finished"
