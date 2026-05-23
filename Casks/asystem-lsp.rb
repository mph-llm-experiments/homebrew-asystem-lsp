cask "asystem-lsp" do
  version "0.2.6"
  sha256 "ebabbfd51679fdf9d99da0728472f64759c510bfe66744c59205ceffdcdb5389"

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
