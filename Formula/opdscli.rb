class Opdscli < Formula
  desc "CLI tool to interact with OPDS 1.x ebook catalogs"
  homepage "https://github.com/rafadc/opdscli"
  url "https://github.com/rafadc/opdscli/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "442f57886551bb79f107c705be61196f72c5cc10f7ae3b5b13a9305d0db8b5c5"
  license "MIT"

  depends_on "python@3.12" => :build
  depends_on "uv" => :build

  def install
    system "uv", "sync", "--no-dev"
    system "uv", "run", "pyinstaller", "--noconfirm", "opdscli.spec"
    bin.install "dist/opdscli"
  end

  test do
    assert_match "0.1.0", shell_output("#{bin}/opdscli --version")
  end
end
