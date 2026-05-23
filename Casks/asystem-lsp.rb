cask "asystem-lsp" do
  version "0.2.8"
  sha256 "d59ae48c9c523271e55cfc196c1ffd051ee0b2d3486fca89e8fc69af8d3bec70"

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
