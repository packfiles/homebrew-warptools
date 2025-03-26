cask "warp-vault" do
  version "v0.1.0"
  sha256 "92ad375a8cb9fa419d251904928e205c0f8526226412df3c9a64cbb1b073a5b2"

  url "https://github.com/packfiles/warp-vault/releases/download/v#{version}/Warp_Vault-v#{version}-macOS-universal.dmg", verified: "github.com/packfiles/warp-vault/releases/"
  name "Warp Vault"
  desc "End-to-end encrypted credential manager for Packfiles Warp"
  homepage "https://vault.packfiles.io/"

  livecheck do
    url "https://vault.packfiles.io/releases.json"
    strategy :json do |json|
      json["stable"]["version"].gsub(/[^\d.]/, "")
    end
  end

  auto_updates false
  depends_on macos: ">= :mojave"
  container type: :dmg

  app "Warp Vault.app"

  caveats "📦 Thanks for installing Warp Vault! To get started, review our documentation at https://kb.packfiles.io."
end
