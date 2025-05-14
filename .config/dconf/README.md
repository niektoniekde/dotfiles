# USAGE
## dconf
Customize configuration by loading changes to subpath from previous dump.
```bash
dconf load / < "custom.dump"
```
# Highlihts
## custom.dump
### Keybindings
This configuration enables WASD navigation between workspaces mainly in horizontal direction.

Supported actions:
* navigating between workspaces left or right (Super+A/D)
* moving window to another workspace left or right (Super+Shift+A/D)
* moving window to another monitor left, right, or up and down (Super+Ctrl+W/S/A/D)
* switching windows in normal or reverse order (Alt+Tab or Shift+Alt+Tab)
* toggling window fullscreen (Super+Return)

Keybindings conflicting those mentioned above were removed (set to empty).

```
[org/gnome/shell/keybindings]
toggle-application-view=@as []

[org/gnome/desktop/wm/keybindings]
cycle-panels=@as []
cycle-panels-backward=@as []
move-to-monitor-down=['<Control><Super>s']
move-to-monitor-left=['<Control><Super>a']
move-to-monitor-right=['<Control><Super>d']
move-to-monitor-up=['<Control><Super>w']
move-to-workspace-left=['<Shift><Super>a']
move-to-workspace-right=['<Shift><Super>d']
switch-applications=['<Super>Tab']
switch-applications-backward=['<Shift><Super>Tab']
switch-panels=@as []
switch-panels-backward=@as []
switch-to-workspace-1=@as []
switch-to-workspace-last=@as []
switch-to-workspace-left=['<Super>a']
switch-to-workspace-right=['<Super>d']
switch-windows=['<Alt>Tab']
switch-windows-backward=['<Shift><Alt>Tab']
toggle-fullscreen=['<Super>Return']
```
