class NotoAT134 < Formula
  desc "Generate clean commit messages in a snap! ✨"
  homepage "https://noto.snelusha.dev"
  version "1.3.4"
  url "https://registry.npmjs.org/@snelusha/noto/-/noto-#{version}.tgz"
  sha256 "9e9f0e82b185d0a5d2df4555f92c1ecf3dae08b44657bee95a8f4fed1b5981b7"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    system "#{bin}/noto", "--version"
  end
end
