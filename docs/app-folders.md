# Restore App Folders in GNOME

This guide will help you restore app folders and app arrangement in GNOME using the `dconf` tool.

# Reset current app folders and arrangement

```shell
dconf reset -f /org/gnome/desktop/app-folders/
gsettings reset org.gnome.shell app-picker-layout
```

# Restore app folders and arrangement from a backup

```shell
cat app-folders.conf | dconf load -f /org/gnome/desktop/app-folders/
```

Note: Logout and login may be required for changes to take effect.
