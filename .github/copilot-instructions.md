# Copilot Instructions for Omarchy

This guide helps AI coding agents work productively in the Omarchy codebase. It summarizes key architecture, workflows, and conventions unique to this project.

## Project Overview
- **Purpose:** Automate setup of a modern Arch Linux system for web development, using Hyprland as the window manager.
- **Philosophy:** Opinionated, minimal manual config, fast onboarding. Inspired by Omakub.
- **Entry Point:** Most automation is triggered via shell scripts (`boot.sh`, `install.sh`).

## Key Directories & Files
- `bin/`: Custom CLI tools and automation scripts. Each file is a standalone executable for system tasks (e.g., `omarchy-cmd-*`, `omarchy-install-*`, `omarchy-launch-*`).
- `applications/`: Desktop entry files for launching apps. Subfolders for icons and hidden apps.
- `config/`, `default/`, `install/`, `migrations/`, `themes/`: System configuration, default settings, install scripts, migration helpers, and theming assets.
- `README.md`: Project pitch and license. See [omarchy.org](https://omarchy.org) for philosophy and user docs.

## Developer Workflows
- **Install/Setup:** Run `boot.sh` or `install.sh` to initialize a system. These scripts orchestrate most automation.
- **Adding Tools:** Place new scripts in `bin/` following the `omarchy-*` naming convention. Each script should be self-contained and executable.
- **Desktop Integration:** Add `.desktop` files to `applications/` for new launchers. Use `icons/` for custom icons.
- **Config Updates:** Edit files in `config/` for system-wide changes. Use `default/` for fallback settings.
- **Migrations:** Add migration scripts to `migrations/` for upgrade paths or config changes.

## Patterns & Conventions
- **Naming:** All scripts in `bin/` use the `omarchy-` prefix and describe their function (e.g., `omarchy-cmd-screenshot`).
- **Modularity:** Scripts are designed to be composable and called independently.
- **No Hidden Magic:** Avoid implicit dependencies; document any cross-script calls in comments.
- **Minimal External Dependencies:** Prefer standard shell utilities and minimal external packages unless necessary.
- **Desktop Files:** `.desktop` launchers should reference scripts in `bin/` and use icons from `applications/icons/`.

## Integration Points
- **Hyprland:** Most automation assumes Hyprland is the window manager. Scripts may interact with Hyprland config or IPC.
- **Web Resources:** See [omarchy.org](https://omarchy.org) for user-facing documentation and philosophy.

## Example: Adding a New System Tool
1. Create `bin/omarchy-cmd-mytool` (executable shell script).
2. Add a launcher: `applications/mytool.desktop` referencing the script.
3. Add an icon: `applications/icons/mytool.png`.
4. Document any config changes in `config/`.

## Tips for AI Agents
- Always check for existing scripts before adding new functionality.
- Follow naming and modularity conventions for maintainability.
- Document any new cross-component interactions in comments.
- Reference this file for project-specific practices.

---
For questions or unclear conventions, ask for feedback or clarification from maintainers.
