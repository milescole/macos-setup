# Workspace

Define the directory layout for repositories, scripts, and throwaway work after
the Apple developer toolchain is installed.

## Create Directories

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

## Directory Policy

Use these directories consistently:

- `~/Developer/personal` for personal repositories
- `~/Developer/work` for employer or client repositories
- `~/Developer/oss` for open-source repositories
- `~/Developer/scratch` for experiments and throwaway projects
- `~/Developer/tools` for local utility scripts, helper repos, and machine
  infrastructure
- `~/Developer/archive` for inactive repositories you want to keep around

For contract work, group repositories by client under `work`:

```text
~/Developer/work/acme/internal-api
~/Developer/work/acme/deploy-scripts
~/Developer/work/contoso/mobile-app
```

This repository belongs under `oss`:

```bash
cd ~/Developer/oss
git clone https://github.com/milescole/macos-setup.git
```
