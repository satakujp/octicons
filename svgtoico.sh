#! /bin/bash

rm /var/work/png/*
for filepath in /var/work/lib/svg/*.svg
do
    filename=$(basename $filepath)
    filename=`echo ${filename} | sed 's/\.svg//'`

    inkscape --without-gui --export-width=${EXPORT_WIDTH} --export-height=${EXPORT_HEIGHT} --file=/var/work/lib/svg/${filename}.svg --export-png=/var/work/png/${filename}.png
done

rm /var/work/ico/*
for filepath in /var/work/png/*.png
do
    filename=$(basename $filepath)
    filename=`echo ${filename} | sed 's/\.png//'`

    convert /var/work/png/${filename}.png /var/work/ico/${filename}.ico
done
