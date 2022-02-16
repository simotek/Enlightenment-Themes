Enlightenment-Themes
====================

Various Enlightenment and Terminology themes i'm working on, a branch per theme, development status for each theme is listed below.

For released themes you can simply download the bundled tarball extract it with `tar -xf <ThemeName>-bundle.tar.xf` and then run `install.sh` to put the files
in the appropriate spot in your home directory.

Building a theme is as simple as running the `./build-darkmod.sh` script. The built theme should be automatically put in your theme directory.

If you would like to modify one of the themes or create a new theme with vtx or darkmod take a look at [Hacking.md](Hacking.md)

Further info can be found at http://simotek.net/tech/projects/linux-themes/darkmod-enlightenment-theme-converter/

Branch Structure
----------------

|Branch Name   | Status   | Description
|--------------|----------|------------------------------------------------------------------------------
| **Development**
| Upstream     | Dev Only | Current working upstream dark theme (from elementary.git
| Master       | Dev Only | My base theme, Upstream + changes i have in all themes (color-paths.conf is just the default)
| **darkmod**
| Dark | Done   | The old default enlightenment theme.
| Extra Dark Green   | Done   | A darker theme then Dark with lots of green
| Ice | Done | A light theme
| Kitty | Semi Usable | A bit of fun
| **vtx**
| Vertex | Almost Done | A port of the Vertex GTK theme
| Fireball2 | In Development | A port of Toma's Fireball theme
| Iceball2 | In Development | A port of Toma's Iceball theme
| Grunge2 | In Development | A port of Toma's Grunge theme
| **Other**
| Cerium2  | Almost Done | A light theme based off Toma's old Cerium theme.
| Transiant  | In Development   | Something i'm slowly working on, Significantly different to dark eats lots of CPU
| Transiant  | In Development   | Something i'm slowly working on, Significantly different to dark eats lots of CPU
| transiant-color  | In Development   | Like Transiant but with more colors
| anti-transiant-color  | In Development   | Like transiant-color but without the transparent bits that eat CPU
| **openSUSE**
| openSUSE-e-42.1 | Release  | The current default theme used in openSUSE (Was blue-green)
| openSUSE-e-ice | Release  | The Ice light theme with openSUSE Branding.
