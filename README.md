Enlightenment-Themes
====================

Various Enlightenment themes im working on, a branch per theme all are still WORKS IN PROGRESS

Also includes the darkmod enlightenment dark theme modification script
set the path to the enlightenment theme you would like to convert in
darkmod-colors-paths.sh in that file you can also modify colors brightnesses
etc.
Images that you wish to modify manually can be placed in the img-manual directory
and the script will include them instead of the originals or modified images specified
in the theme.
THIS SCRIPT IS CURRENTLY UNDERGOING A MAJOR REWRITE AND PROBABLY WONT WORK

Branch Structure
----------------

                                                 -> opensuse-e18
                                               /
                         --> opensuse-e   ------
                       /
                      /
  Upstream -> Master ------> Extra-Dark-Green -----> Transient
                      \
                       \
                         --> Ice
                         
                         
                         
 Branch Name | Description
====================================================================================================
             |
  Upstream   | Current working upstream dark theme (from elementary.git
             |
 ---------------------------------------------------------------------------------------------------
             |
  Master     | My base theme, Upstream + changes i have in all themes (color-paths.conf is just
             |    the default)
             |
 ---------------------------------------------------------------------------------------------------
