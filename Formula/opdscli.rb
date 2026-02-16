class Opdscli < Formula
  desc "CLI tool to interact with OPDS 1.x ebook catalogs"
  homepage "https://github.com/rafadc/opdscli"
  url "https://github.com/rafadc/opdscli/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "e01ab2b08ff3ce761e3debed15e63c27d965bcaa9b437ae13b2c4e0c85119a96"
  license "MIT"

  depends_on "python@3.12" => :build
  depends_on "uv" => :build

  def install
    system "uv", "sync"
    system "uv", "run", "pyinstaller", "--noconfirm", "opdscli.spec"
    bin.install "dist/opdscli"
  end

  test do
    assert_match "0.1.2", shell_output("#{bin}/opdscli --version")
  end
end
