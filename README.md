# NiceMailer tap

Homebrew tap for [NiceMailer](https://nicemailer.org), a fast, calm, local-first
email client for macOS (Apple Silicon, macOS 14+).

## Installation

```sh
brew tap nicemailer/tap
brew install --cask nicemailer
```

or, in a single command:

```sh
brew install --cask nicemailer/tap/nicemailer
```

This installs `NiceMailer.app` into `/Applications` and links the `nicemailer`
CLI (shipped inside the app at `NiceMailer.app/Contents/Helpers/nicemailer`)
into Homebrew's `bin`.

## Updates

- The app updates itself with Sparkle from the GitHub releases of
  [`nicemailer/nicemailer`](https://github.com/nicemailer/nicemailer/releases).
- The cask in this tap is refreshed automatically within an hour of each
  release (`.github/workflows/update-cask.yml`); to refresh it immediately,
  run that workflow by hand from this repo's **Actions** tab.

## Uninstall

```sh
brew uninstall --cask nicemailer
```

This removes the app, quits it, unregisters the `eu.nicemailer.core` launch
agent and removes the `nicemailer` link. Add `--zap` to also remove the
preferences and the mailbox in `~/Library/Application Support/NiceMailer`.
