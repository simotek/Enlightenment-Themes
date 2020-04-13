## Introduction
This repository is structured in a way that's designed to make maintaining multiple themes much easier. The first way it does this is by using git branches to store each theme so changes can be merged between easily. The second way it does this is to use various scripts such as

## To create a new theme - The basics
First you will need a basic understanding of git, especially branches, this is a reasonable first start guide http://rogerdudler.github.io/git-guide/
1. Check out the vtx branch `git checkout vtx` - _alternatively if there is a theme that is similar to the one you want to create checkout that theme instead._
2. Create your own git branch to work in `git branch <Your_Theme_Name>`
3. Edit `darkmod-color-paths.conf` you need to at least change `THEME_NAME` the rest can wait for later.
4. You will now want to start modifying the images in `enlightenment-elementary/img-manual` to get the biggest effect start by modifying the images that start with `e_base` further documentation on each images in `enlightenment-elementary/img-manual/Hacking-Images.md` you can also override images in the default e theme by placing an image with the same name in `enlightenment-elementary/img-manual`
5. You will also want to edit `darkmod-color-paths.conf` further to change some of the other colors particularly e's blue color.

## To recolor e's Dark theme
First you will need a basic understanding of branching in git.
1. Check out the master branch
2. Create your own git branch to work in `git branch <Your_Theme_Name>`
3. Edit `darkmod-color-paths.conf` you need to at least change `THEME_NAME`
4. You can now modify `darkmod-color-paths.conf` further, to change e's blue color you likely want to change `HIGH_BRIGHTNESS,HIGH_SATURATION,HIGH_HUE`
In addition you can reference the following two files for examples on how change the rest of the theme to be much lighter or darker.
  * [Darker - Extra-Dark-Green](https://github.com/simotek/Enlightenment-Themes/blob/Extra-Dark-Green/darkmod-color-paths.conf)
  * [Light - ice](https://github.com/simotek/Enlightenment-Themes/blob/ice/darkmod-color-paths.conf)
5. You may also want to change the font colors or some of the other UI colors these can be found in `enlightenment-elementary/fonts.edc` and `enlightenment-elementary/colorclasses.edc`. Again these files in the `Extra-Dark-Green` and `ice` themes will serve as a useful reference for dark or light themes.

## Building your Theme
Building themes is simple all you need to do is run `./build-darkmod.sh`from the terminal, this will build your theme and add it to e's theme directory. Remember to set the `THEME_NAME` in `darkmod-color-paths.conf` first to ensure it gets created with the right name.

## Creating packages
1. To create a package so you can disribute your theme run `./package-darkmod.sh`


<Todo> Add a good simple guide to branching in git
