# XFCE4 files

## ./panel/
- `docklike-2.rc`
    Responsible for the configuration of the dockbar, where the icons (clock, battery, ...) are placed.

- `genmon-*.rc`
    Responsible for the configuration of the genmon plugin, which is used to display the system information (cpu, memory, ...).

- `launcher-2/16955526721.desktop`
    Responsible for the configuration of the launcher plugin, which is used to display the applications.

## `./terminal/terminalrc`
Responsible for the configuration of the visual appearance of the terminal.

## ./xfconf/xfce-perchannel-xml/
Here are the main configurations of the xfce4, like the keyboard shortcuts, the window manager, the desktop, the panel, the power manager, the session and the terminal.

- `accessibility.xml`
    Responsible for the configuration of the accessibility settings.
- `xfc4-keyboard-shortcuts.xml`
    Defines keyboard shortcuts for commands and window manager actions.
    It contains properties for default shortcuts (default) and custom shortcuts (custom) for various actions.
    For example:
    - `<property name="&lt;Alt&gt;F4" type="string" value="close_window_key"/>`
    - `<property name="&lt;Super&gt;x" type="string" value="maximize_window_key"/>`
- `xfce4-mime-settings.xml`
    > MIME types play a crucial role in determining how files are handled and which applications are used to open them. MIME (Multipurpose Internet Mail Extensions) types are a standard way of classifying file types based on their content and intended use. XFCE, like other desktop environments, relies on MIME types to associate files with appropriate applications and actions. (File Associations, Default Applications, Actions, Configuration, Customization)

    The template that I've used has a lot of `<property>` tags some related directly with the envirorment created (not exactly the same as mine), not so many modifications in here.
- `xfce4-mixer.xml`
    > Refers to a graphical user interface (GUI) tool used for controlling audio settings. This window allows users to adjust various audio-related parameters such as volume levels, input/output devices, and sound settings.
- `xfce4-notifyd.xml`
    Takes care of the notifications settings, in here added some custom settings such as `<property name="theme" type="string" value="Greybird-mx"/>` and `<value type="string" value="Spotify"/>`.
- `xfce4-panel.xml`
    Configures the "task bar". I've made some changes here, from the default configuration, but I'm still planning to test some other configurations.
- `xfce4-power-manager.xml`
    Pretty obvious. Some changes from the default configuration, but nothing too fancy.
- `xfce4-screensaver.xml`
    In the current installation, lets say that I can't afford to spend resources.
- `xfwm4.xml`
    The actual window manager. Some changes from the default configuration too.
- `xsettings.xml`
    Responsible for the configuration of the visual appearance of the desktop (the application itself).
- `displays.xml`
    You may want to replace back with the default configuration, this here is related to the current pc that I'm using.