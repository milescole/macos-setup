# Xcode

Install Apple's developer tooling before Homebrew and the rest of the machine
setup. Many developer packages expect either the full Xcode app or the Xcode
Command Line Tools to already exist.

## Install Xcode

Install Xcode from one of these sources:

- the App Store
- [Apple Developer](https://developer.apple.com/xcode/)

If you only need the baseline compiler, SDK headers, `git`, and related CLI
tools, the Command Line Tools are usually enough to get started. If you plan to
build Apple platform apps, run simulators, or use Instruments, install the full
Xcode app as well.

## Install Command Line Tools

Run:

```bash
xcode-select --install
```

Follow the installer prompts. This installs the Xcode Command Line Tools
package.

Verify the active developer directory:

```bash
xcode-select -p

# You should see:
# /Library/Developer/CommandLineTools
```

If the full Xcode app is installed and selected instead, you may see:

```bash
# /Applications/Xcode.app/Contents/Developer
```

Verify that `git` works:

```bash
git --version

# You should see:
# git version ...
```

Verify that the compiler toolchain is present:

```bash
gcc --version

# You should see:
# Apple clang version ...
```

On macOS, `gcc` usually reports Apple's `clang` toolchain. The exact version
will vary by macOS and Xcode release.

## Optional: Select Full Xcode

If the full Xcode app is installed and you want it to be the active developer
directory, run:

```bash
sudo xcode-select -s /Applications/Xcode.app/Contents/Developer
```

Then accept the license if prompted:

```bash
sudo xcodebuild -license accept
```

## Developer Access

If you need debugger access or other developer-only capabilities, verify the
developer tools security status:

```bash
DevToolsSecurity -status
```

Enable it if needed:

```bash
sudo DevToolsSecurity -enable
```

On newer macOS releases, you may also need to enable `Developer Mode` in
System Settings under `Privacy & Security`.

## Work Directories

Create the user-level directories used by this repository's workflow:

```bash
mkdir -p ~/Developer
mkdir -p ~/Developer/personal
mkdir -p ~/Developer/work
mkdir -p ~/Developer/oss
mkdir -p ~/Developer/scratch
mkdir -p ~/Developer/tools
mkdir -p ~/Developer/archive
```

Use these directories consistently:

- `~/Developer/personal` for personal repositories
- `~/Developer/work` for employer or client repositories
- `~/Developer/oss` for open-source repositories
- `~/Developer/scratch` for experiments and throwaway projects
- `~/Developer/tools` for local utility scripts, helper repos, and machine
  infrastructure
- `~/Developer/archive` for inactive repositories you want to keep around

For example, this repository belongs under `oss`:

```bash
cd ~/Developer/oss
git clone https://github.com/<your-user>/macos-setup.git
```
