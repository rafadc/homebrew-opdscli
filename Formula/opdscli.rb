class Opdscli < Formula
  desc "CLI tool to interact with OPDS 1.x ebook catalogs"
  homepage "https://github.com/rafadc/opdscli"
  url "https://github.com/rafadc/opdscli/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "95caf5de3cbdc581cf148e404987e7d24498abfa892ef14f0f26218451b6d6ea"
  license "MIT"

  depends_on "python@3.12" => :build
  depends_on "uv" => :build

  def install
    system "uv", "sync"
    system "uv", "run", "pyinstaller", "--noconfirm", "opdscli.spec"
    bin.install "dist/opdscli"
  end

  test do
    assert_match "0.1.1", shell_output("#{bin}/opdscli --version")
  end
end
