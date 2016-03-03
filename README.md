Enlightenment-Themes
====================

Various Enlightenment themes im working on, a branch per theme, development status for each theme is listed below

Also includes the darkmod enlightenment dark theme modification script
set the path to the enlightenment theme you would like to convert in
darkmod-colors-paths.sh in that file you can also modify colors brightnesses
etc.
Images that you wish to modify manually can be placed in the img-manual directory
and the script will include them instead of the originals or modified images specified
in the theme.

A how to blog can be found at http://simotek.net/tech/projects/linux-themes/darkmod-enlightenment-theme-converter/

Branch Structure
----------------
```

                                                 -> opensuse-e18
                                               /
                         --> opensuse-e   ------
                       /
                      /
  Upstream -> Master ------> Extra-Dark-Green -----> Transient
                      \
                       \
                         --> Ice
                         \
                          \ 
                            --> Kitty
                         
```                    
|Branch Name   | Status   | Description
|--------------|----------|------------------------------------------------------------------------------
| Upstream     | Dev Only | Current working upstream dark theme (from elementary.git
| Master       | Dev Only | My base theme, Upstream + changes i have in all themes (color-paths.conf is just the default)
| openSUSE-e   | Release  | The default theme used in openSUSE
| openSUSE-e18 | Release  | The openSUSE theme as it was shipped with the release of e18
| Extra Dark Green   | Usable   | A darker theme then Dark with 
| Transiant  | In Development   | Something i'm slowly working on, Significantly different to dark
| Ice | Usable | A light theme
| Kitty | Semi Usable | A bit of fun


