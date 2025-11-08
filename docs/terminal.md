# ptyxis + byobu

1. Create a ptyxis profile for byobu:

    - Open Ptyxis.
    - Go to "Profiles" and create a new profile.
    - Set Shell to "Use Custom Command" and enter `/usr/bin/bash -i -l byobu new-session` as the command.
    - Disable "Use Login Shell" if it's enabled.
    - Save the profile.
    - Set this profile as the default.

   My preferred appearance settings are:
    - Font: JetBrains Mono, 12pt
    - Color Scheme: VS Code
    - Columns: 140, Rows: 40

   Refer to `configs/ptyxis` for an example profile configuration.

2. Configure a keyboard shortcut to launch Ptyxis with the byobu profile:

    - Open your system's keyboard settings.
    - Navigate to the shortcuts section (GNOME: Settings > Keyboard > Keyboard Shortcuts -> Custom Shortcuts).
    - Add a new custom shortcut (or edit an existing one) with the following details:
        - Name: Launch Byobu in Ptyxis
        - Command: `/usr/bin/ptyxis --new-window` (if the byobu profile is set as default)
        - Shortcut: Set your preferred key combination (e.g., Ctrl + Alt + Enter).
