---
name: Bug report
about: Report a visual or functional issue with the Gruvbox GTK Theme
title: ''
labels: 'BUG'
assignees: ''

---

### Describe the bug
Describe the issue in detail, what happens, when it happens, and how it affects the Gruvbox GTK Theme.
Please specify whether it occurs in light, dark, or both variants.

> Example:
> In GTK4 applications, button hover states ignore the accent color from the `Soft` variant and use a default system blue instead.

### To Reproduce
Steps to reproduce the behavior:
1. Apply the theme variant (e.g., `Gruvbox-BL-MB`)
2. Open a GTK3 or GTK4 application (e.g., Nautilus, Settings)
3. Interact with affected elements (buttons, menus, etc.)
4. Observe the incorrect or missing style

### Actual behavior
Describe what actually happens.

> Example:
> The hover state uses the default GTK highlight instead of the accent color.

### Expected behavior
Explain how the UI should look or behave according to Gruvbox’s design.

> Example:
> The button hover background should use the accent color defined by the selected variant (e.g., `Blue`).

### Possible Cause or Solution (Optional)

If you suspect what might cause the issue or know a possible fix, describe it here.

> Example:
> The accent variable may not be applied in `gtk-contained.css` for GTK4 builds.

### Environment
Please provide as much detail as possible:

- **Distro / Version:** (e.g., Fedora 48, Arch Linux)
- **GTK Version:** (e.g., GTK 3.24.41 / GTK 4.14)
- **Theme Variant:** (e.g., Gruvbox-BL-MB)
- **Display Server:** (e.g., Wayland / X11)
- **Desktop Environment:** (e.g., GNOME 46, XFCE 4.20, Mint 21)
- **Installation Method:** (manual, git clone, or system package)
- **Shell Theme (if any):** (e.g., Gruvbox-B, Gruvbox-BL-Medium)

### Screenshots
Attach screenshots and/or logs that demonstrate the problem.

> ```
> Gtk-WARNING **: 09:15:42.123: Theme parsing error: gtk.css:87:20: Not a valid color name
> ```

### ✅ Checklist

- [ ] I’ve read the README and followed the installation instructions
- [ ] I’ve searched for existing issues
- [ ] I’m using the latest version of the theme
- [ ] The problem is not caused by a third-party GTK config or override

### Additional context
Add any other context about the problem here.
