cask "asystem-lsp" do
  version "0.2.3"
  sha256 "7b07c5eb9d7fd1678714fa92cb4b54fdd918229cc2933453b12fb31559258b56"

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
