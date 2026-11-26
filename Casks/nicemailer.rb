cask "nicemailer" do
  version "0.3.0"
  sha256 "69b9c6c286307bbf9520a8d22459bf8bebdb223227adafded15e2ca492f6f4bd"

  url "https://github.com/nicemailer/nicemailer/releases/download/v#{version}/NiceMailer-#{version}.dmg"
  name "NiceMailer"
  desc "Fast, calm, local-first email client for macOS"
  homepage "https://nicemailer.org"

  livecheck do
    url "https://github.com/nicemailer/nicemailer"
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "NiceMailer.app"

  # The CLI ships inside the app; link it into Homebrew's bin.
  binary "#{appdir}/NiceMailer.app/Contents/Helpers/nicemailer"

  uninstall launchctl: "eu.nicemailer.core",
            quit:      "eu.nicemailer.NiceMailer"

  zap trash: [
    "~/Library/Application Support/NiceMailer",
    "~/Library/Caches/eu.nicemailer.NiceMailer",
    "~/Library/HTTPStorages/eu.nicemailer.NiceMailer",
    "~/Library/LaunchAgents/eu.nicemailer.core.plist",
    "~/Library/Preferences/eu.nicemailer.NiceMailer.plist",
    "~/Library/Saved Application State/eu.nicemailer.NiceMailer.savedState",
    "~/Library/WebKit/eu.nicemailer.NiceMailer",
  ]

  caveats <<~EOS
    NiceMailer is built for Apple Silicon (arm64) only.
    The `nicemailer` command-line client, shipped inside the app at
    NiceMailer.app/Contents/Helpers/nicemailer, is linked into #{HOMEBREW_PREFIX}/bin.
    The app updates itself (Sparkle); Homebrew only installs it.
  EOS
end
