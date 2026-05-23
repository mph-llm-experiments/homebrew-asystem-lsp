cask "asystem-lsp" do
  version "0.2.1"
  sha256 "c1147790a77d4503cf00120e998c20dd457e3446f561c9884e2e131e5a853217"

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
