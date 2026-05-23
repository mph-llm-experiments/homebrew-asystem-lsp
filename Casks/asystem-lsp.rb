cask "asystem-lsp" do
  version "0.2.0"
  sha256 "9eb52ee46c7ab5ea4ca0982415da99fded1b7d7354f75e50847bdae6cb44eb66"

  url "https://dist.puddingtime.net/asystem-lsp/v#{version}/asystem-lsp_#{version}_aarch64.tar.gz"
  name "asystem-lsp"
  desc "LSP server for asystem wikilinks in Markdown (queries asystem-service)"
  homepage "https://github.com/mph-asystem/asystem-lsp"

  depends_on arch: :arm64

  binary "asystem-lsp"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{staged_path}/asystem-lsp"],
                   sudo: false
  end

  zap trash: [
    "~/.asystem-lsp.json"
  ]
end
