cask "warp-vault" do
  version "1.0.0"
  sha256 "587ff514d9789b2cd2d408c96218500d38cf9706593003d5f261608ab4caa69a"

  url "https://github.com/packfiles/warp-vault/releases/download/v#{version}/Warp_Vault-v#{version}-macOS-universal.dmg", verified: "github.com/packfiles/warp-vault/releases"

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

  caveats <<-MSG
  📦 Thanks for installing Warp Vault! 
  
  To get started, review our documentation at https://kb.packfiles.io.
  MSG
end
