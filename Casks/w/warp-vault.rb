cask "warp-vault" do
  version "0.1.1"
  sha256 "6f30dce4f77928021209887c0aee30b3bf49371426db1109519b5a5c896bcb68"

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
