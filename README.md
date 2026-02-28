# homebrew-tap

Homebrew tap for [Auxot](https://github.com/auxothq/auxot) binaries.

## Setup

```sh
brew tap auxothq/tap
```

## Formulas

### auxot-worker

GPU inference worker that connects to an Auxot router, downloads the model policy, and runs llama.cpp locally.

```sh
brew install auxothq/tap/auxot-worker
```

#### Quick start

```sh
# Connect directly (foreground)
auxot-worker --gpu-key <your-gpu-key>

# Install as a persistent background daemon (starts on boot)
auxot-worker install --name default --gpu-key <your-gpu-key>

# System daemon — runs as a dedicated user even when logged out (requires sudo)
sudo auxot-worker install --name default --gpu-key <your-gpu-key> --always-on
```

#### Daemon management

Multiple workers can be installed with different names (e.g. one per model/key):

```sh
# Install additional workers
auxot-worker install --name qwen   --gpu-key gpu_abc123
auxot-worker install --name llama  --gpu-key gpu_xyz789

# List all installed workers and their status
auxot-worker list

# Remove a worker
auxot-worker uninstall qwen
```

#### Upgrade

```sh
brew upgrade auxothq/tap/auxot-worker
```

After upgrading, restart any running daemons so they pick up the new binary:

```sh
# macOS — reload the plist
launchctl unload  ~/Library/LaunchAgents/com.auxot.worker.default.plist
launchctl load -w ~/Library/LaunchAgents/com.auxot.worker.default.plist

# Linux — restart the unit
systemctl --user restart auxot-worker-default
```

## Release process

Formulas in this tap are updated automatically by [GoReleaser](https://goreleaser.com) when a new tag is pushed to [auxothq/auxot](https://github.com/auxothq/auxot).
Manual edits to `Formula/*.rb` will be overwritten on the next release.
