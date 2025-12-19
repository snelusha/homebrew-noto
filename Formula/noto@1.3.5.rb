class NotoAT135 < Formula
  desc "Generate clean commit messages in a snap! ✨"
  homepage "https://noto.snelusha.dev"
  version "1.3.5"
  url "https://registry.npmjs.org/@snelusha/noto/-/noto-#{version}.tgz"
  sha256 "638fe2abeb2dd1161b036b8ef9547be18921d33b1512b273998851a5df9756aa"
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
