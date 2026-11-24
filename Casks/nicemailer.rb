cask "nicemailer" do
  version "0.2.1"
  sha256 "fd92c9f8a9a389f5a4dca16708a48867c9105534f4bfe70b0fe6c6e6370a59cc"

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
