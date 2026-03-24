# macOS Settings

Use this page for macOS settings that matter to the workstation setup. Some of
these are applied automatically by `./bootstrap/bootstrap.sh`, while others
still require manual changes in `System Settings`.

The exact menu names vary a little between macOS releases. On current macOS
versions, most of these settings live in `System Settings`.

When a section says `Applied by bootstrap`, those settings are handled by
`./bootstrap/bootstrap.sh`.

## First Pass

Do these early on a fresh machine:

- Run `Apple menu > System Settings > General > Software Update`
- Sign in to the App Store or Apple ID if needed for Xcode and other Apple
  services
- Review any `Privacy & Security` prompts that block developer tools

## Desktop & Dock

Applied by bootstrap.

- Reduce Dock icon size
- Disable `Show suggested and recent apps in Dock`

## Mission Control

Applied by bootstrap.

- Disable `Automatically rearrange Spaces based on most recent use`

## Lock Screen

Review `System Settings > Lock Screen` and `System Settings > Battery`:

- Set `Turn display off on battery when inactive` to a longer interval if the
  default is too aggressive
- Set `Turn display off on power adapter when inactive` to a longer interval if
  longer display time is useful while plugged in
- Keep battery and power-adapter behavior separate if the machine should sleep
  sooner on battery
- Review related settings such as automatic sleep, screen lock timing, and
  battery health options before changing them

## Control Center And Menu Bar

Review `System Settings > Control Center`:

- Set `Battery` to show `Percentage`
- Set `Bluetooth` to `Show in Menu Bar`
- Set `Displays` to `Show in Menu Bar` if external monitors are common
- Set `Sound` to `Show in Menu Bar` if output devices change often

## Hot Corners

Optional, but useful if they are part of the normal workflow:

- Open `System Settings > Desktop & Dock`, scroll to the bottom, and select
  `Hot Corners...`
- Set the top-right corner to `Lock Screen`

## Spotlight

Review `System Settings > Spotlight`:

- Disable result categories that create noise
- Change Spotlight keyboard shortcuts if they will be replaced by Alfred or a
  similar launcher
- Open `Spotlight Privacy...` and add large source or dependency directories if
  indexing becomes noisy

## Privacy & Security

Review `System Settings > Privacy & Security`:

- Set the password requirement after sleep or screen saver to `Immediately`
- Open `FileVault` and enable disk encryption
- Open `Firewall` and enable it
- Review `Full Disk Access`, `Accessibility`, and `Login Items & Extensions`
  for the terminal, editor, and automation tools that will be used
- Enable `Developer Mode` if required for the local Apple development workflow

## Users & Groups

Review `System Settings > Users & Groups`:

- Confirm the account password and profile picture
- Use `Set Up...` or `Change...` for the account password if needed
- Enable fast user switching and set it to show as an icon if multiple local
  users are common

## Internet Accounts

Review `System Settings > Internet Accounts`:

- Add the iCloud account if Calendar, Contacts, Notes, or Find My are part of
  the normal setup
- Enable only the synced services that belong on this machine

## Keyboard

Applied by bootstrap.

- Increase `Key repeat rate`
- Shorten `Delay until repeat`
- Disable smart quotes and smart dashes if this machine will be used heavily
  for coding

## Trackpad

Bootstrap applies the click defaults below. Tracking speed is still manual.

- Enable `Tap to click`
- Set `Secondary click` to `Click or tap with two fingers`
- Increase tracking speed in `System Settings > Trackpad` if the default feels
  too slow

## Mouse

Bootstrap applies the secondary-click default below. Tracking speed is still
manual.

- Enable `Secondary click` for Magic Mouse
- Increase tracking speed in `System Settings > Mouse` if needed

## Finder

Finder is outside `System Settings`, but it belongs in the same machine setup
checklist. Bootstrap applies the window and view defaults below, but sidebar
customization is still manual:

- Set new Finder windows to open in the home directory
- Create `~/Developer` if it does not already exist
- Open `Finder > Settings > Sidebar`, then enable `Home`
- Drag `~/Developer` into the Finder sidebar
- In `Finder > Settings > Sidebar`, disable unneeded `Shared` items
- Enable `Show all filename extensions`
- Enable `Show Path Bar`
- Enable `Show Status Bar`
- Keep folders on top if that matches the preferred working style
